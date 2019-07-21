class ApiController < ActionController::Base
  # 基础控制器
  def authenticate!
    http_token ||= if request.headers["Authorization"].present?
                     request.headers["Authorization"].split(" ").last
                   end
    render_json('n', '没有访问权限', {}, 401) && return if http_token.blank?
    @auth_token ||= Token.decode(http_token)
    # render_json('y', 'ok')
  rescue JWT::VerificationError, JWT::DecodeError
    render_failed
  end

  def render_failed
    render_json('n', '没有访问权限', {}, 401)
  end

  private

    def render_json(code, msg, info = {}, status_code = 200)
      render json: { code: code, msg: msg, info: info }, status: status_code
    end

    def current_user
      User.find(@auth_token[0]['id'])
    end

    def self_server_url
      request.protocol + request.host_with_port
    end
end
