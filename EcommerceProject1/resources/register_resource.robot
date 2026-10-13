*** Settings ***
Library  SeleniumLibrary

*** Variables ***
# URL of Tests #
${URL}   https://practicesoftwaretesting.com/auth/login
# URL to access to Register Page #
${REGISTER_PAGE_LINK Locator}  //a[normalize-space()='Enregistrez votre compte']
# Locators des champs (IDs extraits du DOM) #
${FIRST_NAME_FIELD Locator}  id:first_name
${LAST_NAME_FIELD Locator}  id:last_name
${DOB_FIELD Locator}  id:dob
${COUNTRY_DROPDOWN Locator}  id=country
${POSTAL_CODE_FIELD Locator}  id:postal_code
${STREET_NUMBER_FIELD Locator}  id:house_number
${STREET_FIELD Locator}  id:street
${CITY_FIELD Locator}  id:city
${STATE_FIELD Locator}  id:state
${PHONE_FIELD Locator}  id:phone
${EMAIL_FIELD Locator}  id:email
${PASSWORD_FIELD Locator}  id=password
${SUBMIT_BTN Locator}  //button[@type='submit']
# Test Data (Données de test) #
${VALID_FIRST_NAME}  Chaker
${VALID_LAST_NAME}  Ben Said
${VALID_DOB}  1992-05-07
${COUNTRY_CODE_ALGERIA}  DZ
${COUNTRY_CODE_ALBANIA}  AL
${COUNTRY_CODE_ANDORRA}  AD
${COUNTRY_CODE_TUNISIA}  TN
${COUNTRY_NAME_ALGERIA}  Algeria
${COUNTRY_NAME_ALBANIA}  Albania
${COUNTRY_NAME_TUNISIA}  Tunisia
${VALID_POSTAL_CODE}  75009
${VALID_STREET_NUMBER}  123
${VALID_STREET}  Rue de la Teste
${VALID_CITY}  Gabes
${VALID_STATE}  Tunisia
${VALID_PHONE}  0123456789
${VALID_EMAIL}  chaker.test.qa+3@yopmail.com
${VALID_PASSWORD}  ChakerSecure#2026!Test


*** Keywords ***
Open The WebSite
    [Arguments]   ${BROWSER}
    Open Browser  url=${URL}  browser=${BROWSER}
    Maximize Browser Window

Navigate To Register Page
    Click Link     ${REGISTER_PAGE_LINK Locator}

Register New User
    [Arguments]    ${email}
    Input Text     ${FIRST_NAME_FIELD Locator}           ${VALID_FIRST_NAME}
    Input Text     ${LAST_NAME_FIELD Locator}            ${VALID_LAST_NAME}
    Input Text     ${DOB_FIELD Locator}                  ${VALID_DOB}
    Mouse Over     ${COUNTRY_DROPDOWN Locator}
    Click Element  ${COUNTRY_DROPDOWN Locator}
    Select From List By Value    ${COUNTRY_DROPDOWN Locator}    ${COUNTRY_CODE_TUNISIA}
    Input Text     ${POSTAL_CODE_FIELD Locator}          ${VALID_POSTAL_CODE}
    Input Text     ${STREET_NUMBER_FIELD Locator}        ${VALID_STREET_NUMBER}
    Input Text     ${STREET_FIELD Locator}               ${VALID_STREET}
    Input Text     ${CITY_FIELD Locator}                 ${VALID_CITY}
    Input Text     ${STATE_FIELD Locator}                ${VALID_STATE}
    Input Text     ${PHONE_FIELD Locator}                ${VALID_PHONE}
    Input Text     ${EMAIL_FIELD Locator}                ${email}
    Input Text     ${PASSWORD_FIELD Locator}             ${VALID_PASSWORD}
    Sleep          5s
    Click Button   ${SUBMIT_BTN Locator}

Verify Registering An Account
    ${CurrentURL}  Get Location
    Log To Console  \n Current URL after Register : ${CurrentURL}
    Should Contain  ${CurrentURL}  item=/login

Run The Test Cases
    # TODO: implement keyword "Run The Test Cases".
    Log To Console  Test Executed