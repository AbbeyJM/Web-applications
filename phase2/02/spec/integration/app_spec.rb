require "spec_helper"
require 'rack/test'
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /names" do
    it 'returns 200 OK' do
    # Assuming the post with id 1 exists.
      response = get('/names', name: "Julia, Mary, Karim")
      expect(response.status).to eq(200)
      expect(response.body).to eq("Julia, Mary, Karim")
    end
  end

  context "POST /sort-names" do
    it 'returns 200 OK' do
      response = post('/sort-names', names: ("Joe, Alice, Zoe, Julia, Kieran"))

      expect(response.status).to eq(200)
      expect(response.body).to eq('Alice, Joe, Julia, Kieran, Zoe')
    end
  end
end