inireader
=========

Because, sadly, not every configuration file is in yml.

Seriously barebones ini reader.

Reads from:

[section]
key1=val1
key2=val2
key1=val3

[section2]
;I am a comment. I can do anything here
key1=key2=val1
key3=val2

To:

{
  section: {
    key1: 'val3',
    key2: 'val2'
  },
  section2: {
    key1: 'key2-val1'
    key3: 'val2'
  }
}