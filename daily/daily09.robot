*** Settings ***

Library     SeleniumLibrary

*** Variables ***

${HOMEPAGE}     https://api.edugix.com/login.html
${BROWSER}      Chrome
${DELAY}        5s
${RDelay}       1s
*** Keywords ***

open the browser
    Open Browser    ${HOMEPAGE}     ${BROWSER}
    Maximize Browser Window
search topic
    [Arguments]     ${topic}
    Input Text      name=q      ${topic}
    Press Key       name=q      \\13
login
    enter username
    enter password
    submit form
enter username
    Input Text      id=tbx-username     test_report01_parents@gmail.com
enter password
    Input Text     id=tbx-password     apollo123456
submit form
    Click Button       id=btn-login
change lang EN
    Click Element       xpath://*[@id="language-nav"]/a[2]/img
change lang VN
    Click Element       xpath://*[@id="language-nav"]/a[1]/img
teardown
    Close Browser
*** Test Cases ***

Login test
    open the browser
    login
    sleep       ${DELAY}
    change lang EN
    sleep       ${RDelay}
    change lang VN
    sleep       ${RDelay}
    change lang EN
    sleep       ${RDelay}
    change lang VN
    sleep       ${RDelay}
    teardown

