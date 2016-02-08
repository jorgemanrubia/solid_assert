Dir[File.dirname(__FILE__) + "/solid_assert/**/*.rb"].each do |file|
  require file
end

Object.class_eval do
  include SolidAssert::NullAssert
end
