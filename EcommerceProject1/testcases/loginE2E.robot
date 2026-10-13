*** Settings ***
Documentation   Login to website
Resource  ../resources/login_resource.resource
Test Tags        login    critical

*** Test Cases ***
Logging into app using valid credentials
       Open The WebSite  Chrome
       User Login
       Verify Logging into application
       Log To Console  \nLogin Test Passed\n