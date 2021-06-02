*** Settings ***
Documentation       Valida os valores de um produto no carrinho

Library     Browser


*** Variables ***
${MAX_WAIT}=            60


*** Keywords ***
Abrir pagina
    [Arguments]     ${url}
    Set Browser Timeout         ${MAX_WAIT}
    New Browser     chromium        False
    New Page        ${url}
    Get Title       contains       My Store


*** Keywords ***
Buscar por
    [Arguments]     ${nome_produto}

    Wait For Elements State     css=#search_query_top       visible                 ${MAX_WAIT}
    Fill Text       css=#search_query_top                   ${nome_produto}
    Click           css=button[name="submit_search"]

    Wait For Elements State     css=h5 a[title="${nome_produto}"]       visible         ${MAX_WAIT}    
    Click                       css=h5 a[title="${nome_produto}"]
    ${preco}        Get Text                    css=span[itemprop="price"]
    Set Suite Variable     ${preco_item}     ${preco}


*** Keywords ***
Adicionar ao carrinho
    [Arguments]     ${qtde_carrinho}

    Set Suite Variable          ${qtde_produto}         ${qtde_carrinho}
    Wait For Elements State     css=#add_to_cart > button        visible         ${MAX_WAIT}
    Fill Text                   css=#quantity_wanted                    ${qtde_carrinho}
    Click                       css=#add_to_cart > button[type="submit"]


*** Keywords ***
Validar o valor total da compra de
    [Arguments]     ${valor_total}

    Wait For Elements State     css=a[title="Proceed to checkout"]        visible         ${MAX_WAIT}   
    Click                       css=a[title="Proceed to checkout"]

    Wait For Elements State     css=#cart_title         visible         ${MAX_WAIT}
    Get Text                    css=#cart_title         contains        SHOPPING-CART SUMMARY

    ${total_carrinho}           Get Text                css=#total_price_container span

    ${total_carrinho}         Convert To Number       ${total_carrinho[1:]}
    ${valor_total}            Convert To Number       ${valor_total}

    Should Be Equal     ${valor_total}        ${total_carrinho}


*** Keywords ***
Pegar o Screenshot
    Take Screenshot