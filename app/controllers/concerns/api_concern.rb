module ApiConcern
  extend ActiveSupport::Concern

  included do
    before_action :authenticate
  end

  private

  def authenticate
    authenticate_token || render_error(401)
  end

  def authenticate_token
    authenticate_with_http_token do |token|
      Token.authenticate?(token)
    end
  end

  def render_error(status = 500, msg = nil)
    render(
      json: {
        status: 'ERROR',
        message: msg || error_msg(status)
      },
      status: status
    )
  end

  def error_msg(status)
    case status
    when 400, :bad_request
      '入力内容に誤りがあります。訂正してください。'
    when 401, :unauthorized
      '認証に失敗しました。'
    when 403, :forbidden
      'リソースへのアクセス権がありません。'
    when 404, :not_found
      'リソースが存在しません。'
    when 500, :internal_server_error
      '予期せぬエラーが発生しました。'
    end
  end

  def render_success(obj = nil, action = nil)
    return render_error(500) if obj.blank? || %i[create update].exclude?(action)

    render(
      json: {
        status: 'SUCCESS',
        message: "#{action} the #{obj.class.name}",
        data: obj
      }
    )
  end
end
