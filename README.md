# GcStorage

Elixir wrapper for [Google Cloud Storage API](https://cloud.google.com/storage/docs/json_api/).

## Configuration

1. Make sure you have your [credential json](https://console.cloud.google.com/apis/credentials?_ga=1.167009720.745343083.1452764028) from GCE account in config/. See [goth](https://github.com/peburrows/goth) for credential configuration.
2. Parameters (TODO)

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

## Usage


    iex> GcStorage.post_file("./README.md", "text/plain", "bucket_name", "README.md")
    {:ok, "https://storage.googleapis.com/bucket_name/README.md"}

## TODO

- Probably need to encode URI path
- Implement multipart and resumable uploads. See [upload doc](https://cloud.google.com/storage/docs/json_api/v1/how-tos/upload)
