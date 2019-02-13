require './test/test_helper'
require "./lib/author"

class AuthorTest < Minitest::Test

  def test_it_exists
    nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})

    assert_instance_of Author, nk_jemisin
  end

  def test_books_starts_empty
    nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})

    assert_equal [], nk_jemisin.books
  end

  def test_you_can_add_books
    nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    nk_jemisin.add_book("The Fifth Season", "November 3, 2015")

    assert_equal 1, nk_jemisin.books.count
    assert_equal "N.K.", nk_jemisin.books[0].author_first_name
    assert_equal "Jemisin", nk_jemisin.books[0].author_last_name
    assert_equal "The Fifth Season", nk_jemisin.books[0].title
    assert_equal "2015", nk_jemisin.books[0].publication_date

    nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")

    assert_equal 2, nk_jemisin.books.count
    assert_equal "N.K.", nk_jemisin.books[1].author_first_name
    assert_equal "Jemisin", nk_jemisin.books[1].author_last_name
    assert_equal "The Hundred Thousand Kingdoms", nk_jemisin.books[1].title
    assert_equal "2010", nk_jemisin.books[1].publication_date
  end
end
