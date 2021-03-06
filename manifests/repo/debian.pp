# Class x2go::repo::debian
class x2go::repo::debian {
  case $x2go::version {
    'baikal': { $release_train = 'baikal'  }
    default:  { $release_train = 'main' }
  }

  include apt
  apt::source { 'x2go':
    location    => 'http://packages.x2go.org/debian',
    release     => $::lsbdistcodename,
    repos       => $release_train,
    include_src => false,
    key         => {
      'id'     => 'E1F958385BFE2B6E',
      'server' => 'pgp.mit.edu',
    },
  }
}
