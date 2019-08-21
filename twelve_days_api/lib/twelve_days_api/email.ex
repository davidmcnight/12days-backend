defmodule TwelveDaysApi.Email do
  import Bamboo.Email
  use Bamboo.Phoenix, view: TwelveDaysApiWeb.EmailView

  def welcome_text_email(email_address) do
    new_email()
    |> to(email_address)
    |> from("us@example.com")
    |> subject("Welcome!")
    |> text_body("Welcome to TwelveDaysApi!")
  end
end
