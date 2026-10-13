*** Settings ***
Documentation   Login to website
Resource  ../resources/login_resource.resource
Test Tags   login    critical
Test Teardown  Close Browser

*** Test Cases ***
SQA-002 Verify logging into the Application using valid credentials
       Open The WebSite  Chrome
       User Login
       Verify Logging into application
       Take Screenshot Of Test result