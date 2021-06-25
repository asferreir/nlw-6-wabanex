defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "when all params area valid, returns a valid changeset" do
      params = %{name: "Anderson", email: "anderson@gmail.com", password: "123456"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
        valid?: true,
        changes: %{email: "anderson@gmail.com", name: "Anderson", password: "123456"},
        errors: []
      } = response
    end

    test "when there are invalid params, returns a invalid changeset" do
      params = %{name: "A", email: "anderson@gmail.com", password: ""}

      response = User.changeset(params)

      expected_response =  %{
        name: ["should be at least 2 character(s)"],
        password: ["can't be blank"]}

      assert errors_on(response) == expected_response

    end
  end

end
