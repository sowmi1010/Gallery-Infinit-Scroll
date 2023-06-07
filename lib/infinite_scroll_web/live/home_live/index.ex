defmodule InfiniteScrollWeb.HomeLive.Index do
  use InfiniteScrollWeb, :live_view

  alias InfiniteScrollWeb.Components.GalleryComponent

  @impl true
  def mount(_params, _session, socket) do
    socket = assign(socket, page: 1)

    if connected?(socket) do
      get_images(socket)
    else
      socket
    end

    {:ok, socket, temporary_assigns: [images: []]}
  end

  @impl true
  def handle_event("load-more", _, %{assigns: assigns} = socket) do
    {:noreply, assign(socket, page: assigns.page + 1) |> get_images()}
  end

  defp get_images(%{assigns: %{page: page}} = socket) do
    socket
    |> assign(page: page)
    |> assign(images: images())
  end

  defp images do
    image_directory = "images/Gallery/"

    image_files =
      [
        "111.jpg",
        "112.jpg",
        "113.jpg",
        "114.jpg",
        "115.jpg",
        "116.jpg",
        "117.jpg",
        "118.jpg",
        "115.jpg",
        "120.jpg",
        "121.jpg",
        "122.jpg",
        "123.jpg",
        "124.jpg",
        "125.jpg",
        "126.jpg",
        "128.jpg"
      ]
      |> Enum.map(fn filename -> Path.join([image_directory, filename]) end)
      |> Enum.shuffle()

    image_files
  end
end
