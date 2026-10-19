*** Settings ***
Library        SeleniumLibrary
Test Setup     Set Selenium Page Load Timeout  30s
Test Teardown  Close Browser

*** Variables ***
${url}           https://www.saucedemo.com/
${browser}       chrome
${txtbox_username}    id:user-name
${txtbox_password}    id:password
${btn_login}          id:login-button
${txt_error}          css:h3[role='alert']

*** Test Cases ***
Verify Login fails - Wrong Username
    [Tags]  SauceLabs   FailWrongUsername
    Open Browser  ${url}   ${browser}
    Maximize Browser Window
    Input Text    ${txtbox_username}  standard_us
    Input Text    ${txtbox_password}  secret_sauce
    Click Button  ${btn_login}
    Sleep  2s
    Element Should Contain   ${txt_error}   Epic sadface: Username and password do not match any user in this service

Verify Login fails - LockedOut User
    [Tags]  SauceLabs   LockedOutUser
    Open Browser  ${url}   ${browser}
    Maximize Browser Window
    Input Text    ${txtbox_username}  locked_out_user
    Input Text    ${txtbox_password}  secret_sauce
    Click Button  ${btn_login}
    Sleep  2s
    Element Should Contain   ${txt_error}   Epic sadface: Sorry, this user has been locked out.

Verify Login fails - Wrong Password
    [Tags]  SauceLabs   WrongPwd
    Open Browser  ${url}   ${browser}
    Maximize Browser Window
    Input Text    ${txtbox_username}  locked_out_user
    Input Text    ${txtbox_password}  secret_sa
    Click Button  ${btn_login}
    Sleep  2s
    Element Should Contain   ${txt_error}   Epic sadface: Username and password do not match any user in this service

Verify Login fails - Blank Username and Password
    [Tags]  SauceLabs   BlankUserAndPwd
    Open Browser  ${url}   ${browser}
    Maximize Browser Window
    Input Text    ${txtbox_username}  locked_out_user
    Input Text    ${txtbox_password}  secret_sa
    Click Button  ${btn_login}
    Sleep  2s
    Element Should Contain   ${txt_error}   Epic sadface: Username and password do not match any user in this service