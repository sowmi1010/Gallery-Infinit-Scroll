defmodule InfiniteScroll.Repo do
  use Ecto.Repo,
    otp_app: :infinite_scroll,
    adapter: Ecto.Adapters.Postgres
end
