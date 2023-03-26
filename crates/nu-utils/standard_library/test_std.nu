use std.nu

export def test_path_add [] {
    use std.nu "assert equal"

    with-env [PATH []] {
        assert equal $env.PATH []

        std path add "/foo/"
        assert equal $env.PATH ["/foo/"]

        std path add "/bar/" "/baz/"
        assert equal $env.PATH ["/bar/", "/baz/", "/foo/"]

        let-env PATH = []

        std path add "foo"
        std path add "bar" "baz" --append
        assert equal $env.PATH ["foo", "bar", "baz"]

        assert equal (std path add "fooooo" --ret) ["fooooo", "foo", "bar", "baz"]
        assert equal $env.PATH ["fooooo", "foo", "bar", "baz"]
    }
}
