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
check avatar position and visibility  
    Element Should Be Visible       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div[3]/div/div[1]/img
    ${y}=       Get Vertical Position       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div[3]/div/div[1]/img
    ${x}=       Get Horizontal Position     xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div[3]/div/div[1]/img
    Element Should Be Enabled       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div[3]/div/div[1]/img
***Test Cases***
choosing image test 
    resource_parents.open the browser
    user login 
    sleep       ${Delay}
    go to profile 
    sleep       ${RDelay}
    check avatar position and visibility
    teardown 
    



