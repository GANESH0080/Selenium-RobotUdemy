*** Settings ***
Documentation    To validate the login form
Library     SeleniumLibrary 
Library     webdriver_manager
Library    Collections
Library    ../CustomLibrary/Shop.py
Library    ../CustomLibrary/Checkout.py
Test Setup         Open CHROME Browser with Rahulshettyacademy.com
#Test Setup    Open EDGE Browser with Rahulshettyacademy.com    ${u}    ${b}    ${ins}
Test Teardown    Close Browser session
Suite Setup     Print Hello Before executing the TC
Suite Teardown    Print Bye After executing the TC
Resource        ../PO/Generic_resource.robot
Resource        ../PO/LandingPage.robot
Resource        ../PO/ShopPage.robot
Resource        ../PO/CheckoutPage.robot

*** Variables ***
@{listofproducts}        Nokia Edge    Blackberry
${country_name}          ind
${confirmMSG}            Success!
${u}              https://rahulshettyacademy.com/loginpagePractise/
${b}               edge
${ins}              C:/ProgramData/Microsoft/Windows/Start Menu/Programs/Microsoft Edge




*** Test Cases ***
Validate unsuccessful login
    LandingPage.Enter Username - Password & click on SIGNIN button    ${INVALIDUSER_NAME}     ${INVALID_PASSWORD}
    Wait until Element passed on located Page    ${msg_unsuccessfull_login}    10s
    LandingPage.Verify the message

Validate cart display on shopping page
    LandingPage.Enter Username - Password & click on SIGNIN button     ${VALIDUSER_NAME}    ${VALID_PASSWORD}
    Wait until Element passed on located Page    ${CheckOutBTN}    10s
    ShopPage.Verify card tittles in the shop page
    #Select product as    ${product}
    Add Item To Cart And Checkout    ${listofproducts}
    CheckoutPage.Verify the added itemsROBOT
    Verify the added itemPY
    CheckoutPage.Click on Checkout Button    ${btnpurchase}
    CheckoutPage.Enter delivery location and Purchase    ${country_name}    ${enteredlocation}     ${t&condition}    ${btnpurchase}
    checkoutPage.Confirm the success message    ${confirmMSG}


Fill the Login details and login form
     LandingPage.Fill the Login details and Select User option    ${VALIDUSER_NAME}    ${VALID_PASSWORD}












    




