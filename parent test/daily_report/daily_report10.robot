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
look table  
    Element Should Be Visible      xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div[2]/table/tbody
    ${rows}=        Get Element Count     xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div[2]/table/tbody/tr
    Log         ${rows}
    FOR     ${INDEX}        IN RANGE    ${${rows}-1}
        ${i1}=      Set Variable    ${${INDEX}+1}
        ${i2}=      Set Variable    ${${INDEX}+2}
        ${A}=       Get Text       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div[2]/table/tbody/tr[${i1}]/td[1]
        Log     ${A}
        ${a}=       Convert To Integer      ${A}
        ${B}=       Get Text        xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div[2]/table/tbody/tr[${i2}]/td[1]
        Log   ${B}
        ${b}=       Convert To Integer      ${B}
        IF      ${a} > ${b}
            Fail        msg=        Wrong Order
            Exit For Loop
        END
    END
teardown
    Close Browser
*** Test Cases ***

Login test
    open the browser
    login
    sleep       ${DELAY}
    look table
    teardown

