unless brew_installed? "neo4j"
  package "neo4j"

  directory "/Users/#{node['current_user']}/Library/LaunchAgents" do
    owner node['current_user']
    action :create
  end

  template "#{node['sprout']['home']}/Library/LaunchAgents/homebrew.mxcl.neo4j.plist" do
    source "neo4j.plist.erb"
    variables ({ :neo4j_prefix => `brew --prefix neo4j`.chomp })
    user node['current_user']
  end

  execute "load the neo4j plist into the mac daemon startup thing" do
    command "launchctl load -w #{node['sprout']['home']}/Library/LaunchAgents/homebrew.mxcl.neo4j.plist"
    user node['current_user']
  end
end
