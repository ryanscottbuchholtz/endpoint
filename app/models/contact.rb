class Contact < ActiveRecord::Base
  after_save :mailchimp_status

  def mailchimp_status
    @mailchimp_list_id = "4c21c61086"
    @gb = Gibbon::API.new
      @gb.lists.subscribe({
      :id => @mailchimp_list_id,
      :email => {:email => self.email},
      :merge_vars => {
        :FNAME => self.first_name,
        :LNAME => self.last_name,
        :COMPANY => self.company
      },
      :double_optin => false,
      :send_welcome => true
    })
  end

end