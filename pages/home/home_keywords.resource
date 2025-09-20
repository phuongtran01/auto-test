*** Settings ***
Resource    ../../config/imports.resource
Resource    home_variables.resource


*** Keywords ***
Home - Access to login form
    Common - Wait And Click Element    ${btn_access_login_form}

Home - Verify Login Success
    Wait Until Element Is Visible    ${txt_welcome}

Home - Choose Product
    Common - Wait And Click Element    ${btn_samsung_galaxy_s6}

Home - Access To Cart
    Common - Wait And Click Element    ${btn_access_cart}
