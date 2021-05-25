module UsersHelper
  def user_status(active)
    active ? 'Ativo' : 'Inativo'
  end

  def status_button_label(active)
    active ? 'Desativar' : 'Ativar'
  end
end
