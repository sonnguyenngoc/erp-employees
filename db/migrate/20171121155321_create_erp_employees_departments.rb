class CreateErpEmployeesDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :erp_employees_departments do |t|
      t.string :name
      t.datetime :start_date
      t.string :description
      t.references :employee, index: true, references: :erp_employees_employees
      t.references :creator, index: true, references: :erp_users

      t.timestamps
    end
  end
end
