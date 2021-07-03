*** Settings ***

Library     SeleniumLibrary

*** Variables ***

${HOMEPAGE}     https://api.edugix.com/login.html
${BROWSER}      Chrome
${Delay}        5s
${RDelay}       1s
${SIZE}         0
*** Keywords ***

open the browser
    Open Browser    ${HOMEPAGE}     ${BROWSER}
    Maximize Browser Window
    Register Keyword To Run On Failure      NONE
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
click report 
    Click Element       xpath://*[@id="menu"]/li[2]/a
click daily report
    Click Element       xpath://*[@id="menu"]/li[2]/ul/li[1]/a/span
check student list
    Element Should Be Enabled       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div/div[2]/ui-view/div[1]/div[1]
    Element Should Be Visible       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div/div[2]/ui-view/div[1]/div[1]
    Click Element       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div/div[2]/ui-view/div[1]/div[1]
    ${SIZE}=            Get List Items      xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div/div[2]/ui-view/div[1]/div[1]/div/select       true
    Log                 list items ${SIZE}
    FOR     ${INDEX}    IN RANGE    len(${SIZE})
        Log     ${SIZE}[${INDEX}]
        Select From List By Value       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div/div[2]/ui-view/div[1]/div[1]/div/select       ${SIZE}[${INDEX}]
        check class list 
        sleep       ${RDelay}
    END
check class list 
    Element Should Be Enabled       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div/div[2]/ui-view/div[1]/div[2]/select
    Element Should Be Visible       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div/div[2]/ui-view/div[1]/div[2]/select
    Click Element       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div/div[2]/ui-view/div[1]/div[2]/select
    ${SIZE}=            Get List Items      xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div/div[2]/ui-view/div[1]/div[2]/select        true
    Log                 list items ${SIZE}
    FOR     ${INDEX}     IN RANGE       len(${SIZE})
        Log     ${SIZE}[${INDEX}]
        Select From List By Value       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div/div[2]/ui-view/div[1]/div[2]/select       ${SIZE}[${INDEX}]
        check period list 
    END
check period list 
    Element Should Be Enabled       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div/div[2]/ui-view/div[1]/div[3]/select
    Element Should Be Visible       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div/div[2]/ui-view/div[1]/div[3]/select
    Click Element       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div/div[2]/ui-view/div[1]/div[3]/select
    sleep       ${RDelay}
    ${SIZE}=        Get List Items       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div/div[2]/ui-view/div[1]/div[3]/select     true
    Log                 list items ${SIZE}
    FOR     ${INDEX}     IN RANGE       len(${SIZE})
        Log     ${SIZE}[${INDEX}]
        Select From List By Value       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div/div[2]/ui-view/div[1]/div[3]/select       ${SIZE}[${INDEX}]
    END
teardown
    Close Browser
*** Test Cases ***

Login test
    open the browser
    login
    sleep       ${Delay}
    click report 
    click daily report
    sleep       ${RDelay}
    check student list
    sleep       ${RDelay} 
    teardown   