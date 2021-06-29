*** Settings ***

Library     SeleniumLibrary

*** Variables ***

${HOMEPAGE}     https://api.edugix.com/login.html
${BROWSER}      Chrome
${DELAY}        5s
${RDelay}       1s
${EN}           en
${VI}           vi
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
change lang EN
    Click Element       xpath://*[@id="language-nav"]/a[2]/img
change lang VN
    Click Element       xpath://*[@id="language-nav"]/a[1]/img
teardown
    Close Browser
*** Test Cases ***

Login test
    open the browser
    login
    sleep       ${DELAY}
    change lang EN
    Execute Javascript      $rootScope = angular.element(document).scope()
    ${current}=     Execute Javascript      return $rootScope.currentLanguage
    ${lang}=        Convert To String       ${current}
    Should Be Equal As Strings      ${lang}     ${EN}
    Set Selenium Timeout    3s
    change lang VN
    Execute Javascript      $rootScope = angular.element(document).scope() 
    ${current}=     Execute Javascript      return $rootScope.currentLanguage
    ${lang}=        Convert To String       ${current}
    Should Be Equal As Strings      ${lang}     ${VI} 
    Set Selenium Timeout        3s
    teardown

