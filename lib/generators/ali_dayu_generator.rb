require 'rails/generators'
class AliDayuGenerator < Rails::Generators::Base

  source_root File.expand_path('../templates', __FILE__)

  def install
    template "ali_dayu_setup.rb", "config/initializers/ali_dayu.rb"
  end

end
