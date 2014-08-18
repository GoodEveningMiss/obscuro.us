json.array!(@ideas) do |idea|
  json.extract! idea, :id, :body, :due_date, :completion_status, :votes
  json.url idea_url(idea, format: :json)
end
