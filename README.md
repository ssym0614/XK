# XK (Kaikei) Accounting Application

The objective of this application is to help myself study the basics of developing an application using Ruby on Rails.
The original version of this system was made by M.K., the former chief treasurer at the student organization I was in when I was in college. Since the only purpose of this project is for myself to study, I will use this README as a memo containing things I got stuck on, how I solved it, etc.

# Asset Pipeline (sprockets), Webpack, and Webpacker
* Apparently, there are currently 2 approaches to do similar things in Rails 6: Asset Pipeline and Webpack (via Webpacker gem)
* Asset pipeline is the older method. You place things in app/assets, and concatenate files using directives
* If you use webpack, you place everything in app/javascripts

## Webpack/Webpacker
* yarn to install node modules
* go to app/javascript/packs/application.js, and import your module there
* creates a dependency graph from import statements, with anything in
app/javascript/packs as entry points
* webpack does the job of transpling ES6, scss files, etc. into appropriate formats (js, css) and concatenating each of them into a single file (same name as your entry point filename)

# Installing Bootstrap (using webpack)
* For now, I'll go with installing bootstrap with webpack.
* If you have `extract_css = false` in webpacker.yml, webpacker will NOT generate separate css files. Rather, css will be imported as part of the javascript. If so, you don't need to add stylesheet_pack_tag portion (because no such file exist)

### Steps
* create stylesheets/application.scss inside app/javascript folder
* `import "bootstrap"`, `import "../stylesheets/application"`
* In application.scss, `@import "~bootstrap/scss/bootstrap"`
* In app/assets/views/layouts/application.html.erb, add \
`<%= stylesheet_pack_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>`

[Rails6 Setup Guide](https://dev.to/vvo/a-rails-6-setup-guide-for-2019-and-2020-hf5)
