*** Settings ***
Resource    ../../config/imports.resource
Resource    detail_product_variables.resource


*** Keywords ***
Detail Product - Verify Detail Product
    Wait Until Element Is Visible    ${title_samsung_galaxy_s6}
    Wait Until Element Is Visible    ${price_samsung_galaxy_s6}
    Wait Until Element Is Visible    ${detail_samsung_galaxy_s6}

Detail Product - Add Product To Cart
    Common - Wait And Click Element    ${btn_add_to_cart}

Detail Product - Verify Add To Cart Success
    Alert Should Be Present    ${txt_add_to_cart_success}    ACCEPT
