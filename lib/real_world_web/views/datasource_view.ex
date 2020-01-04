defmodule RealWorldWeb.DatasourceView do
  use RealWorldWeb, :view
  alias RealWorldWeb.{DatasourceView, FormatHelpers}

  def render("index.json", %{datasources: datasources}) do
    %{
      datasources: render_many(datasources, DatasourceView, "datasource.json")
    }
  end

  def render("datasource.json", %{datasource: datasource}) do
    datasource
    |> Map.from_struct()
    |> Map.take([:datasource_id, :title])
    |> FormatHelpers.camelize()
  end
end
