#Importando as bibliotecas necessárias
require 'active_support/all'
require "speedtest"
require 'wicked_pdf'
require_relative "interval_report"
require_relative "package_number_report"
require_relative "package_size_report"
require_relative "package_thread_report"

report_text = "<html><link href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css' rel=stylesheet integrity=sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB crossorigin=anonymous><body><style>td{text-align:center}</style><div class='container'><div class='page-header'><h1>Trabalho de Redes <spam class='small'>UFRJ</spam></h1>"
report_text = report_text + "<div style='text-align: right'><h6>Grupo 4: Lucas Pérez, Diogo Lopes e Antonio Alves</h6></div><hr></div>"

report_text = report_text + "<p>A ideia do trabalho é estimar a velocidade de conexão em função de alguns parâmetros. Vamos alterar alguns parametros da conexão e analisar como que isso afeta a estimativa de velocidade.</p><br>"

report_text = report_text + IntervalReport.new.generate_report
report_text = report_text + PackageNumberReport.new.generate_report
report_text = report_text + PackageSizeReport.new.generate_report
report_text = report_text + PackageThreadReport.new.generate_report

report_text = report_text + "<h4>Conclusão</h4>"
report_text = report_text + "<p>Com esse experimento conseguimos entender que o intervalo entre a geração de pacotes não influencia muito na velocidade da conexão.</p>"
report_text = report_text + "<p>Percebemos também que conforme aumentamos o número de pacotes ou o tamanho dos pacotes ou o número de threads, a velocidade da banda aumenta também.</p>"
report_text = report_text + "<p>Conseguimos concluir que quanto mais necessitamos da banda, mais ela vai sendo disponibilizada.</p>"

report_text = report_text + "</div></body></html>"

pdf = WickedPdf.new.pdf_from_string(report_text, encoding: "UTF-8")

File.open('pdfs/report.pdf', 'wb') do |file|
  file << pdf
end
