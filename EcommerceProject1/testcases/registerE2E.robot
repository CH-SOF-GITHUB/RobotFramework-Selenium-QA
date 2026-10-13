*** Settings ***
Documentation      Register to website
Resource           ../resources/register_resource.robot
Test Tags        register    critical
#Test Setup         Open The WebSite  Chrome


*** Test Cases ***
Simple Execution Test 1
    [Tags]    -chrome
    Open The WebSite  Chrome
    Log To Console    \nLe navigateur est ouvert avec succès !
    Sleep             3s
    Navigate To Register Page
    Log To Console    \nUser got to Register Page
    Sleep             3s
    Register New User  chaker.test.qa+4@yopmail.com
    Sleep             5s
    Verify Registering An Account

Simple Execution Test 2
    [Tags]     -firefox
    Open The WebSite  Firefox
    Log To Console    \nLe navigateur est ouvert avec succès !
    Sleep             3s
    Navigate To Register Page
    Log To Console    \nUser got to Register Page
    Sleep             3s
    Register New User  chaker.test.qa+5@yopmail.com
    Sleep             5s
    Verify Registering An Account

Simple Execution Test 3
    [Tags]    -safari
    Open The WebSite  Safari
    Log To Console    \nLe navigateur est ouvert avec succès !
    Sleep             3s
    Navigate To Register Page
    Log To Console    \nUser got to Register Page
    Sleep             3s
    Register New User  chaker.test.qa+6@yopmail.com
    Sleep             5s
    Verify Registering An Account