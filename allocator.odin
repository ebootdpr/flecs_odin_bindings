package flecs

import "core:c"

//struct ecs_allocator_t {
Allocator :: struct
{
    chunks: BlockAllocator,
    sizes: Sparse,
}