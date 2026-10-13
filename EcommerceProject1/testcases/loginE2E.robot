*** Settings ***
Documentation   Login to website
Resource  ../resources/login_resource.resource
Test Tags   login    critical
Test Teardown  Close Browser

*** Test Cases ***
SQA-003
       Open The WebSite  Chrome
       User Login
       Verify Logging into application
       Take Screenshot Of Test result