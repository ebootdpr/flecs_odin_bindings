package flecs

import "core:c"

//typedef struct { !!!!actually no name, search for the lower part instead
HmBucket :: struct
{
    keys: Vec,
    values: Vec,
}//} ecs_hm_bucket_t;

//typedef struct { !!!!actually no name, search for the lower part instead
Hashmap :: struct
{
    hash: hash_value_action_t,
    compare: compare_action_t,
    key_size: size_t,
    value_size: size_t,
    hashmap_allocator: ^BlockAllocator,
    bucket_allocator: BlockAllocator,
    impl: Map,
}
//} ecs_hashmap_t;

HashmapIter :: struct
{
    it: MapIter,
    bucket: ^HmBucket,
    index: c.int32_t,
}//} flecs_hashmap_iter_t;

HashmapResult :: struct
{
    key: rawptr,
    value: rawptr,
    hash: c.uint64_t,
}//} flecs_hashmap_result_t;

