ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :description, :price
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
# ================================================


# app/admin/product.rb
ActiveAdmin.register Product do
  permit_params :name, :description, :price, images: []

  form do |f|
    f.inputs 'Product Details' do
      f.input :name
      f.input :description
      f.input :price
      f.input :images, as: :file, input_html: { multiple: true }
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price

      row :images do |product|
        if product.images.attached?
          ul do
            product.images.each do |image|
              li do
                image_tag(image, style: 'max-width: 200px; max-height: 200px;')
              end
            end
          end
        else
          "No images attached."
        end
      end
    end
  end
end
