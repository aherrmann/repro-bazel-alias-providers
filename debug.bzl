def _cc_wrapped_library(ctx):
    target = ctx.attr.target
    return [target[DefaultInfo], target[CcInfo]]

cc_wrapper_library = rule(
    _cc_wrapped_library,
    attrs = {"target": attr.label()},
)

def _debug_impl(ctx):
    print(ctx.attr.target)
    if CcInfo in ctx.attr.target:
        print(ctx.attr.target[CcInfo])

debug = rule(
    _debug_impl,
    attrs = {"target": attr.label()},
)
