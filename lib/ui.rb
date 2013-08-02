def start_ui(ui_name, opts)
  puts("Starting ColorME with #{ui_name.upcase} UI") if opts[:debug]
  require "ui/#{ui_name}_ui"

  case ui_name
  when /qt/i
    # Start the QT UI
    # TODO
  when /cmd/i
    # Start the CMD UI
    # TODO
  end
end
