defmodule Synapse.HallMagneticSensor do
  alias ElixirALE.GPIO

  def initialize(gpio) when is_number(gpio) do
    child_spec = %{
      id: GPIO,
      start:
        {GPIO, :start_link, [gpio, :input, [name: Synapse.gpio_via(gpio)]]}
    }

    DynamicSupervisor.start_child(Synapse.Supervisor, child_spec)
  end

  def read(sensor, opts \\ [raw: false])
  def read(sensor, [raw: true]) when is_pid(sensor), do: GPIO.read(sensor)
  def read(sensor, [raw: false]) when is_pid(sensor) do
    case read(sensor, raw: true) do
      0 -> :field_detected
      1 -> :no_field
      error -> error
    end
  end
  def read(_sensor, _opts), do: :invalid_sensor

  # TODO: Research how to do this better
  def watch(sensor, function \\ fn message -> IO.inspect(message, label: "#{__MODULE__}")  end)
  def watch(sensor, function) do
    GPIO.set_int(sensor, :both)

    receive do
      message -> function.(message)
    end

    watch(sensor)
  end
end
