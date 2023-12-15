package flecs
import "core:strings"
import "core:c"
import "core:reflect"
import "core:c/libc"
import "core:mem"



ECS_COMPONENT :: proc{ECS_COMPONENT_TYPE_IS_NAME,
    ECS_COMPONENT_WITH_CUSTOM_NAME} 

ECS_COMPONENT_TYPE_IS_NAME :: proc(world: ^world_t, $T: typeid) -> Entity
{
    edesc: entity_desc_t
    desc: component_desc_t

    edesc.name = _Get_Type_Name(T)
    edesc.symbol = _Get_Type_Name(T)
    edesc.use_low_id = true
    
    desc.entity =  ecs_entity_init(world, &edesc)
    desc.type_.size = size_of(T)
    desc.type_.alignment = align_of(T)
    

    id :=  ecs_component_init(world, &desc)
    return id
}
ECS_COMPONENT_WITH_CUSTOM_NAME :: proc(world: ^world_t, $T: typeid, name: cstring) -> Entity
{
    edesc: entity_desc_t
    desc: component_desc_t

    edesc.name = name
    edesc.symbol = name
    edesc.use_low_id = true
    
    desc.entity =  ecs_entity_init(world, &edesc)
    desc.type_.size = size_of(T)
    desc.type_.alignment = align_of(T)
    

    id :=  ecs_component_init(world, &desc)
    return id
}

ecs_add :: proc(world: ^world_t, entity: Entity, $T: typeid)
{
    ecs_add_id(world, entity, ecs_id(world, T))
}

ecs_add_pair :: proc(world: ^world_t, subject: Entity, first: Entity, second: Entity)
{
    ecs_add_id(world, subject, ecs_pair(first, second))
}
ecs_add_pair2 :: proc(world: ^world_t, subject: Entity, first: Entity, second: Entity)
{
    ecs_add_id(world, subject, ecs_Pair(first, second))
}

ecs_new_from_type :: proc(world: ^world_t, $T: typeid) -> Entity
{
    return ecs_new_w_id(world, ecs_id(world, T))
}

ecs_new_entity:: proc(world: ^world_t, name: cstring) -> Entity{
    edesc := &entity_desc_t{}
    edesc.name = name
    return ecs_entity_init(world,edesc)
}

ecs_new_w_pair :: proc(world: ^world_t, first: Entity, second: Entity) -> Entity
{
    return ecs_new_w_id(world, ecs_pair(first, second))
}

ecs_bulk_new :: proc(world: ^world_t, $component: typeid, count: c.int32_t) -> ^Entity
{
    cdesc: ComponentDesc
    cdesc.type_.size = size_of(component)
    cdesc.type_.alignment = align_of(component)

    id := ecs_component_init(world, &cdesc)

    return ecs_bulk_new_w_id(world, id, count)
}

ecs_entity_lowid :: proc(world: ^world_t, n: cstring) -> Entity
{
    edesc: entity_desc_t
    edesc.name = n
    edesc.symbol = n
    edesc.use_low_id = true

    return ecs_entity_init(world, &edesc)
}
ecs_entity :: proc(world: ^world_t, n: cstring) -> Entity
{
    edesc: entity_desc_t
    edesc.name = n
    edesc.symbol = n

    return ecs_entity_init(world, &edesc)
}

//TODO
// ecs_new_prefab :: proc(world: ^world_t, n: cstring) -> Entity
// {
//     edesc: entity_desc_t
//     edesc.name = n
//     edesc.symbol = n
//     edesc.add[0] = EcsPrefab

//     return ecs_entity_init(world, &edesc)
// }

// Add

// Remove


ecs_remove :: proc(world: ^world_t, entity: Entity, $T: typeid)
{
    ecs_remove_id(world, entity, ecs_id(world, T))
}

ecs_remove_pair :: proc(world: ^world_t, subject: Entity, first: Entity, second: Entity)
{
    ecs_remove_id(world, subject, ecs_pair(first, second))
}


// Override


ecs_override :: proc(world: ^world_t, entity: Entity, $T: typeid)
{
    ecs_override_id(world, entity, ecs_id(world, T))
}

ecs_override_pair :: proc(world: ^world_t, subject: Entity, first: Entity, second: Entity)
{
    ecs_override_id(world, subject, ecs_pair(first, second))
}


// Bulk remove/delete


ecs_delete_children :: proc(world: ^world_t, parent: Entity)
{
    ecs_delete_with(world, ecs_pair(EcsChildOf_ID, parent))
}


// Set


ecs_set_ptr :: proc(world: ^world_t, entity: Entity, $component: typeid, ptr: rawptr) -> Entity
{
    cdesc: ComponentDesc
    cdesc.entity = ecs_id(world, component)
    cdesc.type_.size = size_of(component)
    cdesc.type_.alignment = align_of(component)
    id := ecs_component_init(world, &cdesc)

    return ecs_set_id(world, entity, id, size_of(component), ptr)
}

ecs_set :: proc(world: ^world_t, entity: Entity, $component: typeid, args: component) -> Entity
{
    cdesc: ComponentDesc
    cdesc.entity = ecs_id(world, component)
    cdesc.type_.size = size_of(component)
    cdesc.type_.alignment = align_of(component)
    id := ecs_component_init(world, &cdesc)

    args := args

    return ecs_set_id(world, entity, id, size_of(component), &args)
}


