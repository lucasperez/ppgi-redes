require_relative "package_size"

class PackageSizeReport

  def generate_report

    report_text = "<h4>Tamanho dos pacotes</h4>"
    report_text = report_text + "<p>A proxima abordagem vai ser variar o tamanho do pacote a ser baixado</p>"
    report_text = report_text + "O primeiro teste eh com um aquivo de 350kb e vamos testar 3x pegar os resultados e retornar a media</p>"

    test_350_kb = PackageSize.new(350, 3).execute_test

    report_text = report_text + "<p>Testando com arquivo de 1mb 3x e pegando a média </p>"
    test_1000_kb = PackageSize.new(1000, 3).execute_test

    report_text = report_text + "<p>Testando com arquivo de 4mb 3x e pegando a média </p>"
    test_4000_kb = PackageSize.new(4000, 3).execute_test

    report_text = report_text + "<table class='table table-bordered'><tr><th>Arquivo de 350kb</th><th>Arquivo de 1mb</th><th>Arquivo de 4mb</th></tr><tr><td>#{test_350_kb}</td><td>#{test_1000_kb}</td><td>#{test_4000_kb}</td></tr></table>"

    # report_text = report_text + "<div class='well'>Percebemos que quanto mais aumentamos o número de threads maior a velocidade de conexão</div></p>"

    return report_text
  end
end