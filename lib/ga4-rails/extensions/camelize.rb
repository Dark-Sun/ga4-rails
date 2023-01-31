module Camelize
  refine String do
    def camelize(first_letter = :upper)
      if first_letter == :upper
        self.split('_').map { |word| word.capitalize }.join
      else
        self.split('_').map.with_index do |word, index|
          index == 0 ? word : word.capitalize
        end.join
      end
    end
  end

  refine Symbol do
    def camelize(first_letter = :upper)
      self.to_s.camelize(first_letter).to_sym
    end
  end
end