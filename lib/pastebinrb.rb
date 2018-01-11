require "pastebinrb/version"
require "pastebinrb/expiration"
require 'net/http'

module Pastebinrb
  class Pastebin
    BASE_URL = "https://pastebin.com"

    attr_reader :devkey

    def initialize( devkey )
      @devkey = devkey
    end

    def paste_content( content, **options )
      params = {
        :api_dev_key => @devkey,
        :api_option => "paste",
        :api_paste_name => options[:name],
        :api_paste_format => options[:format],
        :api_paste_expire_date => options[:expire_date],
        :api_paste_code => content
      }
      Net::HTTP.post_form(URI.parse("#{BASE_URL}/api/api_post.php"), params).body
    end

    def get_raw(link)
      Net::HTTP.get_response(URI.parse("#{BASE_URL}/raw/#{link[/[\w]+$/]}")).body
    end
  end
end
