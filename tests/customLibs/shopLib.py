from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn

@library
class Shop:
    def __init__(self):
        self.selenium = BuiltIn().get_library_instance('SeleniumLibrary')

    @keyword
    def select_all_products_and_checkout(self, productsList):
        i = 1
        productsTitles = self.selenium.get_webelements(" css:.card-title")
        for productsTitle in productsTitles:
            if productsTitle.text in productsList:
                self.selenium.click_button("xpath:(//*[@class='card-footer'])["+str(i)+"]/button")
            i = i + 1
