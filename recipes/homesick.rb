chef_gem 'homesick' do
  version node['homesick']['gem_version'] if node['homesick']['gem_version']
end

execute 'rebuild rbenv stubs' do
  command 'rbenv rehash'
  user node['current_user']
end

homesick_castle 'dotvim' do
  user node['current_user']
  source 'git://github.com/undergroundwebdesigns/dotvim.git'
end

homesick_castle 'dottmux' do
  user node['current_user']
  source 'git://github.com/undergroundwebdesigns/dottmux.git'
end
