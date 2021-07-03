***Settings***
Documentation       An example resource file 
Library             SeleniumLibrary
Library             RequestsLibrary
Library             BrowserMobProxyLibrary

***Variables***
${APIPAGE}      https://api.edugix.com
${HOMEPAGE}     https://api.edugix.com/login.html
${TEACHERPAGE}      https://api.edugix.com/teacher.html
${BROWSER}      Chrome
${Delay}        5s
${RDelay}       1s
${SDelay}       0.5s
${parentsUserName}          test_report01_parents@gmail.com 
${parentsPassword}          apollo123456
${teacherUserName}          teacher4@apollo.edu.vn
${teacherPassword}          apollo123456       
${jsonurl}      https://api.edugix.com/ajax/teacher/report/classSummary.html?classId=
***Keywords***
open the browser
    ${BrowserMob_Proxy}=    Create Proxy
    Create Webdriver        ${BROWSER}    proxy=${BrowserMob_Proxy}
    Open Browser        ${HOMEPAGE}     ${BROWSER}
    Maximize Browser Window 
    Register Keyword To Run ON Failure      NONE 
open the browser teacher 
    Open Browser        ${TEACHERPAGE}     ${BROWSER}
    Maximize Browser Window 
    Register Keyword To Run ON Failure      NONE 

user login parents 
    enter username      ${parentsUserName}
    enter password      ${parentsPassword}
    submit form 

user login teacher      
    enter username      ${teacherUserName}
    enter password      ${teacherPassword}
    submit form 

enter username
    [Arguments]     ${input}
    Input Text      id=tbx-username     ${input}     

enter password 
    [Arguments]     ${input}    
    Input Text      id=tbx-password     ${input}

submit form 
    Click Button    id=btn-login

get json value 
    # [Arguments]     ${jsonlink}
    
    # ${jsonid}=      Set Variable        /ajax/teacher/report/classSummary.html?classId=${jsonlink}
    ${response}=        Get Har
    create file             ${EXECDIR}${/}file.har     ${response}
    log to console          Browsermob Proxy HAR file saved as ${EXECDIR}${/}file.har
teardown
    Close Browser