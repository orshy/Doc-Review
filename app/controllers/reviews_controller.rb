class ReviewsController < ApplicationController
  before_action :find_doc
  before_action :find_review, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :has_reviewed, only: [:new]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.doc_id = @doc.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to doc_path(@doc)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to doc_path(@doc)
    else
      render "edit"
    end
  end

  def destroy
    @review.destroy
    redirect_to doc_path(@doc)
  end

  private

    def review_params
      params.require(:review).permit(:rating, :comment)
    end

    def find_doc
      @doc = Doc.find(params[:doc_id])
    end

    def find_review
      @review = Review.find(params[:id])
    end

    def has_reviewed
      redirect_to doc_path(@doc), notice: "You've already written a review for this doc!" if current_user.reviews.exists?(doc: @doc)
    end

end
