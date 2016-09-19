ActiveAdmin.register Notification do

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
permit_params :email, :name, :status

index do
  column "Nombre",  :name
    column :email
    column "Activo", :status
    actions
end

show do
  attributes_table do
    row :id
    row "Nombre" do notification.name end
    row :email
    row "Activo" do notification.status end
  end
end

form do |f|
  f.inputs do
    f.input :name, label: "Nombre"
    f.input :email
    f.input :status, label: "Activo"
  end
  f.actions
end
filter :email

end
