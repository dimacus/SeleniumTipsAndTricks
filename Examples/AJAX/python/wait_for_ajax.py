from selenium import webdriver
from selenium.webdriver.common.by import By
import time

driver = webdriver.Firefox()

def wait_for_ajax():
    while True:
        print "Waiting to login, and AJAX to finish"
        time.sleep(0.3)
        if (driver.execute_script("return jQuery.active") == 0):
            print "\n\nAJAX loaded!!\n\n"
            break

driver.get("http://www.reddit.com/")
driver.find_element(By.NAME, "user").send_keys("selenium_test_user")
driver.find_element(By.NAME, "passwd").send_keys("123456")
driver.find_element(By.NAME, "passwd").submit()
wait_for_ajax()

driver.quit()