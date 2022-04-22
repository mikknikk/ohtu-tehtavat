*** Settings ***
Resource  resource.robot
Test Setup  Create User And Input New Command

*** Test Cases ***
Register With Valid Useraname And Password
    Input Credentials  mikko  mikko123
    Output Should Contain  New user registered

Register With Already Taken Username And Valid Password
    Input Credentials  kalle  kalle123
    Output Should Contain  User with username kalle already exists

Register With Too Short Username And Valid Password
    Input Credentials  mi  mikko123
    Output Should Contain  Invalid username

Register With Valid Username And Too Short Password
    Input Credentials  mikko  mikko12
    Output Should Contain  Invalid password

Register With Valid Username And Long Enough Password Containing Only Letters
    Input Credentials  mikko  salasana
    Output Should Contain  Invalid password

*** Keywords ***
Create User And Input New Command
    Create User  kalle  kalle123
    Input New Command