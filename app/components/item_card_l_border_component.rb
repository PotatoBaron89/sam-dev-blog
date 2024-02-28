# frozen_string_literal: true

class ItemCardLBorderComponent < ApplicationComponent
  attr_reader :title, :description

  def initialize(title:, description: "")
    @title = title
    @description = description
  end

end
