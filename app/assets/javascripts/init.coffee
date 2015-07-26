OrderBuddyJs = angular.module 'OrderBuddyJs', ['ui.router']

OrderBuddyJs.config ($locationProvider) ->
  $locationProvider.html5Mode false

OrderBuddyJs.config ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] =
    angular.element(
      document.querySelector('meta[name=csrf-token]')
    ).attr('content')

OrderBuddyJs.config ($provide, $httpProvider, Rails) ->
  $provide.factory 'railsAssetsInterceptor', ->
    request: (config)->
      if assetUrl = Rails.templates[config.url]
        config.url = assetUrl
      config

  $httpProvider.interceptors.push 'railsAssetsInterceptor'

