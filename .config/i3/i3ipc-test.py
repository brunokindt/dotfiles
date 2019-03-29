#!/usr/bin/env python3

import i3ipc

# Create the Connection object that can be used to send commands and subscribe
# to events.
i3 = i3ipc.Connection()

# Print the name of the focused window
focused = i3.get_tree().find_focused()
print('Focused window %s is on workspace %s' %
      (focused.name, focused.workspace().name))

# Query the ipc for outputs. The result is a list that represents the parsed
# reply of a command like `i3-msg -t get_outputs`.
outputs = i3.get_outputs()
for output in filter(lambda o: o.active, outputs):
    print('[active output] %s' % output.name)

# Send a command to be executed synchronously.
# i3.command('focus left')

# Take all fullscreen windows out of fullscreen
#for container in i3.get_tree().find_fullscreen():
#    container.command('fullscreen')

# Define a callback to be called when you switch workspaces.
def on_workspace_focus(self, e):
    # The first parameter is the connection to the ipc and the second is an object
    # with the data of the event sent from i3.
    if e.current:
        print('[workspace focus] %s' % e.current.name)
        # print('Windows on this workspace:')
        # for w in e.current.leaves():
        #     print(w.name)

# Dynamically name your workspaces after the current window class
def on_window_focus(i3, e):
    focused = i3.get_tree().find_focused()
    print("[window focus] %s:%s" % (focused.workspace().num, focused.window_class))

def on_window_new(i3, e):
    print("[window new] %s" % e.change)
    print("\t[container.name] %s" % e.container.name)
    print("\t[container.type] %s" % e.container.type)
    print("\t[container.command] %s" % e.container.command)
    print("\t[container.window] %s" % e.container.window)
    print("\t[container.window_role] %s" % e.container.window_role)
    print("\t[container.window_class] %s" % e.container.window_class)
    print("\t[container.urgent] %s" % e.container.urgent)
    print("\t[dir container] %s" % dir(e.container))
    print("-----------------")

# Subscribe to events
i3.on('workspace::focus', on_workspace_focus)
i3.on("window::focus", on_window_focus)
i3.on("window::new", on_window_new)

# Start the main loop and wait for events to come in.
i3.main()

# [workspace focus] 2
# [window focus] 2:UE4Editor
# [window focus] 2:UE4Editor
# [window focus] 2:UE4Editor
# [window focus] 2:UE4Editor
# [window new] new
#         [container.name] None
#         [container.type] con
#         [container.command] <bound method Con.command of <i3ipc.i3ipc.Con object at 0x7f4a71af3dd8>>
#         [container.window] 54526169
#         [container.window_role] None
#         [container.window_class] UE4Editor
#         [container.urgent] False
#         [dir container] ['__class__', '__delattr__', '__dict__', '__dir__', '__doc__', '__eq__', '__format__', '__ge__', '__getattribute__', '__gt__', '__hash__', '__init__', '__init_subclass__', '__iter__', '__le__', '__lt__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_conn', 'border', 'command', 'command_children', 'current_border_width', 'deco_rect', 'descendents', 'find_by_id', 'find_by_role', 'find_by_window', 'find_classed', 'find_focused', 'find_fullscreen', 'find_instanced', 'find_marked', 'find_named', 'floating', 'floating_nodes', 'focus', 'focused', 'fullscreen_mode', 'gaps', 'id', 'layout', 'leaves', 'marks', 'name', 'nodes', 'num', 'orientation', 'parent', 'percent', 'props', 'rect', 'root', 'scratchpad', 'scratchpad_state', 'type', 'urgent', 'window', 'window_class', 'window_instance', 'window_rect', 'window_role', 'workspace', 'workspaces']

