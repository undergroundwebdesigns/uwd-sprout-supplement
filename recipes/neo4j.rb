unless brew_installed? "neo4j"
  package "neo4j"

  directory "/Users/#{node['current_user']}/Library/LaunchAgents" do
    owner node['current_user']
    action :create
  end

  template "#{node['sprout']['home']}/Library/LaunchAgents/homebrew.mxcl.neo4j.plist" do
    source "neo4j.plist.erb"
    # This path will break when neo4j updates it's version, but not sure what
    # else to do, because this gets evald by chef before homebrew is installed,
    # so we can't ask homebrew what the path is.
    variables ({ :neo4j_prefix => '/usr/local/Cellar/neo4j/2.0.0/' })
    user node['current_user']
  end

  execute "load the neo4j plist into the mac daemon startup thing" do
    command "launchctl load -w #{node['sprout']['home']}/Library/LaunchAgents/homebrew.mxcl.neo4j.plist"
    user node['current_user']
  end
end
