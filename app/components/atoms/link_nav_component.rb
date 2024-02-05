# frozen_string_literal: true

class Atoms::LinkNavComponent < ViewComponent::Base
  def initialize(href: '#', text: 'Link')
    @href = href
    @text = text
  end
end
