require 'rails_helper'

describe 'HTTParty' do
  it 'HTTParty get' do
    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
    content_type = response.headers['content-type']
    expect(content_type).to match(/application\/json/)
  end
end