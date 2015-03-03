RSpec.describe 'api/v1/products', type: :integration do
  describe 'GET list' do
    before { do_get }

    it_behaves_like 'a valid json response'

    it 'returns valid response format' do
      response = json(last_response)
      expect(response).to have_key(:products)
      expect(response[:products]).to_not be_empty
    end

    def do_get
      get 'api/v1/categories/1/products'
    end
  end
end
