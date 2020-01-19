defmodule RomulusWeb.FormView do
  use RomulusWeb, :view
  alias RomulusWeb.{FormView, FormatHelpers}

  def render("index.json", %{forms: forms}) do
    # Specify content below to change the return shape of the JSON response
    %{
      content: render_many(forms, FormView, "form.json")
    }
  end

  def render("form.json", %{form: form}) do
    form
    |> Map.from_struct()
    |> Map.take([:form_definition_id, :title])
    |> FormatHelpers.camelize()
  end
end
