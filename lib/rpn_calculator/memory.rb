require 'fileutils'
module RpnCalculator
  # Memory class to save the stack and tokens
  class Memory
    MEMORY_FILE = 'tmp/memory'.freeze
    attr_accessor :stack, :tokens

    def initialize
      @stack = []
      @tokens = []
      load
    end

    def save
      FileUtils.mkdir_p('tmp') unless File.directory?('tmp')
      File.open(MEMORY_FILE, 'w+') do |f|
        Marshal.dump(self, f)
      end
    end

    def load
      return unless memory_exists?
      File.open(MEMORY_FILE) do |f|
        data = Marshal.load(f)
        @stack = data.stack
        @tokens = data.tokens
      end
    end

    def clear
      return unless memory_exists?
      File.open(MEMORY_FILE) { |f| File.delete(f) }
    end

    private

    def memory_exists?
      File.exist? MEMORY_FILE
    end
  end
end
