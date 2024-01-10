class Api::InvoicesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    invoice = Invoice.create
    render json: InvoiceSerializer.new(invoice).as_json
  end

  def add_line_item
    invoice = Invoice.find(params[:id])
    invoice.add_line_item(line_item_params)
    invoice.save
    render json: InvoiceSerializer.new(invoice).as_json
  end

  def finalise
    invoice = Invoice.find(params[:id])
    invoice.finalise
    render json: InvoiceSerializer.new(invoice).as_json
  end

  def show
    invoice = Invoice.find(params[:id])
    render json: InvoiceSerializer.new(invoice).as_json
  end

  def list
    invoices = Invoice.all
    render json: invoices.map do |invoice|
      InvoiceSerializer.new(invoice).as_json
    end
  end

  def line_item_params
    params.require(:line_item).permit(:title, :cost)
  end
end
