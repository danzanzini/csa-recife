class Supporter < User

  default_scope { where(role: 'supporter') }
end
