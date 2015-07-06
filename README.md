This is a provider for the user resource. It does not use the nss db so it cannot
be slowed down by an unperformant ldap.


Example use:

user { 'foo':
  ensure => present,
  provider => 'gozeruser',
}


TODO:

Add group provider
