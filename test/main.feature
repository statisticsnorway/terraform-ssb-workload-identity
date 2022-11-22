Feature: Check Service Account and Workload Identity Binding

  related_resources: google_service_account

  Scenario: Ensure there is only one service_account
    Given I have google_service_account defined
    When I count them
    Then I expect the result is equal to 1

  Scenario: Ensure service account's account_id is correct
    Given I have google_service_account defined
    Then its account_id must be "wi-test-app-sa-wi"

  Scenario: Ensure there is only one service_account_iam_member
    Given I have google_service_account_iam_member defined
    When I count them
    Then I expect the result is equal to 1

  Scenario: Ensure the service_account_iam_member has the WI role
    Given I have google_service_account_iam_member defined
    Then its role must be "roles/iam.workloadIdentityUser"

  Scenario: Ensure the service_account_iam_member is for the right service account
    Given I have google_service_account_iam_member defined
    Then its service_account_id must be "module.module-usage-example.google_service_account.wi_service_account"

  Scenario: Ensure the IAM member has the given K8s SA as its member
    Given I have google_service_account_iam_member defined
    Then it must have member
    And its value must be "serviceAccount:staging-bip.svc.id.goog[stratus/wi-test-app-sa]"
