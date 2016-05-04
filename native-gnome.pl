use v6;
use NativeCall;

sub gnome_message_box_new(Str, Str)
    returns int32
    is native('gnomeui-2')
    { * }

gnome_message_box_new("We can haz NCI?", "oh lol");
