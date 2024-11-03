*** Settings ***
Documentation    To validate the login form
Library        SeleniumLibrary
Library         webdriver_manager
Test Teardown    Close Browser
#Resource

*** Test Cases ***
Validate login
    [Tags]    SMOKE
    Open Browser with Rahulshettyacademy.com
    Enter Username - Password & click on SIGNIN button
    Wait and Validate the validation message

*** Variables ***
${LOGIN URL}      https://rahulshettyacademy.com/loginpagePractise/
${BROWSER}        chrome
${INCORRECTUSERNAME}    Ganesh
${INCORRECTPASSWORD}    GaneshS
${loc_Validation_msg}    xpath://*[contains(@class,'alert')]
${loc_Validation_msg1}    css:.alert-danger

*** Keywords ***
Open Browser with Rahulshettyacademy.com
    Open Browser    ${LOGINURL}    ${BROWSER}    webdrivermanager.webdriver_manager.chrome.ChromeDriverManager().install()    options=add_experimental_option("detach", True)
    Maximize Browser Window

Enter Username - Password & click on SIGNIN button
    Input Text    id:username        ${INCORRECTUSERNAME}
    Input Password    id:password    ${INCORRECTPASSWORD}
    Click Button    signInBtn


Wait and Validate the validation message
    #CSS for validation message is ".alert-danger"
    Wait Until Element Is Visible    ${loc_Validation_msg}    timeout=4
#    ${axtualmsg}=    Get Text    ${loc_Validation_msg1}
#    Should Be Equal As Strings    ${axtualmsg}    Incorrect username/password.
    Element Text Should Be    ${loc_Validation_msg1}    Incorrect username/password.


    

    
    




