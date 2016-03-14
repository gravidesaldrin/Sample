class Admin::WordsController < AdminController
  before_action :find_word, only: [:show,:destroy]

  def show
  end

  def edit
  end

  def destroy
    @word.destroy
    redirect_to admin_category_path @category
  end

  private
  def find_word
    @word = Word.find params[:id]
    @category = Category.find params[:category_id]
  end

end
