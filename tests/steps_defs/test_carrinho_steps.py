"""Modulo com a implementacao dos passos para validar 
o valor total da compra no carrinho
"""
import pytest
from pytest_bdd import given, parsers, scenario, scenarios, then, when
from tests.steps_defs.base import Page

EXTRA_TYPES = {"Number": int, "Decimal": float}


scenarios("../features/carrinho.feature")


@pytest.fixture
def page():    
    page: Page = Page()
    page.driver.implicitly_wait(10)    
    yield page
    page.driver.quit()


@given(parsers.cfparse('que estou na loja virtual "{loja}"'), target_fixture="home")
def home(page, loja):    
    page.driver.get(f"http://{loja}/index.php")
    assert page.driver.title == "My Store"
    return page


@when(
    parsers.cfparse(
        'adiciono "{qtde:Number}" "{produto}" ao carrinho', extra_types=EXTRA_TYPES
    )
)
def adiciona_produto_carrinho(page: Page, produto, qtde):
    page.adiciona_produto_carrinho(produto, qtde)


@then(
    parsers.cfparse(
        'o valor total da compra sera de $"{valor_total:Decimal}" dolares',
        extra_types=EXTRA_TYPES,
    )
)
def verifica_total_compra(page: Page, valor_total):
    page.efetuar_checkout()
    assert valor_total == page.total_carrinho
