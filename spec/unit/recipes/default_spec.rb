#
# Cookbook Name:: windows_ad
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'windows_ad::default' do
  context 'when all attributes are default, on a Windows 2008r2 platform' do
    before do
    end
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'windows', version: '2008r2')
      runner.converge(described_recipe)
    end

    it 'installs `NetFx3`' do
      expect(chef_run).to install_windows_feature('NetFx3')
    end

    it 'installs `Microsoft-Windows-GroupPolicy-ServerAdminTools-Update`' do
      expect(chef_run).to install_windows_feature('Microsoft-Windows-GroupPolicy-ServerAdminTools-Update')
    end

    it 'installs `DirectoryServices-DomainController`' do
      expect(chef_run).to install_windows_feature('DirectoryServices-DomainController')
    end
  end

  context 'when all attributes are default, on a Windows 2012 platform' do
    before do
    end
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'windows', version: '2012')
      runner.converge(described_recipe)
    end

    it 'installs `Microsoft-Windows-GroupPolicy-ServerAdmintools-Update`' do
      expect(chef_run).to install_windows_feature('Microsoft-Windows-GroupPolicy-ServerAdmintools-Update')
    end

    it 'installs `ServerManager-Core-RSAT`' do
      expect(chef_run).to install_windows_feature('ServerManager-Core-RSAT')
    end

    it 'installs `ServerManager-Core-RSAT-Role-Tools`' do
      expect(chef_run).to install_windows_feature('ServerManager-Core-RSAT-Role-Tools')
    end

    it 'installs `RSAT-AD-Tools-Feature`' do
      expect(chef_run).to install_windows_feature('RSAT-AD-Tools-Feature')
    end

    it 'installs `RSAT-ADDS-Tools-Feature`' do
      expect(chef_run).to install_windows_feature('RSAT-ADDS-Tools-Feature')
    end

    it 'installs `ActiveDirectory-Powershell`' do
      expect(chef_run).to install_windows_feature('ActiveDirectory-Powershell')
    end

    it 'installs `DirectoryServices-DomainController-Tools`' do
      expect(chef_run).to install_windows_feature('DirectoryServices-DomainController-Tools')
    end

    it 'installs `DirectoryServices-AdministrativeCenter`' do
      expect(chef_run).to install_windows_feature('DirectoryServices-AdministrativeCenter')
    end

    it 'installs `DirectoryServices-DomainController`' do
      expect(chef_run).to install_windows_feature('DirectoryServices-DomainController')
    end
  end

  context 'when all attribues are default, on a Windows 2012r2 platform' do
    before do
    end
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'windows', version: '2012r2')
      runner.converge(described_recipe)
    end

    it 'installs `Microsoft-Windows-GroupPolicy-ServerAdmintools-Update`' do
      expect(chef_run).to install_windows_feature('Microsoft-Windows-GroupPolicy-ServerAdmintools-Update')
    end

    it 'installs `ServerManager-Core-RSAT`' do
      expect(chef_run).to install_windows_feature('ServerManager-Core-RSAT')
    end

    it 'installs `ServerManager-Core-RSAT-Role-Tools`' do
      expect(chef_run).to install_windows_feature('ServerManager-Core-RSAT-Role-Tools')
    end

    it 'installs `RSAT-AD-Tools-Feature`' do
      expect(chef_run).to install_windows_feature('RSAT-AD-Tools-Feature')
    end

    it 'installs `RSAT-ADDS-Tools-Feature`' do
      expect(chef_run).to install_windows_feature('RSAT-ADDS-Tools-Feature')
    end

    it 'installs `ActiveDirectory-Powershell`' do
      expect(chef_run).to install_windows_feature('ActiveDirectory-Powershell')
    end

    it 'installs `DirectoryServices-DomainController-Tools`' do
      expect(chef_run).to install_windows_feature('DirectoryServices-DomainController-Tools')
    end

    it 'installs `DirectoryServices-AdministrativeCenter`' do
      expect(chef_run).to install_windows_feature('DirectoryServices-AdministrativeCenter')
    end

    it 'installs `DirectoryServices-DomainController`' do
      expect(chef_run).to install_windows_feature('DirectoryServices-DomainController')
    end
  end
end