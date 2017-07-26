module WebDriverHelper
	require "selenium-webdriver"

	def navigate_to_page(url)
		@driver.navigate.to(url)
	end

	def click_link(link_text)
		@driver.find_element(:link_text, link_text).click
	end

	def click_link_by_id(id)
		@driver.find_element(:id, id).click
	end

	def enter(field, text)
		@driver.find_element(:id, field).clear
		@driver.find_element(:id, field).send_keys(text)
	end

	def send_keys_to_dropdown(field, text)
		@driver.find_element(:id, field).send_keys(text)
	end

	def enter_name(field, text)
		@driver.find_element(:name, field).send_keys(text)
	end

	def click_button_value(button_label)
		xp = '//*[@*="' + button_label + '"]'
		@driver.find_element(:xpath, xp).click
	end

	def click_button_by_id(button_id)
		@driver.find_element(:id, button_id).click
	end

	def click_button(button_label)
		#sleep 1
		@driver.find_element(:xpath, "//button[contains(., button_label)]").click
	end

	def click_radio_button(radio_button_id)
		@driver.find_element(:id, radio_button_id).click
	end

	def select_from_dropdown_id(list_id, item)
		dropdown_list = @driver.find_element(:id, list_id)
		select_list = Selenium::WebDriver::Support::Select.new(dropdown_list)
		select_list.select_by(:text, item)
	end

	def select_from_dropdown(list_id, item)
		dropdown_list = @driver.find_element(:id, list_id)
		select_list = Selenium::WebDriver::Support::Select.new(dropdown_list)
		select_list.select_by(:id, item)
	end

	def page_should_contain(text)
		page_text = @driver.find_element(:tag_name, "body").text

		if (page_text.include?(text))
			puts "page contains: " + text
		else
			puts "Page doesn't contain text, your test has failed"
		end
	end


	def page_should_not_contain(text)
		page_text = @driver.find_element(:tag_name, "body").text

		if (page_text.include?(text)==false)
			puts "--page does not contain: " + text
		else
			puts "Page contains text, your test has failed"
		end
	end

	def click_checkbox(checkbox_id)
		@driver.find_element(:id, checkbox_id).click
	end
end
