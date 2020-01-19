defmodule RomulusWeb.DatasourceView do
  use RomulusWeb, :view
  alias RomulusWeb.{DatasourceView, FormatHelpers}

  def render("index.json", %{datasources: datasources}) do
    # Specify content below to change the return shape of the JSON response
    %{
      content: render_many(datasources, DatasourceView, "datasource.json")
    }
  end

  def render("show.json", %{datasource: datasource}) do
    %{datasource: render_one(datasource, DatasourceView, "datasource.json")}
  end

  def render("datasource.json", %{datasource: datasource}) do
    datasource
    |> Map.from_struct()
    |> Map.take([:datasource_id, :title])
    |> FormatHelpers.camelize()
  end

#  def render("show.json", %{article: article}) do
#     %{article: render_one(article, ArticleView, "article.json")}
#   end

#   def render("article.json", %{article: article}) do
#     article
#     |> Map.from_struct()
#     |> Map.put(:created_at, datetime_to_iso8601(article.created_at))
#     |> Map.put(:updated_at, datetime_to_iso8601(article.updated_at))
#     |> Map.put(:favorites_count, length(article.favorites))
#     |> Map.put(:favorited, !!article.favorited)
#     |> Map.take([
#       :id,
#       :body,
#       :description,
#       :title,
#       :slug,
#       :favorites_count,
#       :favorited,
#       :author,
#       :tag_list,
#       :created_at,
#       :updated_at
#     ])
#     |> Map.put(:author, UserView.render("author.json", user: article.author))
#     |> FormatHelpers.camelize()
#   end

end
