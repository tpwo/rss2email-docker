# rss2email Docker Config

Configuration for my dockerized instance of [rss2email](https://github.com/skx/rss2email).

## Requirements

* Docker with compose
* [just](https://github.com/casey/just) command runner

## Initial setup

Clone repo and enter the folder:

```
git clone https://github.com/tpwo/rss2email-docker-config
cd rss2email-docker-config
```

Create `.env` file by providing your values for:

- `SMTP_USERNAME` -> recipient and sender address
- `SMTP_PASSWORD` -> your email password, e.g. for Gmail you have to enable 2FA and create an app password [here](https://myaccount.google.com/apppasswords)
- `SMTP_HOST` -> e.g. `smtp.gmail.com` for Gmail
- `SMTP_PORT` -> e.g. `587` for Gmail

You can copy the sample file and edit it:

```
cp .env{.sample,}
```

## Running

To start:

```
just up
```

To stop:

```
just stop
```

See all commands:

```
just
```
