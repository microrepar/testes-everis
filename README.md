
everis - teste
==============
1. Escrever um cenário de testes que valida os valores no carrinho de um produto no website: My Store (automationpractice.com) (Se a automação for feito utilizando a linguagem gherkin, não é necessário fazer esse exercício)
2. Automatizar um fluxo que valida o valor total da compra na tela 01.Summary
3. Automatizar um get no endpoint https://httpbin.org/get e validar o atributo: url da resposta


Ferramentas e linguagens permitidas:
------------------------------------
- Linguagens: Java, Javascript, Ruby, Python ou C#
- Ferramentas: Para web: Selenium WebDriver, Back-end (ferramenta de sua escolha, Ex: RestAssured)
- Git: github, gitlab ou bitbucket
- Recomendado: Cucumber ou outras ferramentas voltadas para BDD


Implementação:
--------------
Implementado em BDD com Robot Framework
 - Interpretador: Python 3.7.9
 - Ferramenta: Robot Framework 4.0
 - Libraries: SeleniumLibrary; Browser
 - Suite de testes: tests/carrinho.robot

 obs: para alternar entre a execução com selenium e playwright basta trocar a importação do Resource base_lib.robot

