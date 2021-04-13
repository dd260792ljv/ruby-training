# frozen_string_literal: true

class HomePage < SitePrism::Page
  set_url CommonVars::BASE_URL

  section :menu, MenuSection, '#top-menu'

  element :header, '#header > h1'
end
