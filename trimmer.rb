require_relative './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    if @nameable.correct_name.size >= 11
      @nameable.correct_name.slice(0, 10)
    else
      @nameable.correct_name
    end
  end
end
