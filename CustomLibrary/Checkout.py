import logging

from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn



@library
class Checkout:

#Constructor
    def __init__(self):
        self.setcolLib = BuiltIn().get_library_instance("Collections")
        self.setLib = BuiltIn().get_library_instance("SeleniumLibrary")




    @keyword
    def Verify_the_added_itemPY(self):
            print("Helllo")
            expectedItemList = ["Nokia Edge",  "Blackberry"]
            actualItemList = []
            j = 1
            items = self.setLib.get_webelements("css:h4.media-heading")
            for item in items:
                if item.text in expectedItemList:
                    self.setcolLib.append_to_list      (actualItemList,     item.text)
                j = j + 1
            self.setcolLib.lists_should_be_equal    (expectedItemList ,  actualItemList)












