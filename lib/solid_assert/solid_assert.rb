module SolidAssert
  # Turns the assertions on
  def self.enable_assertions
    Object.class_eval do
      include Assert
    end
  end

end



