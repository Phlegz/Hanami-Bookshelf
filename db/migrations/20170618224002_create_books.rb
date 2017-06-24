Hanami::Model.migration do
  change do
    create_table :books do
      primary_key :id
      foreign_key :author_id, :authors, on_delete: :cascade, null: false
      foreign_key :owner_id, :owners, on_delete: :cascade, null: false

      column :title,  String, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false

    end
  end
end
