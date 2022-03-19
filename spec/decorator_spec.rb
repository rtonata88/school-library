require_relative '../decorator'
require_relative '../person'
require_relative '../capitalize_decorator'
require_relative '../trimmer_decorator'

describe Decorator do
  context 'Setup Decorator class' do
    before :each do
      person = Person.new(34, name: 'richard chambula', parent_permission: false)
      @capitalizedPerson = CapitalizeDecorator.new(person)
      @capitalizedTrimmedPerson = TrimmerDecorator.new(@capitalizedPerson)
    end

    it 'returns a capitalized name' do
      expect(@capitalizedPerson.correct_name).to eq('Richard chambula')
    end

    it 'returns a truncated name to 10 characters' do
      expect(@capitalizedTrimmedPerson.correct_name).to eq('Richard ch')
    end
  end
end
