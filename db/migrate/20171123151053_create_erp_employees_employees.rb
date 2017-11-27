class CreateErpEmployeesEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :erp_employees_employees do |t|
      t.string :code
      t.string :name
      t.string :sex
      t.datetime :birthday
      t.string :address
      t.string :email
      t.string :phone
      t.decimal :salary
      t.string :tax_code
      t.references :department, index: true, references: :erp_employees_departments
      t.references :creator, index: true, references: :erp_users

      t.timestamps
    end
  end
end
