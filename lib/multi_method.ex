defmodule MultiMethod do
  defmacro defmulti(call, expression)
  defmacro defmulti({name, _, args}, do: dispatcher_block) do
    quote do
      Kernel.def unquote(name)(unquote_splicing(args)) do
        dispatch_value = unquote(dispatcher_block)
        unquote(name)(dispatch_value, unquote_splicing(args))
      end
    end
  end

  defmacro defmethod(call, expression)
  defmacro defmethod({name, _, args}, do: method_block) do
    quote do
      Kernel.defp unquote(name)(unquote_splicing(args)), do: unquote(method_block)
    end
  end
end
