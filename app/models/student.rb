class Student < ApplicationRecord
  belongs_to :mentor, class_name: :Teacher, optional: true

  validates_presence_of :first_name, :last_name, :grade_level, :gender, :gpa

  def self.sort_alphabetically_by_last_name
    Student.order(last_name: :asc)
  end

  def full_name
    [first_name, last_name].join(" ")
  end

end
