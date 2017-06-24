class OwnerRepository < Hanami::Repository
  associations do
    has_many :books
  end
end
