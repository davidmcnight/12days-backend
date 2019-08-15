defmodule TwelveDaysApiWeb.LayoutView do
  use TwelveDaysApiWeb, :view
  import TwelveDaysApi.Users,  only: [signed_in?: 1]
end
