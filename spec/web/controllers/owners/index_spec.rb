require 'spec_helper'
require_relative '../../../../apps/web/controllers/owners/index'

describe Web::Controllers::Owners::Index do
  let(:action) { Web::Controllers::Owners::Index.new }
  let(:params) { Hash[] }
  let(:repository) { OwnerRepository.new }

  before do
    repository.clear

    @author = AuthorRepository.new.create_with_books(name: 'KEnt Beck', books: [{title: 'TDD'}], owner: 'me')
    @owner = OwnerRepository.new.all
  end

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end

  it 'exposes all owners' do
    action.call(params)
    action.exposures[:owners].must_equal [@owner]
  end

end
