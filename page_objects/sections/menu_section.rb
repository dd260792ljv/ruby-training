# frozen_string_literal: true

class MenuSection < SitePrism::Section
  element :sigh_up_link, '.register'
  element :sigh_in_link, '.login'
  element :logged_as, '#loggedas'
end
