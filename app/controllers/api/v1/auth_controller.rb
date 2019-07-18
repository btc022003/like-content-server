class Api::V1::AuthController < ApiController
  def reg
    user = User.new params.permit(:user_name, :nick_name, :avatars, :password)
    user.password = Digest::MD5.hexdigest(user.password) if user.password.present?
    if user.save
      render_json('y', '操作成功')
    else
      render_json('n', '操作失败',  user.errors.full_messages)
    end
  end

  def login
    user = User.find_by_user_name(params[:user_name])
    if user.present?
      if user.validate_pwd(params[:password])
        token = Token.generate(user)
        render_json('y', '登录成功', token)
      else
        render_json('n', '密码错误')
      end
    else
      render_json('n', '用户名不存在')
    end
  end
end
