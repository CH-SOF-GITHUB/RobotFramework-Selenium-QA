*** Settings ***
Library         SeleniumLibrary
Documentation   Behavior-Driven Development Test (BDD)

*** Test Cases ***
Opening Foundation Page
    Given "robotframework.org" is open
    When The user clicks the "Foundation" button
    Then The page title should be "Robot Framework Foundation"
    Then The url should be "https://robotframework.org/foundation/"

*** Keywords ***
"robotframework.org" is open
    Open Browser    https://robotframework.org    chrome

The user clicks the "Foundation" button
    Click Element             locator=//*[@id="page"]/nav/div/button/span
    Wait Until Element Is Visible    locator=link:Foundation    timeout=10s
    Click Link                locator=link:Foundation

The page title should be "Robot Framework Foundation"
    Title Should Be    Robot Framework Foundation

The url should be "https://robotframework.org/foundation/"
    Location Should be  https://robotframework.org/foundation/