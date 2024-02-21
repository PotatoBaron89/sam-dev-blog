# frozen_string_literal: true

class NotificationComponent < ApplicationComponent
  attr_reader :message, :style

  STYLES = {
    primary: {
      notice: 'alert-notice',
      danger: 'alert-danger',
      alert: 'alert-danger',
      success: 'text-green-800 border-t-4 border-green-300 bg-green-50 dark:text-green-400 dark:bg-gray-800 dark:border-green-800',
      warning: 'alert-success'
    },
    secondary: {
      notice: 'bg-blue-200 text-blue-500 rounded-lg focus:ring-2 focus:ring-blue-400 p-1.5 hover:bg-blue-200 inline-flex items-center justify-center dark:bg-gray-800 dark:text-blue-400 dark:hover:bg-gray-700',
      alert: 'bg-red-50 text-red-500 rounded-lg focus:ring-2 focus:ring-red-400 p-1.5 hover:bg-red-200 inline-flex items-center justify-center dark:bg-gray-800 dark:text-red-400 dark:hover:bg-gray-700',
      danger: 'bg-red-50 text-red-500 rounded-lg focus:ring-2 focus:ring-red-400 p-1.5 hover:bg-red-200 inline-flex items-center justify-center dark:bg-gray-800 dark:text-red-400 dark:hover:bg-gray-700',
      success: 'bg-green-50 text-green-500 rounded-lg focus:ring-2 focus:ring-green-400 p-1.5 hover:bg-green-200 inline-flex items-center justify-center dark:bg-gray-800 dark:text-green-400 dark:hover:bg-gray-700',
      warning: 'bg-yellow-50 text-yellow-500 rounded-lg focus:ring-2 focus:ring-yellow-400 p-1.5 hover:bg-yellow-200 inline-flex items-center justify-center dark:bg-gray-800 dark:text-yellow-400 dark:hover:bg-gray-700'
    }
  }.freeze

  def initialize(message:, style: :notice)
    @message = message
    @style = style
  end

  def colour_styles_primary
    STYLES.fetch(:primary).fetch(style, STYLES[:primary][:notice])
  end

  def colour_styles_secondary
    STYLES.fetch(:secondary).fetch(style, STYLES[:secondary][:notice])
  end
end
