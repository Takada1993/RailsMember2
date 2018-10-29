class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.integer :articleId
      t.string :articleName
      t.integer :articleNumber
      t.integer :articleClassification
      t.time :articleContributionDate
      t.integer :recommendedClassification
      t.integer :pickUpClassification
      t.integer :latestClassification
      t.integer :deleteClassification

      t.timestamps
    end
  end
end
