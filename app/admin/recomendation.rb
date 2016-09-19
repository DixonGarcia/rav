ActiveAdmin.register Recomendation do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :user_id, :tema, :seccion, :recomendacion, :created_at
  actions :all, :except => [:destroy, :edit, :new]
  index do
    selectable_column
    column :titulo
    column :user_id
    column :tema
    column :seccion
    column :recomendacion
    column :imagen do |url|
      img(src: url.imagen, class:"my_image_size")
      link_to "ver imagen", url.imagen, {target: "_blank"}
    end
    column "Fecha",:created_at
    actions
  end

  show do
    attributes_table do
      row :titulo
      row :user_id
      row :tema
      row :seccion
      row :imagen do |url|
        img(src: url.imagen, class:"my_image_size_max")
        link_to "ver imagen", url.imagen, {target: "_blank"}
      end
      row :recomendacion
      row :efecto
      row :mitigacion
      row :accion
      row :created_at
    end
  end

  filter :user_id
  filter :tema
  filter :seccion
  filter :created_at
end
