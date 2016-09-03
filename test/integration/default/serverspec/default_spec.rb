require 'spec_helper'

describe 'integration testing' do
  case os[:version]
  when '6.1'
    describe windows_feature('NetFx3') do
      it { should be_installed }
    end

    describe windows_feature('Microsoft-Windows-GroupPolicy-ServerAdminTools-Update') do
      it { should be_installed }
    end

    describe windows_feature('DirectoryServices-DomainController') do
      it { should be_installed }
    end
  when '6.2'
    describe windows_feature('Microsoft-Windows-GroupPolicy-ServerAdmintools-Update') do
      it { should be_installed }
    end

    describe windows_feature('ServerManager-Core-RSAT') do
      it { should be_installed }
    end

    describe windows_feature('ServerManager-Core-RSAT-Role-Tools') do
      it { should be_installed }
    end

    describe windows_feature('RSAT-AD-Tools-Feature') do
      it { should be_installed }
    end

    describe windows_feature('RSAT-ADDS-Tools-Feature') do
      it { should be_installed }
    end

    describe windows_feature('ActiveDirectory-Powershell') do
      it { should be_installed }
    end
    
    describe windows_feature('DirectoryServices-DomainController-Tools') do
      it { should be_installed }
    end

    describe windows_feature('DirectoryServices-AdministrativeCenter') do
      it { should be_installed }
    end

    describe windows_feature('DirectoryServices-DomainController') do
      it { should be_installed }
    end
  end
end