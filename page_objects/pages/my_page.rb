# frozen_string_literal: true

class MyPage < SitePrism::Page
  section :menu, MenuSection, '#top-menu'

  element :title, '#content > h2'
  element :assigned_issues, '#block-issuesassignedtome > h3'
  element :reported_issues, '#block-issuesreportedbyme > h3'
end
