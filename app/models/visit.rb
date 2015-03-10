class Visit < ActiveRecord::Base
belongs_to :link

def create
  @link = Link.find_by(:slug => params[:slug])

  Visit.create(:link_id => @link.id, :ip_address => request.remote_ip)

  redirect_to "https://#{@link.target_url}"
end

end
