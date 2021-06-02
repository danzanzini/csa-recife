class Manager < User

  default_scope { where("role != 'supporter'") }
end
