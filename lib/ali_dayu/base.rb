require 'net/http'
require 'digest'
require 'json'

class AliDayu::Base
  attr_accessor :app_key, :app_secret, :post_url

  def initialize(options = {})
    self.app_key = options['app_key'] || AliDayu.app_key
    self.app_secret = options['app_secret'] || AliDayu.app_secret
    self.post_url = options['post_url'] || AliDayu.post_url
  end

  def deliver(*args)
    raise NotImplementedError, 'crontab must be implemented'
  end

  private
  def sort_options(arg)
    hash = Hash.new
    arg.sort.map{|e| hash[e[0]] = e[1] }
    hash
  end

  def encrypt(arg)
    _arg = arg.map{|k,v| "#{k}#{v}"}
    ::Digest::MD5.hexdigest("#{self.app_secret}#{_arg.join("")}#{self.app_secret}").upcase
  end

  def post(uri, options)
    response = ""
    url = URI.parse(uri)
    Net::HTTP.start(url.host, url.port) do |http|
      req = Net::HTTP::Post.new(url.path)
      req.set_form_data(options)
      response = http.request(req).body
    end

    JSON.parse(response)
  end
end
