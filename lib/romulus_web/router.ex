defmodule RomulusWeb.Router do
  use RomulusWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
    plug(ProperCase.Plug.SnakeCaseParams)

    plug(
      Guardian.Plug.Pipeline,
      error_handler: RomulusWeb.SessionController,
      module: RomulusWeb.Guardian
    )

    plug(Guardian.Plug.VerifyHeader, realm: "Token")
    plug(Guardian.Plug.LoadResource, allow_blank: true)
  end

  scope "/", RomulusWeb do
    pipe_through(:api)

    # get("/articles/feed", ArticleController, :feed)

    # resources "/articles", ArticleController, except: [:new, :edit] do
    #   resources("/comments", CommentController, except: [:new, :edit])
    # end

    # # to allow comments_path in test
    # resources("/comments", CommentController, except: [:new, :edit])

    # post("/articles/:slug/favorite", ArticleController, :favorite)
    # delete("/articles/:slug/favorite", ArticleController, :unfavorite)

    #get("/datasources",DatasourceController, :index)
    resources "/datasources", DatasourceController
    # get("/formdefinitions",FormController, :index)

    # get("/tags", TagController, :index)
    get("/user", UserController, :current_user)
    put("/user", UserController, :update)
    post("/users", UserController, :create)
    post("/users/login", SessionController, :create)

    get("/profiles/:username", ProfileController, :show)
    post("/profiles/:username/follow", ProfileController, :follow)
    delete("/profiles/:username/follow", ProfileController, :unfollow)
  end
end
