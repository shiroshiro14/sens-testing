***Settings***

Resource    ../resource.robot

***Test Cases***
language switching
    resource.open the browser teacher 
    resource.user login teacher
    sleep       ${RDelay}
    Click Element   id=btn-login
    sleep       ${RDelay}
    Click Element       xpath://*[@id="language-nav"]/a[1]
    Location Should Contain     lang=en
    sleep       ${RDelay}
    Click Element       xpath://*[@id="language-nav"]/a[2]
    Location Should Contain     lang=vi     