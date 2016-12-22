defmodule GcStorage do
  alias Goth.Token
  alias GcStorage.GCStorage

  @scope "https://www.googleapis.com/auth/devstorage.read_write"

  defp get_token do
    token =
    case Token.for_scope(@scope) do
      {:ok, token} -> token
    end
  end

  @doc """
  Upload file to Google Cloud Storage. Limited to 5mb file size.

  ### Example

  GcStorage.post_file("/tmp/test.jpg", "image/jpg", "myBucket", "folder_1")
  """
  def post_file(filepath, file_type, bucket, location \\ "") do
    token = get_token
    {:ok, file} = File.read(filepath)

    url = "https://www.googleapis.com/upload/storage/v1/b/#{bucket}/o?uploadType=media&name=#{location}"
    headers = %{"Authorization" => "Bearer #{token.token}", "Content-type"=> file_type, "Content-Length" => String.length(file)}

    result =
      case HTTPoison.post(url, file, headers, [connect_timeout: 1000000, recv_timeout: 1000000, timeout: 1000000]) do
        {:ok, response} ->
          IO.inspect response
          image = Poison.decode(response.body) |> elem(1) |> Map.get("name")
          image_name = "https://storage.googleapis.com/#{bucket}/" <> image
          {:ok, image_name}
        {:error, err} -> {:error, :failed_upload}
      end
  end

end