ecs_set_pair :: proc(world: ^world_t, subject: Entity, $First: typeid, second: Entity, args: First) -> Entity
{
    cdesc: component_desc_t
    cdesc.entity = ecs_id(world, First)
    cdesc.type_.size = size_of(First)
    cdesc.type_.alignment = align_of(First)
    id := ecs_component_init(world, &cdesc)

    args := args

    return ecs_set_id(world, subject, ecs_pair(id, second), size_of(First), &args)
}

ecs_set_pair_second :: proc(world: ^world_t, subject: Entity, first: Entity, $Second: typeid, args: Second) -> Entity
{
    cdesc: ComponentDesc
    cdesc.entity = ecs_id(world, Second)
    cdesc.type_.size = size_of(Second)
    cdesc.type_.alignment = align_of(Second)
    id := ecs_component_init(world, &cdesc)

    args := args

    return ecs_set_id(world, subject, ecs_pair(first, id), size_of(Second), &args)
}



ecs_set_override :: proc(world: ^world_t, entity: Entity, $T: typeid, args: T) -> Entity
{
    add_id(world, entity, IdBitFlags.OVERRIDE | ecs_id(world, T))
    set(world, entity, T, args)
}


// Emplace


ecs_emplace :: proc(world: ^world_t, entity: Entity, $T: typeid) -> ^T
{
    return cast(^T)emplace_id(world, entity, ecs_id(world, T))
}


// Get


ecs_get :: proc(world: ^world_t, entity: Entity, $T: typeid) -> ^T
{
    return cast(^T)ecs_get_id(world, entity, ecs_id(world, T))
}

ecs_get_pair :: proc(world: ^world_t, subject: Entity, $First: typeid, second: Entity) -> ^First
{
    return cast(^First)ecs_get_id(world, subject, ecs_pair(id(world, First), second))
}

ecs_get_pair_second :: proc(world: ^world_t, subject: Entity, first: Entity, $Second: typeid) -> ^Second
{
    return cast(^Second)ecs_get_id(world, subject, ecs_pair(first, id(world, Second)))
}


// Get from record


ecs_record_get :: proc(world: ^world_t, record: ^record_t, $T: typeid) -> ^T
{
    return cast(^T)ecs_record_get_id(world, record, ecs_id(world, T))
}

ecs_record_get_pair :: proc(world: ^world_t, record: ^record_t, $First: typeid, second: Entity) -> ^First
{
    return cast(^First)ecs_record_get_id(world, record, pair(id(world, First), second))
}

ecs_record_get_pair_second :: proc(world: ^world_t, record: ^record_t, first: Entity, $Second: typeid) -> ^Second
{
    return cast(^Second)ecs_record_get_id(world, record, pair(first, id(world, Second)))
}


// Ref


ecs_ref_init :: proc(world: ^world_t, entity: Entity, $T: typeid) -> ref_t
{
    return ref_init_id(world, entity, ecs_id(world, T))
}

ecs_ref_get :: proc(world: ^world_t, ref: ^ref_t, $T: typeid) -> ^T
{
    return cast(^T)ref_get_id(world, ref, ecs_id(world, T))
}


// Modified


ecs_modified :: proc(world: ^world_t, entity: Entity, $component: typeid)
{
    ecs_modified_id(world, entity, id(component))
}

ecs_modified_pair :: proc(world: ^world_t, subject: Entity, first: Entity, second: Entity)
{
    ecs_modified_id(world, subject, ecs_pair(first, second))
}


// Singletons


ecs_singleton_add :: proc(world: ^world_t, $comp: typeid)
{
    add(world, id(world, comp), comp)
}

ecs_singleton_remove :: proc(world: ^world_t, $comp: typeid)
{
    remove(world, id(world, comp), comp)
}

ecs_singleton_get :: proc(world: ^world_t, $comp: typeid) -> ^comp
{
    return get(world, id(world, comp), comp)
}

ecs_singleton_set :: proc(world: ^world_t, $comp: typeid, args: comp)
{
    set(world, id(world, comp), comp, args)
}

ecs_singleton_modified :: proc(world: ^world_t, $comp: typeid)
{
    modified(world, id(comp), comp)
}


// Has, Owns & Shares


ecs_has :: proc(world: ^world_t, entity: Entity, $T: typeid) -> c.bool
{
    return has_id(world, entity, id(T))
}

ecs_has_pair :: proc(world: ^world_t, entity: Entity, first: Entity, second: Entity) -> c.bool
{
    return ecs_has_id(world, entity, ecs_pair(first, second))
}

//hmm
// ecs_owns_id :: proc(world: ^world_t, entity: Entity, id: id_t) -> c.bool
// {
//     return (ecs_search(world, ecs_get_table(world, entity), id, nil) != -1)
// }

ecs_owns_pair :: proc(world: ^world_t, entity: Entity, first: Entity, second: Entity) -> c.bool
{
    return ecs_owns_id(world, entity, ecs_pair(first, second))
}

ecs_owns :: proc(world: ^world_t, entity: Entity, $T: typeid) -> c.bool
{
    return ecs_owns_id(world, entity, ecs_id(world, T))
}

