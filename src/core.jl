
# An implicitly nested structure - represents columns, tables, multiple levels of grouped-by tables...
struct Tabular{I, T}
    index::I
    data::T
end

@inline index(t::Tabular) = t.index

@inline indices(t::Tabular) = _indices((index(t),), first(t))

@inline _indices(out::Tuple, t::Tabular) = _indices((out..., index(t)), first(t))
@inline _indices(out::Tuple, x) = out
