*** Settings ***
Documentation       Valida o valor total do carrinho

Resource    ../resources/base_selenium.robot
# Resource    ../resources/base_browser.robot

Test Teardown       Pegar o Screenshot


*** Test Cases ***
Valida o total da compra na tela 01.Summary
    Dado que estou na loja virtual "http://automationpractice.com/index.php"
    Quando adiciono "1" "Blouse" ao carrinho     
    Entao o valor total da compra sera de $"29.00" dolares
    


*** Keywords ***
Dado que estou na loja virtual "${url}"
    Abrir pagina    ${url}


*** Keywords ***
Quando adiciono "${qtde}" "${nome_produto}" ao carrinho
    Buscar por                  ${nome_produto}
    Adicionar ao carrinho       ${qtde}


Entao o valor total da compra sera de $"${valor_total}" dolares
    Validar o valor total da compra de      ${valor_total}

