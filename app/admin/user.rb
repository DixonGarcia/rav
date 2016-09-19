ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :email, :password, :password_confirmation, :role , :name

  index do
      column :email
      column "Nombre",  :name
      column "Rol", :role
      actions
  end

  filter :email

  form do |f|
      f.inputs "Detalles del usuario" do
          f.input :name, label: "Nombre y Apellido"
          f.input :email
          f.input :password, label: "Contraseña"
          f.input :password_confirmation, label: "Confirmacion de Contraseña"
          f.input :role, as: :radio, collection: {Android: "app", Administrador: "admin"}, label: "Rol"
      end
      f.actions
  end


end
