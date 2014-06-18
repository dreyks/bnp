module ApiHelper
  module JsonHelpers
    def json
      @json ||= JSON.parse(response.body) rescue {}
    end
  end
end