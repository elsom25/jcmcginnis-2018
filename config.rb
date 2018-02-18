# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

helpers do
  def external_link_to(body, url, html_options={})
    html_options[:rel] ||= 'external'
    link_to body, url, html_options
  end
end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
  activate :minify_html
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :relative_assets
end

configure :development do
  activate :livereload
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.deploy_method = :git
  deploy.remote   = 'jcmcginn@143.95.38.6:/home/jcmcginn/repos/jcmcginnis-2018.git' # remote name or git url, default: origin
  deploy.branch   = 'master' # default: gh-pages
  deploy.strategy = :force_push      # commit strategy: can be :force_push or :submodule, default: :force_push
end
