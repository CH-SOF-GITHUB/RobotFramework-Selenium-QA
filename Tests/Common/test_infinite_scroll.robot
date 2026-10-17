*** Settings ***
Resource   ../../Resources/PageObject/KeyDefs/Common.robot
Variables  ../../Resources/PageObject/Locators/Locators.py
Test Teardown   Close Test Browser

*** Variables ***
${test_site_url3}   https://lastest.cloud/playground
${browser}          chrome
${SCROLL_PAUSE_TIME}    2s
# Infinite Scrolling website
# https://scrapingclub.com/exercise/list_infinite_scroll/
# Reference - https://github.com/hjsblogger/web-scraping-with-python/
# blob/main/tests/beautiful-soup/test_infinite_scraping.py
${xProduct}        xpath://a[normalize-space()='GitHub visual regression integration']



*** Test Cases ***
Click Element Infinite Scroll
      Open Test Browser    ${test_site_url3}   ${browser}
      Sleep   3s
      # Boucle pour descendre 5 fois de suite
      WHILE  ${True}
           ${start_height}=  Get Window Height
           Log To Console    \nStart Height: ${start_height}\n
           # Execute Keyword script JS  pour scroller tout en bas
           Scroll Down
           Sleep             ${SCROLL_PAUSE_TIME}
           #Log To Console    \nDéfilement numéro: ${index}\n
           ${scroll_height}=  Get Window Height
           Log To Console     \nScroll Height: ${scroll_height}\n
           Run Keyword If  '${start_height}' == '${scroll_height}'  Exit For Loop
           # Refer - https://github.com/hjsblogger/web-scraping-with-python/
           # blob/main/tests/beautiful-soup/test_infinite_scraping.py#L78
      END

      # Now all the products are loaded since we have reached the end of site
      # Check if a the respective product is present in the DOM
      ${status}=  Run Keyword And Return Status    Page Should Contain Element   ${xProduct}
      Log To Console  \nStatus: ${status}\n
      # Si l'élément est trouvé (True), on clique dessus
      IF  ${status}
          Scroll Element Into View    ${xProduct}
          Click Element       ${xProduct}
          Sleep   ${SCROLL_PAUSE_TIME}
          # Community Rocks :) https://forum.robotframework.org/t/
          # wait-for-complete-page-load-in-robot-framework/4597/2
          Wait For Condition	return document.readyState == "complete"
          Log To Console      \nCompleted - Infinite Scroll with Robot Framework\n
      ELSE
          Fail  Element not found on page
      END