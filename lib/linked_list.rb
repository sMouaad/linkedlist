# frozen_string_literal: true

require_relative 'node'

# Attempt to implement linked list
class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    if empty?(@head)
      create_first_node(value)
    else
      @tail.next_node = Node.new(value)
      @tail = @tail.next_node
    end
  end

  def prepend(value)
    if empty?(@head)
      create_first_node(value)
    else
      new_node = Node.new(value)
      new_node.next_node = @head
      @head = new_node
    end
  end

  def empty?(node)
    node.nil?
  end

  def create_first_node(value)
    @head = Node.new(value)
    @tail = @head
  end

  def size
    pointer = @head
    count = 0
    until pointer.nil?
      count += 1
      pointer = pointer.next_node
    end
    count
  end

  def at(index)
    pointer = @head
    until index.zero? || pointer.nil?
      pointer = pointer.next_node
      index -= 1
    end
    pointer
  end

  def pop
    pointer = @head
    pointer = pointer.next_node until pointer.next_node.eql? @tail
    pointer.next_node = nil
    @tail = pointer
  end

  def contains?(value)
    pointer = @head
    until pointer.nil?
      return true if pointer.value.eql? value

      pointer = pointer.next_node
    end
    false
  end

  def find(value)
    count = 0
    pointer = @head
    until pointer.nil?
      return count if pointer.value.eql? value

      pointer = pointer.next_node
      count += 1
    end
    nil
  end

  def insert_at(value, index)
    return prepend(value) if index.zero?

    pointer = at(index - 1)
    raise IndexError if pointer.nil?

    pointer.next_node = Node.new(value, pointer.next_node)
  end

  def remove_at(index)
    return shift if index.zero?

    pointer = at(index - 1)
    raise IndexError if pointer.nil? || pointer.next_node.nil?

    pointer.next_node = pointer.next_node.next_node
  end

  def shift
    @head = @head.next_node
  end

  def to_s
    linked_list = ''
    pointer = @head
    until pointer.nil?
      linked_list += "(#{pointer.value}) -> "
      pointer = pointer.next_node
    end
    "#{linked_list}nil"
  end
end
