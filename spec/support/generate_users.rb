module GenerateUsers
  def generate_users
    100.times do
      FactoryGirl.create(:user)
    end
  end
end
