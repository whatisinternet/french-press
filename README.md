# French Press

![](https://raw.github.com/whatisinternet/french-press/master/logo.png)

---

A ReactJs + Webpack + Redux generator.

### TODO:

- [ ]**Core**
- [x] Components (with routes and router)
- [x] Routes
- [ ] Mixins

- [ ]**Redux**
- [ ] Models
- [ ] Reducers
- [ ] Stores
- [ ] Middleware

### Install

```shell
  npm install && npm install -g gulp
```

### Usage

**Reset**
```shell
  gulp clean
```

**Run**
```shell
  gulp run
```

**Compile**
```shell
  gulp compile
```

**Generate a component [full]**

*NB: Components are placed in components/[componentName]/index.coffee by default*

As normal component with no customizations (route will match method name
```shell
  gulp g --view --[componentName]
```

As base route
```shell
  gulp g --view --[componentName] --route root
```

With custom route
```shell
  gulp g --view --[componentName] --route [customRouteName]
```

With custom folder name
*NB: This will cause the component to be named based on the actual name of the function*
```shell
  gulp g --view --[componentName] --componentFolder [componentFolderName]
```

**Generate a component [slim]**

```shell
  gulp g --view --[componentName] --slim
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/whatisinternet/french-press. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
