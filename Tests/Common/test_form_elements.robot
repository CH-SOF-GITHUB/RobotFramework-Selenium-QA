*** Settings ***
Library    SeleniumLibrary
Resource   ../../Resources/PageObject/KeyDefs/Common.robot
Test Teardown   Close Test Browser

*** Variables ***
${DROPDOWN_URL}   https://www.testmuai.com/selenium-playground/select-dropdown-demo/
${BROWSER}        Chrome
${DROPDOWN_ID Locator}   id:select-demo

${CHECKBOX_URL}           https://www.testmuai.com/selenium-playground/checkbox-demo/
${CheckBox_Btn Locator}   xpath:(//input[@type='checkbox'])[1]
*** Test Cases ***
Select Option From Dropdown
       [Tags]  SELECT
       Open Test Browser          ${DROPDOWN_URL}  ${BROWSER}
       Select From List By Value  ${DROPDOWN_ID Locator}   Monday
       List Selection Should Be   ${DROPDOWN_ID Locator}   Monday

Check And Verify Checkbox State
       [Tags]  CHECKBOX
       Open Test Browser   ${CHECKBOX_URL}  ${BROWSER}
       Select Checkbox     ${CheckBox_Btn Locator}
       Checkbox Should Be Selected   ${CheckBox_Btn Locator}
       Sleep   2s
       Double Click Element  ${CheckBox_Btn Locator}
       Checkbox Should Not Be Selected  ${CheckBox_Btn Locator}