class ArticleController < ApplicationController
  
  def top
  end
  
  def list 
	  @articles = Article.where(articleClassification: params[:articleClassification])
  end
  
  def show
    @articles = Article.find_by(articleNumber: params[:articleNumber])
  end
  
  def create
    #戻るボタン押下でトップ画面へ遷移
    if params[:back_btn]
      redirect_to 'article/top'
    #登録ボタン押下で会員情報登録
    elsif params[:regist_btn]
      cnt = Article.count + 1
      @articles = Article.create(:articleName  => params[:articleName], 
                                 :articleDetail  => params[:articleDetail],
                                 :articleClassification => params[:articleClassification][:values],
                                 :articleNumber  => cnt)
      if @articles.save
        render 'article/top'
      end
    end
  end

end
