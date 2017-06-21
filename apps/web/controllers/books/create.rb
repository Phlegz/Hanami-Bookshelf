module Web::Controllers::Books
  class Create
    include Web::Action

    expose :book

    params do
      required(:book).schema do
        required(:title).filled(:str?)
        required(:author).filled(:str?)
      end
    end

    def call(params)
      if params.valid?
        AuthorRepository.new.all.each do |author|
          if author.name.upcase == (params[:book])[:author].upcase
            BookRepository.new.create(author_id: author.id,title: (params[:book])[:title] )
            redirect_to routes.books_path
            break
          end
        end

        AuthorRepository.new.create_with_books(name: (params[:book])[:author], books: [{title: (params[:book])[:title]}])
        redirect_to routes.books_path
      else
        self.status = 422
      end
    end

  end

end
