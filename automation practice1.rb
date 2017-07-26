require "selenium-webdriver"
load "web_driver_helper.rb"

class Practice
	include WebDriverHelper

	def initialize
		@driver= Selenium::WebDriver.for :firefox
		@wait= Selenium::WebDriver::Wait.new(:timeout=> 300)
		@driver.manage.timeouts.implicit_wait=10
		@driver.manage.window.maximize
	end

	def create_account
		first_name = "John"
		last_name = "Doe"
		navigate_to_page("http://automationpractice.com/index.php/")
		sleep 2
		click_link("Sign in")
		sleep 2
		enter("email_create", "nmysteryus6@yahoo.com")
		click_link_by_id("SubmitCreate")
		click_radio_button("id_gender1")
		enter("customer_firstname", first_name)
		enter("customer_lastname", last_name)
		enter("passwd", "test1234")
		@driver.find_element(:id, "days").send_keys "1"
		sleep 2
		@driver.find_element(:id, "months").send_keys "January"
		@driver.find_element(:id, "years").send_keys "2004"
		click_checkbox("newsletter")
		click_checkbox("optin")
		enter("firstname", first_name)
		enter("lastname", last_name)
		enter("company", "Yahoo.com")
		enter("address1", "100 Main St")
		enter("city", "Albany")
		send_keys_to_dropdown("id_state", "New York")
		enter("postcode", "12208")
		send_keys_to_dropdown("id_country", "United States")
		enter("phone_mobile", "5182001234")
		enter("alias", "My Home Address")
		sleep 5
		click_button_by_id("submitAccount")
	end

	def logout
		click_link("Sign out")
		sleep 2
	end

	def sign_in
		navigate_to_page("http://automationpractice.com/index.php/")
		sleep 2
		click_link("Sign in")
		sleep 2
		enter("email","nmysteryus6@yahoo.com")
		enter("passwd", "test1234")
		sleep 3
		click_link_by_id("SubmitLogin")
		sleep 3
	end

	def verify_address
		click_link("My addresses")
		page_should_contain("100 Main St")
		page_should_contain("Albany")
		page_should_contain("New York")
		page_should_contain("12208")
		page_should_contain("5182001234")
	end

	def update_address
		click_link("Update")
		enter("address1", "200 Main St")
		enter("address2", "Apt 2")
		enter("city", "Syracuse")
		enter("postcode", "13201")
		click_button_by_id("submitAddress")
		page_should_contain("200 Main St")
		page_should_contain("Syracuse")
		page_should_contain("Apt 2")
		page_should_contain("13201")
	end

	def delete_address
		@driver.find_element(:link_text, "Delete").click

	end

end

practice = Practice.new
practice.create_account
practice.logout
practice.sign_in
practice.verify_address
practice.update_address
practice.delete_address
