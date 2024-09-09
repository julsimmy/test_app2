class BooksController < ApplicationController

  def index
    @books = Book.order(:title)
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = 'Book has been created successfully'
      redirect_to books_path
    else
      render('new')
    end
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'Book has been updated successfully'
        redirect_to books_path
    else
      render('edit')
    end
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = 'Book has been deleted successfully'
    redirect_to books_path
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title)
  end

end
