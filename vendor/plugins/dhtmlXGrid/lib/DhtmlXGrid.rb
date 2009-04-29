module DHtmlXGrid
  EMPTY = '-'
  def acts_as_dhtmlxgrid(options = {})
    self.extend ClassMethods
    
    @grid_columns = create_grid_columns_from(options)
    
    @doc = create_grid_header_xml
  end
  
  module ClassMethods
    def create_grid_columns_from(options)
      columns = case
      when options[:columns]
        options[:columns]
      else
        self.columns.map do |c|
          header = c.name
          case(c.type)
          when :datetime then
            eval, width, type, align, sort = "record.#{c.name}.strftime(\"%Y/%m/%d %H:%M:%S\")", 150, :ro, :left, :date
          when :date
            eval, width, type, align, sort = "record.#{c.name}.strftime(\"%Y/%m/%d\")", 80, :ro, :left, :date
          when :time
            eval, width, type, align, sort = "record.#{c.name}.strftime(\"%H:%M:%S\")", 80, :ro, :left, :time
          when :integer
            eval, width, type, align, sort = "record.#{c.name}", 80, :ro, :right, :str
          when :float
            eval, width, type, align, sort = "record.#{c.name}", 80, :ro, :right, :str
          else
            eval, width, type, align, sort = "record.#{c.name}", 80, :ro, :left, :str
          end
          {
            :header => header,
            :eval => eval,
            :width => width,
            :type => type,
            :align => align,
            :sort => sort,
          }
        end
      end
      columns.map do |c|
        h = {}
        c.each do |k, v|
          h[k.to_s] = v
        end
        h
      end
    end
    
    def create_grid_header_xml()
      doc = REXML::Document.new()
      
      doc.add_element 'rows'
      
      doc.elements['rows'].add_element 'head'
      
      @grid_columns.each do |column|
        c = column.clone
        e = REXML::Element.new 'column'
        e.text = c['header']
        e.add_attributes c.delete_if {|k, v| k == 'header' || k == 'eval' }
        doc.elements['rows/head'].add_element e
      end
      
      doc
    end
    
    def dhtmlxgrid_xml(collection)
      doc = @doc
      collection.each do |record|
        row = REXML::Element.new 'row'
        @grid_columns.each do |column|
          e = REXML::Element.new 'cell'
          e.text = eval(column['eval']) || (column['default'] || DHtmlXGrid::EMPTY) rescue (column['default'] || DHtmlXGrid::EMPTY)
          e.text = e.text.split(/\^/).map{|element| element.empty? ? (column['default'] || DHtmlXGrid::EMPTY) : element}.join('^')
          row.add_element e
        end
        doc.elements['rows'].add_element row, {'id' => record.id}
      end if collection
      doc
    end
  end
end
