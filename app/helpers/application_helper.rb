module ApplicationHelper
  include Pagy::Frontend

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer, extensions = {})
    markdown.render(text).html_safe
  end

  def avatar_url_for(user, opts = {})
    size = opts[:size] || 48

    if user.respond_to?(:avatar) && user.avatar.attached? && user.avatar.variable?
      user.avatar.variant(resize_to_fit: [size, size])
    else
      gravatar_url_for(user.email, size: size)
    end
  end

  def country_list
    Country.all.map { |country| country.translations['en'] }
  end

  def locale
    # only supports English currently
    I18n.default_locale
  end
end
