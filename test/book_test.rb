require './test/test_helper'
require './lib/book'

class BookTest < Minitest::Test

  def test_it_exists
    book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})

    assert_instance_of Book, book
  end

  def test_it_has_an_author_first_name
    book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})

    assert_equal "Harper", book.author_first_name
  end

  def test_it_has_an_author_last_name
    book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})

    assert_equal "Lee", book.author_last_name
  end

  def test_it_has_a_title
    book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})

    assert_equal "To Kill a Mockingbird", book.title
  end

  def test_it_has_a_pulication_year
    book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})

    assert_equal "1960", book.publication_date
  end

end
