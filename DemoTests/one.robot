# Keys Sections of robot framework file

*** Settings ***
Library   SeleniumLibrary

*** Keywords ***


*** Variables ***
${Browser}   Chrome
${URL}  https://ecommerce-playground.lambdatest.io/index.php?route=account/login
${Email Locator}  id:input-email
${Email1}  demolambdatestio@yopmail.com
${Email2}  demolambdatestio@yopmail.com
${Password Locator}  id:input-password
${Password1}  Admin123!
${Password2}  Admin12345!
${Login Button Locator}  //input[@value='Login']

*** Test Cases ***
Valid Login Test|Scenario
    [Tags]    login    critical    -smoke
    Open The Browser
    Login1 To Portal
    ${currentURL}=   Get Location
    Log To Console  \n Acutal URL : ${currentURL}
    Should Contain   ${currentURL}  item=/account
    Close The Browser

Invalid Login Test|Scenario
    [Tags]    login    critical    -smoke
    Open The Browser
    Login2 To Portal
    ${currentURL}=   Get Location
    Log To Console  \n Acutal URL : ${currentURL}
    Should Contain   ${currentURL}  item=/account
    Close The Browser

*** Keywords ***
Open The Browser
    Open Browser  ${URL}  ${Browser}
    Maximize Browser Window
    Sleep  time_=5s
    Log To Console  message=Browser Initialized

Login1 To Portal
    Input Text  locator=${Email Locator}  text=${Email1}
    Input Text  locator=${Password Locator}  text=${Password1}
    Click Element  locator=${Login Button Locator}
    Sleep  time_=5s

Login2 To Portal
    Input Text  locator=${Email Locator}  text=${Email2}
    Input Text  locator=${Password Locator}  text=${Password2}
    Click Element  locator=${Login Button Locator}
    Sleep  time_=5s

Close The Browser
    Close Browser
    Log To Console  message=Test Completed