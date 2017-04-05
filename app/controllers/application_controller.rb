class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale

  def buildRegex(words) #E: Array S:Regexp as /word1(\W*))|(word2(\W*))/
    regex = nil
    words.each do |w|
      if regex == nil
        if words.last == w
          regex = "#{w}(\\W*)"
        else
          regex = "#{w}(\\W*)"
        end
      else
        if words.last == w
          regex << "|#{w}(\\W*)"
        else
          regex << "|#{w}(\\W*)"
        end
      end
    end
    regex = Regexp.new regex
    return regex
  end

  private
    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
      @lang = I18n.locale
      Rails.application.routes.default_url_options[:locale]= I18n.locale

    end

end
