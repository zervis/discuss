defmodule Discuss.User do
  use Discuss.Web, :model
  @fields [:email, :provider, :token]

  @derive {Poison.Encoder, only: [:email]}


  schema "users" do
    field :email, :string
    field :provider, :string
    field :token, :string
    has_many :topics, Discuss.Topic
    has_many :comments, Discuss.Comment

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |>cast(params, @fields)
    |>validate_required(@fields)
  end
end
