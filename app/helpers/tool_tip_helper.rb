module ToolTipHelper
  def tooltip(content, delay: 0, arrow: true, size: 'regular', animation: 'fade')
    "data-controller=tooltip data-tippy-content=\"#{content.html_safe}\" data-tippy-delay=#{delay} data-tippy-arrow=#{arrow} data-tippy-size=#{size} data-tippy-animation=#{animation}".html_safe
  end
end
