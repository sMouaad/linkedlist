# frozen_string_literal: true

require_relative 'lib/linked_list'

test = LinkedList.new
test.append('test1')
test.append('test2')
test.append('test3')
p test.tail
test.prepend('test4')
p test.size
puts test.contains?('test5')
puts test.contains?('test3')
p test.find('test2')
p test.find('test5')
test.pop
test.append('post-pop')
test.prepend('prepend-test')
test.append('append-test')
puts test
p test.at(5)
puts test
test.insert_at('insert_test', 1)
puts test
test.insert_at('insert_head_test', 1)
puts test
test.remove_at(1)
puts test
test.remove_at(0)
puts test
