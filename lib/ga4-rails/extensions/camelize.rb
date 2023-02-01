module Camelize
  refine String do
    def camelize(first_letter = :upper)
      if first_letter == :upper
        split('_').map(&:capitalize).join
      else
        split('_').map.with_index do |word, index|
          index.zero? ? word : word.capitalize
        end.join
      end
    end
  end

  refine Symbol do
    def camelize(first_letter = :upper)
      to_s.camelize(first_letter).to_sym
    end
  end
end
