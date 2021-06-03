Feature: Carrinho de Compras
    Como um cliente de e-commerce,
    Eu quero adicionar produtos no carrinho,
    Para verificar o valor total da compra.

    Scenario: Valida o total da compra de 1 Blouse
        Given que estou na loja virtual "automationpractice.com"
        When adiciono "1" "Blouse" ao carrinho
        Then o valor total da compra sera de $"29.00" dolares

    Scenario: Valida o total da compra de 3 Blouse
        Given que estou na loja virtual "automationpractice.com"
        When adiciono "3" "Blouse" ao carrinho
        Then o valor total da compra sera de $"83.00" dolares