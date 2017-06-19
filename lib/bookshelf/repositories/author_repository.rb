class AuthorRepository < Hanami::Repository
  associations do
    has_many :books
  end

# create an author with a collection of books:
# invoke the function in this way: create_with_books(name: "AuthorName", books: [{title: "Booktitle"}])
  def create_with_books(data)
    assoc(:books).create(data)
  end

#find the author whose id matches the author_id from the books table
  def find_with_books(id)
    aggregate(:books).where(id: id).as(Author).one
  end
end
