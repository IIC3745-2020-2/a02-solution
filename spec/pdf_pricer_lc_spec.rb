require_relative 'test_helper'
require_relative '../pdf_pricer'

=begin
Esta cobertura consiste en que los TCs pasen por todas las líneas al menos una vez.
Resulta simple por tener controles de flujo independientes entre si. Es equivalente 
a evaluar una cobertura de nodos (NC) basada en grafos.
=end

describe 'SimpleCov Line Coverage' do
  it 'should fulfill test case 1 (TC1)' do
    test_pdf = PDF.new(600, 5, 5, true, true)
    expect(test_pdf.bind_book_price false).to be 24000
  end

  it 'should fulfill test case 2 (TC2)' do
    test_pdf = PDF.new(100, 0, 0, true, false)
    expect(test_pdf.bind_book_price true).to be 6000
  end
end
