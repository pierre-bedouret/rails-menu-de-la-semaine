module IngredientsHelper

  def my_div(html_class: "", &block)
    content_tag(:div, class: "m-2 #{html_class}") do
      # capture the value of the block a string
      capture(&block)
    end
  end

  # TABLE
  def table(html_class: "", &block)
    content_tag(:div, class: "table-responsible") do
      content_tag(:table, class: "table #{html_class}") do
        # capture the value of the block a string
        capture(&block)
      end
    end
  end

  def thead(html_class: "", &block)
    content_tag(:thead, class: "table #{html_class}", style: "background: grey") do
      # capture the value of the block a string
      capture(&block)
    end
  end

  def tbody(html_class: "", &block)
    content_tag(:tbody, class: "table #{html_class}") do
      # capture the value of the block a string
      capture(&block)
    end
  end

  # LIST
  def map_join(objects, &block)
    safe_join(objects.map(&block))
  end

  def list(html_class: "", elements: [], &block)
    if elements.none?
      content_tag(:p, "none")
    else
      content_tag(:div, class: "wrapper") do
        map_join(elements) do |element|
          content_tag(:div, class: "test") do
            element
          end
        end
      end
    end
  end
end
