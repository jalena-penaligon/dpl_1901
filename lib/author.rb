class Author
    attr_reader :books

  def initialize(attributes)
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
    @books = []
  end

  def add_book(title, date)
    book_attributes = {
      author_first_name: @first_name,
      author_last_name: @last_name,
      title: title,
      publication_date: date
    }
    book = Book.new(book_attributes)
    @books << book
    return book
  end

end
