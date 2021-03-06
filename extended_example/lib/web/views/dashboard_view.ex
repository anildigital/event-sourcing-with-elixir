defmodule Web.DashboardView do
  use Web, :view

  def status(%Vehicle{out_for_delivery: true}) do
    render(Web.IconView, "badge.html",
      color: "yellow",
      label: "Out for Delivery",
      icon: "fa-truck"
    )
  end

  def status(%Vehicle{out_for_delivery: false}) do
    render(Web.IconView, "badge.html", color: "teal", label: "Packing", icon: "fa-box-open")
  end

  def status(%{delivered_successfully: true}) do
    render(Web.IconView, "badge.html", color: "green", label: "Delivered", icon: "fa-check")
  end

  def status(%{delivered_successfully: false}) do
    render(Web.IconView, "badge.html",
      color: "red",
      label: "Delivery failed",
      icon: "fa-times-circle"
    )
  end

  def status(%{out_for_delivery: true}) do
    render(Web.IconView, "badge.html",
      color: "yellow",
      label: "Out for Delivery",
      icon: "fa-truck"
    )
  end

  def status(%{scheduled_for: scheduled_for}) when not is_nil(scheduled_for) do
    render(Web.IconView, "badge.html",
      color: "teal",
      label: "Scheduled",
      icon: "fa-clock"
    )
  end

  def status(_shipment) do
    render(Web.IconView, "badge.html", color: "gray", label: "Registered", icon: "fa-plus")
  end

  def out_for_delivery_badge(%{delivered_successfully: true, delivering_vehicle: vehicle_id}) do
    render(Web.IconView, "badge.html",
      color: "green",
      label: "Truck #{vehicle_id}",
      icon: "fa-check"
    )
  end

  def out_for_delivery_badge(%{delivered_successfully: false, delivering_vehicle: vehicle_id}) do
    render(Web.IconView, "badge.html",
      color: "red",
      label: "Truck #{vehicle_id}",
      icon: "fa-times-circle"
    )
  end

  def out_for_delivery_badge(%{out_for_delivery: true, delivering_vehicle: vehicle_id}) do
    render(Web.IconView, "badge.html",
      color: "yellow",
      label: "Truck #{vehicle_id}",
      icon: "fa-truck"
    )
  end

  def out_for_delivery_badge(%{scheduled_for_vehicle: vehicle_id}) when is_binary(vehicle_id) do
    render(Web.IconView, "badge.html",
      color: "teal",
      label: "Truck #{vehicle_id}",
      icon: "fa-clock"
    )
  end

  def out_for_delivery_badge(_), do: pill(nil)

  def delivered_badge(%{delivered_successfully: true}) do
    render(Web.IconView, "badge.html",
      color: "green",
      label: "Delivered",
      icon: "fa-check"
    )
  end

  def delivered_badge(%{delivered_successfully: false}) do
    render(Web.IconView, "badge.html",
      color: "red",
      label: "Delivery failed",
      icon: "fa-times-circle"
    )
  end

  def delivered_badge(%{delivered_successfully: nil}), do: pill(nil)
end
