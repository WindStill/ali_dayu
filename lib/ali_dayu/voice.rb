class AliDayu::Voice < AliDayu::Base

  def deliver(*args)
    _telphones, _tts_param, _tts_code, _called_show_num, _extend = args
    _timestamp = Time.now.strftime("%F %T")
    options = {
      app_key: self.app_key,
      format: 'json',
      method: 'alibaba.aliqin.fc.tts.num.singlecall',
      partner_id: 'apidoc',
      sign_method: 'md5',
      timestamp: _timestamp,
      v: '2.0',
      extend: _extend,
      tts_param: _tts_param.to_json,
      called_num: _telphones,
      called_show_num: _called_show_num,
      tts_code: _tts_code
    }

    options = sort_options(options)
    puts "options: #{options}"
    md5_str = encrypt(options)
    options.merge!(sign: md5_str)

    response = post(self.post_url, options.merge(sign: md5_str))
    puts "phones: #{_telphones}, #{_tts_param}, and respone: #{response}"
    response
  end
end
