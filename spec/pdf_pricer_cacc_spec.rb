require_relative 'test_helper'
require_relative '../pdf_pricer'

=begin 
Este criterio de cobertura consiste en evaluar cada cláusula posible como una cláusula
activa del predicado al cuál pertenece.

Las cláusulas asociadas son:
  - c1: is_hardcover
  - c2: is_frecuent_client
  - c3: total_pages > 500
  - c4: total_pages_images >= 6
  - c5: is_premium_book
  - c6: pages_of_text > 300
  - c7: total_pages_images >= 5

Los predicados son:
  - p1: c1
  - p2: c1 and c2
  - p3: c1 and !c2
  - p4: c3 and c4
  - p5: c5 and (c6 or c7) and !c2
=end

describe 'Correlated Active Clause Coverage' do
  # c1 = true, c2 = false, c3 = false, c4 = true, c5 = true, c6 = false, c7 = true
  it 'should fulfill test case 1 (TC1)' do
    test_pdf = PDF.new(100, 5, 5, true, true)
    expect(test_pdf.bind_book_price false).to be 16000
  end

  # c1 = false, c2 = false, c3 = true, c4 = false, c5 = true, c6 = true, c7 = false
  it 'should fulfill test case 2 (TC2)' do
    test_pdf = PDF.new(600, 0, 0, false, true)
    expect(test_pdf.bind_book_price false).to be 8000
  end

  # c1 = true, c2 = true, c3 = true, c4 = true, c5 = true, c6 = true, c7 = true
  it 'should fulfill test case 3 (TC3)' do
    test_pdf = PDF.new(600, 5, 5, true, true)
    expect(test_pdf.bind_book_price true).to be 10000
  end

  # c1 = false, c2 = true, c3 = true, c4 = false, c5 = true, c6 = true, c7 = false
  it 'should fulfill test case 4 (TC4)' do
    test_pdf = PDF.new(600, 0, 0, false, false)
    expect(test_pdf.bind_book_price true).to be 4000
  end

  # c1 = false, c2 = false, c3 = false, c4 = false, c5 = false, c6 = true, c7 = false
  it 'should fulfill test case 5 (TC5)' do
    test_pdf = PDF.new(400, 0, 0, false, false)
    expect(test_pdf.bind_book_price false).to be 4000
  end

  # c1 = false, c2 = false, c3 = false, c4 = false, c5 = true, c6 = false, c7 = false
  it 'should fulfill test case 6 (TC6)' do
    test_pdf = PDF.new(100, 0, 0, false, true)
    expect(test_pdf.bind_book_price false).to be 4000
  end
end
