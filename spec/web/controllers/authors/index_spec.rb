require 'spec_helper'
require_relative '../../../../apps/web/controllers/authors/index'

describe Web::Controllers::Authors::Index do
  let(:action) { Web::Controllers::Authors::Index.new }
  let(:params) { Hash[] }
  let(:repository) { AuthorRepository.new }

  before do
    repository.clear

    @author = AuthorRepository.new.create_with_books(name: 'KEnt Beck', books: [{title: 'TDD'}])

  end

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end

  it 'exposes all authors' do
    action.call(params)
    action.exposures[:authors].must_equal [@author]
  end

end
