json.array!(@checklists) do |checklist|
  json.extract! checklist, 
  json.url checklist_url(checklist, format: :json)
end