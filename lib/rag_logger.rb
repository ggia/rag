# http://stackoverflow.com/questions/917566/ruby-share-logger-instance-among-module-classes
require 'logger'
module RagLogger
  def logger
    RagLogger.logger
  end

  def self.logger
    unless @logger_file
      Dir.mkdir('log/') unless File.directory?('log/')
      @logger_file ||= 'log/rag.log'
    end
    @logger ||= Logger.new(@logger_file)
  end
end