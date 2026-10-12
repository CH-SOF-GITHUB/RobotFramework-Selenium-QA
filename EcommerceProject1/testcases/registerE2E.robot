*** Settings ***
Documentation      Register to website
Resource           ../resources/register_resource.robot
Test Template      Run The Test Cases
Test Setup         Open The WebSite

*** Keywords ***