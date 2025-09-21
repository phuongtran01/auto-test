*** Settings ***
Resource    ../config/imports.resource
Resource    common_variables.resource


*** Keywords ***
Common - Open Demoblaze Website
    Open Browser    ${url}    ${browser_name}
    Maximize Browser Window

Common - Close Browser Session
    Close Browser

Common - Wait and Click Element
    [Arguments]    ${element}    ${timeout}=${timeout_default}
    Wait Until Element Is Visible    ${element}    ${timeout}
    Click Element    ${element}

Common - Wait and Input Text
    [Arguments]    ${element}    ${text}    ${timeout}=${timeout_default}
    Wait Until Element Is Visible    ${element}    ${timeout}
    Clear Element Text    ${element}
    Sleep    2s
    Input Text    ${element}    ${text}


