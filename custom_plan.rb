require 'zeus/rails'

# See https://gist.github.com/moonfly/5326451 
class CustomPlan < Zeus::Rails

    def spec(argv = ARGV)
        RSpec::Core::Runner.disable_autorun!
        exit RSpec::Core::Runner.run(argv)
    end
end

Zeus.plan = CustomPlan.new
