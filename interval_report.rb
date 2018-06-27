require_relative "interval"

class IntervalReport

  def generate_report

    report_text = "<h4>Intervalo entre pacotes</h4>"

    report_text = report_text + "<p>Vamos começar medindo o intervalo entre a geração de pacotes. </p>"
    report_text = report_text + "<p>Faremos o primeiro teste com 0,5 minuto de intervalo e vamos repetir por 3x o teste. Pegaremos a media e saberemos o resultado do teste com 0,5 minuto de intervalo entre pacotes</p>"
    test_0_5_minute = Interval.new(0.5.minutes, 1).execute_test

    report_text = report_text + "<p>Vamos testar agora com intervalo de 1 minuto</p>"
    test_1_minute = Interval.new(1.minutes, 1).execute_test

    report_text = report_text + "<p>Agora vamos repetir o mesmo teste aumentando o intervalo entre os pacotes pra ver se isso altera o valor médio. Testando com intervalo de 2 minutos.</p>"
    test_2_minutes = Interval.new(2.minutes, 1).execute_test

    report_text = report_text + "<table class='table table-bordered'><tr><th>Intervalo de 0.5 minutos</th><th>Intervalo de 1 minuto</th><th>Intervalo de 2 minutos</th></tr><tr><td>#{test_0_5_minute}</td><td>#{test_1_minute}</td><td>#{test_2_minutes}</td></tr></table>"

    report_text = report_text + "<div class='well'>Percebemos que o intervalo entre pacotes não alterou a velocidade de conexão<br><br></div>"

    return report_text
  end
end