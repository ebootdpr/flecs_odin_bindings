package flecs

import "core:c"

HI_COMPONENT_ID :: 256

// MAX_COMPONENT_ID not implementable
// #define ECS_MAX_COMPONENT_ID (~((uint32_t)(ECS_ID_FLAGS_MASK >> 32)))
// #define ECS_MAX_RECURSION (512)
// #define ECS_MAX_TOKEN_SIZE (256)
MAX_RECURSION :: 512

MAX_TOKEN_SIZE :: 256

/*
#define ECS_OFFSET(o, offset) (void*)(((uintptr_t)(o)) + ((uintptr_t)(offset)))
#endif
#define ECS_OFFSET_T(o, T) ECS_OFFSET(o, ECS_SIZEOF(T))
#define ECS_ELEM(ptr, size, index) ECS_OFFSET(ptr, (size) * (index))
#define ECS_ELEM_T(o, T, index) ECS_ELEM(o, ECS_SIZEOF(T), index)
#define ECS_BIT_SET(flags, bit) (flags) |= (bit)
#define ECS_BIT_CLEAR(flags, bit) (flags) &= ~(bit) 
#define ECS_BIT_COND(flags, bit, cond) ((cond) \
    ? (ECS_BIT_SET(flags, bit)) \
    : (ECS_BIT_CLEAR(flags, bit)))
#define ECS_BIT_IS_SET(flags, bit) ((flags) & (bit))
*/
OFFSET :: proc(o: c.uintptr_t, offset: c.uintptr_t) -> rawptr
{
    return cast(rawptr)(o + offset)
}

OFFSET_T :: proc(o: c.uintptr_t, $T: typeid) -> rawptr
{
    return OFFSET(o, size_of(T))
}

ELEM :: proc(ptr: c.uintptr_t, size: c.int32_t, index: c.int32_t) -> rawptr
{
    return OFFSET(ptr, cast(c.uintptr_t)(size * index))
}

ELEM_T :: proc(o: c.uintptr_t, $T: typeid, index: c.int32_t) -> rawptr
{
    return ELEM(o, size_of(T), index)
}