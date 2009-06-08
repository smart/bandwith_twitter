class Gnip::QueueController < ApplicationController
  def show
    head :ok
  end
  
  def create
    Gnip::Queue.create({
      :document => "#{request.raw_post}"
    })
    head :ok
  end
end
