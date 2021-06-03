
everis
======
Testes
------
1. Escrever um cenário de testes que valida os valores no carrinho de um produto no website: My Store (automationpractice.com) (Se a automação for feito utilizando a linguagem gherkin, não é necessário fazer esse exercício)
2. Automatizar um fluxo que valida o valor total da compra na tela 01.Summary
3. Automatizar um get no endpoint https://httpbin.org/get e validar o atributo: url da resposta


Ferramentas e linguagens permitidas:
------------------------------------
- Linguagens: Java, Javascript, Ruby, Python ou C#
- Ferramentas: Para web: Selenium WebDriver, Back-end (ferramenta de sua escolha, Ex: RestAssured)
- Git: github, gitlab ou bitbucket
- Recomendado: Cucumber ou outras ferramentas voltadas para BDD


Implementação 1:
--------------
Implementado em BDD com Robot Framework
 - Interpretador: Python 3.7.9
 - Ferramenta: Robot Framework 4.0
 - Libraries: SeleniumLibrary; Browser
 - Suite de testes: 
    ```
        tests/carrinho.robot
    ```
 - Comando para intalação das dependências após instalado o interpretador python3:
    ```
    pip install -r requiriments.txt
    ```
 - Executar o comando a partir da raiz do projeto, para rodar a suite de testes em Robot Framework:
    ```
    robot -d .log tests
    ```
  obs: para alternar entre a execução com selenium e playwright basta trocar a importação do Resource base_lib.robot
 
 
Implementação 2:
--------------
Implementado em BDD com Pytest-BDD
 - Interpretador: Python 3.7.9
 - Ferramenta: Pytest-bdd
 - Libraries: request; selenium, pytest, pytest-bdd
 - Suite de testes: 
    ```
        tests/features/carrinho.feature
        tests/features/httpbin.feature
        tests/steps_defs/
    ```
 - Comando para intalação das dependências após instalado o interpretador python3:
    ```
    pip install -r requiriments.txt
    ```
 - Executar o comando a partir da raiz do projeto, para rodar a suite de testes em pytest-bdd :
    ```
    python -m pytest
    ```
  obs: Foram implementados a validação do valor total do carrinho e a validação do atributo "url" do endpoint.

