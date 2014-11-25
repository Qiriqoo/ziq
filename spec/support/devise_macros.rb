module DeviseMacros

  def login_admin
    admin = User.create!(email: 'sef@sef.fr', password: 'sefsefsef', password_confirmation: 'sefsefsef', is_admin: true, is_active: true)
    sign_in admin
    admin
  end

  def login_user
    user = User.create!(email: 'sef@sef.fr', password: 'sefsefsef', password_confirmation: 'sefsefsef')
    sign_in user
    user
  end

end