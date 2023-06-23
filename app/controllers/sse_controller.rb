class SseController < ActionController::Base
  include ActionController::Live

  def index
    response.headers["Content-Type"] = "text/event-stream"
    response.headers["Last-Modified"] = Time.now.httpdate

    sse = SSE.new(response.stream, retry: 300, event: "open")

    5.times do
      sleep 2
      sse.write("The current time is: #{Time.current}", event: "message")
    end
  rescue ActionController::Live::ClientDisconnected
    sse.close
  ensure
    sse.close
  end
end
