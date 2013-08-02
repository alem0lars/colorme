$:.unshift(Pathname.new(File.dirname __FILE__).join('lib'))


# Load the bundled environment
require "rubygems"
require "bundler"
Bundler.setup(:default, :development)

# Require gems specified in the Gemfile
require "trollop"


# { entry-point

def main
  global_opts = parse_global_opts(uis: %w(cmd qt))
  ui_name, ui_opts = parse_ui_opts(ARGV, global_opts[:debug])
  start(ui_name, ui_opts, global_opts)
end

def start(ui_name, ui_opts, global_opts)
  Bundler.setup("#{ui_name}_ui".to_sym)
  require "ui"
  start_ui(ui_name, ui_opts.merge(global_opts))
end

# }

# { parsing

# Parse the global options and return them
def parse_global_opts(args)
  global_opts = Trollop::options do
    banner "The colors management app that you're missing"
    opt :verbose, "Be more verbose", :short => "-v"
    opt :debug, "Print debugging output", :short => "-d"
    stop_on args[:uis]
  end

  if global_opts[:debug]
    puts "Global options: #{global_opts.inspect}"
  end

  return global_opts
end

# Parse the starting-ui specific options and return them
def parse_ui_opts(args, debug)
  ui = args.shift # get the starting ui
  ui_opts = case ui
  when "cmd" # parse cmd options
    Trollop::options do
      opt :name, "Command name", type: :string, required: true
    end
  when "qt"  # parse qt options
    Trollop::options do
      # INF: empty
    end
  else
    Trollop::die ui ? "unknown subcommand #{ui.inspect}" : "no subcommand given"
  end

  if debug
    puts "UI: #{ui.inspect}"
    puts "UI options: #{ui_opts.inspect}"
    puts "Remaining arguments: #{args.inspect}"
  end

  return [ui, ui_opts]
end

# }

main
