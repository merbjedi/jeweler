require 'rbconfig'

class Jeweler
  module Commands
    class InstallGem
      attr_accessor :gemspec_helper, :output

      def initialize
        self.output = $stdout
      end


      def run
        command = "#{gem_command} install #{gemspec_helper.gem_path}"
        output.puts "Executing #{command.inspect}:"

        sh sudo_wrapper(command) # TODO where does sh actually come from!? - rake, apparently
      end

      def sudo_wrapper(command)
        use_sudo? ? "sudo #{command}" : command
      end

      def use_sudo?
        host_os !~ /mswin|windows|cygwin/i &&
         !(ENV['DONT_SUDO_GEMS'])
      end

      def host_os
        Config::CONFIG['host_os']
      end

      def gem_command
        Config::CONFIG['RUBY_INSTALL_NAME'].sub('ruby', 'gem')
      end

      def self.build_for(jeweler)
        command = new
        command.output = jeweler.output
        command.gemspec_helper = jeweler.gemspec_helper
        command
      end
    end
  end
end
