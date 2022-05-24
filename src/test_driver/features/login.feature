Feature: Open pages
  The pages should appear when we click on the respective menu options

#  Scenario: login and access the main page
#   When I fill the "usernameinput" field with "up200802821"
#    And  I fill the "passwordinput" field with "************"
#    And I tap the "entrar" button
#    Then I expect the text "Área Pessoal" to be present

# Scenario: login and access the "Horário" page
  Scenario: Access the "Reminders" page
    Given I am logged in
    And I open the drawer
    And I tap the "key_Reminders" button
    Then I expect the text "Reminders" to be present

