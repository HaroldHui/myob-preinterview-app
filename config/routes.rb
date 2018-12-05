Rails.application.routes.draw do
  get '/', to: 'app#index'
  get '/health', to: 'app#health'
  get '/metadata', to: 'app#metadata'
end
