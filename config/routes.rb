Sb::Application.routes.draw do
  root to:"v1/scratchers#index"

  api_version(:module => "V1", :header => {:name => "Accept", :value => "application/vnd.scratchbling.com; version=1"}, default: true) do
    resources :scratchers, except: [:new, :edit]
  end
end
