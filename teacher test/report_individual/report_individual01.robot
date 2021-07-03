***Settings***

Resource    ../resource.robot 

***Test Cases***
class filter
    resource.open the browser teacher 
    resource.user login teacher
    sleep       ${RDelay}
    Click Element   id=btn-login
    sleep       ${RDelay}
    Element Should Be Enabled       id=sen-menu-reports
    Click Element   id=sen-menu-reports
    sleep       ${RDelay}
    Element Should Be Enabled       id=menu_teacher_class_summary_report
    Click Element       id=menu_teacher_class_summary_report
    sleep       ${RDelay}
    Element Should Be Visible       xpath://*[@id="content-wrapper"]/div/div/ui-view/div/div/div[2]/div/table/tbody/tr/td[1]/select
    Element Should Be Enabled       xpath://*[@id="content-wrapper"]/div/div/ui-view/div/div/div[2]/div/table/tbody/tr/td[1]/select     
    ${SIZE}=        Get List Items       xpath://*[@id="content-wrapper"]/div/div/ui-view/div/div/div[2]/div/table/tbody/tr/td[1]/select     true
    Log                 list items ${SIZE}
    FOR     ${INDEX}     IN RANGE       len(${SIZE})
        Log     ${SIZE}[${INDEX}]
        Select From List By Value       xpath://*[@id="content-wrapper"]/div/div/ui-view/div/div/div[2]/div/table/tbody/tr/td[1]/select       ${SIZE}[${INDEX}]
        Run Keyword And Continue On Failure        Element Should Be Visible       xpath://*[@id="content-wrapper"]/div/div/ui-view/div/div/div[4]
        ${rows}=        Get Element Count       xpath://*[@id="session-list"]
        sleep       ${SDelay}
        IF      ${rows} == 0 
            Continue For Loop
        ELSE IF     ${rows} == 1
            Run Keyword And Continue On Failure     Element Should Be Enabled       xpath://*[@id="session-list"]/tbody/tr/td[5]/a
        ELSE
            FOR     ${INDEX}        IN RANGE        ${rows}
                Run Keyword And Continue On Failure     Element Should Be Enabled       xpath://*[@id="session-list"]/tbody/tr[${${rows}+1}]/td[5]/a
            END
        END
    END
    resource.teardown