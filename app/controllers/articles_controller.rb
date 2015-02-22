class ArticlesController < ApplicationController
    before_action :authenticate_user!, :except => [:show, :index]
    def new
        @article = Article.new()
    end

    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def create
        @article = Article.new(article_params)
        @article.source = Redcarpet::Markdown.new(Redcarpet::Render::XHTML, hard_wrap: true).render(params[:article][:body])
        
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        @article.source = Redcarpet::Markdown.new(Redcarpet::Render::XHTML, hard_wrap: true).render(params[:article][:body])

        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to articles_path
    end

    private
    def article_params
        params.require(:article).permit(:title, :body, :author)
    end
end