// ecs_shares_id :: proc(world: ^world_t, entity: Entity, id: id_t) -> c.bool
// {
//     return (ecs_search_relation(world, ecs_get_table(world, entity), 0, id, EcsIsA, 1, nil, nil, nil) != -1)
// }

// ecs_shares_pair :: proc(world: ^world_t, entity: Entity, first: Entity, second: Entity) -> c.bool
// {
//     return ecs_shares_id(world, entity, ecs_pair(first, second))
// }

ecs_shares :: proc(world: ^world_t, entity: Entity, $T: typeid) -> c.bool
{
    return ecs_shares_id(world, entity, id(T))
}


// Enable / Disable component


ecs_enable_component :: proc(world: ^world_t, entity: Entity, $T: typeid, enable: c.bool)
{
    enable_id(world, entity, id(T), enable)
}

ecs_is_enabled_component :: proc(world: ^world_t, entity: Entity, $T: typeid) -> c.bool
{
    return is_enabled_id(world, entity, id(T))
}

ecs_enable_pair :: proc(world: ^world_t, entity: Entity, $First: typeid, second: Entity, enable: c.bool)
{
    enable_id(world, entity, pair(id(First), second), enable)
}

ecs_is_enabled_pair :: proc(world: ^world_t, entity: Entity, $First: typeid, second: Entity) -> c.bool
{
    return is_enabled_id(world, entity, pair(id(First), second))
}


// Count


ecs_count :: proc(world: ^world_t, $type: typeid) -> c.int32_t
{
    return count_id(world, id(type))
}


// Lookups & Paths


ecs_lookup_path :: proc(world: ^world_t, parent: Entity, path: cstring) -> Entity
{
    return ecs_lookup_path_w_sep(world, parent, path, ".", nil, true)
}

ecs_lookup_fullpath :: proc(world: ^world_t, path: cstring) -> Entity
{
    return ecs_lookup_path_w_sep(world, 0, path, ".", nil, true)
}

ecs_get_path :: proc(world: ^world_t, parent: Entity, child: Entity) -> cstring
{
    return ecs_get_path_w_sep(world, parent, child, ".", nil)
}

ecs_get_fullpath :: proc(world: ^world_t, child: Entity) -> cstring
{
    return ecs_get_path_w_sep(world, 0, child, ".", nil)
}

// ecs_get_fullpath_buf :: proc(world: ^world_t, child: Entity, buf: ^strbuf_t)
// {
//     ecs_get_path_w_sep_buf(world, 0, child, ".", nil, buf)
// }

ecs_new_from_path :: proc(world: ^world_t, parent: Entity, path: cstring) -> Entity
{
    return ecs_new_from_path_w_sep(world, parent, path, ".", nil)
}

ecs_new_from_fullpath :: proc(world: ^world_t, path: cstring) -> Entity
{
    return ecs_new_from_path_w_sep(world, 0, path, ".", nil)
}

ecs_add_path :: proc(world: ^world_t, entity: Entity, parent: Entity, path: cstring) -> Entity
{
    return ecs_add_path_w_sep(world, entity, parent, path, ".", nil)
}

ecs_add_fullpath :: proc(world: ^world_t, entity: Entity, path: cstring) -> Entity
{
    return ecs_add_path_w_sep(world, entity, 0, path, ".", nil)
}


// Iterators

//ecs_field_w_size :: proc(iter: ^Iter, size: size_t, index: c.int32_t) -> rawptr ---
ecs_field :: proc(it: ^iter_t, $T: typeid, index: c.int32_t) -> [^]T
{
    return cast(^T)ecs_field_w_size(it, size_of(T), index)
}

// ecs_iter_column :: proc(it: ^iter_t, $T: typeid, index: c.int32_t) -> [^]T
// {
//     return cast(^T)ecs_iter_column_w_size(it, size_of(T), index)
// }


// Utility macros


ecs_isa :: proc(e: Entity) -> Entity
{
    return ecs_pair(EcsIsA_ID, e)
}

ecs_childof :: proc(e: Entity) -> Entity
{
    return ecs_pair(EcsChildOf_ID, e)
}

ecs_dependson :: proc(e: Entity) -> Entity
{
    return ecs_pair(EcsDependsOn_ID, e)
}

ecs_value :: proc(world: ^world_t, $T: typeid, ptr: rawptr) -> value_t
{
    v: Value
    v.type = ecs_id(world, T)
    v.ptr = ptr
    return v
}

ecs_value_new_t :: proc(world: ^world_t, $T: typeid) -> rawptr
{
    return ecs_value_new(world, ecs_id(world, T))
}



ecs_query_new :: proc(world: ^world_t, q_expr: cstring) -> ^query_t
{
    q: query_desc_t
    q.filter.expr = q_expr

    return ecs_query_init(world, &q)
}

ecs_rule_new :: proc(world: ^world_t, q_expr: cstring) -> ^rule_t
{
    f: filter_desc_t
    f.expr = q_expr

    // TODO: FIX
    return {}
    //return rule_init(world, &f)
}

// Ignore HAS_ID_FLAG for now, as it uses token pasting

// #define ECS_IS_PAIR(id)               (((id) & ECS_ID_FLAGS_MASK) == ECS_PAIR)
ECS_IS_PAIR :: proc($ID) -> bool
{
    return ((ID) & ID_FLAGS_MASK) == ECS_PAIR
}

