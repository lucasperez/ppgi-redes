require 'active_support/all'

class Interval
  def initialize(time, test_numbers)
    @time = time
    @test_numbers = test_numbers
    @results = []
  end

  def execute_test

    @test_numbers.times do
      sleep @time
      test = Speedtest::Test.new(
        download_runs: 1,
        upload_runs: 1,
        ping_runs: 4,
        download_sizes: [350],
        upload_sizes: [10000],
        debug: true
       )  
      @results << test.run.download_rate / 1024 / 1024
    end
    return (@results.sum / @results.size).round(2)
  end
end