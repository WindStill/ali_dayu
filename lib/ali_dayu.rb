#require File.expand_path('../ali_dayu/version', __FILE__)
#require File.expand_path('../ali_dayu/base', __FILE__)
#require File.expand_path('../ali_dayu/sms', __FILE__)
#require File.expand_path('../ali_dayu/voice', __FILE__)
require "ali_dayu/version"
require "ali_dayu/base"
require "ali_dayu/sms"
require "ali_dayu/voice"

module AliDayu
  class << self
    attr_accessor :app_key, :app_secret, :post_url

    def sms_send telphones, sms_param, sms_template_code, sms_free_sign_name, extend="", options={}
      Sms.new(options).deliver(telphones, sms_param, sms_template_code, sms_free_sign_name, extend)
    end

    def voice_send telphones, sms_param, tts_code, called_show_num, extend="", options={}
      Voice.new(options).deliver(telphones, sms_param, tts_code, called_show_num, extend)
    end
  end
end
