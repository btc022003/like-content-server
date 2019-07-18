class Api::V1::UsersController < ApiController
  before_action :authenticate!

  def info
    render_json('y', '操作成功', current_user)
  end

  def modify_info
    user = current_user
    user.mobile = params[:mobile]
    user.email = params[:email]
    user.nick_name = params[:nick_name]
    user.avatars = params[:avatars]
    if user.save
      render_json('y', '操作成功')
    else
      render_json('n', '操作失败', ac.errors.full_messages)
    end
  end

  def modify_pwd
    user = current_user
    if user.validate_pwd(params[:old_pwd])
      # user.password = params[:password] if params[:password].present?
      if user.update_pwd(params[:old_pwd], params[:pwd])
        render_json('y', '操作成功')
      else
        render_json('n', '操作失败', user.errors.full_messages)
      end
    else
      render_json('n', '原始密码输入错误')
    end
  end
end
