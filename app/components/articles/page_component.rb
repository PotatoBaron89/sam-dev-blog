# frozen_string_literal: true

class Articles::PageComponent < ApplicationComponent
  attr_reader :article

  def initialize(article:)
    @article = article
  end

end
