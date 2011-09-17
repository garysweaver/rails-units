# this patch is necessary for ruby 1.8 because cases where
# Integers are divided by Units don't work quite right

if RUBY_VERSION < "1.9"
  class Fixnum
    alias quo_without_units quo
  
    def quo_with_units(other)
      case other
      when Unit
        self * other.inverse
      else
        quo_without_units(other)
      end
    end
  
    alias quo quo_with_units
    alias / quo_with_units
  end
end