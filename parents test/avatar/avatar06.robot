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
check profile page content 
    Element Should Be Visible       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div[2]/div/div[1]/div[1]/div/input
    Element Should Be Visible       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div[2]/div/div[1]/div[2]/div/input
    Element Should Be Visible       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div[2]/div/div[1]/div[3]/div/input
    Element Should Be Visible       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div[2]/div/div[1]/div[4]/div/button 
    Element Should Be Visible       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div[3]/div/div[1]/img
    Element Should Be Visible       xpath:/html/body/ng-include/div[2]/ui-view/div/div/div/div/div/div[3]/div/div[2]    
check page content after resize 
    Set Window Size     200     400
    check profile page content 
***Test Cases***
resize test  
    resource_parents.open the browser
    user login 
    sleep       ${Delay}
    go to profile 
    sleep       ${RDelay}
    check profile page content 
    sleep       ${RDelay}
    check page content after resize 
    teardown