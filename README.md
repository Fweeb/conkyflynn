# ConkyFlynn!

![Flynn](https://raw.github.com/Fweeb/conkyflynn/master/flynn.png)

This is a [currently rough] Conky port of the very cool [Flynn plugin for Gkrellm by Henryk Richter](http://bax.comlab.uni-rostock.de/en/projects/flynn.html). It's "a tiny system load meter". Flynn is a guy who suffers from your activity. The higher your processor load, the more he bleeds.

Flynn is the notorious ["Doom Guy" from Id Software's Doom series](http://en.wikipedia.org/wiki/Doomguy).

## REQUIREMENTS

Conky, with Lua and Imlib2 bindings enabled.

## USAGE

**IMPORTANT** In order for this to work, `flynn.picture_alpha_big.png` *must* be in the same directory as `conkyflynn.lua`.

If you have no other Lua scripts for your Conky config, it's simple. Just add the following above the TEXT line in your `.conkyrc` file:

    lua_load /path/to/your/conkyflynn.lua
    lua_draw_hook_post flynn

If you do have other Lua scripts for your Conky config, you have a couple options. Either copy the contents of `conkyflynn.lua` to your own Conky Lua script or import it into your script with a require statement, like so:

    package.path = 'path/to/your/scripts/?.lua'
    require 'conkyflynn'

Then, regardless of which way you choose to do it, include the `conky_flynn()` function in whichever function you reference from the `lua_draw_hook` line in your `.conkyrc` file.

To position Flynn in your Conky, adjust the left, top variables in `conkyflynn.lua`. They're currently set to my Conky config of 1i55, 10

## KNOWN ISSUES

Flynn's alpha channel doesn't quite work right yet. If Imlib2's blend context is set to 1 (`imlib_context_set_blend(1)`), then the image seems to be treated like it has a pre-multiplied alpha channel. Setting it to 0 ensures proper colors and Flynn will overlay on your background just fine... he just doesn't composite well over other Conky elements. I'm no Imlib2 or Conky expert, so any insight here would be greatly appreciated.

## TO DO

  * Make Flynn clickable, so he smiles when clicked (just like the Gkrellm plugin. Alternatively, it might be fun to make smiling mean something different (e.g. new mail, IM, or some other notification).
  * Think of something fun for Flynn's "God Mode" sprite. The notifier idea above     might be viable here, too/instead.
