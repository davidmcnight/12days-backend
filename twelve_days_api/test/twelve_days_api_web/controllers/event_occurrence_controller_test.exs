defmodule TwelveDaysApiWeb.EventOccurrenceControllerTest do
  use TwelveDaysApiWeb.ConnCase

  alias TwelveDaysApi.Events

  @create_attrs %{days_of_week: "some days_of_week", end_date: ~D[2010-04-17], increment: 42, increment_type: "some increment_type", interval: 42, months_of_year: "some months_of_year", start_date: ~D[2010-04-17]}
  @update_attrs %{days_of_week: "some updated days_of_week", end_date: ~D[2011-05-18], increment: 43, increment_type: "some updated increment_type", interval: 43, months_of_year: "some updated months_of_year", start_date: ~D[2011-05-18]}
  @invalid_attrs %{days_of_week: nil, end_date: nil, increment: nil, increment_type: nil, interval: nil, months_of_year: nil, start_date: nil}

  def fixture(:event_occurrence) do
    {:ok, event_occurrence} = Events.create_event_occurrence(@create_attrs)
    event_occurrence
  end

  describe "index" do
    test "lists all event_occurrences", %{conn: conn} do
      conn = get(conn, Routes.event_occurrence_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Event occurrences"
    end
  end

  describe "new event_occurrence" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.event_occurrence_path(conn, :new))
      assert html_response(conn, 200) =~ "New Event occurrence"
    end
  end

  describe "create event_occurrence" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.event_occurrence_path(conn, :create), event_occurrence: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.event_occurrence_path(conn, :show, id)

      conn = get(conn, Routes.event_occurrence_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Event occurrence"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.event_occurrence_path(conn, :create), event_occurrence: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Event occurrence"
    end
  end

  describe "edit event_occurrence" do
    setup [:create_event_occurrence]

    test "renders form for editing chosen event_occurrence", %{conn: conn, event_occurrence: event_occurrence} do
      conn = get(conn, Routes.event_occurrence_path(conn, :edit, event_occurrence))
      assert html_response(conn, 200) =~ "Edit Event occurrence"
    end
  end

  describe "update event_occurrence" do
    setup [:create_event_occurrence]

    test "redirects when data is valid", %{conn: conn, event_occurrence: event_occurrence} do
      conn = put(conn, Routes.event_occurrence_path(conn, :update, event_occurrence), event_occurrence: @update_attrs)
      assert redirected_to(conn) == Routes.event_occurrence_path(conn, :show, event_occurrence)

      conn = get(conn, Routes.event_occurrence_path(conn, :show, event_occurrence))
      assert html_response(conn, 200) =~ "some updated days_of_week"
    end

    test "renders errors when data is invalid", %{conn: conn, event_occurrence: event_occurrence} do
      conn = put(conn, Routes.event_occurrence_path(conn, :update, event_occurrence), event_occurrence: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Event occurrence"
    end
  end

  describe "delete event_occurrence" do
    setup [:create_event_occurrence]

    test "deletes chosen event_occurrence", %{conn: conn, event_occurrence: event_occurrence} do
      conn = delete(conn, Routes.event_occurrence_path(conn, :delete, event_occurrence))
      assert redirected_to(conn) == Routes.event_occurrence_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.event_occurrence_path(conn, :show, event_occurrence))
      end
    end
  end

  defp create_event_occurrence(_) do
    event_occurrence = fixture(:event_occurrence)
    {:ok, event_occurrence: event_occurrence}
  end
end
