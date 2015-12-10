json.array! @change_actions do |change_action|
  json.(change_action, :id, :title)
  json.next_click change_action.external_link || change_action_path(change_action)
end