SOLVE_AND_BIT_EQUATION :: proc(left:u64,result:u64) ->u64{
   return (result | ~left);

}


ECS_IS_PAIR_32 :: proc(id: u64) -> bool
{
    return ((id) & ID_FLAGS_MASK) == ECS_PAIR
}

// #define ECS_PAIR_FIRST(e)             (ecs_entity_t_hi(e & ECS_COMPONENT_MASK))
ECS_PAIR_FIRST :: proc(E: Entity) -> c.uint64_t
{
    return ecs_entity_t_hi(E & COMPONENT_MASK)
}

ECS_PAIR_FIRST_32 :: proc(E: Entity) -> u32
{
    return ecs_Entity_Hi(E & COMPONENT_MASK)
}

// #define ECS_PAIR_SECOND(e)            (ecs_entity_t_lo(e))
ECS_PAIR_SECOND :: proc(E: Entity) -> c.uint64_t
{
    return ecs_entity_t_lo(E)
}

ECS_PAIR_SECOND_32 :: proc(E: Entity) -> u32
{
    return ecs_Entity_Lo(E)
}






/// Utilities for working with pair identifiers
// TODO: Replace generics with entities



// Ignore ecs_pair_t



// #define ecs_entity_t_lo(value) ECS_CAST(uint32_t, value)
ecs_entity_t_lo :: proc(Val: Entity) -> c.uint64_t
{
    return Val
}

ecs_Entity_Lo :: proc(value: Entity) -> u32
{
    return cast(u32)value
}

// #define ecs_entity_t_hi(value) ECS_CAST(uint32_t, (value) >> 32)
ecs_entity_t_hi :: proc(Val: Entity) -> c.uint64_t
{
    return Val >> 32
}

ecs_Entity_Hi :: proc(value: Entity) -> u32
{
    return cast(u32)(value >> 32)
}
//#define ecs_entity_t_comb(lo, hi) ((ECS_CAST(uint64_t, hi) << 32) + ECS_CAST(uint32_t, lo))
// #define ecs_pair(pred, obj) (ECS_PAIR | ecs_entity_t_comb(obj, pred))
ecs_entity_t_comb :: proc(Lo: Entity, Hi: Entity) -> c.uint64_t
{
    return ((Hi << 32) + Lo)
}

ecs_Entity_Comb :: proc(lo: Entity, hi: Entity) -> u64
{
    return (((cast(u64)hi) << 32) + cast(u64)lo)
}



ecs_pair::proc(Pred: Entity, Obj: Entity) -> u64 {
    return ECS_PAIR | ecs_entity_t_comb(Obj,Pred)
}
ecs_Pair :: proc(pred: Entity, obj: Entity) -> u64
{
    return ECS_PAIR | ecs_Entity_Comb(obj, pred)
}

// #define ecs_pair_t(pred, obj) (ECS_PAIR | ecs_entity_t_comb(obj, ecs_id(pred)))
// ecs_pair_first :: proc(world: ^world_t, pair: Entity) -> c.uint64_t
// {
//     return ecs_get_alive(world, ECS_PAIR_FIRST(pair))
// }
ecs_pair_first :: proc(world: ^world_t, pair: Entity) -> u64
{
    return  ecs_get_alive(world, cast(u64)ECS_PAIR_FIRST_32(pair))
}

// #define ecs_pair_first(world, pair) ecs_get_alive(world, ECS_PAIR_FIRST(pair))
// #define ecs_pair_second(world, pair) ecs_get_alive(world, ECS_PAIR_SECOND(pair))
// ecs_pair_second :: proc(world: ^world_t, pair: Entity) -> c.uint64_t
// {
//     return ecs_get_alive(world, ECS_PAIR_SECOND(pair))
// }

ecs_pair_second :: proc(world: ^world_t, pair: Entity) -> u64
{
    return  ecs_get_alive(world, cast(u64)ECS_PAIR_SECOND_32(pair))
}

// TODO: iter_action



// HAS_RELATION uses token pasting

ecs_id :: proc(world: ^world_t, $T: typeid) -> Entity
{
    edesc: entity_desc_t
    name_c := _Get_Type_Name(T)
    edesc.name = name_c
    edesc.symbol = name_c
    return  ecs_entity_init(world, &edesc)
}




