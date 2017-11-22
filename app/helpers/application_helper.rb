module ApplicationHelper
  def current_class?(paths=[])
    (paths.include? request.path) ? true : false
  end

  def current_controller?(active_controller, current_controller)
    (active_controller ==  current_controller) ? true : false
  end
end
