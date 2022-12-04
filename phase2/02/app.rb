require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
    # This allows the app code to refresh
    # without having to restart the server.

    get '/hello' do
        name = params[:name] # value is 'Abbey'

        return "Hello #{name}"
    
    end

    post '/submit' do
        name = params[:name] # Abbey
        message = params[:message] # Hello World

        p name
        p message

        return "Thanks #{name}, you sent this message: #{message}"
    end

    get '/names' do
        names = params[:names]

        return 'Julia, Mary, Karim'
    end

    post '/sort-names' do
        names = params[:names]
        
        return 'Alice, Joe, Julia, Kieran, Zoe'
    end

    configure :development do
        register Sinatra::Reloader
    end
end