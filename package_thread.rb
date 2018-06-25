require 'active_support/all'

class PackageThread
  # [350, 500, 750, 1000, 1500, 2000, 2500, 3000, 3500, 4000]
  def initialize(package_thread, test_numbers)
    @package_thread = package_thread
    @test_numbers = test_numbers
    @results = []
  end

  def execute_test

    @test_numbers.times do
      test = Speedtest::Test.new(
        download_runs: @package_thread,
        upload_runs: 1,
        ping_runs: 2,
        download_sizes: [350],
        upload_sizes: [10000],
        debug: true
       )  
      @results << test.run.download_rate / 1024 / 1024
    end
    return (@results.sum / @results.size).round(2)
  end
end