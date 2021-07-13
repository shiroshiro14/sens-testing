***Settings***

Resource        ../../resource.robot


***Variables***
${USERNAME}      teacher1@apollo.edu.vn
${PASSWORD}      apollo123456

***Keywords***
user login
    resource.enter username         ${USERNAME} 
    resource.enter password         ${PASSWORD}
    resource.submit form 

check student attendance for testing
    Click Element       xpath://*[@id="content-wrapper"]/div/div/ui-view/div[2]/div/div[3]/div/div/ul/li[2]
    Click Element       xpath://*[@id="attendance"]/div[1]/table/tbody/tr/td[4]/div/div[1]/button
    sleep               ${SDelay}
    Click Element       xpath://*[@id="attendance"]/div[2]/button[1]
    sleep               ${SDelay}
    Click Element       xpath:/html/body/div[22]/div/div[3]/div/button
online session
    Click Element       xpath://*[@id="content-wrapper"]/div/div/ui-view/div[2]/div/div[3]/div/div/ul/li[4]/a
    Switch Window       title=Online Class
    Location Should Be      https://api.edugix.com/teacher/onlineClass.html#/index/37424/5378/-1
drag and drop testing
    Click Element       xpath://*[@id="slide-339"]/div[1]/img
    Element Should Be Enabled           xpath:/html/body/ui-view/div[2]/div[2]/div[1]/div[2]/div/div/div[1]                  
    Drag And Drop       xpath:/html/body/ui-view/div[2]/div[2]/div[1]/div[2]/div/div/div[1]         xpath:/html/body/ui-view/div[2]/div[2]/div[2]/div/div/*[name()="svg"]/*[name()="rect"][4]
    Page Should Contain Element         xpath:/html/body/ui-view/div[2]/div[2]/div[2]/div/div/*[name()="svg"]/*[name()="image"]
    ${x}=       Get Horizontal Position     xpath:/html/body/ui-view/div[2]/div[2]/div[2]/div/div/*[name()="svg"]/*[name()="image"]
    ${y}=       Get Vertical Position       xpath:/html/body/ui-view/div[2]/div[2]/div[2]/div/div/*[name()="svg"]/*[name()="image"]     
    Drag And Drop By Offset             xpath:/html/body/ui-view/div[2]/div[2]/div[2]/div/div/*[name()="svg"]/*[name()="image"]     20      20
    ${new_x}=       Get Horizontal Position     xpath:/html/body/ui-view/div[2]/div[2]/div[2]/div/div/*[name()="svg"]/*[name()="image"]
    ${new_Y}=       Get Vertical Position       xpath:/html/body/ui-view/div[2]/div[2]/div[2]/div/div/*[name()="svg"]/*[name()="image"]
    ${x_offset}=        Set Variable        ${${new_x} - ${x}}
    ${y_offset}=        Set Variable        ${${new_y} - ${y}}
    Run Keyword And Continue On Failure       Should Be True      '${x_offset}'=='20' and '${y_offset}'=='20' 

***Test Cases***
add function 02
    resource.open the browser teacher  
    user login
    sleep       ${RDelay}
    Page Should Contain Element         xpath://*[@id="calendar"]/div[2]/div/table/tbody/tr/td/div/div/div[3]/div[2]/table/tbody/tr[3]/td[2]
    Click Element           xpath://*[@id="calendar"]/div[2]/div/table/tbody/tr/td/div/div/div[3]/div[2]/table/tbody/tr[3]/td[2]
    sleep       ${RDelay}
    Page Should Contain Element         xpath:/html/body/div[1]/div/div
    Click Element           xpath:/html/body/div[1]/div/div/div[3]/p/button[2]
    sleep       ${RDelay}
    #check student attendance for testing
    online session
    sleep       ${RDelay}
    drag and drop testing 
    sleep       ${Delay}
    resource.teardown

