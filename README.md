# flutter_participants_lottery

A participants lottery app

## How to fix API key errors (if you get the source code from GitHub)

1. Get an API key from [Multiavatar](https://multiavatar.com/) and save it to `.env` file. An example row: `MULTIAVATAR=insert-api-key-here`
2. Run the generator (it will create an `env.g.dart` file):

```bash
flutter pub run build_runner build
```
