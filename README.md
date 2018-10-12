# Synapse
My goal for this project is to make it easier to start working with common hardware and sensors using Elixir.

Why synapse? Well, my primary target is those using [Nerves](https://github.com/nerves-project/nerves) framework for creating embedded software on devices. A `synapse` is the junction point between two nerve cells that propogates communication between them with each side knowing how to deal with the others neurotransmitter. This library will help facilitate `Nerves <-> hardware` and `Web <-> Nerves <-> hardware` relationships, ergo...`synapse`.

Although the primary target is Nerves, it is not a requirement to use this library. Anything with access to GPIO pins should be compatible (i.e. running elixir app in Rasbian, etc)

# Installation

```elixir
def deps do
  [{:synapse, "~> 0.1"}]
end
```