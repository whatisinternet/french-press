# French Press
---

An opinionated ReactJs + Webpack + Redux generator.

![](https://raw.github.com/whatisinternet/french-press/master/logo.png)

---


### TODO:

- **Core**
- [x] Components (with routes and router)
- [x] Routes
- [x] Styles
- [ ] Mixins

- **Redux**
- [ ] Models
- [ ] Reducers
- [ ] Stores
- [ ] Middleware

### Install

```shell
  npm install
```

### Usage

**Reset**
```shell
  ./fp clean
```

**Run**
```shell
  ./fp run
```

**Compile**
```shell
  ./fp compile
```
**Generate a new app**
```shell
  ./fp g --app --git --appName [AwesomeApp] --author [YourName] --ghUser [GitHubUserName] --email [some@one.com]
```

**Generate a component [full]**

*NB: Components are placed in components/[componentName]/index.coffee by default*

As normal component with no customizations (route will match method name
```shell
  ./fp g --view --[componentName]
```

As base route
```shell
  ./fp g --view --[componentName] --route root
```

With custom route
```shell
  ./fp g --view --[componentName] --route [customRouteName]
```

With custom folder name
*NB: This will cause the component to be named based on the actual name of the function*
```shell
  ./fp g --view --[componentName] --componentFolder [componentFolderName]
```

**Generate a component [slim]**

```shell
  ./fp g --view --[componentName] --slim
```

**Remove the generators and leave your new app**

This will remove all generators.

```shell
  ./fp implode
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/whatisinternet/french-press. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
