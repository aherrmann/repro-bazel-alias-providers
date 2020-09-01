def _cc_wrapped_library(ctx):
    print(str(ctx.label) + ": Wrapping " + str(ctx.attr.target.label))
    target = ctx.attr.target
    return [target[DefaultInfo], target[CcInfo]]

cc_wrapper_library = rule(
    _cc_wrapped_library,
    attrs = {"target": attr.label()},
)

def _debug_impl(ctx):
    print(
        str(ctx.label) +
        ": Debugging " +
        str(ctx.attr.target) +
        (" has CcInfo" if CcInfo in ctx.attr.target else " no CcInfo"))

debug = rule(
    _debug_impl,
    attrs = {"target": attr.label()},
)
