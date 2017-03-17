require 'rails_helper'

describe CachorroSearch do
  let!(:dachshund) { create(:cachorro) }
  let!(:poodle) { create(:poodle) }
  let!(:labrador) { create(:labrador) }
  let(:cachorros) { Cachorro.all }

  describe "#search" do

    before do
      allow(cachorro_search).to(receive :search_by_field).and_return cachorros
      allow(cachorros).to(receive :order).and_return cachorros
    end

    context "ordering page results - default" do
      let(:cachorro_search) { CachorroSearch.new({page: nil}) }

      it "should order by ultima_consulta descent as default" do
        cachorro_search.search
        expect(cachorros).to have_received(:order).with "cachorros.data_ultima_consulta DESC"
      end
    end

    context "ordering page results by nome_dono" do
      let(:cachorro_search) { CachorroSearch.new({page: nil, order: 'cachorros.nome_dono'}) }

      it "should order by nome_dono descent" do
        cachorro_search.search
        expect(cachorros).to have_received(:order).with "cachorros.nome_dono"
      end
    end
  end

  describe "#search" do
    context "filtering page results - default - when field is blank" do
      let(:cachorro_search) { CachorroSearch.new({page: nil, query:'gabriel', field: ''}) }

      it "should show all dogs" do
        expect(cachorro_search.search_by_field(Cachorro.all)).to eq([dachshund, poodle, labrador])
      end
    end

    context "filtering page results - with query" do
      let(:cachorro_search) { CachorroSearch.new({page: nil, query:'gabriel', field: 'cachorros.nome_dono'}) }

      it "should show only dogs that correspond to the query" do
        expect(cachorro_search.search_by_field(Cachorro.all)).to eq([poodle])
      end
    end
  end
end
