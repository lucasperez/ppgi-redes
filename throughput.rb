#Importando as bibliotecas necessárias
require 'active_support/all'
require "speedtest"
require_relative "interval"
require_relative "package_size"
require_relative "package_number"
require_relative "package_thread"


#A ideia do trabalho é alterar alguns parametros de entrada e analisar 
#como que isso afeta a estimativa de velocidade de conexão

#Vamos começar medindo o intervalo entre a geração de pacotes
#Faremos o primeiro teste com 1 minuto de intervalo e vamos repetir por 3x o teste
#Pegaremos a media e saberemos o resultado do teste com 1 minuto de intervalo
#entre pacotes
# test_1_minute = Interval.new(0.5.minutes, 3).execute_test
# puts "intervalo de 0.5 minutos e fizemos 3 testes e pagamos a media: #{test_1_minute}"

# #Agora vamos repetir o mesmo teste aumentando o intervalo entre os pacotes 
# #pra ver se isso altera o valor médio
# test_2_minutes = Interval.new(2.minutes, 3).execute_test
# puts "intervalo de 2 minutos e fizemos 3 testes e pagamos a media: #{test_2_minutes}"

#Resumo do resultado
# puts "teste de 1 minuto: #{test_1_minute} ---> teste de 2 minutos: #{test_2_minutes}"

#A proxima abordagem vai ser variar o tamanho do pacote a ser baixado
#O primeiro teste eh com um aquivo de 350kb e vamos testar 3x 
#pegar os resultados e retornar a media
# test_350_kb = PackageSize.new(350, 3).execute_test

# #Testando com arquivo de 1mb 3x e pegando a média
# test_1000_kb = PackageSize.new(1000, 3).execute_test

# #Testando com arquivo de 1mb 3x e pegando a média
# test_4000_kb = PackageSize.new(4000, 3).execute_test

# #Resumo do resultado
# puts "teste de 350kb: #{test_350_kb} ---> teste de 1 mb: #{test_1000_kb} ---> teste de 4 mb: #{test_4000_kb}"


# Agora vamos tentar analisar a interferência do número de pacotes
# na taxa de download
# Vamos pegar com 1 pacote 3x e tirar a media
# test_1_package = PackageNumber.new(1, 3).execute_test

# Vamos pegar com 3 pacotes 3x e tirar a media
# test_3_packages = PackageNumber.new(3, 3).execute_test

# Vamos pegar com 5 pacotes 3x e tirar a media
# test_5_packages = PackageNumber.new(5, 3).execute_test

# #Resumo do resultado
# puts "teste com 1 pacote: #{test_1_package} ---> teste com 3 pacotes: #{test_3_packages} ---> teste com 5 pacotes: #{test_5_packages}"

# Agora vamos tentar analisar a interferência de conexoes paralelas
# na taxa de download
# Vamos pegar com 1 pacote com 1 thread 3x e tirar a media
test_1_thread = PackageThread.new(1, 3).execute_test

# Vamos pegar com 1 pacote com 3 thread 3x e tirar a media
test_3_thread = PackageThread.new(3, 3).execute_test

# Vamos pegar com 1 pacote com 5 thread 3x e tirar a media
test_5_thread = PackageThread.new(5, 3).execute_test

# #Resumo do resultado
puts "teste com 1 thead: #{test_1_thread} ---> teste com 3 threads: #{test_3_thread} ---> teste com 5 thread: #{test_5_thread}"


