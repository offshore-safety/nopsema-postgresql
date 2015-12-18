#
# Cookbook Name:: nopsema-postgresql
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'apt'
include_recipe 'postgresql::server'
include_recipe 'database::postgresql'

postgresql_database 'submissions_db' do
  connection(
    :host      => '0.0.0.0',
    :port      => 5432,
    :username  => 'postgres',
    :password  => node['postgresql']['password']['postgres']
  )
  action :create
end
