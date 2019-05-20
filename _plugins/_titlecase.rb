require 'liquid'
require 'uri'

# Capitalize each word of the input
module TitleCase
  def title_case(words)
    return words.split(' ').map(&:capitalize).join(' ')
  end
end

Liquid::Template.register_filter(TitleCase)