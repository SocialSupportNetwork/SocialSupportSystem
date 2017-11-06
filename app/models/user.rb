class User < ApplicationRecord
  
  #ricki changed here from display_name to username
  validates :username, presence: true, uniqueness: true
  #before_validation :uniq_username!, on: :create

  def display_name=(value)
    #super(value ? value.strip : nil)
    #display_name=("null")
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # Authenticates users- need a new strategy that uses user names instead of email
  devise :database_authenticatable, :registerable,
        :validatable
  private
  
  def will_save_change_to_email?
  end
    
  def email_required?
    false
  end
  
  def email_changed?
    false
  end

  # Makes the display_name unique by appending a number to it if necessary.
  # "Gleb" => Gleb 1"
  
  
  # Use this section to make all posts and comments anonymous instead of just adding a number
  
  def uniq_display_name!
    if display_name.present?
      new_display_name = display_name
      i = 0
      while User.exists?(display_name: new_display_name)
        new_display_name = "#{display_name} #{i += 1}"
      end
      self.display_name = new_display_name
    end
  end
  
  def display_name
    return username
  end
  
  # def thredded_can_message_users
  # end
  
end
