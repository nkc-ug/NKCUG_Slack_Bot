# frozen-string-literal: true

def gif_get(search_query)
  require 'http'

  tenor_api_key = ENV['TENOR_API_KEY']
  response = JSON.parse(HTTP.get('https://api.tenor.com/v1/search',
                                 params: { key: tenor_api_key,
                                           q: search_query,
                                           limit: 50 }))
  if response['results'].empty?
    'SearchCount: 0'
  else
    response['results'].sample['media'][0]['gif']['url']
  end
end
