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

  def top_nav_account_elements
    if user_signed_in?
      [
        { name: 'Profile', path: profile_path, method: :get },
        { name: 'Logout', path: destroy_user_session_path, method: :delete }
      ]
    else
      [
        { name: 'Login', path: new_user_session_path, method: :get },
        { name: 'Register', path: new_user_registration_path, method: :get }
      ]
    end
  end
  def top_nav_article_elements
    Category.all.map do |category|
      { name: category.name, path: articles_path(category: category.name), method: :get }
    end
  end

  def country_list
    Country.all.map { |country| country.translations['en'] }
  end

  def locale
    # only supports English currently
    I18n.default_locale
  end

  def tailwind_classes_for(flash_type)
    {
      notice: "bg-green-400 border-l-4 border-green-700 text-white",
      error: "bg-red-400 border-l-4 border-red-700 text-black",
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end
end
