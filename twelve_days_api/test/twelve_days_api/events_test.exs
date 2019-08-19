defmodule TwelveDaysApi.EventsTest do
  use TwelveDaysApi.DataCase

  alias TwelveDaysApi.Events

  describe "events" do
    alias TwelveDaysApi.Events.Event

    @valid_attrs %{all_day: true, end_time: ~N[2010-04-17 14:00:00], event_name: "some event_name", send_ecard: true, start_time: ~N[2010-04-17 14:00:00]}
    @update_attrs %{all_day: false, end_time: ~N[2011-05-18 15:01:01], event_name: "some updated event_name", send_ecard: false, start_time: ~N[2011-05-18 15:01:01]}
    @invalid_attrs %{all_day: nil, end_time: nil, event_name: nil, send_ecard: nil, start_time: nil}

    def event_fixture(attrs \\ %{}) do
      {:ok, event} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Events.create_event()

      event
    end

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Events.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Events.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      assert {:ok, %Event{} = event} = Events.create_event(@valid_attrs)
      assert event.all_day == true
      assert event.end_time == ~N[2010-04-17 14:00:00]
      assert event.event_name == "some event_name"
      assert event.send_ecard == true
      assert event.start_time == ~N[2010-04-17 14:00:00]
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      assert {:ok, %Event{} = event} = Events.update_event(event, @update_attrs)
      assert event.all_day == false
      assert event.end_time == ~N[2011-05-18 15:01:01]
      assert event.event_name == "some updated event_name"
      assert event.send_ecard == false
      assert event.start_time == ~N[2011-05-18 15:01:01]
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_event(event, @invalid_attrs)
      assert event == Events.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Events.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Events.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Events.change_event(event)
    end
  end

  describe "event_occurrences" do
    alias TwelveDaysApi.Events.EventOccurrence

    @valid_attrs %{days_of_week: "some days_of_week", end_date: ~D[2010-04-17], increment: 42, increment_type: "some increment_type", interval: 42, months_of_year: "some months_of_year", start_date: ~D[2010-04-17]}
    @update_attrs %{days_of_week: "some updated days_of_week", end_date: ~D[2011-05-18], increment: 43, increment_type: "some updated increment_type", interval: 43, months_of_year: "some updated months_of_year", start_date: ~D[2011-05-18]}
    @invalid_attrs %{days_of_week: nil, end_date: nil, increment: nil, increment_type: nil, interval: nil, months_of_year: nil, start_date: nil}

    def event_occurrence_fixture(attrs \\ %{}) do
      {:ok, event_occurrence} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Events.create_event_occurrence()

      event_occurrence
    end

    test "list_event_occurrences/0 returns all event_occurrences" do
      event_occurrence = event_occurrence_fixture()
      assert Events.list_event_occurrences() == [event_occurrence]
    end

    test "get_event_occurrence!/1 returns the event_occurrence with given id" do
      event_occurrence = event_occurrence_fixture()
      assert Events.get_event_occurrence!(event_occurrence.id) == event_occurrence
    end

    test "create_event_occurrence/1 with valid data creates a event_occurrence" do
      assert {:ok, %EventOccurrence{} = event_occurrence} = Events.create_event_occurrence(@valid_attrs)
      assert event_occurrence.days_of_week == "some days_of_week"
      assert event_occurrence.end_date == ~D[2010-04-17]
      assert event_occurrence.increment == 42
      assert event_occurrence.increment_type == "some increment_type"
      assert event_occurrence.interval == 42
      assert event_occurrence.months_of_year == "some months_of_year"
      assert event_occurrence.start_date == ~D[2010-04-17]
    end

    test "create_event_occurrence/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_event_occurrence(@invalid_attrs)
    end

    test "update_event_occurrence/2 with valid data updates the event_occurrence" do
      event_occurrence = event_occurrence_fixture()
      assert {:ok, %EventOccurrence{} = event_occurrence} = Events.update_event_occurrence(event_occurrence, @update_attrs)
      assert event_occurrence.days_of_week == "some updated days_of_week"
      assert event_occurrence.end_date == ~D[2011-05-18]
      assert event_occurrence.increment == 43
      assert event_occurrence.increment_type == "some updated increment_type"
      assert event_occurrence.interval == 43
      assert event_occurrence.months_of_year == "some updated months_of_year"
      assert event_occurrence.start_date == ~D[2011-05-18]
    end

    test "update_event_occurrence/2 with invalid data returns error changeset" do
      event_occurrence = event_occurrence_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_event_occurrence(event_occurrence, @invalid_attrs)
      assert event_occurrence == Events.get_event_occurrence!(event_occurrence.id)
    end

    test "delete_event_occurrence/1 deletes the event_occurrence" do
      event_occurrence = event_occurrence_fixture()
      assert {:ok, %EventOccurrence{}} = Events.delete_event_occurrence(event_occurrence)
      assert_raise Ecto.NoResultsError, fn -> Events.get_event_occurrence!(event_occurrence.id) end
    end

    test "change_event_occurrence/1 returns a event_occurrence changeset" do
      event_occurrence = event_occurrence_fixture()
      assert %Ecto.Changeset{} = Events.change_event_occurrence(event_occurrence)
    end
  end
end
