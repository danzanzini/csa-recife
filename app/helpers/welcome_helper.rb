module WelcomeHelper

  def harvest_button
    return disabled_button if !current_offering
    current_harvest ? edit_harvest_button : new_harvest_button
  end

  def disabled_button
    link_to('Não há oferendas disponíveis', '#',
      class: "btn btn-sm btn-block btn-primary mb-3 disabled"
    )
  end

  def new_harvest_button
    link_to('Realizar Pedido',
      new_harvest_url,
      class: "btn btn-sm btn-block btn-primary mb-3"
    )
  end

  def edit_harvest_button
    link_to('Editar pedido realizado',
      edit_harvest_url(current_harvest),
      class: "btn btn-sm btn-block btn-primary mb-3"
    )
  end
end
