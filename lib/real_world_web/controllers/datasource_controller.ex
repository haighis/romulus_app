defmodule RealWorldWeb.DatasourceController do
  use RealWorldWeb, :controller

  alias Forms.Core

  action_fallback(RealWorldWeb.FallbackController)

  def index(conn, _params) do
    render(conn, "index.json", datasources: Core.list_datasources())
  end
end


# defmodule RealWorldWeb.TagController do
#   use RealWorldWeb, :controller

#   alias RealWorld.Blog

#   action_fallback(RealWorldWeb.FallbackController)

#   def index(conn, _params) do
#     render(conn, "index.json", tags: Blog.list_tags())
#   end
# end