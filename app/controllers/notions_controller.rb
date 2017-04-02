class NotionsController < ApplicationController
  before_action :set_notion, only: [:show, :edit, :update, :destroy]

  # GET /notions
  # GET /notions.json
  def index
    @notions = Notion.all
  end

  # GET /notions/1
  # GET /notions/1.json
  def show
    language = Language.where(:code => I18n.locale).limit(1).first
    @id = params[:id]
    if @id == 9
      @filterLimit = 10
    else
      @filterLimit = 9
    end
    if params[:notions].nil? || params[:notions].empty?
      @array = []
    else
      @array = params[:notions].split(",")
    end
    if defined?(params[:entrance])
      @array << params[:entrance]
    end
    if defined?(params[:out])
      @array.delete(params[:out])
    end
    @notions = Notion.all
    @Notionfilter = []
    @array.each do |a|
      @Notionfilter << a
    end
    @Notionfilter << @notion.title
    @notionIds = []

    @Notionfilter.each do |n|
      if n
        @notionFind = Notion.where(:title => n).first
        if @notionFind
          @notionFindId = @notionFind.id
          @notionIds << @notionFind.id
        end
      end
    end
    @articles = Article.where(:language_id => language.id)
    @articlesFinals = []
    @articles.each do |article|
      notions = article.notions
      notionsId = []
      notions.each do |notion|
        notionsId << notion.id
      end

      notions = notions.sort
      @notionIds = @notionIds.sort
      testBeta = true
      @notionIds.each do |nFilterId|
        isPresent = false
          if notionsId.include?(nFilterId)
            isPresent = true
          end
        #si is present = true alors
        #on a un filtre trouvé dans un article

        if isPresent == false
          testBeta = false
        end
      end
      if testBeta == true
        @articlesFinals << article
      end
    end
    

  end

  # GET /notions/new
  def new
    @notion = Notion.new
  end

  # GET /notions/1/edit
  def edit
  end

  # POST /notions
  # POST /notions.json
  def create
    @notion = Notion.new(notion_params)

    respond_to do |format|
      if @notion.save
        format.html { redirect_to @notion, notice: 'Notion was successfully created.' }
        format.json { render :show, status: :created, location: @notion }
      else
        format.html { render :new }
        format.json { render json: @notion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notions/1
  # PATCH/PUT /notions/1.json
  def update
    respond_to do |format|
      if @notion.update(notion_params)
        format.html { redirect_to @notion, notice: 'Notion was successfully updated.' }
        format.json { render :show, status: :ok, location: @notion }
      else
        format.html { render :edit }
        format.json { render json: @notion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notions/1
  # DELETE /notions/1.json
  def destroy
    @notion.destroy
    respond_to do |format|
      format.html { redirect_to notions_url, notice: 'Notion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notion
      @notion = Notion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notion_params
      params.require(:notion).permit(:title)
    end
end
