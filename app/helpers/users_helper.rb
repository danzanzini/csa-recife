module UsersHelper
  def user_status(active)
    active ? 'Ativo' : 'Inativo'
  end

  def status_button_label(active)
    active ? 'Desativar' : 'Ativar'
  end

  def role_label(role)
    case role
    when 'admin'
      'Administrador'
    when 'producer'
      'Produtor'
    end
  end

  def role_positions
    User::MANAGER_ROLES.map { |role| [role_label(role), role] }
  end
end
