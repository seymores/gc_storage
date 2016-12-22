# GcStorage

Elixir wrapper for Google Cloud Storage API.

## Configuration

1. See [goth](https://github.com/peburrows/goth) for credential configuration.
2. Paramters (TODO)

## Installation

  1. Add `gc_storage` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:gc_storage, "~> 0.2.0"}]
    end
    ```

  2. Ensure `gc_storage` is started before your application:

    ```elixir
    def application do
      [applications: [:gc_storage]]
    end
    ```
