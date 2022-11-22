Feature: Check Google Service Account account id is good

  related_resources: google_service_account

  Scenario: Ensure account_id is correct
    Given I have google_service_account defined
    Then it must have account_id
    And its value must be wi-test-app-sa-wi
