class LessonsController < ApplicationController
  def create
    @category = Category.find params[:category]
    @category.start_a_lesson current_user
    redirect_to edit_lesson_path current_user.current_lesson
  end

  def edit
    @lesson = Lesson.find params[:id]
    @result = Result.new
    @question = current_user.unlearned_words_not_in_the_lesson(@lesson.category, @lesson).sample
  end

  def update
    raise params.inspect
  end

  def show
    @lesson = Lesson.find params[:id]
  end

end
