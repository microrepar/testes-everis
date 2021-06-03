"""Modulo que implementa a classe de manipulacao dos elementos da pagina web
"""

from selenium import webdriver
from selenium.webdriver import ChromeOptions
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait

MAX_WAIT = 30


class Page:
    def __init__(self):
        options = webdriver.ChromeOptions()
        options.add_experimental_option('excludeSwitches', ['enable-logging'])
        self.driver = webdriver.Chrome(options=options)
        self.preco_item: float
        self.qtde_produto: int
        self._total_carrinho: float

    @property
    def total_carrinho(self):
        return self._total_carrinho

    @total_carrinho.setter
    def total_carrinho(self, total: str):
        try:
            self._total_carrinho = float(total[1:])
        except:
            self._total_carrinho = 0.0

    def adiciona_produto_carrinho(self, produto, qtde):
        self.qtde_produto = qtde

        campo_pesquisa = WebDriverWait(self.driver, MAX_WAIT).until(
            EC.presence_of_element_located((By.ID, "search_query_top"))
        )
        campo_pesquisa.clear()
        campo_pesquisa.send_keys(produto)
        campo_pesquisa.send_keys(Keys.RETURN)

        link_produto = WebDriverWait(self.driver, MAX_WAIT).until(
            EC.presence_of_element_located(
                (By.CSS_SELECTOR, f'h5 a[title="{produto}"]')
            )
        )
        link_produto.send_keys(Keys.RETURN)

        span_preco_produto = WebDriverWait(self.driver, MAX_WAIT).until(
            EC.presence_of_element_located((By.CSS_SELECTOR, 'span[itemprop="price"]'))
        )
        self.preco_item = span_preco_produto.text

        bt_add_to_cart = WebDriverWait(self.driver, MAX_WAIT).until(
            EC.presence_of_element_located(
                (By.CSS_SELECTOR, '#add_to_cart > button[type="submit"]')
            )
        )

        campo_quantide_produto = WebDriverWait(self.driver, MAX_WAIT).until(
            EC.presence_of_element_located((By.ID, "quantity_wanted"))
        )
        campo_quantide_produto.clear()
        campo_quantide_produto.send_keys(self.qtde_produto)
        bt_add_to_cart.send_keys(Keys.RETURN)

    def efetuar_checkout(self):
        btn_calcular_compra = WebDriverWait(self.driver, MAX_WAIT).until(
            EC.visibility_of_element_located(
                (By.CSS_SELECTOR, 'a[title="Proceed to checkout"]')
            )
        )

        actions = webdriver.ActionChains(self.driver)
        actions.move_to_element(btn_calcular_compra)
        actions.click(btn_calcular_compra)
        actions.perform()

        span_total_carrinho = WebDriverWait(self.driver, MAX_WAIT).until(
            EC.presence_of_element_located(
                (By.CSS_SELECTOR, "#total_price_container span")
            )
        )

        self.total_carrinho = span_total_carrinho.text