ecs_print :: proc(level: i32, fmt: cstring, args: ..any)
{
     ecs_print_(level, #file, #line, fmt, args)
}

ecs_printv :: proc(level: i32, fmt: cstring, args: cstring)
{
     ecs_printv_(level, #file, #line, fmt, args)
}

ecs_log :: proc(level: i32, fmt: cstring, args: ..any)
{
     ecs_log_(level, #file, #line, fmt, args)
}

ecs_logv :: proc(level: i32, fmt: cstring, args: cstring)
{
     ecs_logv_(level, #file, #line, fmt, args)
}

ecs__trace :: proc(file: cstring, line: i32, fmt: cstring, args: ..any)
{
     ecs_log_(0, file, line, fmt, args)
}

ecs_trace :: proc(fmt: cstring, args: ..any)
{
    ecs__trace(#file, #line, fmt, args)
}

ecs__warn :: proc(file: cstring, line: i32, fmt: cstring, args: ..any)
{
     ecs_log_(-2, file, line, fmt, args)
}

ecs_warn :: proc(fmt: cstring, args: ..any)
{
    ecs__warn(#file, #line, fmt, args)
}

ecs__err :: proc(file: cstring, line: i32, fmt: cstring, args: ..any)
{
     ecs_log_(-3, file, line, fmt, args)
}

ecs_err :: proc(fmt: cstring, args: ..any)
{
    ecs__err(#file, #line, fmt, args)
}

ecs__fatal :: proc(file: cstring, line: i32, fmt: cstring, args: ..any)
{
     ecs_log_(-4, file, line, fmt, args)
}

ecs_fatal :: proc(fmt: cstring, args: ..any)
{
    ecs__fatal(#file, #line, fmt, args)
}

// Ignore debug logging, flecs should always be compiled in release

ecs_abort :: proc(error_code: i32, fmt: cstring, args: ..any)
{
     ecs_abort_(error_code, #file, #line, fmt, args)
     ecs_os_abort()
    libc.abort()
}

// Ignore assert because it's debug only

// Ignore dummy_check because it uses goto

ecs_parser_error :: proc(name: cstring, expr: cstring, column: i64, fmt: cstring, args: ..any)
{
     ecs_parser_error_(name, expr, column, fmt, args)
}

ecs_parser_errorv :: proc(name: cstring, expr: cstring, column: i64, fmt: cstring, args: cstring)
{
     ecs_parser_errorv_(name, expr, column, fmt, args)
}

ECS_PIPELINE_DEFINE :: proc(world: ^world_t, id: Entity, name: cstring, args: cstring)
{
    desc: pipeline_desc_t = {}
    edesc: entity_desc_t = {}
    edesc.id = id
    edesc.name = name
    desc.entity =  ecs_entity_init(world, &edesc)
    desc.query.filter.expr = args
    id :=  ecs_pipeline_init(world, &desc)
    assert_out, valid := reflect.as_string(INVALID_PARAMETER)
    assert(id != 0, assert_out)
}

ECS_PIPELINE :: proc(world: ^world_t, id: Entity, name: cstring, args: cstring)
{
    id: Entity = 0
    ECS_PIPELINE_DEFINE(world, id, name, args)
}


ecs_os_malloc :: proc(size: size_t) -> rawptr
{
    return Global_OS_API.malloc_(size)
}

ecs_os_free :: proc(ptr: rawptr)
{
    Global_OS_API.free_(ptr)
}

ecs_os_realloc :: proc(ptr: rawptr, size: size_t) -> rawptr
{
    return Global_OS_API.realloc_(ptr, size)
}

ecs_os_calloc :: proc(size: size_t) -> rawptr
{
    return Global_OS_API.calloc_(size)
}

ecs_os_alloca :: proc(size: size_t) -> (rawptr,mem.Allocator_Error)
{
    return mem.alloc(cast(int)size)
}

ecs_os_malloc_t :: proc($T: typeid) -> ^T
{
    return cast(^T)os_malloc(size_of(T))
}

ecs_os_malloc_n :: proc($T: typeid, count: size_t) -> [^]T
{
    return cast([^]T)os_malloc(size_of(T) * count)
}

ecs_os_calloc_t :: proc($T: typeid) -> ^T
{
    return cast(^T)os_calloc(size_of(T))
}

ecs_os_calloc_n :: proc($T: typeid, count: size_t) -> [^]T
{
    return cast([^]T)os_calloc(size_of(T) * count)
}

ecs_os_realloc_t :: proc(ptr: rawptr, $T: typeid) -> ^T
{
    return cast(^T)os_realloc(ptr, size_of(T))
}

ecs_os_realloc_n :: proc(ptr: rawptr, $T: typeid, count: size_t) -> [^]T
{
    return cast([^]T)os_realloc(ptr, size_of(T) * count)
}

ecs_os_alloca_t :: proc($T: typeid) -> ^T
{
    return cast(^T)os_alloca(size_of(T))
}

ecs_os_alloca_n :: proc($T: typeid, count: i32) -> [^]T
{
    return cast([^]T)os_alloca(size_of(T) * count)
}

ecs_os_strdup :: proc(str: cstring) -> cstring
{
    return Global_OS_API.strdup_(str)
}

ecs_os_strlen :: proc(str: cstring) -> uint
{
    return libc.strlen(str)
}

ecs_os_strncmp :: proc(str1: cstring, str2: cstring, num: uint) -> c.int
{
    return libc.strncmp(str1, str2, num)
}

ecs_os_memcmp :: proc(ptr1: rawptr, ptr2: rawptr, num: uint) -> c.int
{
    return libc.memcmp(ptr1, ptr1, num)
}

ecs_os_memcpy :: proc(ptr1: rawptr, ptr2: rawptr, num: uint) -> rawptr
{
    return libc.memcpy(ptr1, ptr2, num)
}

ecs_os_memset :: proc(ptr: rawptr, value: c.int, num: uint) -> rawptr
{
    return libc.memset(ptr, value, num)
}

ecs_os_memmove :: proc(dst: rawptr, src: rawptr, size: uint) -> rawptr
{
    return libc.memmove(dst, src, size)
}

ecs_os_memcpy_t :: proc(ptr1: rawptr, ptr2: rawptr, $T: typeid) -> rawptr
{
    return os_memcpy(ptr1, ptr2, size_of(T))
}

ecs_os_memcpy_n :: proc(ptr1: rawptr, ptr2: rawptr, $T: typeid, count: i32) -> rawptr
{
    return os_memcpy(ptr1, ptr2, size_of(T) * count)
}

ecs_os_memcmp_t :: proc(ptr1: rawptr, ptr2: rawptr, $T: typeid) -> c.int
{
    return os_memcmp(ptr1, ptr2, size_of(T))
}

ecs_os_strcmp :: proc(str1: cstring, str2: cstring) -> c.int
{
    return libc.strcmp(str1, str2)
}

ecs_os_memset_t :: proc(ptr: rawptr, value: c.int, $T: typeid) -> rawptr
{
    return ecs_os_memset(ptr, value, size_of(T))
}

ecs_os_memset_n :: proc(ptr: rawptr, value: c.int, $T: typeid, count: i32) -> rawptr
{
    return ecs_os_memset(ptr, value, size_of(T) * count)
}

ecs_os_zeromem :: proc(ptr: rawptr) -> rawptr
{
    return ecs_os_memset(ptr, 0, size_of(ptr))
}

ecs_os_memdup_t :: proc(ptr: rawptr, $T: typeid) -> rawptr
{
    return ecs_os_memdup(ptr, size_of(T))
}

ecs_os_memdup_n :: proc(ptr: rawptr, $T: typeid, count: i32) -> rawptr
{
    return ecs_os_memdup(ptr, size_of(T) * count)
}

ecs_offset :: proc(ptr: rawptr, $T: typeid, index: i32) -> ^T
{
    return cast(^T)offset_of(ptr, size_of(T) * index)
}

ecs_os_strcat :: proc(str1: [^]c.char, str2: cstring) -> [^]c.char
{
    return libc.strcat(str1, str2)
}

//who cares TODO:
// ecs_os_sprintf :: proc(ptr: [^]c.char, format: cstring, args: ..any) -> c.int
// {
//     return libc.snprintf(ptr, format, args)
// }

ecs_os_vsprintf :: proc(ptr: [^]c.char, fmt: cstring, args: ^libc.va_list) -> c.int
{
    return libc.vsprintf(ptr, fmt, args)
}

ecs_os_strcpy :: proc(str1: [^]c.char, str2: cstring) -> [^]c.char
{
    return libc.strcpy(str1, str2)
}

ecs_os_strncpy :: proc(str1: [^]c.char, str2: cstring, num: uint) -> [^]c.char
{
    return libc.strncpy(str1, str2, num)
}

ecs_os_fopen :: proc(result: ^libc.FILE, file: cstring, mode: cstring)
{
    result := result
    result = libc.fopen(file, mode)
}

/// Threads

ecs_os_thread_new :: proc(callback: os_thread_callback_t, param: rawptr) -> os_thread_t
{
    return Global_OS_API.thread_new_(callback, param)
}

ecs_os_thread_join :: proc(thread: os_thread_t) -> rawptr
{
    return Global_OS_API.thread_join_(thread)
}

ecs_os_thread_self :: proc() -> os_thread_id_t
{
    return Global_OS_API.thread_self_()
}

/// Atomic increment/decrement

ecs_os_ainc :: proc(value: ^i32) -> i32
{
    return Global_OS_API.ainc_(value)
}

ecs_os_adec :: proc(value: ^i32) -> i32
{
    return Global_OS_API.adec_(value)
}

ecs_os_lainc :: proc(value: ^i64) -> i64
{
    return Global_OS_API.lainc_(value)
}

ecs_os_ladec :: proc(value: ^i64) -> i64
{
    return Global_OS_API.ladec_(value)
}

/// Mutex

ecs_os_mutex_new :: proc() -> os_mutex_t
{
    return Global_OS_API.mutex_new_()
}

ecs_os_mutex_free :: proc(mutex: os_mutex_t)
{
    Global_OS_API.mutex_free_(mutex)
}

ecs_os_mutex_lock :: proc(mutex: os_mutex_t)
{
    Global_OS_API.mutex_lock_(mutex)
}

ecs_os_mutex_unlock :: proc(mutex: os_mutex_t)
{
    Global_OS_API.mutex_unlock_(mutex)
}

/// Condition variable

ecs_os_cond_new :: proc() -> os_cond_t
{
    return Global_OS_API.cond_new_()
}

ecs_os_cond_free :: proc(cond: os_cond_t)
{
    Global_OS_API.cond_free_(cond)
}

ecs_os_cond_signal :: proc(cond: os_cond_t)
{
    Global_OS_API.cond_signal_(cond)
}

ecs_os_cond_broadcast :: proc(cond: os_cond_t)
{
    Global_OS_API.cond_broadcast_(cond)
}

ecs_os_cond_wait :: proc(cond: os_cond_t, mutex: os_mutex_t)
{
    Global_OS_API.cond_wait_(cond, mutex)
}

/// Time

ecs_os_sleep :: proc(sec: i32, nanosec: i32)
{
    Global_OS_API.sleep_(sec, nanosec)
}

ecs_os_now :: proc() -> u64
{
    return Global_OS_API.now_()
}

ecs_os_get_time :: proc(time_out: ^time_t)
{
    Global_OS_API.get_time_(time_out)
}

ecs_os_inc :: proc(v: ^i32) -> i32
{
    return ecs_os_ainc(v)
}

ecs_os_linc :: proc(v: ^i64) -> i64
{
    return ecs_os_lainc(v)
}

ecs_os_dec :: proc(v: ^i32) -> i32
{
    return ecs_os_adec(v)
}

ecs_os_ldec :: proc(v: ^i64) -> i64
{
    return ecs_os_ladec(v)
}

ecs_os_abort :: proc()
{
    Global_OS_API.abort_()
}

ecs_os_dlopen :: proc(libname: cstring) -> os_dl_t
{
    return Global_OS_API.dlopen_(libname)
}

ecs_os_dlproc :: proc(lib: os_dl_t, procname: cstring) -> os_proc_t
{
    return Global_OS_API.dlproc_(lib, procname)
}

ecs_os_dlclose :: proc(lib: os_dl_t)
{
    Global_OS_API.dlclose_(lib)
}

ecs_os_module_to_dl :: proc(lib: cstring) -> cstring
{
    return Global_OS_API.module_to_dl_(lib)
}

ecs_os_module_to_etc :: proc(lib: cstring) -> cstring
{
    return Global_OS_API.module_to_etc_(lib)
}

ECS_MODULE_DEFINE :: proc(world: ^world_t, id: Entity, name: cstring)
{
    desc: component_desc_t = {}
    desc.entity = id
    id := id
    id = ecs_module_init(world, name, &desc)
    ecs_set_scope(world, id)
}

ECS_MODULE :: proc(world: ^world_t, name: cstring)
{
    id :=  ecs_new_id(world)
    ECS_MODULE_DEFINE(world, id, name)
}

//hmm
// ecs_IMPORT :: proc(world: ^world_t, module: module_action_t, name: cstring) -> Entity
// {
//     return import_c(world, module, name)
// }



ecs_map_count :: proc(map_: map_t) -> i32
{
    return map_.count
}

ecs_map_is_init :: proc(map_: map_t) -> bool
{
    return (map_).bucket_shift != 0
}

ecs_map_get_ref :: proc(m: ^map_t, $T: typeid, k: Map_Key) -> [^]T
{
    return cast([^]T)map_get(m, k)
}

ecs_map_get_deref :: proc(m: ^map_t, $T: typeid, k: Map_Key) -> ^T
{
    return cast(^T)_map_get_deref(m, k)
}

ecs_map_ensure_ref :: proc(m: ^map_t, $T: typeid, k: Map_Key) -> [^]T
{
    return cast([^]T)map_ensure(m, k)
}

ecs_map_insert_ptr :: proc(m: ^map_t, k: Map_Key, v: int)
{
    ecs_map_insert(m, k, cast(Map_Val)v)
}

ecs_map_insert_alloc_t :: proc(m: ^map_t, $T: typeid, k: Map_Key) -> ^T
{
    return cast(^T)map_insert_alloc(m, size_of(T), k)
}

ecs_map_ensure_alloc_t :: proc(m: ^map_t, $T: typeid, k: Map_Key) -> ^T
{
    return cast(^T)map_ensure_alloc(m, size_of(T), k)
}

// TODO: Fix this
/*
ecs_map_remove_ptr :: proc(m: ^map_t, k: Map_Key) -> rawptr
{
    return cast(rawptr)map_remove(m, k)
}
*/

ecs_map_key :: proc(it: ^map_iter_t) -> Map_Data
{
    return it.res[0]
}

ecs_map_value :: proc(it: ^map_iter_t) -> Map_Data
{
    return it.res[1]
}

// TODO: Fix this
/*
ecs_map_ptr :: proc(it: ^map_iter_t) -> rawptr
{
    return cast(rawptr)map_value(it)
}
*/

ecs_map_ref :: proc(it: ^map_iter_t, $T: typeid) -> [^]T
{
    return cast([^]T)(&(it->res[1]))
}


ecs_vec_init_t :: proc(allocator: ^allocator_t, vec: ^vec_t, $T: typeid, elem_count: i32) -> ^vec_t
{
    return vec_init(allocator, vec, size_of(T), elem_count)
}

ecs_vec_init_if_t :: proc(vec: ^vec_t, $T: typeid)
{
    vec_init_if(vec, size_of(T))
}

ecs_vec_fini_t :: proc(allocator: ^allocator_t, vec: ^vec_t, $T: typeid)
{
    vec_fini(allocator, vec, size_of(T))
}

ecs_vec_reset_t :: proc(allocator: ^allocator_t, vec: ^vec_t, $T: typeid) -> ^vec_t
{
    return vec_reset(allocator, vec, size_of(T))
}

ecs_vec_append_t :: proc(allocator: ^allocator_t, vec: ^vec_t, $T: typeid) -> ^T
{
    return cast(^T)vec_append(allocator, vec, size_of(T))
}

ecs_vec_remove_t :: proc(vec: ^vec_t, $T: typeid, elem: i32)
{
    vec_remove(vec, size_of(T), elem)
}

ecs_vec_copy_t :: proc(allocator: ^allocator_t, vec: ^vec_t, $T: typeid) -> ^T
{
    return vec_copy(allocator, vec, size_of(T))
}

ecs_vec_reclaim_t :: proc(allocator: ^allocator_t, vec: ^vec_t, $T: typeid)
{
    vec_reclaim(allocator, vec, size_of(T))
}

ecs_vec_set_size_t :: proc(allocator: ^allocator_t, vec: ^vec_t, $T: typeid, elem_count: i32)
{
    vec_set_size(allocator, vec, size_of(T), elem_count)
}

ecs_vec_set_min_size_t :: proc(allocator: ^allocator_t, vec: ^vec_t, $T: typeid, elem_count: i32)
{
    vec_set_min_size(allocator, vec, size_of(T), elem_count)
}

ecs_vec_set_min_count_t :: proc(allocator: ^allocator_t, vec: ^vec_t, $T: typeid, elem_count: i32)
{
    vec_set_min_count(allocator, vec, size_of(T), elem_count)
}

ecs_vec_set_min_count_zeromem_t :: proc(allocator: ^allocator_t, vec: ^vec_t, $T: typeid, elem_count: i32)
{
    vec_set_min_count_zeromem(allocator, vec, size_of(T), elem_count)
}

ecs_vec_set_count_t :: proc(allocator: ^allocator_t, vec: ^vec_t, $T: typeid, elem_count: i32)
{
    vec_set_count(allocator, vec, size_of(T), elem_count)
}

ecs_vec_grow_t :: proc(allocator: ^allocator_t, vec: ^vec_t, $T: typeid, elem_count: i32) -> rawptr
{
    return vec_grow(allocator, vec, size_of(T), elem_count)
}

ecs_vec_get_t :: proc(vec: ^vec_t, $T: typeid, index: i32) -> ^T
{
    return cast(^T)vec_get(vec, size_of(T), index)
}

ecs_vec_first_t :: proc(vec: ^vec_t, $T: typeid) -> ^T
{
    return cast(^T)vec_first(vec)
}

ecs_vec_last_t :: proc(vec: ^vec_t, $T: typeid) -> ^T
{
    return cast(^T)vec_last(vec, size_of(T))
}


ecs_sparse_init_t :: proc(sparse: ^sparse_t, $T: typeid)
{
    sparse_init(sparse, size_of(T))
}

ecs_sparse_add_t :: proc(sparse: ^sparse_t, $T: typeid) -> ^T
{
    return cast(^T)sparse_add(sparse, size_of(T))
}

ecs_sparse_get_dense_t :: proc(sparse: ^sparse_t, $T: typeid, index: i32) -> ^T
{
    return cast(^T)sparse_get_dense(sparse, size_of(T), index)
}

ecs_sparse_get_t :: proc(sparse: ^sparse_t, $T: typeid, index: i32) -> ^T
{
    return cast(^T)sparse_get(sparse, size_of(T), index)
}

// TODO: Change all generics to proper types
ECS_RECORD_TO_ROW :: proc($V) -> i32
{
    return cast(i32)(cast(i32)V & ROW_MASK)
}

ECS_RECORD_TO_ROW_FLAGS :: proc($V) -> u32
{
    return cast(u32)V & ROW_FLAGS_MASK
}

ECS_ROW_TO_RECORD :: proc($Row, $Flags) -> u32
{
    return cast(u32)(cast(u32)Row | Flags)
}

ECS_GENERATION :: proc(E: u64) -> u64
{
    return (E & GENERATION_MASK) >> 32
}

ECS_GENERATION_INC :: proc(E: u64) -> u64
{
    return (E & ~GENERATION_MASK) | (((0xFFFF & (ECS_GENERATION(E) + 1)) << 32))
}



//hmm
// ecs_Poly_Id :: proc(world: ^world_t, tag: Entity) -> u64
// {
//     return ecs_Pair(id(world, Ecs_Poly), tag)
// }

// ecs_component_init(world, &(ecs_component_desc_t) { \
//     .entity = ecs_entity(world, { \
//         .name = #T, \
//         .symbol = #T, \
//         .use_low_id = true \
//     }), \
//     .type.size = ECS_SIZEOF(T), \
//     .type.alignment = ECS_ALIGNOF(T) \
// })



ecs_strbuf_appendlit :: proc(buffer: ^strbuf_t, str: cstring) -> c.bool
{
    return  ecs_strbuf_appendstrn(buffer, str, cast(i32)(size_of(str) - 1))
}

ecs_strbuf_list_appendlit :: proc(buffer: ^strbuf_t, str: cstring) -> c.bool
{
    return  ecs_strbuf_list_appendstrn(buffer, str, cast(i32)(size_of(str) - 1))
}

ecs_ballocator_init_t :: proc(ba: ^block_allocator_t, $T: typeid)
{
    ballocator_init(ba, size_of(T))
}

ecs_ballocator_init_n :: proc(ba: ^block_allocator_t, $T: typeid, count: int)
{
    ballocator_init(ba, size_of(T) * count)
}

ecs_ballocator_new_t :: proc($T: typeid) -> ^block_allocator_t
{
    return ballocator_new(size_of(T))
}

ecs_ballocator_new_n :: proc($T: typeid, count: int) -> ^block_allocator_t
{
    return ballocator_new(size_of(T) * count)
}

