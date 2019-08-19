defmodule TwelveDaysApi.Events do
  @moduledoc """
  The Events context.
  """

  import Ecto.Query, warn: false
  alias TwelveDaysApi.Repo

  alias TwelveDaysApi.Events.Event
  alias TwelveDaysApi.Events.EventOccurrence

  @doc """
  Returns the list of events.

  ## Examples

      iex> list_events()
      [%Event{}, ...]

  """
  def list_events do
    Repo.all(Event)
  end

  @doc """
  Gets a single event.

  Raises `Ecto.NoResultsError` if the Event does not exist.

  ## Examples

      iex> get_event!(123)
      %Event{}

      iex> get_event!(456)
      ** (Ecto.NoResultsError)

  """
  def get_event!(id), do: Repo.get!(Event, id)

  @doc """
  Creates a event.

  ## Examples

      iex> create_event(%{field: value})
      {:ok, %Event{}}

      iex> create_event(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_event(attrs \\ %{}) do
    %Event{}
    |> Event.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a event.

  ## Examples

      iex> update_event(event, %{field: new_value})
      {:ok, %Event{}}

      iex> update_event(event, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_event(%Event{} = event, attrs) do
    event
    |> Event.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Event.

  ## Examples

      iex> delete_event(event)
      {:ok, %Event{}}

      iex> delete_event(event)
      {:error, %Ecto.Changeset{}}

  """
  def delete_event(%Event{} = event) do
    Repo.delete(event)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking event changes.

  ## Examples

      iex> change_event(event)
      %Ecto.Changeset{source: %Event{}}

  """
  def change_event(%Event{} = event) do
    Event.changeset(event, %{})
  end

  alias TwelveDaysApi.Events.EventOccurrence

  @doc """
  Returns the list of event_occurrences.

  ## Examples

      iex> list_event_occurrences()
      [%EventOccurrence{}, ...]

  """
  def list_event_occurrences do
    Repo.all(EventOccurrence)
  end

  @doc """
  Gets a single event_occurrence.

  Raises `Ecto.NoResultsError` if the Event occurrence does not exist.

  ## Examples

      iex> get_event_occurrence!(123)
      %EventOccurrence{}

      iex> get_event_occurrence!(456)
      ** (Ecto.NoResultsError)

  """
  def get_event_occurrence!(id), do: Repo.get!(EventOccurrence, id)

  @doc """
  Creates a event_occurrence.

  ## Examples

      iex> create_event_occurrence(%{field: value})
      {:ok, %EventOccurrence{}}

      iex> create_event_occurrence(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_event_occurrence(attrs \\ %{}) do
    %EventOccurrence{}
    |> EventOccurrence.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a event_occurrence.

  ## Examples

      iex> update_event_occurrence(event_occurrence, %{field: new_value})
      {:ok, %EventOccurrence{}}

      iex> update_event_occurrence(event_occurrence, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_event_occurrence(%EventOccurrence{} = event_occurrence, attrs) do
    event_occurrence
    |> EventOccurrence.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a EventOccurrence.

  ## Examples

      iex> delete_event_occurrence(event_occurrence)
      {:ok, %EventOccurrence{}}

      iex> delete_event_occurrence(event_occurrence)
      {:error, %Ecto.Changeset{}}

  """
  def delete_event_occurrence(%EventOccurrence{} = event_occurrence) do
    Repo.delete(event_occurrence)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking event_occurrence changes.

  ## Examples

      iex> change_event_occurrence(event_occurrence)
      %Ecto.Changeset{source: %EventOccurrence{}}

  """
  def change_event_occurrence(%EventOccurrence{} = event_occurrence) do
    EventOccurrence.changeset(event_occurrence, %{})
  end
end
