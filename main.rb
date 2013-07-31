# Load the bundled environment
require "rubygems"
require "bundler"
Bundler.setup(:default, :development)

# Require gems specified in the Gemfile
require "trollop"


# { entry-point

def main
  global_opts = parse_global_opts(modes: %w(cmd qt))
  mode, mode_opts = parse_mode_opts(ARGV, global_opts[:debug])
  start(mode, mode_opts, global_opts)
end

def start(mode, mode_opts, global_opts)
  Bundler.setup("#{mode}_mode".to_sym)
  puts mode
  $:.unshift(File.dirname __FILE__) && require("main_#{mode}")
  start_mode(mode_opts.merge(global_opts))
end

# }

# { parsing

# Parse the global options and return them
def parse_global_opts(args)
  global_opts = Trollop::options do
    banner "The colors management app that you're missing"
    opt :verbose, "Be more verbose", :short => "-v"
    opt :debug, "Print debugging output", :short => "-d"
    stop_on args[:modes]
  end

  if global_opts[:debug]
    puts "Global options: #{global_opts.inspect}"
  end

  return global_opts
end

# Parse the starting-mode specific options and return them
def parse_mode_opts(args, debug)
  mode = args.shift # get the starting mode
  mode_opts = case mode
  when "cmd" # parse cmd options
    Trollop::options do
      opt :name, "Command name", type: :string, required: true
    end
  when "qt"  # parse qt options
    Trollop::options do
      # INF: empty
    end
  else
    Trollop::die mode ? "unknown subcommand #{mode.inspect}" : "no subcommand given"
  end

  if debug
    puts "Mode: #{mode.inspect}"
    puts "Mode options: #{mode_opts.inspect}"
    puts "Remaining arguments: #{args.inspect}"
  end

  return [mode, mode_opts]
end

# }

main
