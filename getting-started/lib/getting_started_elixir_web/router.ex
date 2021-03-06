defmodule GettingStartedElixirWeb.Router do
  use GettingStartedElixirWeb, :router

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

  scope "/", GettingStartedElixirWeb do
    pipe_through :browser # Use the default browser stack

    resources "/books", BookController

    get "/", PageController, :index
  end

end
