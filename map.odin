package flecs

import "core:c"

//typedef struct ecs_bucket_entry_t {
BucketEntry :: struct
{
    key: map_key_t,
    value: ecs_map_val_t,
    next: ^BucketEntry,
}

//typedef struct ecs_bucket_t {
Bucket :: struct
{
    first: ^BucketEntry,
}

//typedef struct ecs_map_t {
Map :: struct
{
    bucket_shift: c.uint8_t,
    shared_allocator: bool,
    buckets: [^]Bucket,
    bucket_count: c.int32_t,
    count: c.int32_t,
    // buckets_end: ^Bucket,
    // elem_size: c.int16_t,
    entry_allocator: ^BlockAllocator,
    allocator: ^Allocator,
}

//typedef struct ecs_map_iter_t {
MapIter :: struct
{
    map_t: ^Map,
    bucket: ^Bucket,
    entry: ^BucketEntry,
    res: ^ecs_map_data_t,
}

//typedef struct ecs_map_params_t {
MapParams :: struct
{
    // size: size_t,
    allocator: ^Allocator,
    entry_allocator: BlockAllocator,
    // initial_count: c.int32_t,
}

//DEPRECATED:
//#define ECS_MAP_INIT(T) { .elem_size = ECS_SIZEOF(T) }
// MAP_INIT :: proc($T: typeid) -> Map
// {
//     return {.elem_size = size_of(T)}
// }

/*
OLD:
#define ecs_map_params_init(params, allocator, T)\
    _ecs_map_params_init(params, allocator, ECS_SIZEOF(T))
void _ecs_map_params_init(
    ecs_map_params_t *params,
    struct ecs_allocator_t *allocator,
    ecs_size_t elem_size);
map_params_init :: proc(params: ^MapParams, allocator: ^Allocator, $T: typeid)
{
    _map_params_init(params, allocator, size_of(T))
}
NEW:
void ecs_map_params_init(
    ecs_map_params_t *params,
    struct ecs_allocator_t *allocator);
*/
// already added to procs file:
// map_params_init :: proc(params: ^MapParams, allocator: ^Allocator)
//SAME FOR THIS:
// map_init :: proc(map_t: ^Map, $T: typeid, allocator: ^Allocator, initial_count: c.int32_t)
// {
//     _map_init(map_t, size_of(T), allocator, initial_count)
// }

//SAME FOR THIS:
// map_init_w_params :: proc(map_t: ^Map, params: ^MapParams)
// {
//     _map_init_w_params(map_t, params)
// }

//SAME FOR THIS:
// map_init_if :: proc(map_t: ^Map, $T: typeid, allocator: ^Allocator, elem_count: c.int32_t)
// {
//     _map_init_if(map_t, size_of(T), allocator, elem_count)
// }

//SAME FOR THIS:
// map_init_w_params_if :: proc(map_t: ^Map, params: ^MapParams)
// {
//     _map_init_w_params_if(map_t, params)
// }

//DEPRECATED:
// map_new :: proc($T: typeid, allocator: ^Allocator, elem_count: c.int32_t) -> ^Map
// {
//     return _map_new(size_of(T), allocator, elem_count)
// }

//SAME FOR THIS (previous to the deprecated one) and the lower ones:
//FLECS_API
//ecs_map_val_t* ecs_map_get( //to search in flecs.h
// map_get :: proc(map_t: ^Map, $T: typeid, key: map_key_t) -> ^T
// {
//     return cast(^T)_map_get(map_t, size_of(T), key)
// }

// map_get_ptr :: proc(map_t: ^Map, $T: typeid, key: map_key_t) -> ^T
// {
//     return cast(^T)_map_get_ptr(map_t, key)
// }

// map_ensure :: proc(map_t: ^Map, $T: typeid, key: map_key_t) -> ^T
// {
//     return cast(^T)_map_ensure(map_t, size_of(T), key)
// }

//DEPRECATED: now it is void ecs_map_insert( I belive
// map_set :: proc(map_t: ^Map, key: map_key_t, payload: rawptr) -> rawptr
// {
//     return _map_set(map_t, size_of(payload), key, payload)
// }

// map_next :: proc(iter: ^MapIter, $T: typeid, key: ^map_key_t) -> ^T
// {
//     return cast(^T)_map_next(iter, size_of(T), key)
// }

//DEPRECATED: I belive
// map_next_ptr :: proc(iter: ^MapIter, $T: typeid, key: ^map_key_t) -> T
// {
//     return cast(T)_map_next_ptr(iter, key)
// }