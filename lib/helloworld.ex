defmodule Helloworld do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(__MODULE__, [], function: :run)
    ]

    opts = [strategy: :one_for_one, name: Helloworld.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def run do
    routes = [
      {"/", Helloworld.Handler, []}
    ]
    dispatch = :cowboy_router.compile([{:_, routes}])
    opts = [port: port]
    env = [dispatch: dispatch]
    {:ok, _pid} = :cowboy.start_http(:http, 100, opts, [env: env])
  end

  def port do
    port = System.get_env("PORT")
    if port == nil do
      port = "8080"
    end
    {port_int, _} = Integer.parse(port)
    port_int
  end

  def main(_args) do
    IO.gets("Listening on port " <> to_string(port) <> ". Press a key to exit.\n")
  end

end
