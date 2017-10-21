module Api
  module V1
    class OrdersController < ApiController

      def index
        @orders = if params[:created_at_gte].present?
          created_at_gte = Time.zone.parse(params[:created_at_gte])
          Order.find(:all, :conditions => ["created_at >= ?", created_at_gte])
        else
          Order.all
        end
      end

      def create
        @order = Order.new(order_params)
        @order.ordnumber = (Order.last.ordnumber.to_i + 1).to_s
        @order.save!
      end

      def show
        @order = Order.find(params[:id])
      end

      def update
        @order = Order.find(params[:id])
        @order.update_attributes(order_params)
      end

      def destroy
        @order = Order.find(params[:id])
        @order.destroy
      end

      private
      
      def order_params
        # FIXME: might be dangerous to whitelist everything
        params.require(:order).permit!
      end
    end
  end
end