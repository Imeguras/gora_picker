defmodule GoraPickerWeb.Router do
  alias GoraPickerWeb.UserController
  use GoraPickerWeb, :router


  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {GoraPickerWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    resources "/users", UserController
  end



  scope "/api", GoraPickerWeb do
    pipe_through :api
    get "/users", UserController, :index
    put "/users", UserController, :edit
    post "/users", UserController, :create
    delete "/users", UserController, :delete
  end

  def swagger_info do
    %{
      schemes: ["http", "https", "ws", "wss"],
      info: %{
        version: "1.0",
        title: "Gora_Picker API",
        description: "API Documentation for Gora_Picker v1",
        contact: %{
          name: "Joao Vieira",
          email: "joaovieira@ieee.org"
        }
      },
      #securityDefinitions: %{
      #  Bearer: %{
      #    type: "apiKey",
      #    name: "Authorization",
      #    description:
      #    "API Token must be provided via `Authorization: Bearer ` header",
      #in: "header"
      #  }
      #},
      consumes: ["application/json"],
      produces: ["application/json"]
      #tags: [
      #  %{name: "Users", description: "User resources"},
      #]
    }
  end


  scope "/", GoraPickerWeb do
    pipe_through :browser

    get "/", PageController, :home
  end



  # Other scopes may use custom stacks.
  # scope "/api", GoraPickerWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:gora_picker, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: GoraPickerWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
