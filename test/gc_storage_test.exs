defmodule GcStorageTest do
  use ExUnit.Case
  doctest GcStorage

  test "test upload" do
    {:ok, _} = GcStorage.post_file("README.md", "text/plain", "cms_assetsk", "README.md")
  end
end
