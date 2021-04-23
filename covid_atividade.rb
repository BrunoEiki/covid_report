require 'csv'

covid_data = CSV.parse(File.read('boletim-covid-21-04-2021.csv'), headers: true)

def sum_col (table, header, unid_federativa = '')
    total = 0
    table.by_col[header].each { |row|
        if unid_federativa != ''
        end
        total += row.to_i
    }
    return total
end
puts 'Total de Confirmados:', sum_col(covid_data, 'confirmed')
puts 'Total de Mortes:', sum_col(covid_data, 'deaths')



maior_morte_estado = ''
maior_quant_morte = 0


vetor = [['am', 21], ['ac', 20], ['pa', 22]]
def imax(vetor)
    m = 0
    for i in 1...vetor.size
        if vetor[m][1] < vetor[i][1]
            m = i
        end
    end
    return m
end


def ordenar(vetor)
    aux = []
    while vetor != [] do
        m = imax(vetor)
        aux.append(vetor[m])
    end
    return aux
end

puts ordenar(vetor)

for linha in 0...covid_data.size
    if covid_data[linha]['deaths'].to_i > maior_quant_morte
        maior_quant_morte = covid_data[linha]['deaths'].to_i
        maior_morte_estado = covid_data[linha]['state']
    end
end

puts maior_morte_estado