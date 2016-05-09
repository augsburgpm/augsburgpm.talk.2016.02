use v6;
use NativeCall;
constant GTKLIB = 'gtk-3';

sub gtk_init(int32, CArray[Str])
returns int32
is native(GTKLIB)
{*}

sub gtk_window_new(int32)
returns Pointer
is native(GTKLIB)
{*}

sub gtk_button_new_with_label (Str)
returns Pointer
is native(GTKLIB)
{*}

sub gtk_container_add(Pointer, Pointer)
returns int32
is native(GTKLIB)
{*}

sub gtk_widget_show_all(Pointer)
returns int32
is native(GTKLIB)
{*}

sub gtk_main()
is native(GTKLIB)
{*}

sub g_signal_connect_object (Pointer, Str, &callback (), Pointer, Pointer)
returns int32
is native(GTKLIB)
{*}

sub gtk_main_quit ()
is native(GTKLIB)
{*}

sub click_handler {
    say "clicked";
    gtk_main_quit();
}

sub MAIN () {
    my @argv := CArray[Str].new;
    gtk_init(0, @argv);

    my $window = gtk_window_new(0);
    my $button = gtk_button_new_with_label("Hallihallo");
    g_signal_connect_object($button, "clicked", &click_handler, Nil, Nil);
    gtk_container_add($window, $button);
    gtk_widget_show_all($window);
    gtk_main();
}


=finish
#include <gtk/gtk.h>

/* Rückruffunktion - aufgerufen, wenn die Schaltfläche geklickt wurde */
void on_button_clicked (GtkButton *button, gpointer data)
{
  g_print ("Knopf '%s' geklickt!\n", gtk_button_get_label (button));
  gtk_main_quit ();  /* Beendet das Programm */
}

int main (int argc, char *argv[])
{
  GtkWidget *window;
  GtkWidget *button;

  /* GTK+ initialisieren */
  gtk_init (&argc, &argv);

  /* Hauptfenster erstellen, Titel setzen, Rahmenabstand setzen */
  window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
  gtk_window_set_title (GTK_WINDOW (window), "Hallo Welt!");
  gtk_container_set_border_width (GTK_CONTAINER (window), 10);

  /* Schaltfläche erstellen und dem Fenster hinzufügen */
  button = gtk_button_new_with_label ("Hallo Wikipedia!");
  gtk_container_add (GTK_CONTAINER (window), button);

  /* Signale mit Rückruffunktionen verbinden */
  g_signal_connect (window, "destroy", G_CALLBACK (gtk_main_quit), NULL);
  g_signal_connect (button, "clicked", G_CALLBACK (on_button_clicked), NULL);

  /* Fenster und all seine Unterelemente anzeigen */
  gtk_widget_show_all (window);

  /* Haupt-Ereignisschleife starten */
  gtk_main ();

  return 0;
}
