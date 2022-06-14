class ArticlesController < ApplicationController
  # before subdomains are implemented:
  # before_action :set_authors, only: [:edit, :update, :new, :create]

  # for subdomains: the author must be set before the article is set
  before_action :set_author
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    # before subdomains are implemented:
    # @articles = Article.all

    # for subdomains: select only articles assigned to current tenant
    @articles = Article.where(tenant_id: @author.id)
    # look for the article with the id and the assigned author
   
      
  end

  # GET /articles/1 or /articles/1.json
  def show
    @author = @author
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  rescue_from ActiveRecord::RecordNotFound do |ex|
    # render json: { status: 404, error: ex.to_s }, status: 404
    render :action => "article_missing", :status => :not_found
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      # @article = Article.find(params[:id])
      # look for the article with the id and the assigned author
      @article = Article.find_by!(id: params[:id], tenant_id: @author.id)
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content, :tenant_id)
    end

    def set_author
      # Set the author requested via the subdomain
      @author = Author.find_by!(slug: request.subdomain)
    end

    
  
end
