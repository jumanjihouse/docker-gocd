$gocd_dependencies = [
  'git',
  'java-1.7.0-openjdk',
  'subversion',
  'yum-utils',            # `repoquery' for yum plugin
]

package { $gocd_dependencies:
  ensure          => latest,
  allow_virtual   => false,
}
