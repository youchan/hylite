require 'hyalite'
require 'browser/interval'

class ExampleView
  include Hyalite::Component

  state :count, 0

  def component_did_mount
    every(5) do
      @state.count += 1
    end
  end

  def render
    div({class: 'example'},
      h2(nil, @props[:title]),
      h3(nil, "count = #{@state.count}")
    )
  end
end

$document.ready do
  Hyalite.render(Hyalite.create_element(ExampleView, {title: "Hyalite counter example"}), $document['.container'])
end
