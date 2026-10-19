*** Settings ***
Library         SeleniumLibrary
Resource        ../../Resources/PageObject/KeyDefs/Common.robot
Variables       ../../Resources/PageObject/Locators/Locators.py
Test Template   Verify Login System
Test Teardown   Close Test Browser
Test Setup      Set Selenium Page Load Timeout      30s

*** Test Cases ***
Login Scenarios
    standard_user            secret_sauce   https://www.saucedemo.com/inventory.html   Swag Labs
    locked_out_user          secret_sauce   https://www.saucedemo.com/inventory.html   Swag Labs
    problem_user             secret_sauce   https://www.saucedemo.com/inventory.html   Swag Labs
    performance_glitch_user  secret_sauce   https://www.saucedemo.com/inventory.html   Swag Labs
    error_user               secret_sauce   https://www.saucedemo.com/inventory.html   Swag Labs
    visual_user              secret_sauce   https://www.saucedemo.com/inventory.html   Swag Labs

*** Keywords ***
Verify Login System
    # TODO: implement keyword "Verify Login System".
    [Arguments]    ${username}    ${password}   ${expectedURL}   ${expectedTitle}
    Open Browser   https://www.saucedemo.com/   chrome
    Maximize Browser Window
    Wait Until Element Is Visible       id:user-name     10s
    Input Text                          id:user-name     ${username}
    Wait Until Element Is Visible       id:password      10s
    Input Text                          id:password      ${password}
    Wait Until Element Is Visible       id:login-button  10s
    Click Element                       id:login-button
    Location Should Be                  ${expectedURL}
    Title Should Be                     ${expectedTitle}