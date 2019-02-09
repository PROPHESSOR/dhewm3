# [Work In Progress] it4engine DECORATE Specification

This file format was created inspired by ZDoom DECORATE therefore it is called that way.

## Contents

- [Header](#header)
- [Actor](#actor)
- [Flags Section](#flags)
- [Properties Section](#properties)
- [Model/Animation Section](#model)

<a name="header"></a>

### Header

The header represents as a `// Version n` directive, where `n` - number of the it4dec edition.

<a name="actor"></a>

### Actor

An Actor is a self-sufficient class that represents a single entity.

Actor definition:

```java

Actor weapon_myweaponname : Weapon {
    // === Flags Section ===

    // === Properties Section ===
    SpawnClass "idWeapon"

    // Used by the Editor
    Editor.color                 ".3 .3 1"
    Editor.mins                  "-16 -16 0"
    Editor.maxs                  "16 16 32"
    Editor.usage                 "Shotgun"
    Editor.rotatable             "1"

    // Used by idItem
    Item.def_dropItem           "moveable_item_shotgun"
    Item.inv_name               "Shotgun"
    Item.inv_weapon             "weapon_shotgun"
    Item.inv_ammo_shells        "4"
    Item.inv_item               "5"

    Sound.acquire              "sound_weapon_acquire"
    Sound.respawn              "sound_weapon_respawn"

    // Used by idEntity
    Entity.size                 "32 32 32"
    Entity.model                "models/weapons/shotgun/w_shotgun2.lwo"

    // Used by idWeapon
    Weapon.model_view           "viewmodel_shotgun"
    Weapon.model_world          "worldmodel_shotgun"
    Weapon.joint_attach         "SHOTGUN_ATTACHER"
    Weapon.icon                 "guis/assets/hud/wpn_2"

    Weapon.weapon_scriptobject  "weapon_shotgun"
    Weapon.def_projectile       "projectile_bullet_shotgun"
    Weapon.ammoType             "ammo_shells"
    Weapon.ammoRequired         "1"
    Weapon.clipSize             "8"
    Weapon.lowAmmo              "2"
    Weapon.mtr_flashShader      "muzzleflash"
    Weapon.flashColor           "1 0.8 0.4"
    Weapon.flashRadius          "120"
    Weapon.silent_fire          "0"
    Weapon.recoilTime           "325"
    Weapon.recoilAngles         "-1 0 0"

    Weapon.weaponAngleOffsetAverages "15"
    Weapon.weaponAngleOffsetScale    ".40"
    Weapon.weaponAngleOffsetMax      "20"
    Weapon.weaponOffsetTime          "500"
    Weapon.weaponOffsetScale         "0.005"

    Weapon.hide_time            "0.3"
    Weapon.hide_distance        "-15"

    Weapon.smoke_muzzle         "shotgunmuzzlesmoke.prt"
    Weapon.def_ejectBrass       "debris_shotgunbrass"
    Weapon.ejectBrassDelay      "650"

    // Used by scripts
    Scripts.spread              "22"
    Scripts.skin_invisible      "skins/shotgun_invis"

    // === States Section ===

    States {
        Spawn:      // As an item in the world
        Ready:      // Default weapon state
            IDLE 0  // Start playing IDLE animation
            Loop
        Fire:       // When the fire button is pressed

        AltFire:    // When the secondary fire button is pressed
        Reload:     // When the reload button is pressed
        Select:     // When the weapon is selecting
            RAISE 0 // Start playing RAISE animation
            RAISE 1 A_PlaySound("player_shotgun_raise", CHAN_BODY) // On frame 1 play sound on channel CHAN_BODY
            Goto Ready
        Deselect:   // When the weapon is deselecting
            PUTAWAY 0 // Start playing PUTAWAY animation
            Stop
    }
}

```

A Model is the global model definition that can be used for many Actors.

```java
Model worldmodel_shotgun { // World view
    Mesh                       "models/md5/weapons/shotgun_world/worldshotgun.md5mesh"

    Animations {
        RAISE                  "models/md5/weapons/shotgun_world/shotgun_idle.md5anim"
        IDLE                   "models/md5/weapons/shotgun_world/shotgun_idle.md5anim"
        AIM                    "models/md5/weapons/shotgun_world/shotgun_idle.md5anim"
        FIRE1                  "models/md5/weapons/shotgun_world/shotgun_fire1.md5anim"
        FIRE2                  "models/md5/weapons/shotgun_world/shotgun_fire1.md5anim"
        FIRE3                  "models/md5/weapons/shotgun_world/shotgun_fire1.md5anim"
        RELOADSTART            "models/md5/weapons/shotgun_world/shotgun_idle.md5anim"
        RELOADLOOP1            "models/md5/weapons/shotgun_world/shotgun_idle.md5anim"
        RELOADLOOP2            "models/md5/weapons/shotgun_world/shotgun_idle.md5anim"
        RELOADEND              "models/md5/weapons/shotgun_world/shotgun_idle.md5anim"
        PUTAWAY                "models/md5/weapons/shotgun_world/shotgun_idle.md5anim"
    }
}

Model viewmodel_shotgun { // First person view
    Mesh                       "models/md5/weapons/shotgun_view/viewshotgun.md5mesh"

    Animations {
        RAISE                  "models/md5/weapons/shotgun_view/raise.md5anim"
        IDLE                   "models/md5/weapons/shotgun_view/idle.md5anim"
        FIRE1                  "models/md5/weapons/shotgun_view/fire1.md5anim"
        FIRE2                  "models/md5/weapons/shotgun_view/fire2.md5anim"
        FIRE3                  "models/md5/weapons/shotgun_view/fire3.md5anim"
        RELOADSTART            "models/md5/weapons/shotgun_view/reload_start.md5anim"
        RELOADLOOP1            "models/md5/weapons/shotgun_view/reload_loop.md5anim"
        RELOADLOOP2            "models/md5/weapons/shotgun_view/reload_loop2.md5anim"
        RELOADLOOP3            "models/md5/weapons/shotgun_view/reload_loop3.md5anim"
        RELOADEND              "models/md5/weapons/shotgun_view/reload_end.md5anim"
        NOAMMO                 "models/md5/weapons/shotgun_view/empty.md5anim"
        PUTAWAY                "models/md5/weapons/shotgun_view/lower.md5anim"
    }
}

```

<a name="flags"></a>

### Flags Section

// TODO: Learn more about the ways to create flags system

<a name="properties"></a>

### Properties Section

In the Properties Section you can define your class properties.
The property consists of 3 parts:

- Category (For structured properties)
- Property
- Value

Look at this example:

```c

// Version 1



```

### Relations

- idEntity
  - idItem
    - idWeapon
  - idAI
  - idProjectile
