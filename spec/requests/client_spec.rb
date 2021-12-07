require 'rails_helper'

RSpec.describe ClientsController, type: :request do

  #describe "GET /index" do
  #  pending "add some examples (or delete) #{__FILE__}"
  #end
  subject {
    Client.new(name: "Fulano da Silva",
               email: "fulano@hotmail.com",
               phone: "81988887777",
               address: "Rua Fulano da Silva, 123. Boa Viagem, Recife - PE, Brasil.")
  }

  it 'index' do
    get clients_path
    expect(response).to have_http_status(:success)
  end

  it '#create' do
    get "/clients/new"
    assert_response :success

    expect {
      post "/clients", params: { client: {name: 'Fulano', email: 'email@email.com', phone: '88887777', address: 'Rua Fulano da Silva, 123.' } }
    }.to change { Client.count }.from(0).to(1)

    assert_response :redirect
    follow_redirect!
    expect(response).to have_http_status(:success)
  end 

  it '#show' do
    get clients_path(client_id: subject.id)
    expect(response).to have_http_status(:success)
  end 

  it '#destroy' do
    cli = Client.new(name: "nome", email: "email@email.com", phone: "fone", address: "add")    
    cli.save

    expect {
      delete "http://localhost:3000/clients/#{cli.id}"
    }.to change {Client.count }.from(1).to(0)

    assert_redirected_to clients_path
    follow_redirect!
    expect(response).to have_http_status(:success)
  end 

  it '#update' do
    cli = Client.new(name: "nome", email: "email@email.com", phone: "fone", address: "add")    
    cli.save
    
    put "http://localhost:3000/clients/#{cli.id}", params: { client: {name: "Fulano Update", email: "email@email.com", phone: "88887777", address: "Rua Fulano da Silva, 123."} }
    
    assert_response :redirect
    follow_redirect!
    expect(response).to have_http_status(:success)
  end 

end
