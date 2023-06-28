require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'Unknown', parent_permission: true)
    add_student_classroom if classroom
    super(age, name, parent_permission: parent_permission)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def add_student_classroom(classroom)
    @classroom = classroom
    clasroom.add_student(self) unless classroom.students.include?(self)
  end
end
