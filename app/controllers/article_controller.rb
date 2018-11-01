class ArticleController < ApplicationController
  before_action :set_article
  
  def top
  end
  
  def list 
	  @articles = Article.where(articleClassification: params[:articleClassification])
  end
  
  def show
    @articles = Article.find_by(articleNumber: params[:articleNumber])
  end
  
  def search
    if params[:articleName].nil?
      flash[:notice] = "検索内容を入力してください。"
      redirect_to '/article/top'
    else
      @articles = Article.where('articleName LIKE ?', "%#{params[:articleName]}%")
      @articles_number = @articles.length
      if @articles.nil? || @articles_number == 0
        flash[:notice] = "該当記事が有りません。"
        redirect_to '/article/top'
      else
        render 'article/list'
      end
    end
  end
  
  def create
    @articles = Article.new(article_params)
    #戻るボタン押下でトップ画面へ遷移
    if params[:back_btn]
      redirect_to 'article/top'
    #登録ボタン押下で会員情報登録
    elsif params[:regist_btn]
      cnt = Article.count + 1
      @articles = Article.create(:articleName  => article_params[:articleName], 
                                 :articleDetail  => article_params[:articleDetail],
                                 :articleClassification => article_params[:articleClassification],
                                 :articleNumber  => cnt)
      if @articles.save
        render 'article/top'
      end
    end
  end
  
  private

    def set_article
      @articles = Article.new
    end
      
    def article_params
      params.require(:article).permit(:articleName,:articleDetail,:articleClassification)
    end
    
    def picture_params
      params.require(:picture).permit(:photo)
    end
    
end
