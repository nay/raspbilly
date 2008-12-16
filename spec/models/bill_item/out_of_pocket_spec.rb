require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe BillItem::OutOfPocket do
  describe "update_attributes" do
    it "taxedは一括指定できない" do
      i1 = BillItem::OutOfPocket.new(:taxed => true)
      i2 = BillItem::OutOfPocket.new(:taxed => false)
      i1.taxed?.should == i2.taxed?
    end
  end

  describe "new" do
    it "taxedがfalseになる" do
      i = BillItem::OutOfPocket.new
      i.taxed?.should be_false
    end
  end
  describe "save" do
    it "taxed=trueだと例外を発生する" do
      i = BillItem::OutOfPocket.new
      i.taxed = true
      lambda{i.save}.should raise_error(RuntimeError)
    end
  end
end
