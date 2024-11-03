from ast import Index
from token import ENDMARKER

from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop:

#Constructor
    def __init__(self):
        self.setLib = BuiltIn().get_library_instance("SeleniumLibrary")


    # method name hello_world will be converted into Keyword name "Hello World"
    @keyword
    def hello_world(self):
        print("Hello")


    @keyword
    def add_item_to_cart_and_checkout(self, productList):
        i = 1
        productsTittles = self.setLib.get_webelements("css:.card-title")
        for PrdTitle in productsTittles:
            if PrdTitle.text in productList:
                    self.setLib.click_button("xpath:(//*[@class='card-footer'])["+str(i)+"]/button")
            i = i + 1
        self.setLib.click_link("css:.btn-primary")

