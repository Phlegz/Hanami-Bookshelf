class OwnerRepository < Hanami::Repository
  associations do
    has_many :books
  end

# invoke the function in this way: create_with_books(owner: "OwnerName", books: [{title: "Booktitle"}])
  def owner_exists(data)
    owners.read("select id from owners where name='#{data}'").to_a
  end

  def create_with_books(data)
    assoc(:books).create(data)
  end

  def find_with_books(id)
    aggregate(:books).where(id: id).as(Owner).one
  end

end
