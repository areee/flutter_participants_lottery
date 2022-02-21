<a href="https://github.com/areee/flutter_participants_lottery/releases"><img alt="GitHub release (latest by date)" src="https://img.shields.io/github/v/release/areee/flutter_participants_lottery"></a>
<a href="https://github.com/areee/flutter_participants_lottery/blob/main/LICENSE.md"><img alt="GitHub" src="https://img.shields.io/github/license/areee/flutter_participants_lottery"></a>

# flutter_participants_lottery

A participants lottery app

## Developing

### How to fix API key errors (if you get the source code from GitHub)

1. Get an API key from [Multiavatar](https://multiavatar.com/) and save it to `.env` file. An example row: `MULTIAVATAR=insert-api-key-here`
2. Run the generator (it will create an `env.g.dart` file):

```zsh
flutter pub run build_runner build
```

### How to build and deploy the web app to GitHub pages (using [Peanut](https://github.com/kevmoo/peanut.dart))

1. Install to your local environment:

```zsh
flutter pub global activate peanut
```

2. Run:

```zsh
peanut
```

or

```zsh
flutter pub global run peanut
```

3. Push to the `gh-pages` branch:

```zsh
git push origin --set-upstream gh-pages
```