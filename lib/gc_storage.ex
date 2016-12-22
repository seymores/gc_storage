defmodule GcStorage do
  alias Goth.Token
  require Logger

  @scope "https://www.googleapis.com/auth/devstorage.read_write"

  defp get_token do
    case Token.for_scope(@scope) do
      {:ok, token} -> token
    end
  end

  @doc """
  Upload file to Google Cloud Storage. Limited to 5mb file size.

  ### Example

  GcStorage.post_file("/tmp/test.jpg", "image/jpg", "myBucket", "folder_location")
  """
  def post_file(filepath, file_type, bucket, location \\ "") do
    token = get_token
    {:ok, file} = File.read(filepath)

    url = "https://www.googleapis.com/upload/storage/v1/b/#{bucket}/o?uploadType=media&name=#{location}"
    headers = %{"Authorization" => "Bearer #{token.token}", "Content-type"=> file_type, "Content-Length" => String.length(file)}

    case HTTPoison.post(url, file, headers, [connect_timeout: 1000000, recv_timeout: 1000000, timeout: 1000000]) do
      {:ok, response} ->
          Logger.debug inspect(response)
          filename = Poison.decode(response.body) |> elem(1) |> Map.get("name")
          location = "https://storage.googleapis.com/#{bucket}/" <> filename
          {:ok, location}
      {:error, err} -> {:error, :failed_upload, err}
    end
  end

end
