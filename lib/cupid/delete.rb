class Cupid
  module Delete
    def delete_user(key)
      resource :delete, server.object('Subscriber', { customer_key: key.to_s })
    end
  end
end
