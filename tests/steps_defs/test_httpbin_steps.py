"""Modulo implementa os passos para execucao do teste de endpoint
"""

import requests
from pytest_bdd import given, parsers, scenarios, then, when

EXTRA_TYPES = {
    'Number': int
}


scenarios('../features/httpbin.feature')

@given(parsers.cfparse('o acesso ao endpoint "{url}" com o metodo "{metodo}"'), target_fixture='resposta')
def resposta(url, metodo):
    req = getattr(requests, metodo)
    resp = req(url)
    return resp


@when(parsers.cfparse('o codigo de status da resposta é "{status_code:Number}"', extra_types=EXTRA_TYPES))
def verifica_status_code(resposta, status_code):
    assert resposta.status_code == status_code



@then(parsers.cfparse('o atributo url da resposta deve conter "{url}"'))
def valida_attr_url(resposta, url):
    resp = resposta.json()
    assert resp.get('url') == url
