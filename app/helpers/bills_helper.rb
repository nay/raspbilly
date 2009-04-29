module BillsHelper
  def self.format_bill(bill)
    "#{ERB::Util.h bill.customer_name}への請求書（#{bill.subject.blank? ? Bill.default_subject : ERB::Util.h(bill.subject)}）"
  end
  def format_bill(bill)
    BillsHelper.format_bill(bill)
  end
end
