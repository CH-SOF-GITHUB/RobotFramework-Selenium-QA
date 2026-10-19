
*** Settings ***
Documentation    Test Chrome sur BlueStacks avec Appium
Library          AppiumLibrary
Suite Teardown   Run Keyword If Test Failed    Log    Vérifier les logs Appium et Android

*** Variables ***
${APPIUM_SERVER}    http://127.0.0.1:4723
${DEVICE_UDID}      emulator-5554

*** Test Cases ***
Ouvrir Chrome Sur BlueStacks
    Open Application    ${APPIUM_SERVER}
    ...    platformName=Android
    ...    automationName=UiAutomator2
    ...    deviceName=${DEVICE_UDID}
    ...    udid=${DEVICE_UDID}
    ...    browserName=Chrome
    ...    noReset=${True}
    ...    adbExecTimeout=120000
    ...    uiautomator2ServerLaunchTimeout=60000
    ...    uiautomator2ServerInstallTimeout=60000

    Go To Url    https://www.google.com
    Sleep    3s
    Capture Page Screenshot
    [Teardown]    Run Keyword And Ignore Error    Close Application