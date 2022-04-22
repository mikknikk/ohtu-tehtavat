*** Settings ***
Resource  resource.robot
Resource  login_resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser
Test Setup  Reset Application And Go To Register Page

*** Test Cases ***
Register With Valid Username And Password
    Set Username  mikko
    Set Password And Password Confirmation  mikko123
    Submit Credentials
    Register Should Succeed

Register With Too Short Username And Valid Password
    Set Username  mi
    Set Password And Password Confirmation  mikko123
    Submit Credentials
    Register Should Fail With Message  Invalid username

Register With Valid Username And Too Short Password
    Set Username  mikko
    Set Password And Password Confirmation  mikko12
    Submit Credentials
    Register Should Fail With Message  Invalid password

Register With Nonmatching Password And Password Confirmation
    Set Username  mikko
    Set Password  mikko123
    Set Password Confirmation  mikko124
    Submit Credentials
    Register Should Fail With Message  Password and password confirmation do not match

Login After Successful Registeration
    Set Username  mikko
    Set Password And Password Confirmation  mikko123
    Submit Credentials
    Register Should Succeed
    Go To Login Page
    Login Page Should Be Open
    login_resource.Set Username  mikko
    login_resource.Set Password  mikko123
    login_resource.Submit Credentials
    Login Should Succeed

*** Keywords ***
Register Should Succeed
    Welcome Page Should Be Open

Register Should Fail With Message
    [Arguments]  ${message}
    Register Page Should Be Open
    Page Should Contain  ${message}

Submit Credentials
    Click Button  Register

Set Username
    [Arguments]  ${username}
    Input Text  username  ${username}

Set Password
    [Arguments]  ${password}
    Input Password  password  ${password}

Set Password Confirmation
    [Arguments]  ${password}
    Input Password  password_confirmation  ${password}

Set Password And Password Confirmation
    [Arguments]  ${password}
    Set Password  ${password}
    Set Password Confirmation  ${password}
