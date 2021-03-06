class Zendesk2::Client::UpdateCategory < Zendesk2::Client::Request
  request_method :put
  request_body { |r| { "category" => Cistern::Hash.except(r.category, "id") } }
  request_path { |r| "/categories/#{r.category_id}.json" }

  def category
    self.params.fetch("category")
  end

  def category_id
    category.fetch("id")
  end

  def mock
    mock_response(
      "category" => find!(:categories, category_id).merge!(Cistern::Hash.slice(category, *Zendesk2::Client::CreateCategory.accepted_attributes))
    )
  end
end
