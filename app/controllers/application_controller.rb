# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pagy::Backend

  def paginate_items(items)
    pagy, paginated_item = pagy(items)
    pagy_headers_merge(pagy) if Pagy

    paginated_item
  end
end
