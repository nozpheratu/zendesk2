class Zendesk2::Client::DestroyForum < Zendesk2::Client::Request
  request_method :delete
  request_path { |r| "/forums/#{r.forum_id}.json" }

  def forum_id
    params.fetch("forum").fetch("id")
  end

  def mock
    delete!(:forums, forum_id)

    mock_response(nil)
  end
end
