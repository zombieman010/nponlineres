class StaticPagesController < ApplicationController
  def home
    counter = 1
    photo_list = []
    Photo.all.order('id DESC').each do |i|
      if counter <= 4
        photo_list.append(i.link)
        counter += 1
      end
    end
    @photo_show = photo_list
  end

  def projects
  end

  def resume
  end
end
