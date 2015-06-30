Puppet::Type.type(:user).provide :gozeruser do
  @doc = "Create a new user."
  commands :add => "useradd", :getent => "getent", :userdel => "userdel", :id => "id"

  def exists?
    begin
      user = id(resource['name'])
    rescue Puppet::ExecutionFailure => e
      return nil
    end
    return user
  end

  def create
    add "-m", resource['name']
  end

  def destroy
    userdel resource['name']
  end

end

