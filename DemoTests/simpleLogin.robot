*** Settings ***
Documentation   Simple Example using SeleniumLibrary
Library         SeleniumLibrary
Test Teardown   Close Browser

*** Variables ***
${LOGIN_URL}    https://the-internet.herokuapp.com/login
${BROWSER}      Chrome
${DELAY}        0
${SECURE_LOGIN_URL}  https://the-internet.herokuapp.com/secure


*** Test Cases ***
Valid Login
     Open Browser To Login Page
     Input Username   tomsmith
     Input Password   SuperSecretPassword!
     Submit Credentials
     Welcome Page Should Be Open

*** Keywords ***
Login Page Should Be Open
     Title Should Be  The Internet

Open Browser To Login Page
     Open Browser   ${LOGIN_URL}  ${BROWSER}
     Maximize Browser Window
     Set Selenium Speed  ${DELAY}
     Login Page Should Be Open

Input Username
     [Arguments]  ${username}
     Input Text   id:username  ${username}

Input Password
     [Arguments]  ${password}
     Input Text   id:password  ${password}

Submit Credentials
     Click Button  //button[@type='submit']

Welcome Page Should Be Open
     Location Should Be   ${SECURE_LOGIN_URL}