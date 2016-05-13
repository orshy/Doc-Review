class AddAttachmentDocImgToDocs < ActiveRecord::Migration
  def self.up
    change_table :docs do |t|
      t.attachment :doc_img
    end
  end

  def self.down
    remove_attachment :docs, :doc_img
  end
end
