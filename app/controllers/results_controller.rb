class ResultsController < ApplicationController

  def index
    @lesson = Lesson.find params[:lesson]
    @results = @lesson.results.paginate page: params[:page]
  end

  def create
    @lesson = Lesson.find params[:lesson]
    @chosen_answer = WordAnswer.find params[:word_answer]
    @lesson.answered @chosen_answer
    if @lesson.results.count == @lesson.total_item
      redirect_to results_path lesson: @lesson
    else
      redirect_to edit_lesson_path @lesson
    end
  end
end
