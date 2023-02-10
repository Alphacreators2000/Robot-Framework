*** Settings ***
Documentation     Sample Documentation
Resource          resource.robot

*** Test Cases ***
Valid Login Page
    [Tags]  alpaha
    Open Browser To Login Page
    Input Username    demo
    Input Password    mode
    Submit Credentials
    Welcome Page Should Be Open
    [Teardown]    Close Browser
    
*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Login Page

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    username_field    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password_field    ${password}

Submit Credentials
    Click Button    login_button

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Welcome Page
    
// Browser Library
*** Keywords ***
Open Browser To Login Page
    New Page    ${LOGIN URL}
    Login Page Should Be Open

Login Page Should Be Open
    Get Title    ==    Login Page

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open
