***Settings***
Resource        ../resource_parents.robot


***Variables***
${USERNAME}        quang1parents@gmail.com
${PASSWORD}        apollo123456
***Keywords***
user login 
    input username 
    input password 
    resource_parents.submit form
input username 
    Input Text      id=tbx-username     ${USERNAME}
input password 
    Input Text      id=tbx-password     ${PASSWORD}
go to profile 
    Click Element       xpath://*[@id="menu"]/li[8]/a
    Click Element       xpath://*[@id="menu"]/li[8]/ul/li[1]/a
hover on avatar  
    Mouse Over       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div[3]/div/div[1]/img 
    Element Should Be Visible           xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div[3]/div/div[1]/div
    Element Should Contain Text         xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div[3]/div/div[1]/div        edit 
***Test Cases***
hover on avatar test  
    resource_parents.open the browser
    user login 
    sleep       ${Delay}
    go to profile 
    sleep       ${RDelay}
    hover on avatar 
    resource_parents.teardown









