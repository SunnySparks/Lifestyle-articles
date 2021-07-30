class ArtcategoController < ApplicationController
  def new
    @artcatego = Artcatego.new
  end

  def create
    @artcatego = Artcatego.new(artcatego_params)
  end

  private

  def artcatego_params
    params.require(:artcatego).permit(:article_id, :category_id)
  end
end
