require 'rails_helper'

RSpec.describe Client, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  # number, name, email, phone, address, sales
  
  subject {
    described_class.new(name: "Fulano da Silva",
                        email: "fulano@hotmail.com",
                        phone: "81988887777",
                        address: "Rua Fulano da Silva, 123. Boa Viagem, Recife - PE, Brasil.")
  }
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  
  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a phone" do
    subject.phone = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a address" do
    subject.address = nil
    expect(subject).to_not be_valid
  end

  it '#save' do
    cli = Client.new(name: "nome", email: "email@email.com", phone: "fone", address: "add")    
    expect { cli.save }.to change { Client.count }.by(1)
  end

  it '#list' do
    arr = []
    for i in 0..5 do
      cli = Client.new(name: "nome#{i}", email: "email#{i}@email.com", phone: "fone#{i}", address: "add#{i}")
      cli.save
      arr[i] = cli.id
    end
    clients = Client.order('created_at DESC');
    clients.each { |obj|
      expect(obj.id).to be > 0
    } 
  end 

  it '#update' do
    cli = Client.new(name: "nome", email: "email@email.com", phone: "fone", address: "add")
    cli.save

    obj = Client.find(cli.id)
    obj.update(name: "name-upd", email: "email@email.com", phone: "fone", address: "add")

    obj2 = Client.find(cli.id)
    expect(obj2.name).to eq("name-upd")
  end 

  it '#destroy' do
    cli = Client.new(name: "nome", email: "email@email.com", phone: "fone", address: "add")
    cli.save
    expect { cli.destroy }.to change { Client.count }.by(-1)
  end 

end