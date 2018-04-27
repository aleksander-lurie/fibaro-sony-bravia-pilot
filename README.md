# fibaro-sony-bravia-pilot
Fibaro Virtual Device for controlling the Sony Bravia TV

## How to

# Scenes
* login to your Fibaro Home Center
* go to the `Scenes` tab
* create a new one scene called `Sony Bravia Pilot`
* set `Max. running instances` to 1
* set `Run scene` to manual
* select `Scene hidden`
* go to advanced tab
* paste `sony-bravia-pilot.lua` content to the textfield
* save your scene
* scroll down and copy scene
* paste `sony-bravia-app-control.lua` content to the textfield
* back to the general tab
* rename copied scene as `Sony Bravia App Control`
* save your scene

# Variables
* go to the `Panels` tab
* click on the `Variables Panel` at the left menu
* create variables: `SB_APP`, `SB_APPCTRL_SCENEID`, `SB_IRCC`, `SB_PILOT_SCENEID`, `SB_PSK`, `SB_IP`
* set your sony bravia key to the `SB_PSK` variabe
* set your `Sony Bravia Pilot` scene id to the `SB_PILOT_SCENEID`
* set your `Sony Bravia App Control` scene id to the `SB_APPCTRL_SCENEID`

# Virtual Device
* go to `Devices` tab
* click on the `Add or remove device` at the left menu
* scroll down to the `To add the Virtual Device` section and import a `fibaro-sony-bravia-pilot.vfib`
* set ip of your Sony Bravia TV
* assign a new created device to your room

That's it :D
