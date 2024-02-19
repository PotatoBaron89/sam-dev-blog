# frozen_string_literal: true

class Articles::CardComponent < ApplicationComponent
  attr_reader :article

  def initialize(article:)
    @article = article
  end
end
