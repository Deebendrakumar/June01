class SomeNameForAJob < ApplicationJob
  queue_as :default

  def perform(name, times)
    # Actual implementation of the task to run in the background goes here
    times.times do
        puts "Hello, #{name}!"
    end
  end
end
