require_relative 'test_helper'
require_relative '../pdf_pricer'

=begin 
Este criterio de cobertura consiste en que los TCs evalúen todas las posibles cláusulas
como true y false al menos una vez.

Las cláusulas asociadas son:
  - c1: is_hardcover
  - c2: is_frecuent_client
  - c3: total_pages > 500
  - c4: total_pages_images >= 6
  - c5: is_premium_book
  - c6: pages_of_text > 300
  - c7: total_pages_images >= 5
=end

describe 'Clause Coverage' do
  # Este criterio no exige atención en el cortocircuito generado por predicados

  # c1 = true, c2 = true, c3 = true, c4 = true, c5 = true, c6 = true, c7 = true
  it 'should fulfill test case 1 (TC1)' do
    test_pdf = PDF.new(600, 5, 5, true, true)
    expect(test_pdf.bind_book_price true).to be 10000
  end

  # c1 = false, c2 = false, c3 = false, c4 = false, c5 = false, c6 = false, c7 = false
  it 'should fulfill test case 2 (TC2)' do
    test_pdf = PDF.new(100, 0, 0, false, false)
    expect(test_pdf.bind_book_price false).to be 4000
  end
end

describe 'Conditional Coverage' do
  # Este criterio no considera como evaluada una cláusula que está sometida a un
  # predicado que genera cortocircuito en cierto caso.

  # c1 = true, c2 = true, c3 = true, c4 = true, c5 = true, c6 = true, c7 = true
  it 'should fulfill test case 1 (TC1)' do
    test_pdf = PDF.new(600, 5, 5, true, true)
    expect(test_pdf.bind_book_price true).to be 10000
  end

  # c1 = false, c2 = false, c3 = true, c4 = false, c5 = true, c6 = false, c7 = false
  it 'should fulfill test case 2 (TC2)' do
    test_pdf = PDF.new(100, 0, 0, false, true)
    expect(test_pdf.bind_book_price false).to be 4000
  end

  # c1 = true, c2 = false, c3 = false, c4 = false, c5 = false, c6 = false, c7 = false
  it 'should fulfill test case 3 (TC3)' do
    test_pdf = PDF.new(100, 0, 0, true, false)
    expect(test_pdf.bind_book_price false).to be 8000
  end
end
