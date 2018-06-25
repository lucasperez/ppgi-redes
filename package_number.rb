require 'active_support/all'

class PackageNumber
  
  def initialize(package_numbers, test_numbers)
    @package_numbers = package_numbers
    @test_numbers = test_numbers
    @results = []
  end

  def execute_test

    @test_numbers.times do
      test = Speedtest::Test.new(
        download_runs: @package_numbers,
        upload_runs: 1,
        ping_runs: 2,
        download_sizes: @package_numbers.times.collect{350},
        upload_sizes: [10000],
        debug: true
       )  
      @results << test.run.download_rate / 1024 / 1024
    end
    return @results.sum / @results.size
  end
end