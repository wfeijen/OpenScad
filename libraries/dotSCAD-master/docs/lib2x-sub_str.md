# sub_str

The dir changed since 2.0. 

Returns the part of the string from `begin` to `end`, or to the `end` of the string (`end` not included).

## Parameters

- `t` : The original string.
- `begin` : The beginning index, inclusive.
- `end` : The ending index, exclusive. If it's omitted, the substring begins with the character at the specified `begin` and extends to the end of the original string.

## Examples

    use <util/sub_str.scad>;
    
	echo(sub_str("helloworld", 0, 5)); // ECHO: "hello"
	echo(sub_str("helloworld", 5));    // ECHO: "world"
