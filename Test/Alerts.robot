*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url_alert}    https://demo.automationtesting.in/Alerts.html
${url_register}    https://demo.automationtesting.in/Register.html
${browser}    chrome

*** Test Cases ***
Alert Processing
    Open Browser    ${url_alert}    ${browser}
    Maximize Browser Window
    Click Element    xpath=//button[@onclick= 'alertbox()']
    Sleep    3s
    Handle Alert    action=ACCEPT
    Sleep    3s

    Click Element    xpath=//a[@href='#CancelTab']
    Click Element    xpath=//button[@onclick='confirmbox()']
    Sleep    3s
    Handle Alert    action=DISMISS
    Sleep    3s

    Click Element    xpath=//a[@href='#Textbox']
    Click Element    xpath=//button[@onclick='promptbox()']
    Sleep    3s
    Input Text Into Alert    PHoebe    action=ACCEPT
    Sleep    3s
    Close Browser
    
Checkbox Processing
    Open Browser    ${url_register}    ${browser}
    Maximize Browser Window

    Sleep    3s
    Select Checkbox    id=checkbox1
    Sleep    3s
    Checkbox Should Be Selected    id=checkbox1

    Select Checkbox    id=checkbox3
    Unselect Checkbox    id=checkbox3
    Checkbox Should Not Be Selected    id=checkbox3