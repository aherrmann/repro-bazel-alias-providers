def _py_wrapped_library(ctx):
    print(str(ctx.label) + ": Wrapping " + str(ctx.attr.target.label))
    target = ctx.attr.target
    return [target[DefaultInfo], target[PyInfo]]

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
