# monk-radicle 🐬 🌱

[monk.io](https://monk.io) | [Documentation](https://docs.monk.io) | [Other templates](https://monkhub.io) | [monk.io on Twitter](https://twitter.com/monk_io) | [monk.io Discord](https://discord.gg/WxDzaKe)

This is a 🐬 [Monk template](https://monk.io/) for a 🌱 [Radicle Seed Node](https://docs.radicle.xyz/docs/using-radicle/running-a-seed-node).

Monk can deploy a Radicle Seed Node with just one command and zero config.

## Deploy your Radicle Seed Node

💻 To run locally:

Take two minutes to [install Monk on your machine](https://docs.monk.io/docs/get-monk) if you don't have it already, then:

```bash
monk run radicle/seed
```

☁️ To run on AWS, GCP, Azure or DigitalOcean:

[Create your Monk cluster in 10 minutes](https://docs.monk.io/docs/monk-in-10) if you don't have one already, then:

```bash
monk run -t yourtag radicle/seed
```

That's it! You don't even have to pull this repo since `radicle/seed` is on [MonkHub](https://monkhub.io) 😎

## See it in action

Upon running this template Monk will display similar output:

```bash
🔩 templates/monk/radicle/seed
 └─🧊 Peer QmUnSSnVPXQKKcPKQ6DMWx27syXHJhct53nxMy8d4VpWGX
    └─📦 monk-radicle-seed-seed
       ├─🧩 gcr.io/monk-releases/radicle:latest
       ├─🔌 open 34.147.13.37:80 -> 80
       └─🔌 open 34.147.13.37:12345 -> 12345
```

Here `34.147.13.37` is the address of your Radicle Seed Node.

Visit `http://34.147.13.37:80` in your browser to check Radicle web UI.

## Tune your Radicle Seed Node

This template exposes the following default config:

```text
http-port: 80
peer-port: 12345
name: seedling-monk
```

To override these settings, make another template and inherit `radicle/seed`, like this:

```yaml
namespace: my-radicle

seed:
    defines: runnable
    inherits: radicle/seed
    variables:
        http-port: 8080
        name: my-super-cool-radicle-seed
```

Save as `my-radicle.yaml`

Run with `monk load my-radicle.yaml`, then `monk run my-radicle/seed`.

## Upgrade your Radicle Seed Node

It's easy with Monk, use:

```bash
monk update radicle/seed
```

It will pull the newest available version and upgrade without losing any data.

## Questions? Suggestions? Got stuck?

Happy to chat! Join us at [monk.io Discord](https://discord.gg/WxDzaKe).

---

[monk.io](https://monk.io) | [Documentation](https://docs.monk.io) | [Other templates](https://monkhub.io) | [monk.io on Twitter](https://twitter.com/monk_io) | [monk.io Discord](https://discord.gg/WxDzaKe)
