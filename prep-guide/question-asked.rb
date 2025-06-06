# Tell me about yourself/ introduce yourself?
# What is your Role and responsibility?
# What you are currently working on? / Tell me about the features you delivered?

# Give output?

module Some
  def runner
    puts "I am runner in Some"
  end

  class << self
    def runner
      puts "I am runner in Some Other"
    end
  end
end

class A
  def runner
    puts "Runner A"
  end

  class << self
    include Some

    def runner
      puts "I am runner in A"
      super
    end
  end
end

class B < A
  def runner
    puts "I am runner in B"
  end

  class << self
    def runner
      puts "I am runner in B"
      super
    end
  end
end

B.runner


# Give me System design of purchasing a mouse from amazon?
# What is difference between singleton design pattern and factory design pattern?
# What is difference between lambda, proc, block?
# Create proc, lambda and block? (syntax)
# How to handle authorization in rails?
# How to handle authentication in rails?
# Ways of declaring class methods in ruby?
# What are singleton methods in ruby
# What are singleton class in ruby
# what is around_action in rails?
# What is enumerable in rails?

# What is long polling and short polling?
# Pure ruby code to check if the 7 is present in array (do not use for each loop)
# sort array time complexity?
# CAP theorem in system design
# what is HTTP (methods, headers, options)?
# Types of protocol? ()
# please check TCP, UDP stateful, stateless protocol
# joins in SQL (cross join?)
# what is composite in rails?
# What are LLD strategies? factory, adapter, singleton, observer, strategy

# What is normalization? What is 1NF, 2NF, 3NF?
  # >>> Removes duplicate data (avoids unnecessary data storage)
  # >>> Ensures data consistency (prevents anomalies)
  # >>> Improves efficiency (optimized queries and updates)
  # >>> Reduces update, insertion, and deletion anomalies

  #  First Normal Form (1NF) – Eliminate Duplicates
    # >>> Each column must have atomic (indivisible) values
    # >>> Each row must be unique
    #
    #--------------------------
    # ID  Name    Phone Numbers
    # 1   Alice     12345, 67890
    # 2   Bob       98765, 43210
    #--------------------------
    # ID  Name    Phone Numbers
    # 1   Alice     12345
    # 1   Alice     67890
    # 2   Bob       98765
    # 2   Bob       43210
    #--------------------------

  #  Second Normal Form (2NF) – Remove Partial Dependencies
  #  Must be in 1NF
  #  All non-key attributes should depend on the full primary key, not just part of it

      #--------------------------
    # ID  Name
    # 1   Alice
    # 2   Bob
    #--------------------------

    #--------------------------
    # ID     Phone Numbers
    # 1       12345
    # 1       67890
    # 2       98765
    # 2       43210


# What is ACID properties?
# What is Network Layer in OSM model
# What is difference between TCP and UDP

# What is difference between Active Record and Active Model?
  # >>>  In summary, while Active Record provides an interface for defining models that correspond to database tables, Active Model provides functionality for building model-like Ruby classes that don't necessarily need to be backed by a database. Active Model can be used independently of Active Record.

# SQL Queries Output.

# -----------------------------------------------------------------------------------------------
# You need to implement a Ruby class that analyzes an array of elements and determines the most frequent element in the array. In addition, you are required to create a helper method within the class to count the frequency of elements and use it to solve the problem.
# 1. Use a helper method to count the frequency of each element.
# 2. The most_frequent_element method should make use of the helper method to solve the task.
# 3. The helper method should be defined as private, to be used only within the class.
# -----------------------------------------------------------------------------------------------

# -----------------------------------------------------------------------------------------------
# Given two strings, s1 and s2, determine if s2 is a rotation of s1. A string s2 is a rotation of s1 if it can be obtained by shifting some characters from the beginning of s1 to its end while maintaining the relative order of the characters.
# Constraints:
# Both s1 and s2 consist of lowercase and/or uppercase English letters.

# The lengths of s1 and s2 must be equal for s2 to be a valid rotation of s1.
# Input:
# Two strings s1 and s2.
# Output:
# Return true if s2 is a rotation of s1, otherwise return false.

# Example 1:
# Input: s1 = "waterbottle", s2 = "erbottlewat"
# Output: true
# Explanation: Rotating "waterbottle" by shifting "wat" to the end gives "erbottlewat".

# Example 2:
# Input: s1 = "hello", s2 = "lohel"
# Output: true
# Explanation: Rotating "hello" by shifting "lo" to the end gives "lohel".

# Example 3:
# Input: s1 = "hello", s2 = "olelh"
# Output: false

# Explanation: "olelh" is not a valid rotation of "hello".
# -----------------------------------------------------------------------------------------------


# a = "I have 300 Rs."
# "sR. 200 have I"
# o/p => ".sR three zero zero evah I"

# Difference Between Unit Test and Minitest in Rails?
# What is difference between bundle and gem?
# What is difference between concurrency and parallelism?
# Why we use rabbitMQ?
# Explain me caching strategies in rails?
# What is difference between class and module in ruby?
# load balancing, preload, eager load, lazy load
# What is active storage in rails?
# What is difference between include and extend in ruby?
# What is difference between include and prepend in ruby?
# What is callback sequence in rails?
# What is use of iat field in jwt token?
# what is 'activeadmin' in rails?
# what is 'pre-command' in rails?
# why RoR is convention over configuration?
# what is difference between 'sym' and 'string' in ruby?
# what is difference between member and collection route in rails?
# what is mixin in rails?
# why we use mixin in rails?


# consider the scenario
  # There are 3 models user, posts, comments
  # I want to see those posts where my followers commented

# Post
#   has_many :comments
#   belongs_to :user

# Comment
#   belongs_to :user
#   belongs_to :post

# User
#   has_many :posts
#   has_many :comments
#   has_many :followers, class_name: "User", foreign_key: :follower_id
#   has_many :following, class_name: "User", foreign_key: :following_id

# Post.joins(:comments).where(comments: { user_id: current_user.followers.pluck(:id) })

