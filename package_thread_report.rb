require_relative "package_thread"

class PackageThreadReport

  def generate_report

    report_text = "<h4>Conexões Paralelas</h4>"

    report_text = report_text + "<p>Agora vamos tentar analisar a interferência de conexoes paralelas na taxa de download</p>"

    report_text = report_text + "<p>Vamos pegar com 1 pacote com 1 thread 3x e tirar a media</p>"
    test_1_thread = PackageThread.new(1, 3).execute_test

    report_text = report_text + "<p>Vamos pegar com 1 pacote com 3 thread 3x e tirar a media</p>"
    test_3_thread = PackageThread.new(3, 3).execute_test

    report_text = report_text + "<p>Vamos pegar com 1 pacote com 5 thread 3x e tirar a media</p>"
    test_5_thread = PackageThread.new(5, 3).execute_test

    report_text = report_text + "<table class='table table-bordered'><tr><th>1 Thread</th><th>3 Thread</th><th>5 Thread</th></tr><tr><td>#{test_1_thread}</td><td>#{test_3_thread}</td><td>#{test_5_thread}</td></tr></table>"

    report_text = report_text + "<div class='well'>Percebemos que quanto mais aumentamos o número de threads maior a velocidade de conexão</div></p>"

    return report_text
  end
end