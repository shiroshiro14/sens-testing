***Settings***

Resource    ../resource.robot

***Test Cases***
display hover test 
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
    ${SIZE}=        Get List Items       xpath://*[@id="content-wrapper"]/div/div/ui-view/div/div/div[2]/div/table/tbody/tr/td[1]/select     true
    Log                 list items ${SIZE}
    FOR     ${INDEX}     IN RANGE       len(${SIZE})
        Log     ${SIZE}[${INDEX}]
        Select From List By Value       xpath://*[@id="content-wrapper"]/div/div/ui-view/div/div/div[2]/div/table/tbody/tr/td[1]/select       ${SIZE}[${INDEX}]
        Wait Until Page Contains Element    xpath://*[@id="content-wrapper"]/div/div/ui-view/div/div/div[2]/div/table/tbody/tr/td[1]/select 
        ${classname}=       Get Element Attribute       xpath://*[@id="content-wrapper"]/div/div/ui-view/div/div/div[2]/div/table/tbody/tr/td[1]/select     className
        Execute Javascript      $scope = angular.element(document.getElementsByClassName('${classname}')).scope()
        ${programName}=     Execute Javascript      return $scope.programName
        Mouse Over      xpath://*[@id="chart-data"]/div[1]/div/h4
        Element Should Be Visible       xpath: //*[@id="chart-data"]/div[1]/div/div[1]
        Run Keyword And Continue On Failure     Element Should Contain      xpath: //*[@id="chart-data"]/div[1]/div/div[1]      pronunciation, vocabulary, grammar
        sleep       ${SDelay}
        IF      '${programName}' == 'kindy'
            Mouse Over      xpath://*[@id="chart-data"]/div[2]/div/h4
            Element Should Be Visible       xpath://*[@id="chart-data"]/div[2]/div/div[1]
            Run Keyword And Continue On Failure     Element Should Contain      xpath://*[@id="chart-data"]/div[2]/div/div[1]       correlation between sounds and letters or groups of letters
        ELSE 
            Mouse Over      xpath://*[@id="chart-data"]/div[2]/div/h4
            Element Should Be Visible       xpath://*[@id="chart-data"]/div[2]/div/div[1]
            Run Keyword And Continue On Failure     Element Should Contain      xpath://*[@id="chart-data"]/div[2]/div/div[1]       writing, speaking, listening, reading
        END
        Mouse Over     xpath://*[@id="chart-data"]/div[3]/div/h4
        Element Should Be Visible       xpath://*[@id="chart-data"]/div[3]/div/div[1]
        Run Keyword And Continue On Failure     Element Should Contain      xpath://*[@id="chart-data"]/div[3]/div/div[1]       communication, collaboration, creativity, critical thinking & 21st century skills
    END
    resource.teardown