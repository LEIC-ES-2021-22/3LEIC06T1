Feature: Open pages
  The pages should appear when we click on the respective menu options

#  Scenario: login and access the main page
#   When I fill the "usernameinput" field with "up200802821"
#    And  I fill the "passwordinput" field with "************"
#    And I tap the "entrar" button
#    Then I expect the text "Área Pessoal" to be present

# Scenario: login and access the "Horário" page
  Scenario: Access the "Horário" page
    Given I am logged in
    And I open the drawer
    And I tap the "key_Horário" button
    Then I expect the text "Horário" to be present

  # Scenario: Access "Mapa de Exames" page
  Scenario: Access the "Mapa de Exames" page
    Given I am logged in
    And I open the drawer
    And I tap the "key_Mapa de Exames" button
    Then I expect the text "Exames" to be present

  Scenario: Access the "Autocarros" page
    Given I am logged in
    And I open the drawer
    And I tap the "key_Autocarros" button
    Then I expect the text "Autocarros" to be present


  Scenario: Submit bug report
    Given I am logged in
    And I open the drawer
    And I tap the "key_Bugs e Sugestões" button
    And I fill the "key_bug_form_Título" field with "Texto 1"
    And I fill the "key_bug_form_Descrição" field with "Texto 2"
    And I pause for 1 seconds
    And I tap the "key_bug_consent" button
    And I pause for 1 seconds
    And I tap the "key_bug_form_submit" button
    And I pause for 1 seconds
    Then I expect the text "Texto 1" to be absent

  Scenario: Access the "Serviços" page
    Given I am logged in
    And I open the drawer
    And I tap the "key_Serviços" button
    Then I expect the text "Serviços" to be present

  Scenario: Access the "Mapa" page
    Given I am logged in
    And I open the drawer
    And I tap the "key_Mapa" button
    Then I expect the text "Mapa" to be present

  Scenario: Access the "Reminders" page
    Given I am logged in
    And I open the drawer
    And I tap the "key_Reminders" button
    Then I expect the text "Reminders" to be present

  Scenario: Access the "Serviços" page and see the "SERAC" panel
    Given I am logged in
    And I open the drawer
    And I tap the "key_Serviços" button
    Then I expect the text "SERAC" to be present

  Scenario: Access the "Serviços" page and see the "SDInf" panel
    Given I am logged in
    And I open the drawer
    And I tap the "key_Serviços" button
    Then I expect the text "SDInf" to be present

  Scenario: Access the "Serviço" page and see the "SRH" description
    Given I am logged in
    And I open the drawer
    And I tap the "key_Serviços" button
    And I tap the "SRH-service" button
    Then I expect the text "Os Serviços de Recursos Humanos tem como missão o recrutamento, a selecção e a integração, a gestão e o desenvolvimento dos recursos humanos da FEUP." to be present

  Scenario: Access the "Serviço" page and see the "SRH" schedule
    Given I am logged in
    And I open the drawer
    And I tap the "key_Serviços" button
    And I tap the "SRH-service" button
    Then I expect the text "10:00-12:00" to be present