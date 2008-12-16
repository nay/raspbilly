require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe BillItem::Sale do

  describe "new" do
    it "taxedを指定しなければtrueになる" do
      i = BillItem::Sale.new
      i.taxed?.should be_true
    end
    it "taxedをfalseに指定できる" do
      i = BillItem::Sale.new(:taxed => false)
      i.taxed?.should be_false
    end
  end
end
