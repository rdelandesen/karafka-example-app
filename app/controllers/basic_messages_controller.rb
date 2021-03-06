# frozen_string_literal: true

# This controller does not have after_received callbacks,
# so it will receive all messages which are sent to basic_messages topic
class BasicMessagesController < ApplicationController
  # Here we set any logic what should be done in sidekiq once controller receives
  # message to 'basic_messages' topic.
  # In this example it logs received params in 'log/basic_controller_params' file
  def consume
    sleep 10
    LoggerService.new.write_to_file(
      self,
      File.join(Karafka::App.root, 'log', 'basic_controller_params.log')
    )
  end
end
