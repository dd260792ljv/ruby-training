# frozen_string_literal: true

class MenuSection < SitePrism::Section
  element :sigh_up_link, '.register'
  element :sigh_in_link, '.login'
  element :logged_as, '#loggedas'
  element :my_page_link, '#top-menu > ul > li:nth-child(2) > a'
end
