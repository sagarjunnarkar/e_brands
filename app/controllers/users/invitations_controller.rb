class Users::InvitationsController < Devise::InvitationsController
  skip_before_action :verify_authenticity_token, only: [ :update ]
  def update
    super do |resource|
      if resource.errors.empty?
        render json: { status: "Invitation Accepted!" }, status: 200 and return
      else
        render json: resource.errors, status: 401 and return
      end
    end
  end
end