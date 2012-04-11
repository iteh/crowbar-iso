case node.sledgehammer.strategy
when "download"
  include_recipe "sledgehammer::download"
when "build"
  include_recipe "sledgehammer::build"
end
