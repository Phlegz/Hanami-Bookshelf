require 'features_helper'

describe 'List books' do
  let(:repository) { BookRepository.new }
  before do
    repository.clear

    AuthorRepository.new.create_with_books(name: 'Martin Fowler', books: [{title: 'PoEAA'}])
    AuthorRepository.new.create_with_books(name: 'Kent Beck', books: [{title: 'TDD'}])
    AuthorRepository.new.create_with_books(name: 'Kent Beck', books: [{title: 'TDD2'}])

  end

  it 'displays each author sorted by the number of their books in the bookshelf, descending' do
    visit '/authors'

    within '#authors' do
      assert page.has_css?('.author', count: 2), 'Expected to find 2 authors'
    end
  end
end
