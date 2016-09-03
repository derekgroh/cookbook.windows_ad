require 'serverspec'
require 'winrm'

include SpecInfra::Helper::Exec
include SpecInfra::Helper::DetectOS

set :backend, :cmd
set :os, family: 'windows'
