    <header class="navbar navbar-fixed-top navbar-inverse">
      <div class="navbar-inner">
        <div class="container">
          <%= link_to "sample app", root_path, id: "logo" %>
          <nav>
            <ul class="nav pull-right">
              <li><%= link_to "Home", root_path %></li>
              <li><%= link_to "Help", help_path %></li>
                   <!-- Is user logged in? -->
              <% if signed_in? %>
                <li><%= link_to "Users", '#' %></li>
                <li id="fat-menu" class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    Account <b class="caret"></b>
                  </a>
                  <ul class="dropdown-menu">
                    <li><%= link_to "Profile", current_user %></li> # the link_to helper examines the second argument's type and generates a REST-based URL accordingly, e.g. Profile
                    <li><%= link_to "Settings", '#' %></li>
                    <li class="divider"></li>
                    <li>
                    # below generates Sign out
                      <%= link_to "Sign out", signout_path, method: "delete" %> 
                    </li>
                  </ul>
                </li>
              <% else %> 
                <li><%= link_to "Sign in", signin_path %></li>
              <% end %>
            </ul>
          </nav>
        </div>
      </div>
    </header>