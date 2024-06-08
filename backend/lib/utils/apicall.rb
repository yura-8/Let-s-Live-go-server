require 'net/http'
require 'uri'
require 'json'
require 'dotenv'
require 'nokogiri'
require 'open-uri'

module Utils
  class ApiCall
    def initialize
      Dotenv.load

      # 環境変数を読み込む
      @client_access_token = ENV['GENIUS_ACCESS_TOKEN']
    end

    def headers
      # Genius APIに対する認証ヘッダーを作成
      {
        'Authorization' => "Bearer #{@client_access_token}"
      }
    end

    def search_song_id(search_query)
      uri = URI("https://api.genius.com/search?q=#{URI.encode_www_form_component(search_query)}")
      response = Net::HTTP.get_response(uri, headers)

      if response.is_a?(Net::HTTPSuccess)
        parsed_response = JSON.parse(response.body)
        if parsed_response['response']['hits'].any?
          return parsed_response['response']['hits'][0]['result']['id']
        else
          raise "No hits found for query: #{search_query}"
        end
      else
        raise "Error fetching song ID: #{response.message}"
      end
    end

    # 曲の埋め込みコンテンツを取得
    def get_lyrics(song_id)
      uri = URI("https://api.genius.com/songs/#{song_id}")
      response = Net::HTTP.get_response(uri, headers)

      if response.is_a?(Net::HTTPSuccess)
        parsed_response = JSON.parse(response.body)
        embed_content = parsed_response['response']['song']['embed_content']
        response_doc = Nokogiri::HTML.fragment(embed_content)
        song_lyrics_url = response_doc.css('a').first['href']

        # URLからHTMLデータを取得
        html = URI.open(song_lyrics_url)

        # Nokogiriを使ってHTMLをパース
        doc = Nokogiri::HTML(html)

        # 歌詞部分を抽出する
        # Geniusの歌詞は通常、divタグでクラス名が 'lyrics' もしくは 'Lyrics__Root-sc-1ynbvzw-0' で囲まれている
        lyrics = doc.css('.lyrics').text.strip

        # 新しいデザインのGeniusページでは、歌詞が別の場所にある場合があります
        if lyrics.empty?
          lyrics = doc.css('[data-lyrics-container="true"]').text.strip
        end

        lyrics = lyrics.gsub(/[.*?]/, '')
      else
        raise "Error fetching lyrics: #{response.message}"
      end
    end
  end
end

