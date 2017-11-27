Erp::Employees::Engine.routes.draw do
	scope "(:locale)", locale: /en|vi/ do
		namespace :backend, module: "backend", path: "backend/employees" do
			resources :departments do
		        collection do
		          get 'dataselect'
		          post 'list'
		          delete 'delete_all'
		        end
		    end
			resources :employees do
		        collection do
		          get 'dataselect'
		          post 'list'
		          delete 'delete_all'
		        end
		    end
		end
	end
end