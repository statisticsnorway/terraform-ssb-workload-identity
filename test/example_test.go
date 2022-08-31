package test

import (
	"github.com/gruntwork-io/terratest/modules/k8s"
	"github.com/gruntwork-io/terratest/modules/terraform"
	test_structure "github.com/gruntwork-io/terratest/modules/test-structure"
	"github.com/stretchr/testify/assert"
	"path/filepath"
	"testing"
)

// A simple test, running terraform plan to check that the desired buckets and IAM members will be created
func TestExample(t *testing.T) {
	t.Parallel()
	exampleFolder := test_structure.CopyTerraformFolderToTemp(t, "../", "examples")
	planFilePath := filepath.Join(exampleFolder, "plan.out")
	terraTestOptions := &terraform.Options{
		TerraformDir: "fixtures",
		NoColor:      true, // This avoids any colour codes being included in the output string from terratest, which would mess up the assertions
		PlanFilePath: planFilePath,
	}
	output := terraform.InitAndPlan(t, terraTestOptions)
	jsonOut := terraform.InitAndPlanAndShow(t, terraTestOptions)
	assertions := assert.New(t)

	var accountId []string
	k8s.UnmarshalJSONPath(
		t,
		[]byte(jsonOut),
		"{ .planned_values.root_module.child_modules[0].resources[0].values.account_id }",
		&accountId,
	)

	// Check the account_id
	assert.Equal(t, []string{"wi-test-app-sa-wi"}, accountId)
	assertions.Contains(output, "# module.module-usage-example.google_service_account.wi_service_account will be created\n  + resource \"google_service_account\" \"wi_service_account\" {\n      + account_id   = \"wi-test-app-sa-wi\"", "Failure")

	// Check that the plan only adds (2) resources, changes and destroys none.
	assertions.Contains(output, "Plan: 2 to add, 0 to change, 0 to destroy.", "Plan didn't go as expected. Expected 2 new, 0 changed, 0 destroyed.")
}
