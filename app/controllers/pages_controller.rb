class PagesController < ApplicationController

  def search
    @articles = Article.search(params)
  end

end
