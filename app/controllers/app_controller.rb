# frozen_string_literal: true

class AppController < ApplicationController
  def index
    render json: { text: 'Hello World' }
  end

  def health
    render json: { status: 'OK' }
  end

  def metadata
    render json: {
      'myob-pre-interview': [
        {
          version: ENV['VERSION'],
          description: 'pre-interview technical test',
          lastcommitsha: ENV['LAST_COMMIT_SHA']
        }
      ]
    }
  end
end
