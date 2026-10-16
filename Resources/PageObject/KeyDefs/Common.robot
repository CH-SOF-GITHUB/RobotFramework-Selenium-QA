*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${TIMEOUT}      3000
# Des variables globales stockant les noms de menus ou de liens à manipuler (ex: "AddOns" et "Designs").
${MENU_ITEM}    AddOns
${DESIGN_ITEM}  Designs

*** Keywords ***
Open Test Browser
     [Arguments]    ${TEST_URL}    ${BROWSER}
     [Timeout]      ${TIMEOUT}
     Open Browser   ${TEST_URL}    ${BROWSER}
     Maximize Browser Window

Close Test Browser
     Close Browser

Move to Element
     [Documentation]   Hover over the menu item
     ${menu_item}=  Get WebElement   partial link=${MENU_ITEM}
     Mouse Over  ${menu_item}
     Sleep  2s      #equivalent of time.sleep(2)

Click Menu Item
     [Documentation]  Click the submenu item once it opens up
     Click Link   partial link=${DESIGN_ITEM}
     Sleep  10s
     # Wait Until Page Contains Element