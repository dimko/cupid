class Cupid
  module Models
    class List < Base

      map_fields :id           => "ID",
                 :name         => "ListName",
                 :customer_key => "CustomerKey",
                 :folder_id    => "Category"

      convert(:id) { |id| id.to_i }
      convert(:folder_id) { |folder_id| folder_id.to_i }

      belongs_to(:DataFolder) { |list, folder| folder.id == list.folder_id }

      def add_subscribers(subscribers)
        set = SubscriberSet.new(@cupid, :Subscriber, subscribers)
        set.add_to_list(self).first
      end
    end
  end
end
