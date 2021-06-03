*** Settings ***
Documentation       Implementa os passos para execucao do teste de validacao do valor total do carrinho

Library     SeleniumLibrary


*** Variables ***
${MAX_WAIT}=            60


*** Keywords ***
Abrir pagina
    [Arguments]     ${url}

    Set Selenium Timeout          ${MAX_WAIT}
    Open Browser                  ${url}      chrome    options=add_experimental_option('excludeSwitches', ['enable-logging'])
    Wait Until Page Contains      My Store


*** Keywords ***
Buscar por
    [Arguments]     ${nome_produto}

    Wait Until Element Is Visible       id:search_query_top                 ${MAX_WAIT}
    Input Text                          id:search_query_top                 ${nome_produto}
    Click Element                       css:button[name="submit_search"]

    Wait Until Element Is Visible       css:h5 a[title="${nome_produto}"]   ${MAX_WAIT}    
    Click Element                       css:h5 a[title="${nome_produto}"]
    ${preco}        Get Text            css:span[itemprop="price"]
    Set Suite Variable     ${preco_item}     ${preco}


*** Keywords ***
Adicionar ao carrinho
    [Arguments]     ${qtde_carrinho}

    Set Suite Variable                ${qtde_produto}                   ${qtde_carrinho}
    Wait Until Element Is Visible     id:add_to_cart                    ${MAX_WAIT}
    Input Text                        id:quantity_wanted                ${qtde_carrinho}
    Click Element                     css:#add_to_cart > button[type="submit"]


*** Keywords ***
Validar o valor total da compra de
    [Arguments]     ${valor_total}

    Wait Until Element Is Visible     css:a[title="Proceed to checkout"]                ${MAX_WAIT}   
    Click Element                     css:a[title="Proceed to checkout"]

    Wait Until Element Contains       id:cart_title         SHOPPING-CART SUMMARY       ${MAX_WAIT}

    ${total_carrinho}           Get Text                css:#total_price_container span

    ${total_carrinho}         Convert To Number       ${total_carrinho[1:]}
    ${valor_total}            Convert To Number       ${valor_total}

    Should Be Equal     ${valor_total}        ${total_carrinho}


*** Keywords ***
Pegar o Screenshot
    Capture Page Screenshot
    Close Browser
