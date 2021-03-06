require 'rails_helper'

RSpec.describe "Aguzon::Categories", type: :request do
  describe 'GET #show' do
    let(:taxon) { create(:taxon) }
    let!(:product) { create(:product, taxons: [taxon]) }

    before { get aguzon_category_path taxon.id }

    it 'リクエストが成功すること' do
      expect(response.status).to eq 200
    end

    it 'taxon名が表示されていること' do
      expect(response.body).to include taxon.name
    end

    it 'productの値段が表示されていること' do
      expect(response.body).to include product.display_price.to_s
    end

    it 'categoryのtitleが表示されていること' do
      expect(response.body).to include("#{taxon.name} - #{BASE_TITLE}")
    end
  end
end
