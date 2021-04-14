class SearchController < ApplicationController
  def search
    @model = params["search"]["model"]
    @value = params["search"]["value"]
    @how = params["search"]["how"]
    @dates = search_for(@how, @model, @value)
  end

  private

  def match(model, value)
    if model == "post"
      Post.where(title: value)
    end
  end

  def partical(model, value)
    if model == "post"
      Post.where("title LIKE ?", "%#{value}%")
    end
  end

  def search_for(how, model, value)
    case how
    when "match"
      match(model, value)

    when "partical"
      partical(model, value)
    end
  end
end
