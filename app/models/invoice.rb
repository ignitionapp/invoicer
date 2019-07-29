class Invoice < ApplicationRecord

  def add_line_item(line_item)
    __line_items = _line_items
    __line_items.push(line_item)
    self.line_items = __line_items.to_json.to_s
  end

  def _line_items
    JSON.parse(line_items.presence || "[]")
  end

  def finalise

  end
end
