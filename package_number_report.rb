require_relative "package_number"

class PackageNumberReport

  def generate_report

    report_text = "<h4>Número de Pacotes</h4>"
    report_text = report_text + "<p>Agora vamos tentar analisar a interferência do número de pacotes na taxa de download</p>"
    report_text = report_text + "<p>Vamos pegar com 1 pacote 3x e tirar a media</p>"

    test_1_package = PackageNumber.new(1, 3).execute_test

    report_text = report_text + "<p>Vamos pegar com 3 pacotes 3x e tirar a media</p>"
    test_3_packages = PackageNumber.new(3, 3).execute_test

    report_text = report_text + "<p>Vamos pegar com 5 pacotes 3x e tirar a media</p>"
    test_5_packages = PackageNumber.new(5, 3).execute_test

    report_text = report_text + "<table class='table table-bordered'><tr><th>Recebendo 1 pacote</th><th>Recebendo 3 pacotes</th><th>Recebendo 5 pacotes</th></tr><tr><td>#{test_1_package}</td><td>#{test_3_packages}</td><td>#{test_5_packages}</td></tr></table>"

    report_text = report_text + "<div class='well'>Percebemos que quanto mais aumentamos o número de pacotes maior a velocidade de conexão<br><br></div>"

    return report_text
  end
end