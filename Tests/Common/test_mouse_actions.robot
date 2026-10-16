*** Settings ***
Resource   ../../Resources/PageObject/KeyDefs/Common.robot
Test Teardown  Close Test Browser


*** Variables ***
${site_url_1}       https://ecommerce-playground.lambdatest.io/
${extected_title}   Designs

*** Comments ***
# Configuration for first test scenario

*** Test Cases ***
Example 2: [Playground] Actions Chains Robot Framework
      [Tags]  Action Chains Robot Framework
      [Timeout]  ${TIMEOUT}
      Open Test Browser  TEST_URL=${site_url_1}  BROWSER=Chrome
      Move to Element
      Sleep   3s
      Click Menu Item
      Sleep   2s
      #Check the new page title
	  ${curr_page_title}  Get Title
   	  Log To Console		${curr_page_title}
	  # https://robotframework.org/robotframework/latest/
	  # libraries/BuiltIn.html#Should%20Be%20Equal%20As%20Strings
      Should Be Equal As Strings  ${curr_page_title}    ${extected_title}