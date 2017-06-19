require 'features_helper'

describe 'List books' do
  let(:repository) { BookRepository.new }
  before do
    repository.clear

    repository.create(title: 'PoEAA', author: 'Martin Fowler')
    repository.create(title: 'TDD',   author: 'Kent Beck')
    repository.create(title: 'TDD2',   author: 'Kent Beck')
  end

  it 'displays each author sorted by the number of their books in the bookshelf, descending' do
    visit '/authors'

    within '#authors' do
      assert page.has_css?('.author', count: 2), 'Expected to find 2 authors'
    end
  end
end
