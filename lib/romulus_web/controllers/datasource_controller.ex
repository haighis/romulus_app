defmodule RomulusWeb.DatasourceController do
  use RomulusWeb, :controller
  # import the business helper from another module
  import RomulusWeb.BusinessHelper 
  alias Forms.Core
  
  action_fallback(RomulusWeb.FallbackController)

  # Gets all Datasources
  def index(conn, _params) do
    # Get the business id from header
    raw_business_id = get_req_header(conn, "business")
    
    bs = get_business_id(raw_business_id)
    datasources = Core.list_datasources_by_business( bs )
    render(conn, "index.json", datasources: datasources)
  end

  # Get Datasource by Id
  def show(conn, %{"id" => id}) do
  # https://lobotuerto.com/blog/building-a-json-api-in-elixir-with-phoenix/
  # https://thoughtbot.com/blog/building-a-phoenix-json-api
    # For Demo purposes text conn, "hi " <> id 
    datasource = Core.get_datasource!(id)
    render(conn, "show.json", datasource: datasource)
  end


  # def show(conn, %{"id" => slug}, user) do
  #   article =
  #     slug
  #     |> Blog.get_article_by_slug!()
  #     |> Repo.preload([:author, :favorites])
  #     |> Blog.load_favorite(user)

  #   render(conn, "show.json", article: article)
  # end
end