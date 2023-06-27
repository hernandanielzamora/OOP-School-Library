require_relative 'nameable'

class Decorator < Nameable
  def initialize(object)
    @object = object
    super()
  end

  def correct_name
    @object.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @object.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    name = @object.correct_name
    name.length > 10 ? name[0..9] : name
  end
end
