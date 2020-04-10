# frozen_string_literal: true

module Api
  module V1
    class LinksController < BaseController
      def index
        links = Link.top_hits
        render_with(links, LinkSerializer)
      end

      def show
        link = Link.find_by(slug: params[:id])
        if link
          link.increment!(:hits_count)
          render_with(link, LinkSerializer)
        else
          render_not_found
        end
      end

      def create
        @link = Link.new(link_params)
        if @link.save
          render_with(@link, LinkSerializer)
        else
          render_save_error(@link)
        end
      end

      def prefetch
        @link = Link.new(link_params)
        if @link.valid?
          render_with(@link, LinkSerializer)
        else
          render_save_error(@link)
        end
      end

      private

      def link_params
        params
          .require(:link)
          .permit(
            :url,
            :title,
            :description,
            :author,
            :image,
            :slug
          )
      end
    end
  end
end
