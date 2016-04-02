class DocsController < ApplicationController

  def index
  end

  def new
    @doc = Doc.new
  end

  def create
    @doc = Doc.new(doc_params)
  end

  private

    def doc_params
      params.require(:doc).permit(:title, :description, :director)
    end
end
