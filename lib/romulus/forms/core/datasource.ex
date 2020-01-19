defmodule Forms.Core.Datasource do
  @moduledoc """
  The Datasource Model
  """

  use Ecto.Schema
  import Ecto.Changeset
  # alias RealWorld.Accounts.User
  alias Forms.Core.{Datasource}

  @timestamps_opts [type: :utc_datetime]
  @required_fields ~w(title)a

  @primary_key {:datasource_id, :integer, []}
  @derive {Phoenix.Param, key: :datasource_id}
  schema "datasource" do
    field(:title, :string)
    field(:business_id, :integer)
  end

  def changeset(%Datasource{} = datasource, attrs) do
    datasource
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
