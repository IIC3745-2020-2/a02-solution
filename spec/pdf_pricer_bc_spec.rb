require_relative 'test_helper'
require_relative '../pdf_pricer'

=begin 
Esta cobertura consiste en que los TCs evalúen todas los posibles predicados como true 
y false al menos una vez. Es equivalente a evaluar una cobertura de aristas (EC) basada en grafos.
=end

describe 'SimpleCov Branch Coverage' do
  it 'should fulfill test case 1 (TC1)' do
    test_pdf = PDF.new(100, 0, 0, true, false)
    expect(test_pdf.bind_book_price true).to be 6000
  end

  it 'should fulfill test case 2 (TC2)' do
    test_pdf = PDF.new(600, 5, 5, true, true)
    expect(test_pdf.bind_book_price false).to be 24000
  end

  # Test adicional que evalúa el único predicado no evaluado como false en line coverage:
  # @is_hardcover = false.
  it 'should fulfill test case 3 (TC3)' do
    test_pdf = PDF.new(600, 5, 5, false, true)
    expect(test_pdf.bind_book_price false).to be 16000
  end
end
