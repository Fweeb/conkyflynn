--==============================================================================
--                                 conkyflynn.lua
--
--  author  : Jason van Gumster (Fweeb)
--  date    : 2012-12-19
--  license : Distributed under the terms of GNU GPL version 2 or later
--
--  notes : "Flynn" spritesheet pulled and converted from gkrellflynn... which,
--          in turn, pulled from Id Software's Doom.
--==============================================================================

require 'imlib2'

function conky_flynn()
    scriptpath = debug.getinfo(1).source:match("@(.*)$"):sub(0, -15)
    left, top = 155, 10
    w, h = 48, 64
    if conky_window == nil then return end
    imlib_set_cache_size(0)
    imlib_set_color_usage(128)
    imlib_context_set_dither(1)
    imlib_context_set_display(conky_window.display)
    imlib_context_set_visual(conky_window.visual)
    imlib_context_set_drawable(conky_window.drawable)

    image = imlib_load_image(scriptpath .. 'flynn.picture_alpha_big.png')
    if image == nil then return end
    update_num = tonumber(conky_parse('${updates}'))
    if update_num == 6 then -- This assumes you call conkyflynn at updates > 5
        cpulast = 0
    else
        cpulast = cpunow
    end
    cpunow = tonumber(conky_parse('${cpu}'))
    if cpunow - cpulast > 5 then
        offset = 3
    else
        offset = math.random(0,2)
    end
    imlib_context_set_image(image)
    imlib_context_set_blend(0)
    damage = math.floor((cpunow / 25) + 0.5)
    buffer = imlib_create_cropped_image(0, h * (5 * offset) + (h * damage), w, h)
    imlib_free_image()
    imlib_context_set_image(buffer)

    imlib_render_image_on_drawable(left, top)
    imlib_free_image()
end

