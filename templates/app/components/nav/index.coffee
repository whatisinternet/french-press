{div, a}  = React.DOM

module.exports = React.createFactory React.createClass
  displayName: "Navigation"

  # https://facebook.github.io/react/docs/reusable-components.html
  propTypes:
    null

  getRoutes: ->
    require('../../../config/routes')

  render: ->
    routes = @getRoutes()
    routeTitles = _.values routes

    bem = new Bemmer(block: 'nav')

    div className: bem.classes(),
      _.map routeTitles, (r, idx) ->
        a
          key: idx
          className: bem.with(element: 'item')
          href: "#{_.keys(routes)[idx]}",
          _.startCase r
