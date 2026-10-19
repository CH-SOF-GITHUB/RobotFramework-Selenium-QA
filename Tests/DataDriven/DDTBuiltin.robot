*** Settings ***
Library         SeleniumLibrary
Resource        ../../Resources/PageObject/KeyDefs/Common.robot
Suite Setup     Common.Open Test Browser  TEST_URL=https://www.saucedemo.com/  BROWSER=Chrome
Suite Teardown  Common.Close Test Browser
Test Template   Invalid Login Scenarios

*** Test Cases ***                                    USERNAMAE         PASSWORD        ERROR MESSAGE
Verify Login fails - Wrong Username                   standard_us       secret_sauce    Epic sadface: Username and password do not match any user in this service
Verify Login fails - LockedOut User                   locked_out_user   secret_sauce    Epic sadface: Sorry, this user has been locked out.
Verify Login fails - Wrong Password                   standard_user     secret_sa       Epic sadface: Username and password do not match any user in this service
Verify Login fails - Blank Username and Password      ${EMPTY}          ${EMPTY}        Epic sadface: Username is required

*** Keywords ***
Invalid Login Scenarios
    # TODO: implement keyword "Invalid Login Scenarios".
    [Arguments]  ${username}  ${password}  ${error_msg}
    Input Text    ${txtbox_username}  ${username}
    Input Text    ${txtbox_password}  ${password}
    Sleep  2s
    Click Button  ${btn_login}
    Sleep  2s
    Element Should Contain  ${txt_error}  ${error_msg}