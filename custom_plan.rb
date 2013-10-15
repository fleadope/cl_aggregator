require 'zeus/rails'

# See https://gist.github.com/moonfly/5326451 
class CustomPlan < Zeus::Rails

    def spec(argv = ARGV)
        RSpec::Core::Runner.disable_autorun!
        exit RSpec::Core::Runner.run(argv)
    end

    def all_specs(argv = ARGV)
        append_pattern_and_run("spec/**/*_spec.rb", argv)
    end

    private 
    def append_pattern_and_run(glob, argv)
        pattern = Dir.glob(glob).inject(%w[--pattern]) do |result, file|
            result << file
        end
        argv += pattern
        spec(argv)
    end


end

Zeus.plan = CustomPlan.new
