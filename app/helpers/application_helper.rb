module ApplicationHelper
  def paginate(collection)
    will_paginate collection, renderer: WillPaginate::ActionView::BootstrapLinkRenderer, list_classes: %w[pagination justify-content-center]
  end
end
