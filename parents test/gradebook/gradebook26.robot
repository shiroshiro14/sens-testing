***Settings***
Resource    ../resource_parents.robot 

***Keywords***
gradebook login
    Input Text      id=tbx-username     abc@gmail.com  
    Input Text      id=tbx-password     apollo123456
    resource_parents.submit form
click report 
    Click Element       xpath://*[@id="menu"]/li[2]/a
click gradebook
    Click Element       xpath://*[@id="menu"]/li[2]/ul/li[2]/a
choose student for test 
    Select From List By Label       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div[1]/div[1]/div/select     Tran Trần Tài
choose class for test 
    Select From List By Value       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div[1]/div[2]/select     HCM22106-C00011-0322
gradebook table should be open 
    Element Should Be Visible       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div[2]/div/div/table/tbody
    Element Should Be Enabled       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div[2]/div/div/table/tbody/tr/td[3]/button
check gradebook a 
    Click Element       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div[2]/div/div/table/tbody/tr/td[3]/button
    Element Should Be Visible       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div[3]/div[1]/img
    Element Should Be Visible       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div[3]/div[2]/img
    Element Should Be Visible       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div[4]/div/*[name()="nvd3"]/*[name()="svg"]/*[name()="g"]/*[name()="g"]/*[name()="g"][3]/*[name()="g"]/*[name()="g"]/*[name()="g"]/*[name()="g"]/*[name()="g"][1]
    Element Should Be Visible       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div[5]/div/div
***Test Cases***
gradebook A test 
    resource_parents.open the browser   
    gradebook login
    sleep       ${Delay}
    click report 
    click gradebook
    sleep       ${RDelay} 
    choose student for test 
    choose class for test 
    sleep       ${SDelay}
    gradebook table should be open 
    sleep       ${RDelay}
    check gradebook a 
    teardown 

