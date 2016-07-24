class Admin::AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]


  def index
    @authors = Author.all
  end


  def show
  end


  def new
    @author = Author.new
  end


  def edit
  end


  def create
    @author = Author.new(author_params)

      if @author.save
        redirect_to [:admin, @author], notice: 'Autor criado com sucesso.'
      else
        render :new
      end
  end


  def update
      if @author.update(author_params)
        redirect_to [:admin,@author], notice: 'Autor atualizado com sucesso'
      else
        render :edit
      end
  end


  def destroy
    @author.destroy
    redirect_to admin_authors_url, notice: 'Author was successfully destroyed.'
  end

  private

    def set_author
      @author = Author.find(params[:id])
    end


    def author_params
      params.require(:author).permit(:name)
    end
end