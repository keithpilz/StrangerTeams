class StudentsController < ApplicationController

  def index # call method to sort students alphabetically
    @students = Student.sort_alphabetically_by_last_name
  end

  def show # show individual student
    @student = Student.find(params[:id])
  end

  def new # get new student form
    @student = Student.new
  end

  def create # post new student
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      @errors = @student.errors.full_messages
      render 'new'
    end
  end

  def edit # get edit form
    @student = Student.find(params[:id])
  end

  def update #put student data
    @student = Student.find(params[:id])

    if @student = Student.update(student_params)
      redirect_to @student
    else
      @errors = @student.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @student = Student.find(params[:id])
    if @student != nil
      @student.destroy
    end
    redirect_to students_path
  end

  private
  def student_params
    params.require(:student).permit(:first_name, :last_name, :grade_level, :gender, :gpa, :detention_count, :shirt_size, :food_allergies, :mentor_id)
  end
end