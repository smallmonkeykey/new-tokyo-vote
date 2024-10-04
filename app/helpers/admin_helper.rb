# frozen_string_literal: true

module AdminHelper
  def require_admin
    return if current_user&.admin?

    flash[:alert] = '管理者のみアクセス可能です'
    redirect_to root_path
  end
end
