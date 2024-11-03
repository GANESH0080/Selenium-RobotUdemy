*** Settings ***
Documentation    To validate the login form
Library     SeleniumLibrary
Library     webdriver_manager
Test Teardown    Close Browser
Test Template    Validate login
#Resource

*** Variables ***
${LOGIN URL}      https://rahulshettyacademy.com/loginpagePractise/
${BROWSER}        Chrome
${loc_Validation_msg}    xpath://*[contains(@class,'alert')]
${loc_Validation_msg1}    css:.alert-danger


*** Test Cases ***    UnName    Ppass
Invalid Credentials    Ganesh    Salunkhw
Invalid Credentials    Vinit    Patil
Invalid Credentials    Dhiraj    Pawar
Invalid Credentials    Vishwa    Danawale



*** Keywords ***
Validate login    
    [Arguments]    ${UName}    ${Pass}
    Open Browser with Rahulshettyacademy.com
    Enter Username - Password & click on SIGNIN button    ${UName}    ${Pass}
    Wait and Validate the validation message

Open Browser with Rahulshettyacademy.com
    Open Browser    ${LOGIN URL}    ${BROWSER}    webdrivermanager.webdriver_manager.chrome.ChromeDriverManager().install()
    Maximize Browser Window

Enter Username - Password & click on SIGNIN button
    [Arguments]    ${UserName}     ${Password}
    Input Text    id:username        ${UserName}
    Input Password    id:password    ${Password}
    Click Button    signInBtn

Wait and Validate the validation message
    #CSS for validation message is ".alert-danger"
    Wait Until Element Is Visible    ${loc_Validation_msg}    timeout=15
#    ${axtualmsg}=    Get Text    ${loc_Validation_msg1}
#    Should Be Equal As Strings    ${axtualmsg}    Incorrect username/password.
    Element Text Should Be    ${loc_Validation_msg1}    Incorrect username/password.


    

    
    




