module UsersHelper
  def user_status(active)
    active ? 'Ativo' : 'Inativo'
  end
end
