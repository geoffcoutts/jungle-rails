class OrderReceiptMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_receipt(order)
    mail(to: order.email, subject: 'Thanks for Ordering From Jungle')
  end

end
