defmodule ElexWeb.Router do
  use ElexWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ElexWeb do
    pipe_through :browser


    scope "/pep" do
      get "/", PepController, :index
      post "/upload_list", PepController, :upload_list
      get "/search", PepController, :search
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElexWeb do
  #   pipe_through :api
  # end
end
