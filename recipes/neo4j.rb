unless brew_installed? "neo4j"
  package "neo4j"

  execute "install neo4j to start on boot" do
    command "`brew --prefix neo4j`/bin/neo4j install"
    user node['current_user']
  end
end
