*** Settings ***
Resource  ../../Resources/PageObject/KeyDefs/Common.robot
Variables  ../../Resources/PageObject/Locators/Locators.py
Test Teardown  Close Test Browser

*** Variables ***
${site_test_url_2}   https://www.testmuai.com/selenium-playground/drag-and-drop-demo/
########## Locators for mouse interactions ##########
${ElDroggable1_1}  xpath://span[normalize-space()='Draggable 1']
${ElDroggable1_2}  xpath://span[normalize-space()='Draggable 2']
${ElDroppable1}    xpath://div[@id='mydropzone']
${Droppedlist1}    id:droppedlist

${ElDroggable2}  id:draggable
${ElDroppable2}  id:droppable
${IsDropped2}    xpath://p[normalize-space()='Dropped!']

*** Test Cases ***
Example 1: [Playground] Drag & Drop Mouse Operations Demo with Robot Framework
     [Tags]   DragDrop1
     [Timeout]  ${TIMEOUT}
     Open Test Browser  ${site_test_url_2}   Chrome
     # Verify the droggable and droppable elements are present
     Wait Until Element Is Visible  ${ElDroggable2}   timeout=10s
     Wait Until Element Is Visible  ${ElDroppable2}   timeout=10s
     Scroll Element Into View       ${ElDroggable2}
     Scroll Element Into View       ${ElDroppable2}
     # Drag and Drop (Demo 2)
     Drag And Drop  ${ElDroggable2}  ${ElDroppable2}
     Sleep  2s
     # Verify the operation result
     Wait Until Element Is Visible   ${IsDropped2}   timeout=5s
     Log    Completed - Drag & Drag Demo 2 with Robot Framework

Example 2: [Playground] Drag & Drop Mouse Operations Demo with Robot Framework
     [Tags]   DragDrop2
     [Timeout]  ${TIMEOUT}
     Open Test Browser  ${site_test_url_2}   Chrome
     # Verify the droggable and droppable elements are present
     Wait Until Element Is Visible  ${ElDroggable1_1}   timeout=10s
     Wait Until Element Is Visible  ${ElDroggable1_2}   timeout=10s
     Scroll Element Into View       ${ElDroggable1_1}
     Scroll Element Into View       ${ElDroppable1}
     # Drag and Drop (Demo 1)
     Drag And Drop   ${ElDroggable1_1}  ${ElDroppable1}
     Sleep  2s
     Drag And Drop   ${ElDroggable1_2}  ${ElDroppable1}
     Sleep  2s
     Element Should Contain   ${Droppedlist1}  Draggable 1
     Sleep  2s
     Element Should Contain   ${Droppedlist1}  Draggable 2
     Sleep  2s
     Log    Completed - Drag & Drag Demo with Robot Framework