module ColorHelper
  def generate_color(theme, instance)
    theme == 'fun' ? fun(instance) : '#eee'
  end

  def fun(instance)
    numbs = instance.created_at.to_s

    hex1 = length_to_char(instance.text.length)
    hex3 = instance.text.count('?').zero? ? 'd' : 'a'
    hex5 = char_to_hexchar(instance.text.first)

    '#'.concat(hex1, numbs[15], hex3, numbs[18], hex5, numbs[17])
  end

  private

  def length_to_char(length)
    case length
    when 0..50 then 'a'
    when 51..100 then 'b'
    when 101..150 then 'c'
    when 151..200 then 'd'
    when 201..250 then 'e'
    else 'f'
    end
  end

  def char_to_hexchar(char)
    return 'b' unless char.match(/[a-zA-Z]/)

    case char.downcase
    when 'a'..'e' then 'b'
    when 'f'..'j' then 'c'
    when 'k'..'o' then 'd'
    when 'p'..'t' then 'e'
    when 'u'..'z' then 'f'
    else 'a'
    end
  end
end
