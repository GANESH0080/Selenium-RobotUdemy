*** Settings ***
Documentation    All the page Objects and Keyword of Landing Page.
Library     SeleniumLibrary
Resource    ..//PO/Generic_resource.robot

*** Variables ***
${loc_Validation_msg1}    css:.alert-danger
${msg_unsuccessfull_login}    xpath://*[contains(@class,'alert')]

*** Keywords ***
Enter Username - Password & click on SIGNIN button
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Input Text    id:username        ${USERNAME}
    Input Password    id:password    ${PASSWORD}
    Click Button    signInBtn


#Wait for element is visible
#    Wait until Element passed on located Page    ${msg_unsuccessfull_login}    10s

Verify the message
#    ${axtualmsg}=    Get Text    ${loc_Validation_msg1}
#    Should Be Equal As Strings    ${axtualmsg}    Incorrect username/password.
    Element Text Should Be    ${loc_Validation_msg1}    Incorrect username/password.



Fill the Login details and Select User option
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Input Text    id:username        ${USERNAME}
    Input Password    id:password    ${PASSWORD}
    #Select Radio Button    radio    user
    Click Element    Xpath://*[@class='customradio'][2]/span[2]
    Wait Until Element Is Visible    id=okayBtn
    Click button    id=okayBtn
    #Click button    id=okayBtn
    Wait Until Element Is Not Visible    okayBtn
    Select From List by Value    //select[@class='form-control']    consult
    Select Checkbox    terms
    Checkbox Should Be Selected    terms
    Hello World

