class BooksController < ApplicationController

  def show
        @book = Book.find(params[:id])
  end

  def index
    # 記事を全件取得
        @books = Book.all
        @book = Book.new
  end

  def new
        @book = Book.new
  end

  def create
        book = Book.new(book_params)
      if  book.save
          flash[:notice] = "Book was successfully created."
          redirect_to books_path
      else
         render action: :new
      end
  end

  def edit
        @book = Book.find(params[:id])
  end

  def update
        book = Book.find(params[:id])
        book.update(book_params)
        flash[:notice] = "Book was successfully updated."
        redirect_to book_path(book.id)
  end

  def destroy
        book = Book.find(params[:id])
        book.destroy
        flash[:notice] = "Book was successfully deleted."
        redirect_to books_path
  end

  private

  def book_params
        params.require(:book).permit(:title, :body)
  end

end