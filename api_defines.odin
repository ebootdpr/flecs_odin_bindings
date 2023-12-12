package flecs

import "core:c"
import "core:reflect"
import "core:strings"

ecs_poly_t :: rawptr 
ecs_string_t :: ^c.char
// bool :: c.char 
ecs_char_t :: c.char 
ecs_bool_t :: c.bool 
// char :: c.unsigned ecs_byte_t;
ecs_flags8_t :: c.uint8_t 
ecs_i8_t :: c.int8_t 
ecs_u8_t :: c.uint8_t 
ecs_i16_t :: c.int16_t 
ecs_flags16_t :: c.uint16_t 
ecs_u16_t :: c.uint16_t 
ecs_u32_t :: c.uint32_t 
ecs_flags32_t :: c.uint32_t 
ecs_size_t :: c.int32_t 
ecs_i32_t :: c.int32_t 
ecs_i64_t :: c.int64_t 
ecs_flags64_t :: c.uint64_t 
ecs_id_t :: c.uint64_t 
ecs_map_data_t :: c.uint64_t 
ecs_os_thread_id_t :: c.uint64_t 
os_thread_id_t :: c.uint64_t 
ecs_u64_t :: c.uint64_t 
ecs_os_thread_t :: c.uintptr_t 
ecs_os_cond_t :: c.uintptr_t 
ecs_os_mutex_t :: c.uintptr_t 
ecs_os_dl_t :: c.uintptr_t 
ecs_os_sock_t :: c.uintptr_t 
ecs_uptr_t :: c.uintptr_t 
ecs_iptr_t :: c.intptr_t 
ecs_f32_t :: c.float 
ecs_f64_t :: c.double 
// typedef ecs_id_t ecs_entity_t;
// typedef ecs_map_data_t ecs_map_key_t;
// typedef ecs_map_data_t ecs_map_val_t;
// typedef ecs_iterable_t EcsIterable;
flags8_t :: c.uint8_t
flags16_t :: c.uint16_t
flags32_t :: c.uint32_t
flags64_t :: c.uint64_t

size_t :: c.int32_t

map_key_t :: c.uint64_t
ecs_map_val_t :: c.uint64_t


va_list :: cstring

os_thread_t :: c.uintptr_t
os_cond_t :: c.uintptr_t
os_mutex_t :: c.uintptr_t
os_dl_t :: c.uintptr_t
os_sock_t :: c.uintptr_t

ftime_t :: c.float

ROW_MASK :: uint(0x0FFFFFFF)
ROW_FLAGS_MASK :: ~ROW_MASK

// TODO: Change all generics to actual types
// #define ECS_RECORD_TO_ROW(v)          (ECS_CAST(int32_t, (ECS_CAST(uint32_t, v) & ECS_ROW_MASK)))
RECORD_TO_ROW :: proc($V) -> c.int32_t
{
    return cast(c.int32_t)(cast(c.int32_t)V & ROW_MASK)
}

// #define ECS_RECORD_TO_ROW_FLAGS(v)    (ECS_CAST(uint32_t, v) & ECS_ROW_FLAGS_MASK)
RECORD_TO_ROW_FLAGS :: proc($V) -> c.uint32_t
{
    return cast(c.uint32_t)V & ROW_FLAGS_MASK
}

// #define ECS_ROW_TO_RECORD(row, flags) (ECS_CAST(uint32_t, (ECS_CAST(uint32_t, row) | (flags))))
ROW_TO_RECORD :: proc($Row, $Flags) -> c.uint32_t
{
    return cast(c.uint32_t)(cast(c.uint32_t)Row | (Flags))
}

// #define ECS_ID_FLAGS_MASK             (0xFFull << 60)
ID_FLAGS_MASK :: u64(255) << 56
// #define ECS_ENTITY_MASK               (0xFFFFFFFFull)
ENTITY_MASK :: u64(0xFFFFFFFF)
// #define ECS_GENERATION_MASK           (0xFFFFull << 32)
GENERATION_MASK :: u64(0xFFFF) << 32

// #define ECS_GENERATION(e)             ((e & ECS_GENERATION_MASK) >> 32)
GENERATION :: proc($E) -> u64
{
    return ((E & GENERATION_MASK) >> 32)
}

