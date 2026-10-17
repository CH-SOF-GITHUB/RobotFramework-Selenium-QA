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
${xProduct}        xpath:/html/body/div[3]/div/div/div[1]/div[3]/div/div[15]/a"



*** Test Cases ***
Click Element Infinite Scroll
      Open Test Browser    ${test_site_url3}   ${browser}
      Sleep   3s
      # Boucle pour descendre 5 fois de suite
      FOR  ${index}  IN RANGE  1  6
           # Execute Keyword script JS  pour scroller tout en bas
           Scroll Down
           Sleep             ${SCROLL_PAUSE_TIME}
           Log To Console    \nDéfilement numéro: ${index}\n
           ${scroll_height}=  Get Window Height
           Log To Console     Scroll Height: ${scroll_height}\n
      END