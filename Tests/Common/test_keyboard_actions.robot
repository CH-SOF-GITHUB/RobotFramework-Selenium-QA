*** Settings ***
Resource   ../../Resources/PageObject/KeyDefs/Common.robot
Variables        ../../Resources/PageObject/Locators/Locators.py
Test Teardown  Close Test Browser

*** Variables ***
${site_url_1}        https://www.testmuai.com/selenium-playground/
${NameField}         name:name
${EmailField}        xpath://input[@id='inputEmail4']
${PasswordField}     xpath://input[@id='inputPassword4']
${CompanyField}      //input[@id='company']
${WebsiteField}      //input[@id='websitename']
${CountryDropDown}   //select[@name='country']
${CityField}         //input[@id='inputCity']
${Address1Field}     //input[@id='inputAddress1']
${Address2Field}     //input[@id='inputAddress2']
${StateField}        //input[@id='inputState']
${ZipCodeField}      //input[@id='inputZip']
${FinalSubmission}   //*[@id='seleniumform']/div[6]/button

${SuccessText}       Thanks for contacting us, we will get back to you shortly.
${ExpectedURL}       https://www.testmuai.com/selenium-playground/input-form-demo/
*** Comments ***
# Configuration for first test scenario


*** Test Cases ***
Example 1: [Playground] Send Keys Demo with Robot Framework
   [Tags]  Selenium Playground Automation
   [Timeout]   ${TIMEOUT}
   Open Test Browser  TEST_URL=${site_url_1}  BROWSER=Chrome
   Page Should Contain Element    ${SubmitButton}
   Click Link  ${SubmitButton}
   Page Should Contain Element    locator=${NameField}

   # 1. Enter details in the input form
   # Name
   Input Text  ${NameField}   TestName
   # Email
   Input Text  ${EmailField}  testing@gmail.com
   # Password
   Input Text  ${PasswordField}  Password1
   # Company
   Input Text  ${CompanyField}   LambdaTest
   # Website
   Input Text  ${WebsiteField}   https://www.testmuai.com
   # Country
   Select From List By Value     ${CountryDropDown}      US
   # City
   Input Text  ${CityField}      San Jose
   # Address 1
   Input Text  ${Address1Field}  Googleplex, 1600 Amphitheatre Pkwy
   # Address 2
   Input Text  ${Address2Field}  Mountain View, CA 94043
   # State
   Input Text  ${StateField}   text=calefornia
   # Zip Code
   Input Text  ${ZipCodeField}  text=94088
   # Click on submit button
   Click Button   ${FinalSubmission}
   # Go back to the top of the page instantly.
   Execute Javascript  window.scrollTo(0, 0)
   # Check the validation of Input Form
   ## 2. Verify the presence of succes Text
   Page Should Contain   ${SuccessText}
   ### 3. Retreive Current URL and compare it with expected URL
   ${CurrentURL}=       Get Location
   Log To Console       Current URL after Submit Form: ${CurrentURL}
   Location Should Be   ${ExpectedURL}
   Sleep   2s
   Log    Completed - Example 2: [Playground] Parallel Testing with Robot framework