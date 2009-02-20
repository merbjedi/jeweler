Feature: shoulda generator
  In order to start a new gem
  A user should be able to
  generate a project setup for testunit

  Scenario: generating a gem with testunit tests
    Given a working directory
    And I have configured git sanely
    And I decide to call the project 'the-perfect-gem' that is 'zomg, so good'
    And I intend to test with testunit

    When I generate a project

    And a directory named 'the-perfect-gem/test' is created
    And cucumber directories are created

    And a file named 'the-perfect-gem/test/test_helper.rb' is created
    And a file named 'the-perfect-gem/test/the_perfect_gem_test.rb' is created

    And a file named 'the-perfect-gem/features/the_perfect_gem.feature' is created
    And a file named 'the-perfect-gem/features/support/env.rb' is created
    And a file named 'the-perfect-gem/features/steps/the_perfect_gem_steps.rb' is created

    And Rakefile has 'test/**/*_test.rb' in the Rake::TestTask pattern
    And Rakefile has 'test/**/*_test.rb' in the Rcov::RcovTask test_pattern
    And Rakefile has 'test' in the Rcov::RcovTask libs

    And 'test/the_perfect_gem_test.rb' should define 'ThePerfectGemTest' as a subclass of 'Test::Unit::TestCase'

    And 'test/test_helper.rb' requires 'test/unit'
    And 'test/test_helper.rb' requires 'mocha'
    And 'test/test_helper.rb' requires 'the_perfect_gem'

    And 'features/support/env.rb' requires 'the_perfect_gem'
    And 'features/support/env.rb' requires 'test/unit/assertions'
    And 'features/support/env.rb' sets up features to use test/unit assertions

    And 'test/test_helper.rb' was checked in
    And 'test/the_perfect_gem_test.rb' was checked in
