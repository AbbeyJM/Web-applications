require 'spec_helper'
require "rack/test"
require_relative '../../app.rb'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }
end

context "post /albums" do
  it 'returns 200 OK' do
    response = post(
    '/albums',
    title: ('Voyage'),
    release_year: ('2022'),
    artist_id: ('2')
    )

    expect(response.status).to eq(200)
    expect(response.body).to eq('')

    #response = (get'/albums')

    #expect(response.body).to include("Voyage")
  end
end

context "GET /artists" do
  it 'returns 200 OK' do
  # Assuming the post with id 1 exists.
    response = get('/artists', name: "Pixies, ABBA, Taylor Swift, Nina Simone")
    expect(response.status).to eq(200)
    expect(response.body).to eq("Pixies, ABBA, Taylor Swift, Nina Simone")
  end
end

context 'GET /albums/:id' do
  it 'should get info about album 1' do
    respose = get('/albums/1')

    expect(response.status).to eq(200)
    expect(response.body).to include('<h1>Doolittle</h1>')
    expect(reponse.body).to include('Realease year: 1989')
    expect(respose.body).to include('Artist: Pixies')
  end
end