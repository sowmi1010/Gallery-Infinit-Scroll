defmodule InfiniteScrollWeb.CartLive do
  use InfiniteScrollWeb, :live_view

  on_mount {InfiniteScrollWeb.UserAuth, :ensure_authenticated}

  @images [
    "/images/shoes/shoes1.jpg",
    "/images/shoes/shoes2.jpg",
    "/images/shoes/shoes3.jpg",
    "/images/shoes/shoes4.jpg",
    "/images/shoes/shoes5.jpg"
  ]

  @bag_images [
    "/images/Bags/bag1.jpg",
    "/images/Bags/bag2.jpg",
    "/images/Bags/bag3.jpg",
    "/images/Bags/bag4.jpg",
    "/images/Bags/bag5.jpg",
    "/images/Bags/bag6.jpg"
  ]

  @all_images [
    "/images/shoes/shoes1.jpg",
    "/images/Bags/bag1.jpg",
    "/images/shoes/shoes2.jpg",
    "/images/Bags/bag2.jpg",
    "/images/shoes/shoes3.jpg",
    "/images/Bags/bag3.jpg",
    "/images/shoes/shoes4.jpg",
    "/images/Bags/bag4.jpg",
    "/images/shoes/shoes5.jpg",
    "/images/Bags/bag5.jpg",
    "/images/Bags/bag6.jpg"
  ]

  def handle_params(params, _url, socket) do
    {:noreply, assign(socket, images: @images, bag_images: @bag_images, all_images: @all_images)}
  end

  def render(assigns) do
    ~H"""
    <div class="container">
      <ul class="flex flex-wrap items-center justify-center py-4 text-center text-base font-bold text-gray-700 md:py-8">
        <li class="tab_option">
          <button
            id="tab1"
            class="tab active-tab mb-3 mr-3 px-5 py-2.5 hover:border-gray-200 focus:ring-4 focus:outline-none focus:ring-gray-300 rounded-full"
            phx-click={set_active_tab("#tab1") |> show_active_content("#content_tab_1")}
          >
            All Categories
          </button>
        </li>
        <li class="tab_option">
          <button
            id="tab2"
            class="tab mb-3 mr-3 px-5 py-2.5 hover:border-gray-200 focus:ring-4 focus:outline-none focus:ring-gray-300 rounded-full"
            phx-click={set_active_tab("#tab2") |> show_active_content("#content_tab_2")}
          >
            Shoes
          </button>
        </li>
        <li class="tab_option">
          <button
            id="tab3"
            class="tab mb-3 mr-3 px-5 py-2.5 hover:border-gray-200 focus:ring-4 focus:outline-none focus:ring-gray-300 rounded-full"
            phx-click={set_active_tab("#tab3") |> show_active_content("#content_tab_3")}
          >
            Bags
          </button>
        </li>
      </ul>
      <div id="content" class="flex gap-4 justify-center items-center">
        <div id="content_tab_1" class="tab_content">
          <div class="grid grid-cols-3 gap-4">
            <div :for={image <- @all_images}>
              <img
                id={"image-#{random_id()}"}
                src={image}
                class="lg:h-72 lg:w-72 h-48 w-48 rounded-lg"
              />
            </div>
          </div>
        </div>
        <div id="content_tab_2" class="tab_content hidden">
          <div class="grid grid-cols-3 gap-4">
            <div :for={image <- @images}>
              <img
                id={"image-#{random_id()}"}
                src={image}
                class="lg:h-72 lg:w-72 h-48 w-48 rounded-lg"
              />
            </div>
          </div>
        </div>
        <div id="content_tab_3" class="tab_content hidden">
          <div class="grid grid-cols-3 gap-4">
            <div :for={image <- @bag_images}>
              <img
                id={"image-#{random_id()}"}
                src={image}
                class="lg:h-72 lg:w-72 h-48 w-48 rounded-lg"
              />
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end

  defp set_active_tab(js \\ %JS{}, tab) do
    js
    |> JS.remove_class("active-tab", to: "a.active-tab")
    |> JS.add_class("active-tab", to: tab)
  end

  defp random_id, do: Enum.random(1..1_000_000)

  defp show_active_content(js \\ %JS{}, to) do
    js
    |> JS.hide(to: "div.tab_content")
    |> JS.show(to: to)
  end
end
