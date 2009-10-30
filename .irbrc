class Object
  public
  def pubs
    public_methods.sort-Object.public_methods
  end
end
 
begin
  require 'rubygems'
 
  begin
    require 'wirble'
    Wirble.init
  rescue LoadError
  end
 
  begin
    require 'ruby-debug'
    trap ('TSTP') { debugger }
  rescue LoadError
  end
end
