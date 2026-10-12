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
${VALID_CITY}  Gabes
${VALID_STATE}  Tunisia
${VALID_PHONE}  0123456789
${VALID_EMAIL}  chaker.test.qa+1@yopmail.com
${VALID_PASSWORD}  Password123!


*** Keywords ***
Open The WebSite
    Open Browser  url=${URL}  browser=Chrome
    Maximize Browser Window