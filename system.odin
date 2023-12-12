package flecs

import "core:c"
import "core:strings"
import "core:reflect"

//typedef struct EcsTickSource {
EcsTickSource :: struct
{
    tick: c.bool,
    time_elapsed: ftime_t,
}

//typedef struct ecs_system_desc_t {
SystemDesc :: struct
{
    _canary: c.int32_t,
    entity: Entity,
    query: QueryDesc,
    run: run_action_t,
    callback: iter_action_t,
    ctx: rawptr,
    binding_ctx: rawptr,
    
    ctx_free: ctx_free_t,
    binding_ctx_free: ctx_free_t,

    interval: ftime_t,
    rate: c.int32_t,
    tick_source: Entity,
    multi_threaded: c.bool,
    no_readonly: c.bool,
}

// #define ECS_SYSTEM_DECLARE(id) ecs_entity_t ecs_id(id)
// #define ECS_SYSTEM_DEFINE(world, id_, phase, ...) \
System :: proc(world: ^World, name: cstring = nil, func: iter_action_t, phase: c.uint64_t, args: cstring)
{
    sdesc: SystemDesc
    edesc: EntityDesc

    edesc.name = name
    edesc.add[0] = phase != 0 ? pair(EcsDependsOn, phase) : 0
    edesc.add[1] = phase

    sdesc.entity = ecs_entity_init(world, &edesc)
    sdesc.query.filter.expr = args
    sdesc.callback = func
    id := ecs_system_init(world, &sdesc)
}

//#define ECS_SYSTEM(world, id, phase, ...) \

//#define ecs_system(world, ...)\