# frozen_string_literal: true

require 'pagy/extras/overflow'
require 'pagy/extras/headers'

# When page overflow it renders the last page
Pagy::DEFAULT[:overflow] = :last_page
# Default items per page
Pagy::DEFAULT[:items] = 20
