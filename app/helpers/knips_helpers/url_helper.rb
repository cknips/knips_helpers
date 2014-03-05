module KnipsHelpers
  module UrlHelper
    def link_to_url(url, show_only_domain: true)
      if url.present?
        url_with_protocol, url_without_protocol =
          if url.starts_with?("http://") || url.starts_with?("https://")
            [url, url.gsub(/https?:\/\//, "")]
          else
            ["http://#{url}", url]
          end

        if show_only_domain
          only_domain = url_without_protocol.split("/").first
          link_to only_domain, url_with_protocol, target: "_blank"
        else
          link_to url_without_protocol, url_with_protocol, target: "_blank"
        end
      end
    end
  end
end
