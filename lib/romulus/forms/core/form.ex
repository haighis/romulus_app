defmodule Forms.Core.Form do
  @moduledoc """
  The Form Definition Model
  """

  use Ecto.Schema
  import Ecto.Changeset
  alias Forms.Core.{Form}

  @timestamps_opts [type: :utc_datetime]
  @required_fields ~w(title)a

  @primary_key {:form_definition_id, :integer, []}
  @derive {Phoenix.Param, key: :form_definition_id}
  schema "form_definition" do
    field(:title, :string)
    field(:business_id, :integer)
  end

  def changeset(%Form{} = form, attrs) do
    form
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
