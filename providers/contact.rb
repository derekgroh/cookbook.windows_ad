#
# Author:: Derek Groh (<dgroh@arch.tamu.edu>)
# Cookbook Name:: windows_ad
# Provider:: contact
#
# Copyright 2013, Texas A&M
#

require 'mixlib/shellout'

action :create do
  if exists?
    Chef::Log.debug('The object already exists')
    new_resource.updated_by_last_action(false)
  else
    cmd = 'dsadd'
    cmd << ' contact '
    cmd << "\""
    cmd << CmdHelper.dn(new_resource.name, new_resource.ou,
                        new_resource.domain_name)
    cmd << "\""

    cmd << CmdHelper.cmd_options(new_resource.options)

    Chef::Log.info(print_msg("create #{new_resource.name}"))
    CmdHelper.shell_out(cmd, new_resource.cmd_user, new_resource.cmd_pass,
                        new_resource.cmd_domain)

    new_resource.updated_by_last_action(true)
  end
end

action :modify do
  if exists?
    cmd = 'dsmod'
    cmd << ' contact '
    cmd << CmdHelper.dn(new_resource.name, new_resource.ou,
                        new_resource.domain_name)

    cmd << CmdHelper.cmd_options(new_resource.options)

    Chef::Log.info(print_msg("modify #{new_resource.name}"))
    CmdHelper.shell_out(cmd, new_resource.cmd_user, new_resource.cmd_pass,
                        new_resource.cmd_domain)

    new_resource.updated_by_last_action(true)
  else
    Chef::Log.error('The object does not exist')
    new_resource.updated_by_last_action(false)
  end
end

action :move do
  if exists?
    cmd = 'dsmove '
    cmd << CmdHelper.dn(new_resource.name, new_resource.ou,
                        new_resource.domain_name)

    cmd << CmdHelper.cmd_options(new_resource.options)

    Chef::Log.info(print_msg("move #{new_resource.name}"))
    CmdHelper.shell_out(cmd, new_resource.cmd_user, new_resource.cmd_pass,
                        new_resource.cmd_domain)

    new_resource.updated_by_last_action(true)
  else
    Chef::Log.error('The object does not exist')
    new_resource.updated_by_last_action(false)
  end
end

action :delete do
  if exists?
    cmd = 'dsrm '
    cmd << CmdHelper.dn(new_resource.name, new_resource.ou,
                        new_resource.domain_name)
    cmd << ' -noprompt'

    cmd << CmdHelper.cmd_options(new_resource.options)

    Chef::Log.info(print_msg("delete #{new_resource.name}"))
    CmdHelper.shell_out(cmd, new_resource.cmd_user, new_resource.cmd_pass,
                        new_resource.cmd_domain)

    new_resource.updated_by_last_action(true)
  else
    Chef::Log.debug('The object has already been removed')
    new_resource.updated_by_last_action(false)
  end
end

def exists?
  contact = CmdHelper.shell_out("dsquery contact
                                -name \"#{new_resource.name}\"",
                                new_resource.cmd_user, new_resource.cmd_pass,
                                new_resource.cmd_domain)
  user = CmdHelper.shell_out("dsquery user -name #{new_resource.name}",
                             new_resource.cmd_user, new_resource.cmd_pass,
                             new_resource.cmd_domain)
  contact.stdout.downcase.include?('dc') ||
    user.stdout.downcase.include?('dc')
end

def print_msg(action)
  "windows_ad_contact[#{action}]"
end
