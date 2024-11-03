*** Settings ***
Documentation    To validate the login form
Library     SeleniumLibrary 
Library     webdriver_manager
Library    Collections
Test Setup         Open CHROME Browser with Rahulshettyacademy.com
Test Teardown    Close Browser session
Resource        ../PO/Generic_resource.robot

*** Variables ***
${msg_unsuccessfull_login}    xpath://*[contains(@class,'alert')]
${loc_Validation_msg1}    css:.alert-danger
${CheckOutBTN}            css:.btn-primary

*** Test Cases ***
Validate unsuccessful login
    [Tags]    REGRESSION
    Enter Username - Password & click on SIGNIN button    ${INVALIDUSER_NAME}     ${INVALID_PASSWORD}
    Wait for element is visible    ${msg_unsuccessfull_login}    3s
    Verify the message

Validate cart display on shopping page
    [Tags]    SMOKE    REGRESSION
    Enter Username - Password & click on SIGNIN button     ${VALIDUSER_NAME}    ${VALID_PASSWORD}
    Wait for element is visible    ${CheckOutBTN}    4s
    Verify card tittles in the shop page
    Select product as    ${product}


Fill the Login details and login form
     [Tags]       REGRESSION    SMOKE
     Fill the Login details and Select User option    ${VALIDUSER_NAME}    ${VALID_PASSWORD}



*** Keywords ***
Enter Username - Password & click on SIGNIN button
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Input Text    id:username        ${USERNAME}
    Input Password    id:password    ${PASSWORD}
    Click Button    signInBtn

Wait for element is visible
    [Arguments]    ${element}    ${timing}
    Wait Until Element Is Visible    ${element}    ${timing}


Verify the message
#    ${axtualmsg}=    Get Text    ${loc_Validation_msg1}
#    Should Be Equal As Strings    ${axtualmsg}    Incorrect username/password.
    Element Text Should Be    ${loc_Validation_msg1}    Incorrect username/password.


Verify card tittles in the shop page
    @{expectedList} =    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elem} =	Get Webelements    css:.card-title
    @{actuallist} =        Create List
    FOR  ${values}    IN        @{elem}
         ${text}=  Get Text  ${values}
         Log        ${values.text}
         Log To Console     ${text}
         Append To List      ${actuallist}       ${values.text}
    END
    Lists Should Be Equal        ${expectedList}        ${actuallist}

Select product as
    [Arguments]    ${product}
    ${elem} =	Get Webelements    css:.card-title
    ${index} =    Set Variable    1
        FOR  ${values}    IN        @{elem}
             ${text}=  Get Text  ${values}
             Log        ${values.text}
             Log To Console    ${text}
             Exit For Loop if    '${values.text}' == '${product}'
             ${index} =  Evaluate    ${index}+1
        END
    Click Button    Xpath:(//*[@class='card-footer'])[${index}]/button



Fill the Login details and Select User option
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Input Text    id:username        ${USERNAME}
    Input Password    id:password    ${PASSWORD}
    #Select Radio Button    radio    user
    Click Element    Xpath://*[@class='customradio'][2]/span[2]
    Wait Until Element Is Visible    id=okayBtn    timeout=3
    Click button    id=okayBtn
    Click button    id=okayBtn
    Wait Until Element Is Not Visible    okayBtn
    Select From List by Value    //select[@class='form-control']    consult
    Select Checkbox    terms
    Checkbox Should Be Selected    terms






    




