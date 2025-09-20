*** Settings ***
Resource    ../../config/imports.resource
Resource    cart_variables.resource


*** Keywords ***
Cart - Delete Product
    Common - Wait And Click Element    ${btn_delete}

Cart - Verify Delete Product Success
    Wait Until Element Is Not Visible    ${txt_samsung_galaxy_s6}

Cart - Access Place Order
    Common - Wait And Click Element    ${btn_place_order}
