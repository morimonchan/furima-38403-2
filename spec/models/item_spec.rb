require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

end
