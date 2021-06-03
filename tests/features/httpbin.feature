Feature: Consulta o endpoint do servico httpbin.org

    Scenario: Valida o atributo url da respota
        Given o acesso ao endpoint "https://httpbin.org/get" com o metodo "get"
        When o codigo de status da resposta é "200"
        Then o atributo url da resposta deve conter "https://httpbin.org/get"
