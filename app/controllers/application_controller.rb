class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

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

  def buildRegexArray(words)
    regex = []
    words.each do |w|
      regex << /#{w}(\W*)/
    end
    return regex
  end

  def matchtest(regexTab, t)
    regexTab.each do |r|
      if r.match(t)
        logger.debug(regexTab.find_index(r))
        return regexTab.find_index(r)

      end
    end
    return nil
  end



  def decrypter(t)
  		if t.nil? or t == "" #si il n'y a pas de texte
  			return t
  		else #on décrypte

  			#espaces et sauts de lignes
  			t.gsub!(/\n/, "<br />")

  			#emphases
  			t.gsub!(/<[\s]*i[\s]*>(.+?)<[\s]*\/[\s]*i[\s]*>/im, "<em>\\1</em>")
  			t.gsub!(/<[\s]*g[\s]*>(.+?)<[\s]*\/[\s]*g[\s]*>/im, "<strong>\\1</strong>")
  			t.gsub!(/<[\s]*s[\s]*>(.+?)<[\s]*\/[\s]*s[\s]*>/im, "<ins>\\1</ins>")
  			t.gsub!(/<[\s]*b[\s]*>(.+?)<[\s]*\/[\s]*b[\s]*>/im, "<del>\\1</del>")

  			#semantique
  			t.gsub!(/<[\s]*titre[\s]*>(.+?)<[\s]*\/[\s]*titre[\s]*>[[\s]*<br \/>]*/im, "<h3>\\1</h3>")
  			t.gsub!(/<[\s]*sous-titre[\s]*>(.+?)<[\s]*\/[\s]*sous-titre[\s]*>[[\s]*<br \/>]*/im, "<h4>\\1</h4>")

  			#listes
  			t.gsub!(/[<br \/>]*<[\s]*liste[\s]*>(.+?)<[\s]*\/[\s]*liste[\s]*>/im, "<ul>\\1</ul>")
  			t.gsub!(/[<br \/>]*<[\s]*-[\s]*>(.+?)<[\s]*\/[\s]*-[\s]*>/im, "<li>\\1</li>")

  			#acronymes
  			t.gsub!(/<[\s]*sigle[\s]*=[\s]*(.+?)[\s]*>(.+?)<[\s]*\/[\s]*sigle[\s]*>/im, "<acronym title=\"\\1\">\\2</acronym>")

  			#liens
  			t.gsub!(/<[\s]*lien[\s]*=[\s]*(.+?)[\s]*>(.+?)<[\s]*\/[\s]*lien[\s]*>/im, "<a href=\"\\1\">\\2</a>")

  			#accents
  			accents = {
  			"à"=>"&agrave;", "â"=>"&acirc;",
  			"é"=>"&eacute;", "è"=>"&egrave;", "ê"=>"&ecirc;", "ë"=>"&euml;",
  			"î"=>"&icirc;", "ï"=>"&iuml;",
  			"ô"=>"&ocirc;", "ö"=>"&ouml;",
  			"ù"=>"&ugrave;", "û"=>"&ucirc;",
  			"ç"=>"&ccedil;"
  			}
  			accents.each do |k, v|
  				t.gsub!(/#{k}/, v)
  			end

  		end

  		return t
  	end
  private
    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
      @lang = I18n.locale
      Rails.application.routes.default_url_options[:locale]= I18n.locale

    end

end
