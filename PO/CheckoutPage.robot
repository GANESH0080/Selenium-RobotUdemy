*** Settings ***
Documentation    All the page Objects and Keyword of Landing Page.
Library     SeleniumLibrary
Library    Collections
Resource    ..//PO/Generic_resource.robot

*** Variables ***
${enteredlocation}        xpath://a[text()='India']
${t&condition}            css:.checkbox label
${btnpurchase}            css:.btn-success



*** Keywords ***
Verify the added itemsROBOT
    @{expecteditem} =    Create List    Nokia Edge    Blackberry
    ${actualitem} =	Get Webelements    css:h4.media-heading
    @{actualitemlist} =        Create List
    FOR  ${itemname}    IN        @{actualitem}
         ${text}=  Get Text  ${itemname}
         Log        ${itemname.text}
         Log To Console     ${text}
         Append To List      ${actualitemlist}       ${itemname.text}
    END
    Lists Should Be Equal        ${expecteditem}        ${actualitemlist}



Click on Checkout Button
    [Arguments]    ${chkbtn}
    Click Button    ${chkbtn}



Enter delivery location and Purchase
   [Arguments]    ${country}     ${location}     ${termscondition}    ${purchasebtn}   
   Input Text    country        ${country}
   Wait until Element passed on located Page        ${location}    10s
   Click Element    ${location}    
   Wait until Element passed on located Page        ${termscondition}    10s
   Click Element    ${termscondition}
   Click Button     ${purchasebtn}

Confirm the success message
    [Arguments]    ${successmsg}
    Page Should Contain    ${successmsg}
    