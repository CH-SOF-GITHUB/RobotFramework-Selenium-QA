*** Settings ***
Library   SeleniumLibrary

*** Variables ***
# URL of Tests #
${URL}   https://practicesoftwaretesting.com/auth/login
# email and password mandatory fields
${EMAIL_FIELD Locator}  id:email
${PASSWORD_FIELD Locator}  id:password
${SHOW_PWD_BUTTON Locator}  xpath://button[@class='btn btn-outline-secondary']
${LOGIN_BUTTON Locator}  xpath://input[@value='Connexion']

*** Keywords ***
Open The WebSite
    [Arguments]  ${browser}
    Open Browser  url=${URL}  browser=${browser}
    Maximize Browser Window
    Sleep  5s

User Login
    Input Text  ${EMAIL_FIELD Locator}   bchaker28@yahoo.com
    Input Text  ${PASSWORD_FIELD Locator}  ChakerSecure#2026!Test
    Click Button  ${LOGIN_BUTTON Locator}
    Sleep  3s

Verify Logging into application
    ${CurrentURL}  Get Location
    Log To Console  \n Current URL after Login : ${CurrentURL}\n
    Should Contain  ${CurrentURL}  item=/account
