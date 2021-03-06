module AdLocalize
  class CLI
    def self.start(args:)
      options = OptionHandler.parse!(args)
      export_request = Mappers::OptionsToExportRequest.new.map(options: options)
      export_request.csv_paths = options[:csv_paths]
      Interactors::ExecuteExportRequest.new.call(export_request: export_request)
    end
  end
end