ActiveAdmin.register NewsArticle do
  permit_params :title, :content, :published_at, :image

  form do |f|
    f.inputs 'News Article Details' do
      f.input :title
      f.input :content, as: :text
      f.input :published_at, as: :date_time_picker
      f.input :image, as: :file
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :title
    column :published_at
    column :images do |article|
      article.images.map { |image| content_tag(:div, image_tag(url_for(image), width: '50px'), style: 'margin-bottom: 2px;') }.join.html_safe
    end   
    actions
  end
end
