require 'active_support/all'

class PackageSize
  # [350, 500, 750, 1000, 1500, 2000, 2500, 3000, 3500, 4000]
  def initialize(package_size, test_numbers)
    @package_size = package_size
    @test_numbers = test_numbers
    @results = []
  end

  def execute_test

    @test_numbers.times do
      test = Speedtest::Test.new(
        download_runs: 1,
        upload_runs: 1,
        ping_runs: 2,
        download_sizes: [@package_size],
        upload_sizes: [10000],
        debug: true
       )  
      @results << test.run.download_rate / 1024 / 1024
    end
    return (@results.sum / @results.size).round(2)
  end
end