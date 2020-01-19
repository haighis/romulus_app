defmodule RomulusWeb.FormController do
  use RomulusWeb, :controller

  alias Forms.Core

  action_fallback(RomulusWeb.FallbackController)

  def index(conn, _params) do
    business_id = 1111
    render(conn, "index.json", forms: Core.list_forms_by_business(business_id))
  end
end