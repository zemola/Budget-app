<div>
  <% if user_signed_in? %>
    <%= link_to 'Sign out', destroy_user_session_path, method: :delete %>
  <% end %>
</div>