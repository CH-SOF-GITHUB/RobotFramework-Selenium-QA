*** Settings ***
Library       SeleniumLibrary
Task Setup    Set Selenium Page Load Timeout    30s

*** Test Cases ***
Verify Foundation Link
    [Tags]        RFCP
    Open Page     http://robotframework.org   chrome
    # Éviter Set Selenium Speed qui ralentit artificiellement tout le script
    # Set Selenium Timeout          10s
    Click Element             locator=//*[@id="page"]/nav/div/button/span
    # On attend explicitement que la page soit stable et que le lien apparaisse
    Wait Until Element Is Visible    link:Foundation    timeout=10s
    Click Link                link:Foundation
    Verify Title              Robot Framework Foundation
    Verify Url                https://robotframework.org/foundation/

*** Keywords ***
Verify Title
    [Arguments]   ${ExpectedTitle}
    Title Should Be   ${ExpectedTitle}

Open Page
    [Arguments]    ${url}   ${browser}
    Open Browser   ${url}   ${browser}
    Maximize Browser Window

Verify Url
    [Arguments]   ${ExpectedUrl}
    Location Should Be   ${ExpectedUrl}