class OrderReceiptMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_receipt(order)

    @order = order
    mail(to: @order.email, subject: 'Thanks for Ordering From Jungle') do |format|
      format.html { render locals: { order: @order } }
      # format.text { render locals: { order: order } }
    end
  end

end
