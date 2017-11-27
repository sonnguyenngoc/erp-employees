module Erp
  module Employees
    module Backend
      class DepartmentsController < Erp::Backend::BackendController
        before_action :set_department, only: [:edit, :update, :destroy]
        before_action :set_departments, only: [:delete_all]
    
        # GET /departments
        def index
        end
    
        # POST /departments/list
        def list
          @departments = Department.search(params).paginate(:page => params[:page], :per_page => 10)
          
          render layout: nil
        end
    
        # GET /departments/new
        def new
          @department = Department.new
        end
    
        # GET /departments/1/edit
        def edit
        end
    
        # POST /departments
        def create
          @department = Department.new(department_params)
          @department.creator = current_user
    
          if @department.save
            if request.xhr?
              render json: {
                status: 'success',
                text: @department.name,
                value: @department.id
              }
            else
              redirect_to erp_employees.edit_backend_department_path(@department), notice: t('.success')
            end
          else
            render :new        
          end
        end
    
        # PATCH/PUT /departments/1
        def update
          if @department.update(department_params)
            if request.xhr?
              render json: {
                status: 'success',
                text: @department.name,
                value: @department.id
              }              
            else
              redirect_to erp_employees.edit_backend_department_path(@department), notice: t('.success')
            end
          else
            render :edit
          end
        end
    
        # DELETE /departments/1
        def destroy
          @department.destroy

          respond_to do |format|
            format.html { redirect_to erp_employees.backend_departments_path, notice: t('.success') }
            format.json {
              render json: {
                'message': t('.success'),
                'type': 'success'
              }
            }
          end
        end
        
        # DELETE ALL /departments/delete_all?ids=1,2,3
        def delete_all         
          @departments.destroy_all
          
          respond_to do |format|
            format.json {
              render json: {
                'message': t('.success'),
                'type': 'success'
              }
            }
          end          
        end
        
        # DATASELECT
        def dataselect
          respond_to do |format|
            format.json {
              render json: Department.dataselect(params[:keyword])
            }
          end
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_department
            @department = Department.find(params[:id])
          end
          
          def set_departments
            @departments = Department.where(id: params[:ids])
          end
    
          # Only allow a trusted parameter "white list" through.
          def department_params
            params.fetch(:department, {}).permit(:name, :start_date, :employee_id, :description)
          end
      end
    end
  end
end