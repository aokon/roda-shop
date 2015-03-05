RSpec.describe 'api/v1/categories', type: :integration do
  describe 'GET list' do
    before { do_get }

    it_behaves_like 'a valid json response'

    it 'returns valid response format' do
      response = json(last_response)

      expect(response).to have_key(:categories)
      expect(response[:categories]).to_not be_empty
    end

    def do_get
      get 'api/v1/categories'
    end
  end

  describe 'GET show' do
    before { do_get }

    it_behaves_like 'a valid json response'

    it 'returns valid response format' do
      response = json(last_response)

      expect(response).to have_key(:category)
      expect(response[:category][:id]).to eq(1)
    end

    def do_get
      get 'api/v1/categories/1'
    end
  end
end
