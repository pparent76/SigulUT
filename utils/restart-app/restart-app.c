#include <gio/gio.h>

int main(void)
{
    GDBusConnection *c = g_bus_get_sync(G_BUS_TYPE_SESSION, NULL, NULL);

    g_dbus_connection_call_sync(
        c,
        "com.lomiri.Postal",
        "/com/lomiri/Postal/signalut_2epparent",
        "com.lomiri.Postal",
        "Post",
        g_variant_new("(ss)",
            "signalut.pparent_signallauncher",
            "{\"message\": \"launch\", \"notification\":{}}"),
        NULL,
        G_DBUS_CALL_FLAGS_NONE,
        -1,
        NULL,
        NULL
    );

    g_object_unref(c);
    return 0;
}
