package flecs

import "core:c"

//SPARSE_CHUNK_SIZE :: 4096 //OLD, new one:
FLECS_SPARSE_PAGE_SIZE :: (1 << FLECS_SPARSE_PAGE_BITS)
//

/*
#define FLECS_SPARSE_CHUNK_SIZE (4096)
struct ecs_sparse_t {
    ecs_vector_t *dense;        
    ecs_vector_t *chunks;       
    ecs_size_t size;            
    int32_t count;              
    uint64_t max_id_local;      
    uint64_t *max_id;           
    struct ecs_allocator_t *allocator;
    ecs_block_allocator_t *chunk_allocator;
};
*//*
#define FLECS_SPARSE_PAGE_SIZE (1 << FLECS_SPARSE_PAGE_BITS)
typedef struct ecs_sparse_t {
    typedef struct ecs_sparse_t {
    ecs_vec_t dense;         
    ecs_vec_t pages;         
    ecs_size_t size;         
    int32_t count;           
    uint64_t max_id;         
    struct ecs_allocator_t *allocator;
    struct ecs_block_allocator_t *page_allocator;
} ecs_sparse_t;
    */
Sparse :: struct
{
    dense: Vec,
    pages: Vec,
    size: size_t,
    count: c.int32_t,
    max_id: c.uint64_t,
    allocator: ^Allocator,
    page_allocator: ^BlockAllocator,
}
/*
PROBABLY NOT USED AND ANNOYING (flecs_sparse_init VS ecs_sparse_init):

//#define flecs_sparse_init(sparse, allocator, chunk_allocator, T)\

//#define flecs_sparse_new(allocator, chunk_allocator, T)\
sparse_new :: proc($T: typeid) -> ^Sparse
{
    return _sparse_new(size_of(T))
}

//#define flecs_sparse_add(sparse, T)\
sparse_add :: proc(sparse: ^Sparse, $T: typeid) -> ^T
{
    return cast(^T)_sparse_add(sparse, size_of(T))
}
//#define flecs_sparse_remove_get(sparse, T, index)\

//#define flecs_sparse_get_dense(sparse, T, index)\
sparse_get_dense :: proc(sparse: ^Sparse, $T: typeid, index: c.int32_t) -> ^T
{
    return cast(^T)_sparse_get_dense(sparse, size_of(T), index)
}
//#define flecs_sparse_get(sparse, T, index)\
sparse_get :: proc(sparse: ^Sparse, $T: typeid, index: c.int32_t) -> ^T
{
    return cast(^T)_sparse_get(sparse, size_of(T), index)
}
//#define flecs_sparse_ensure(sparse, T, index)\
//#define flecs_sparse_set(sparse, T, index, value)\
//#define flecs_sparse_iter(sparse, T)\
//#define flecs_sparse_each(sparse, T, var, ...)\
//#define ecs_sparse_new(T)\
//#define ecs_sparse_add(sparse, T)\

*/