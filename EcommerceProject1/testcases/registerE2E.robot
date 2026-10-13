*** Settings ***
Documentation      Register to website
Resource           ../resources/register_resource.robot
Test Setup         Open The WebSite


*** Test Cases ***
Simple Execution Test
    Log To Console    \nLe navigateur est ouvert avec succès !
    Sleep             3s
    Navigate To Register Page
    Log To Console    \nUser got to Register Page
    Sleep             3s
    Register New User
    Sleep             5s
    Verify Registering An Accont