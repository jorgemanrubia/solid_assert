module SolidAssert

  def self.enable_assertions
    Object.class_eval do
      include Assert
    end
  end

  module Assert

  end
end