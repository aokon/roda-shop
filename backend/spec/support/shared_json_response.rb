RSpec.shared_examples 'a valid json response' do
  it 'returns 200 HTTP code' do
    expect(last_response.status).to eq(200)
  end

  it 'returns valid format' do
    content_type = last_response.header['Content-Type']
    expect(content_type).to eq('application/json')
  end
end
