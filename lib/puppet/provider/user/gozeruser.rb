Puppet::Type.type(:user).provide :gozeruser do
  @doc = "Create a new user."
  # Have to get funky with 'id' because ruby/puppet already use thta
  commands :add => "useradd", :getent => "getent", :userdel => "userdel", :idcmd => "id"

  def exists?
    begin
      user = idcmd(resource['name'])
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

