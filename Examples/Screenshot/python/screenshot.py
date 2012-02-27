from selenium import webdriver
import time

driver = webdriver.Firefox()

def wait_for_ajax():
    while True:
        print "Waiting to login, and AJAX to finish"
        time.sleep(0.3)
        if (driver.execute_script("return jQuery.active") == 0):
            print "\n\nAJAX loaded!!\n\n"
            break

driver.get("http://www.groupon.com/")
driver.save_screenshot("screenshot.png")

driver.quit()