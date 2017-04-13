require 'CGI'
class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    id = params[:id]
    article = Article.find(id)
    if account_signed_in?
      if current_account.articles.include?(article)
        @stared = true
      else
        @stared = false
      end
    end
    @textArray = article.content.split(" ")
    @content = ""
    @textArray.each do |t|
      indefs = Indefinition.all
      indefsTitles = []
      indefsIds = []
      indefs.each do |i|
        indefsTitles << decrypter(i.title)
        indefsIds << i.id
      end
      regex = buildRegex(indefsTitles)
      regexTab = buildRegexArray(indefsTitles)
      match = matchtest(regexTab, t)
      if match != nil
        t = "<a href='indef_numerique/#{indefsIds[match]}'>" << t << "</a> "
      else
        t = t << " "
      end
      # if regex.match(t)
      #
      # else
      #
      # end
      @content << t
    end
  end

  # GET /articles/new
  def new
    @languages = Language.all
    @article = Article.new
    @notions = Notion.all
  end

  # GET /articles/1/edit
  def edit
    @notions = Notion.all
    @article = Article.find(params[:id])
    @languages = Language.all
  end

  # POST /articles
  # POST /articles.json
  def create
    # notions = params[:notions]
    notions = params[:notions]
    notionsObj = []

    notions.each do |notion|
    @article = Article.new(article_params)
      @article.notions << Notion.find(notion)
    end
    respond_to do |format|
      if @article.save
        format.html { redirect_to article_path(id: @article), notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    notions = params[:notions]
    notionsObj = []
    @article.notions.clear
    notions.each do |notion|
      @article.notions << Notion.find(notion)
    end
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_path(id: @article), notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def fav
  id = params[:id]
  article = Article.find(id)
  if account_signed_in?
    account = current_account
    if account.articles.include?(article)
      logger.debug "#{account.articles} - #{article} : #{account.articles.include?(article)}"
      account.articles.delete(article)
    else
      account.articles << article
    end
  end
  respond_to do |format|
    format.html { redirect_to article, notice: 'Vos favoris ont bien été modifiés' }
    format.json { head :no_content }
  end

end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :language_id)
    end
end
