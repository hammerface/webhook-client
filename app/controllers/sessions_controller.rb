class SessionsController < ApplicationController
  def new
  end

  def create
    p4       = '/usr/local/bin/p4'
    server   = params[:session][:server]
    user     = params[:session][:user]
    password = params[:session][:password]

    output = `/bin/echo #{password} | #{p4} -p #{server} -u #{user} login -p`
    puts output
    regex = /\AEnter password: .?[A-Z0-9]+.?\z/m
    if output =~ regex
      #success
      #sign_in params
      redirect_to webhooks_path
    else
      #flash.now[:error] = 'Invalid login information'
      render 'new'
    end
  end

  def destroy
  end
end
