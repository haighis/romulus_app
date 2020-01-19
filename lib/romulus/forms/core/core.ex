defmodule Forms.Core do
  @moduledoc """
  The boundary for the Core system.
  """

  import Ecto.Query, warn: false
  alias Forms.Repo2
  #alias RealWorld.Accounts.{User, UserFollower}
  alias Forms.Core.{Datasource,Form}

  @default_pagination_limit 200

  @doc """
  Returns the list of datasources.

  ## Examples

      iex> list_datasources(%{"limit" => 10, "offset" => 0})
      [%Article{}, ...]

  """
  def list_datasources() do
    # limit = params["limit"] || @default_pagination_limit
    # offset = params["offset"] || 0

    from(a in Datasource) # , limit: ^limit, offset: ^offset, order_by: a.created_at
    |> Repo2.all()
  end

  def list_datasources_by_business(business_id) do
    query =
      from(d in Datasource,
        where: d.business_id == ^business_id
      )
    Repo2.all(query)
  end

  def list_forms_by_business(business_id) do
    # limit = params["limit"] || @default_pagination_limit
    # offset = params["offset"] || 0
    query =
      from(f in Form,
        where: f.business_id == ^business_id
      )
    Repo2.all(query)
  end

  def list_forms_paged(params) do
    from(a in Form) # , limit: ^limit, offset: ^offset, order_by: a.created_at
    |> Repo2.all()  
  end

  @doc """
  Gets a single Datasource.

  Raises `Ecto.NoResultsError` if the Datasource does not exist.

  ## Examples

      iex> get_datasource!(123)
      %Datasource{}

      iex> get_datasource!(456)
      ** (Ecto.NoResultsError)
 
  """
  def get_datasource!(id), do: Repo2.get!(Datasource, id)

  
  # @doc """
  # Creates a article.

  # ## Examples

  #     iex> create_article(%{field: value})
  #     {:ok, %Article{}}

  #     iex> create_article(%{field: bad_value})
  #     {:error, %Ecto.Changeset{}}

  # """
  # def create_article(attrs \\ %{}) do
  #   %Article{}
  #   |> Article.changeset(attrs)
  #   |> Repo.insert()
  # end

  # @doc """
  # Updates a article.

  # ## Examples

  #     iex> update_article(article, %{field: new_value})
  #     {:ok, %Article{}}

  #     iex> update_article(article, %{field: bad_value})
  #     {:error, %Ecto.Changeset{}}

  # """
  # def update_article(%Article{} = article, attrs) do
  #   article
  #   |> Article.changeset(attrs)
  #   |> Repo.update()
  # end

  # @doc """
  # Deletes a Article.

  # ## Examples

  #     iex> delete_article(article)
  #     {:ok, %Article{}}

  #     iex> delete_article(article)
  #     {:error, %Ecto.Changeset{}}

  # """
  # def delete_article(slug) do
  #   case Article |> Repo.get_by(slug: slug) do
  #     nil ->
  #       false

  #     article ->
  #       Repo.delete(article)
  #   end
  # end

  # @doc """
  # Returns the list of comments.

  # ## Examples

  #     iex> list_comments()
  #     [%Comment{}, ...]

  # """
  # # def list_comments do
  # #   Repo.all(Comment)
  # # end

  # def list_comments(article) do
  #   Repo.all(from(c in Comment, where: c.article_id == ^article.id))
  # end

  # @doc """
  # Gets a single comment.

  # Raises `Ecto.NoResultsError` if the Comment does not exist.

  # ## Examples

  #     iex> get_comment!(123)
  #     %Comment{}

  #     iex> get_comment!(456)
  #     ** (Ecto.NoResultsError)

  # """
  # def get_comment!(id), do: Repo.get!(Comment, id)

  # @doc """
  # Creates a comment.

  # ## Examples

  #     iex> create_comment(%{field: value})
  #     {:ok, %Comment{}}

  #     iex> create_comment(%{field: bad_value})
  #     {:error, %Ecto.Changeset{}}

  # """
  # def create_comment(attrs \\ %{}) do
  #   %Comment{}
  #   |> Comment.changeset(attrs)
  #   |> Repo.insert()
  # end

  # @doc """
  # Updates a comment.

  # ## Examples

  #     iex> update_comment(comment, %{field: new_value})
  #     {:ok, %Comment{}}

  #     iex> update_comment(comment, %{field: bad_value})
  #     {:error, %Ecto.Changeset{}}

  # """
  # def update_comment(%Comment{} = comment, attrs) do
  #   comment
  #   |> Comment.changeset(attrs)
  #   |> Repo.update()
  # end

  # @doc """
  # Deletes a Comment.

  # ## Examples

  #     iex> delete_comment(comment)
  #     {:ok, %Comment{}}

  #     iex> delete_comment(comment)
  #     {:error, %Ecto.Changeset{}}

  # """
  # def delete_comment(%Comment{} = comment) do
  #   Repo.delete(comment)
  # end

  # @doc """
  # Returns an `%Ecto.Changeset{}` for tracking comment changes.

  # ## Examples

  #     iex> change_comment(comment)
  #     %Ecto.Changeset{source: %Comment{}}

  # """
  # def change_comment(%Comment{} = comment) do
  #   Comment.changeset(comment, %{})
  # end

  # @doc """
  # Unfavorites an Article

  # ## Example

  # iex> unfavorite(article)
  # {:ok, %Favorite{}}
  # """
  # def unfavorite(article, user) do
  #   article
  #   |> find_favorite(user)
  #   |> Repo.delete()
  # end

  # @doc """
  # Favorites an Article

  # ## Example

  # iex> favorite(article)
  # {:ok, %Favorite{}}
  # """
  # def favorite(user, article) do
  #   favorite = %Favorite{}

  #   params = %{
  #     user_id: user.id,
  #     article_id: article.id
  #   }

  #   favorite
  #   |> Favorite.changeset(params)
  #   |> Repo.insert()
  # end

  # def load_favorite(article, nil), do: article

  # def load_favorite(article, user) do
  #   case find_favorite(article, user) do
  #     %Favorite{} -> Map.put(article, :favorited, true)
  #     _ -> article
  #   end
  # end

  # def load_favorites(articles, nil), do: articles

  # def load_favorites(articles, user) do
  #   articles
  #   |> Enum.map(fn article -> load_favorite(article, user) end)
  # end

  # defp find_favorite(%Article{} = article, %User{} = user) do
  #   query = from(f in Favorite, where: f.article_id == ^article.id and f.user_id == ^user.id)

  #   Repo.one(query)
  # end
end
