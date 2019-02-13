class Library
  attr_reader :books

  def initialize
    @books = []
  end

  def add_to_collection(book)
    @books << book
  end

  def include?(title)
    @books.any? do |book|
      book.title == title
    end
  end

  def card_catalogue
    @books.sort_by do |book|
      book.author_last_name
    end
  end

  def group_books_by_author(author)
    @books.find_all do |book|
      author == "#{book.author_first_name} #{book.author_last_name}"
    end
  end

  def find_by_author(author)
    grouped = {}
    group_books_by_author(author).each do |book|
      grouped[book.title] = book
    end
    grouped
  end

  def group_books_by_publication_date(date)
    @books.find_all do |book|
      date == book.publication_date
    end
  end

  def find_by_publication_date(date)
    grouped = {}
    group_books_by_publication_date(date).each do |book|
      grouped[book.title] = book
    end
    grouped
  end
end
