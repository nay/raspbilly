#pdf生成のテスト用に入れています。後で削除します
class PdfTestController < ApplicationController
  helper :send_doc
  include SendDocHelper

  def test_xml
    render :layout => false
  end

  #pdfのテスト用に入れています。後で削除します。
  def pdf
    send_doc(
      render_to_string(:template => '/pdf_test/test_xml', :layout => false),
      '/test/contents',
      'test',
      'TestReport',
      'pdf')
  end

end
