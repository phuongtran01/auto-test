*** Settings ***
Resource    ../config/imports.resource
Resource    common_variables.resource


*** Keywords ***
Common - Open Demoblaze Website
    Open Browser    ${url}    ${browser_name}
    Maximize Browser Window
    Start Video Recording

Common - Close Browser Session
    Common - Stop Screen Record
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

Common - Stop Screen Record
    ${file_name}=    Stop Video Recording
    Run Keyword If Test Passed    Remove File    ${file_name}
