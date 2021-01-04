# Docker image for 7 Days to Die Dedicated Server w/ Darkness Falls

## Docker the image
1. Ensure `/config` is mounted inside the runtime, ie `-v /opt/7dtd/:/config`
1. First time it runs, it populates a sample `serverconfig.xml` then exits,
  giving you time to modify it to your needs.
1. Map data gets symlinked into `/config/Saves/`

## Update automation
IFTTT monitors the RSS feed of the
 [mod's upstream repo](https://gitlab.com/KhaineGB/darknessfallsa19server),
 and will trigger a dockerhub rebuild of the image. Additionally, dockerhub
 has been configured to update if the base game also gets updated.