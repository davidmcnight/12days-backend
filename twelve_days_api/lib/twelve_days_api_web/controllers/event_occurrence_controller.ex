defmodule TwelveDaysApiWeb.EventOccurrenceController do
  use TwelveDaysApiWeb, :controller

  alias TwelveDaysApi.Events
  alias TwelveDaysApi.Events.EventOccurrence

  def index(conn, _params) do
    event_occurrences = Events.list_event_occurrences()
    render(conn, "index.html", event_occurrences: event_occurrences)
  end

  def new(conn, _params) do
    changeset = Events.change_event_occurrence(%EventOccurrence{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"event_occurrence" => event_occurrence_params}) do
    case Events.create_event_occurrence(event_occurrence_params) do
      {:ok, event_occurrence} ->
        conn
        |> put_flash(:info, "Event occurrence created successfully.")
        |> redirect(to: Routes.event_occurrence_path(conn, :show, event_occurrence))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    event_occurrence = Events.get_event_occurrence!(id)
    render(conn, "show.html", event_occurrence: event_occurrence)
  end

  def edit(conn, %{"id" => id}) do
    event_occurrence = Events.get_event_occurrence!(id)
    changeset = Events.change_event_occurrence(event_occurrence)
    render(conn, "edit.html", event_occurrence: event_occurrence, changeset: changeset)
  end

  def update(conn, %{"id" => id, "event_occurrence" => event_occurrence_params}) do
    event_occurrence = Events.get_event_occurrence!(id)

    case Events.update_event_occurrence(event_occurrence, event_occurrence_params) do
      {:ok, event_occurrence} ->
        conn
        |> put_flash(:info, "Event occurrence updated successfully.")
        |> redirect(to: Routes.event_occurrence_path(conn, :show, event_occurrence))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", event_occurrence: event_occurrence, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    event_occurrence = Events.get_event_occurrence!(id)
    {:ok, _event_occurrence} = Events.delete_event_occurrence(event_occurrence)

    conn
    |> put_flash(:info, "Event occurrence deleted successfully.")
    |> redirect(to: Routes.event_occurrence_path(conn, :index))
  end
end
