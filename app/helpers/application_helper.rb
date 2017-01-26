module ApplicationHelper
  def avatar_url(account)
    default_url = "#{root_url}images/pp.png"
    gravatar_id = Digest::MD5.hexdigest(account.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=128&d=#{CGI.escape(default_url)}"
  end
end
