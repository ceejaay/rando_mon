defmodule RandoMon.AccountFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RandoMon.Account` context.
  """

  @doc """
  Generate a unique user email.
  """
  def unique_user_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
         is_active: true,
        email: unique_user_email()
      })
      |> RandoMon.Account.create_user()

    user
  end
end
