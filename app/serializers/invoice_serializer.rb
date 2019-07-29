class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :line_items

  def line_items
    object._line_items
  end
end
