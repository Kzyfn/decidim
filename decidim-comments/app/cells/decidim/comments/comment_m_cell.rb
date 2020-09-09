# frozen_string_literal: true

module Decidim
  module Comments
    # This cell renders the Medium (:m) comment card
    # for an given instance of a Comment
    class CommentMCell < Decidim::CardMCell
      include CommentCellsHelper

      def statuses
        []
      end

      def comment
        model
      end

      def participatory_space
        model.participatory_space
      end

      def body(links: true, extras: true, strip_tags: false)
        text = translated_attribute(comment.body)
        text = decidim_sanitize(text)

        renderer = Decidim::ContentRenderers::HashtagRenderer.new(text)
        text = renderer.render(links: links, extras: extras).html_safe

        text = Decidim::ContentRenderers::LinkRenderer.new(text).render
        text
      end

      def description
        strip_tags(body).truncate(200, separator: /\s/)
      end
    end
  end
end