// #define ECS_GENERATION_INC(e)         ((e & ~ECS_GENERATION_MASK) | ((0xFFFF & (ECS_GENERATION(e) + 1)) << 32))
GENERATION_INC :: proc($E) -> u64
{
    return ((E & ~GENERATION_MASK) | ((0xFFFF & (GENERATION(E) + 1)) << 32))
}

// #define ECS_COMPONENT_MASK            (~ECS_ID_FLAGS_MASK)
COMPONENT_MASK :: ~ID_FLAGS_MASK

// #define ECS_HAS_ID_FLAG(e, flag)      ((e) & ECS_##flag)
// HAS_ID_FLAG uses token pasting


// #define ECS_IS_PAIR(id)               (((id) & ECS_ID_FLAGS_MASK) == ECS_PAIR)
IS_PAIR :: proc($ID) -> bool
{
    return ((ID) & ID_FLAGS_MASK) == PAIR
}

// #define ECS_PAIR_FIRST(e)             (ecs_entity_t_hi(e & ECS_COMPONENT_MASK))
PAIR_FIRST :: proc(E: Entity) -> c.uint64_t
{
    return entity_t_hi(E & COMPONENT_MASK)
}

// #define ECS_PAIR_SECOND(e)            (ecs_entity_t_lo(e))
PAIR_SECOND :: proc(E: Entity) -> c.uint64_t
{
    return entity_t_lo(E)
}

// #define ECS_HAS_RELATION(e, rel)      (ECS_HAS_ID_FLAG(e, PAIR) && (ECS_PAIR_FIRST(e) == rel))
// HAS_RELATION uses token pasting

// #define ecs_entity_t_lo(value) ECS_CAST(uint32_t, value)
entity_t_lo :: proc(Val: Entity) -> c.uint64_t
{
    return Val
}

// #define ecs_entity_t_hi(value) ECS_CAST(uint32_t, (value) >> 32)
entity_t_hi :: proc(Val: Entity) -> c.uint64_t
{
    return Val >> 32
}

// #define ecs_entity_t_comb(lo, hi) ((ECS_CAST(uint64_t, hi) << 32) + ECS_CAST(uint32_t, lo))
entity_t_comb :: proc(Lo: Entity, Hi: Entity) -> c.uint64_t
{
    return ((Hi << 32) + Lo)
}

//#define ecs_pair(pred, obj) (ECS_PAIR | ecs_entity_t_comb(obj, pred))
//#define ecs_pair(pred, obj) (ECS_PAIR | ecs_entity_t_comb(obj, ecs_id(pred)))
// #define ecs_pair(pred, obj) (ECS_PAIR | ecs_entity_t_comb(obj, pred))
pair :: proc(Pred: Entity, Obj: Entity) -> c.uint64_t
{
    // return (PAIR | entity_t_comb(Obj, Pred))
    //#define ecs_id(T) FLECS_ID##T##ID_
    return (PAIR | entity_t_comb(Obj, Pred))
}

// #define ecs_pair_t(pred, obj) (ECS_PAIR | ecs_entity_t_comb(obj, ecs_id(pred)))
pair_first :: proc(world: ^World, pair: Entity) -> c.uint64_t
{
    return ecs_get_alive(world, PAIR_FIRST(pair))
}

// #define ecs_pair_first(world, pair) ecs_get_alive(world, ECS_PAIR_FIRST(pair))
// #define ecs_pair_second(world, pair) ecs_get_alive(world, ECS_PAIR_SECOND(pair))
pair_second :: proc(world: ^World, pair: Entity) -> c.uint64_t
{
    return ecs_get_alive(world, PAIR_SECOND(pair))
}

// #define ecs_pair_relation ecs_pair_first
pair_relation :: pair_first
// #define ecs_pair_object ecs_pair_second
pair_object :: pair_second

// #define ecs_poly_id(tag) ecs_pair(ecs_id(EcsPoly), tag)
// poly_id uses ecs_id

PAIR :: u64(1) << 63

/*
#define EcsIterNextYield  (0) 
#define EcsIterYield      (-1)  
#define EcsIterNext  (1)  
*/
EcsIterNextYield :: 0  
EcsIterYield :: -1  
EcsIterNext :: 1  

// Create an entity from a typeid
id :: proc(world: ^World, $T: typeid) -> Entity
{
    edesc: EntityDesc
    name_c := strings.clone_to_cstring(_GetTypeName(T))
    edesc.name = name_c
    edesc.symbol = name_c
    return ecs_entity_init(world, &edesc)
}