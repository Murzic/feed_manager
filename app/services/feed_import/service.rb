class FeedImport::Service
  def set_strategy(uploaded_file)
    file_format = uploaded_file.content_type.split(/\//)[1]
    @strategy = FeedImport.const_get(file_format.upcase).new(uploaded_file.tempfile)
  end

  def strategy_class_name
    @strategy.class.name
  end
end
