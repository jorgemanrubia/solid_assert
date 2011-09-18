module SolidAssert

  # Turns the assertions on
  def self.enable_assertions
    Object.class_eval do
      include Assert
    end
  end

  # Turns the assertions off
  def self.disable_assertions
    Object.class_eval do
      include NullAssert
    end
  end

end



