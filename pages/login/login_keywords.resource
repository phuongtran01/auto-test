*** Settings ***
Resource    ../../config/imports.resource
Resource    login_variables.resource


*** Keywords ***
Login - Fill the login form
    [Arguments]    ${username}    ${password}
    Common - Wait And Input Text    ${input_username}    ${username}
    Common - Wait And Input Text    ${input_password}    ${password}

Login - Click Submit Login Button
    Common - Wait And Click Element    ${btn_submit}

Login - Verify Wrong Password Alert
    Alert Should Be Present    ${txt_inform_invalid_password}    ACCEPT
