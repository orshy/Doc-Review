class Doc < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :reviews

    has_attached_file :doc_img, styles: { doc_index: "250x350>", doc_show: "325x475>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :doc_img, content_type: /\Aimage\/.*\Z/
end
