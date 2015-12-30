# French Press
---

An opinionated ReactJs + Webpack generator.

![](https://raw.github.com/whatisinternet/french-press/master/logo.png)

---

## What's in the box?
- Generators:
  - [Base app](#generate-a-new-application)
    - Builds router
    - Adds mixin folder
    - Adds webpack config
    - Generates a test suite
    - Replaces refs to french-press with your own
  - View component (base component)
    - All come with tests
    - [Full](#generate-a-view-full)
      - Comes with routes
    - [Slim](#generate-a-view-slim)
      - Comes with routes
  - Child component
    - All come with tests
    - [Full](#generate-a-component-full)
      - No route included
    - [Slim](#generate-a-component-slim)
      - No route included

- Actions:
  - [Reset](#reset)
  - [Run](#run)
  - [Compile for production](#compile)
  - [Test](#test)
  - [Generator tests](#generator-tests)
  - [:warning: Remove Generators :warning:](#remove-the-generators-and-leave-your-new-application)

- Included modules other than React:
  - [Bemmer](https://www.npmjs.com/package/bemmer-node) - Create BEM with ease
  - [lodash](https://www.npmjs.com/package/lodash) - The missing standard lib
  - [moment](https://www.npmjs.com/package/moment) - Parse, validate, manipulate and display dates
  - [React Mini Router](https://www.npmjs.com/package/react-mini-router) - Easy routing
  - [Redux](https://www.npmjs.com/package/redux) - Functional flux store for your data

## What's missing:

- **Redux**
- [ ] Models
- [ ] Reducers
- [ ] Stores
- [ ] Middleware

- **Electron**

---

### Install Requirements

```shell
  npm install
```

---

### Usage

#### Reset
:bangbang: This will remove all generated content in your project use with extreme caution :bangbang:
```shell
  ./fp clean
```

---

#### Run
```shell
  ./fp run
```

---

#### Compile
```shell
  ./fp compile
```

---

#### Test
```shell
  ./fp test
```

---

#### Generator tests
:bangbang: This will remove all generated content in your project! Use before generating anything  :bangbang:

```shell
  ./fp clean && npm run spec && ./fp clean
```

---

#### Remove the generators and leave your new application

:warning: This will remove all generators.

```shell
  ./fp implode
```

---

#### Generate a new application

*You will want to `rm -rf .git` and `git init` before running this command*

```shell
  ./fp g --app --appName [AwesomeApp] --author [YourName] --ghUser [GitHubUserName] --email [some@one.com]
```

---

#### Generate a view [full]

*NB: Components are placed in components/[componentName]/index.coffee by default*

As a normal component with no customizations (route will match method name)
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

#### Generate a view [slim]

```shell
  ./fp g --view --[componentName] --slim
```

---

#### Generate a component [full]

*NB: Components are placed in components/[componentFolderName]/[componentName].coffee by default*

```shell
  ./fp g --component --[componentName] --folder [componentFolderName]
```

#### Generate a component [slim]

```shell
  ./fp g --component --[componentName] --folder [componentFolderName] --slim
```

---

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/whatisinternet/french-press. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
