# frozen_string_literal: true

require 'rails_helper'

describe 'Request test', type: :request do
  context 'get /' do
    it 'Should return hello world' do
      get '/'
      expect(response.status).to eq 200
      expect(JSON.parse(response.body)).to include_json(
        text: 'Hello World'
      )
    end
  end

  context 'get /health' do
    it 'Should return hello world' do
      get '/health'
      expect(response.status).to eq 200
      expect(JSON.parse(response.body)).to include_json(
        status: 'OK'
      )
    end
  end

  context 'get /metadata' do
    it 'Should return hello world' do
      get '/metadata'
      expect(response.status).to eq 200
      expect(JSON.parse(response.body)).to include_json(
        'myob-api': [
          {
            version: ENV['VERSION'],
            description: 'pre-interview technical test',
            lastcommitsha: ENV['LAST_COMMIT_SHA']
          }
        ]
      )
    end
  end
end
