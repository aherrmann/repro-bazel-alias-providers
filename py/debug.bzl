def _py_wrapped_library(ctx):
    print(str(ctx.label) + ": Wrapping " + str(ctx.attr.target.label))
    target = ctx.attr.target
    py_info = PyInfo(
        transitive_sources = target[PyInfo].transitive_sources,
        uses_shared_libraries = target[PyInfo].uses_shared_libraries,
        imports = target[PyInfo].imports,
        has_py2_only_sources = target[PyInfo].has_py2_only_sources,
        has_py3_only_sources = target[PyInfo].has_py3_only_sources,
    )
    return [target[DefaultInfo], py_info]

py_wrapper_library = rule(
    _py_wrapped_library,
    attrs = {"target": attr.label()},
)

def _debug_impl(ctx):
    print(
        str(ctx.label) +
        ": Debugging " +
        str(ctx.attr.target) +
        (" has PyInfo" if PyInfo in ctx.attr.target else " no PyInfo"))

debug = rule(
    _debug_impl,
    attrs = {"target": attr.label()},
)
