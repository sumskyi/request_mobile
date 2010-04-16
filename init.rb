# 2.2
ActionController::AbstractRequest.send(:include, ActionController::RequestMobile) if defined? ActionController::AbstractRequest

#2.3
ActionController::Request.send(:include, ActionController::RequestMobile) if defined? ActionController::Request
