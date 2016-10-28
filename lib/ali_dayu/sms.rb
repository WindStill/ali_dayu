class AliDayu::Sms < AliDayu::Base

  def deliver(*args)
    _telphones, _sms_param, _sms_template_code, _sms_free_sign_name, _extend = args
    _timestamp = Time.now.strftime("%F %T")
    options = {
      app_key: self.app_key,
      format: 'json',
      method: 'alibaba.aliqin.fc.sms.num.send',
      partner_id: 'apidoc',
      sign_method: 'md5',
      timestamp: _timestamp,
      v: '2.0',
      extend: _extend,
      sms_type: 'normal',
      sms_free_sign_name: _sms_free_sign_name,
      sms_param: _sms_param.to_json,
      rec_num: _telphones,
      sms_template_code: _sms_template_code
    }

    options = sort_options(options)
    puts "options: #{options}"
    md5_str = encrypt(options)
    options.merge!(sign: md5_str)

    response = post(self.post_url, options.merge(sign: md5_str))
    puts "phones: #{_telphones}, #{_sms_param}, and respone: #{response}"
    response
  end
end
