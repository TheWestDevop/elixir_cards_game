defmodule Cards do
  @moduledoc """
  Provide methods for creating and handling a deck of cards
  """

  @doc """
  Return a list of string representing a deck of playing cards
  ## Examples

      iex> deck = Cards.create_deck
      iex> ["Ace of Spades", "Ace of Clubs", "Ace of Hearts", "Ace of Diamonds"]
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  @doc """
  Return a list of shuffled string representing a deck of playing cards
  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.shuffle(deck)
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Return a boolean response if list of string contain a given `card`

  ## Examples
      iex> deck = Cards.create_deck
      iex> Cards.contain?(deck,"Ace of Spades")
      iex> true

  """
  def contain?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Divide a deck into hand and the reminder of the deck.
  The `hand_size` argument indicates how many cards should be in the hand 

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand,rest_of_deck} = Cards.deal(deck,1)
      iex> hand
      iex> ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
  save a list of string representing a deck of playing cards into file 
  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.save(deck,"file title here")
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
  load and read a list of string representing a deck of playing cards from a saved file
  ## Examples

      iex> Cards.load("file title here")
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _} -> "#{filename} file does not exist"
    end
  end

  @doc """
  creating hand a deck then shuffle three times and make a deal on the deck  base on give `hand_size` 
  ## Examples

      iex> {hand, rest_of_deck } = Cards.create_hand(1)
      iex> hand
      iex> ["Ace of Spades"]
  """
  def create_hand(hand_size) do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.shuffle()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end
