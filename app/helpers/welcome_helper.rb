module WelcomeHelper
  def new_harvest_button_label
    current_offering&.published ? 'Realizar Colheita' : 'Não há oferendas disponíveis'
  end

  def new_harvest_button_class
    'disabled' unless current_offering&.published
  end
end
