# coding: utf-8

require 'rubygems'
require 'thor'

class UwsgiIniMake < Thor
  option :n, :type => :string, :required => true, :desc => "socket name"
  option :p, :type => :string, :required => true, :desc => "application path"
  desc 'make','make uwsgi ini file'
  def make
    File.open('ini_files/sample.ini') do |f|
      rep = f.read.gsub!(/hogehoge/,"#{options[:n]}").gsub!(/{dir}/,"#{options[:p]}")
      File.write("ini_files/#{options[:n]}.ini",rep)
    end
  end
end

UwsgiIniMake.start
