#include <glib/gprintf.h>
#include <i3ipc-glib/i3ipc-glib.h>

gint main() {
  i3ipcConnection *conn;
  gchar *reply;

  conn = i3ipc_connection_new(NULL, NULL);

  reply = i3ipc_connection_message(conn, I3IPC_MESSAGE_TYPE_COMMAND, "focus left", NULL);

  g_printf("Reply: %s\n", reply);

  g_free(reply);
  g_object_unref(conn);

  return 0;
}
