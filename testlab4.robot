*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        http://localhost:7272/Registration.html
${BROWSER}    chrome

*** Test Cases ***
Open Workshop Registration Page
	[Tags]    open
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Registration
    Page Should Contain    Workshop Registration
    Capture Page Screenshot    OpenPage.png
    Close Browser


Register Success
	[Tags]    success
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Registration
    Page Should Contain    Workshop Registration

    Input Text    id:firstname      Somyod
    Input Text    id:lastname       Sodsai
    Input Text    id:organization   CS KKU
    Input Text    id:email          somyod@kkumail.com
    Input Text    id:phone          091-001-1234

    Click Button    id:registerButton

    Title Should Be    Success
    Page Should Contain    Thank you for registering with us.
    Page Should Contain    We will send a confirmation to your email soon.
    Capture Page Screenshot    RegisterSuccess.png
    Close Browser


Register Success No Organization Info
	[Tags]    no
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Registration
    Page Should Contain    Workshop Registration

    Input Text    id:firstname    Somyod
    Input Text    id:lastname     Sodsai
    Input Text    id:email        somyod@kkumail.com
    Input Text    id:phone        091-001-1234

    Click Button    id:registerButton

    Title Should Be    Success
    Page Should Contain    Thank you for registering with us.
    Page Should Contain    We will send a confirmation to your email soon.
    Capture Page Screenshot    RegisterSuccessNoOrg.png
    Close Browser


Empty First Name
	[Tags]    firstname
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Registration
    Page Should Contain    Workshop Registration

    Input Text    id:lastname      Sodyod
    Input Text    id:organization  CS KKU
    Input Text    id:email         somyod@kkumail.com
    Input Text    id:phone         091-001-1234

    Click Button    id:registerButton

    Page Should Contain    *Please enter your first name!!
    Capture Page Screenshot    EmptyFirstName.png
    Close Browser


Empty Last Name
	[Tags]    lastname
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Registration
    Page Should Contain    Workshop Registration

    Input Text    id:firstname    Somyod
    Input Text    id:organization CS KKU
    Input Text    id:email        somyod@kkumail.com
    Input Text    id:phone        091-001-1234

    Click Button    id:registerButton

    Page Should Contain    *Please enter your last name!!
    Capture Page Screenshot    EmptyLastName.png
    Close Browser


Empty First Name and Last Name
	[Tags]    name
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Registration
    Page Should Contain    Workshop Registration

    Input Text    id:organization    CS KKU
    Input Text    id:email           somyod@kkumail.com
    Input Text    id:phone           091-001-1234

    Click Button    id:registerButton

    Page Should Contain    *Please enter your name!!
    Capture Page Screenshot    EmptyFirstAndLastName.png
    Close Browser


Empty Email
    [Tags]    email
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Registration
    Page Should Contain    Workshop Registration

    Input Text    id:firstname       Somyod
    Input Text    id:lastname        Sodsai
    Input Text    id:organization    CS KKU
    Input Text    id:phone           091-001-1234

    Click Button    id:registerButton

    Page Should Contain    *Please enter your email!!
    Capture Page Screenshot    EmptyEmail.png
    Close Browser


Empty Phone Number
    [Tags]    phone
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Registration
    Page Should Contain    Workshop Registration

    Input Text    id:firstname       Somyod
    Input Text    id:lastname        Sodsai
    Input Text    id:organization    CS KKU
    Input Text    id:email           somyod@kkumail.com

    Click Button    id:registerButton

    Page Should Contain    *Please enter your phone number!!
    Capture Page Screenshot    EmptyPhoneNumber.png
    Close Browser


Invalid Phone Number
    [Tags]    phonein
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Registration
    Page Should Contain    Workshop Registration

    Input Text    id:firstname       Somyod
    Input Text    id:lastname        Sodsai
    Input Text    id:organization    CS KKU
    Input Text    id:email           somyod@kkumail.com
    Input Text    id:phone           1234

    Click Button    id:registerButton

    Page Should Contain    Please enter a valid phone number!!
    Capture Page Screenshot    InvalidPhoneNumber.png
    Close Browser
