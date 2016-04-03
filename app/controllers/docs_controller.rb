class DocsController < ApplicationController
  before_action :find_doc, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category].blank?
    @docs = Doc.all.order("created_at DESC")
  else
    @category_id = Category.find_by(name: params[:category]).id
    @docs = Doc.where(:category_id => @category_id).order("created_at DESC")
  end
  end

  def show
  end

  def new
    @doc = current_user.docs.build
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def create
    @doc = current_user.docs.build(doc_params)
    @doc.category_id = params[:category_id]

    if @doc.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def update
    @doc.category_id = params[:category_id]
    if @doc.update(doc_params)
      redirect_to doc_path(@doc)
    else
      render 'edit'
    end
  end

  def destroy
    @doc.destroy
    redirect_to root_path
  end

  private

    def doc_params
      params.require(:doc).permit(:title, :description, :director, :category_id, :doc_img)
    end

    def find_doc
      @doc = Doc.find(params[:id])
    end
end
