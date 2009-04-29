require 'rexml/document'
require 'dhtmlxgrid'

class << ActiveRecord::Base
  include DHtmlXGrid
end
