package flecs

import "core:c"
import "core:strings"

//typedef struct ecs_pipeline_desc_t {
PipelineDesc :: struct
{
    entity: Entity,
    query: QueryDesc,
}

//#ifndef FLECS_LEGACY
//#define ECS_PIPELINE_DEFINE(world, id_, ...) \
PipelineDefine :: proc(world: ^World, $T: typeid, args: ..string)
{
    pdesc: PipelineDesc
    edesc: EntityDesc

    comp_name_c := _GetTypeName(T)

    edesc.name = comp_name_c
    edesc.symbol = comp_name_c

    pdesc.entity = entity_init(world, &edesc)
    pdesc.query.filter.expr = strings.clone_to_cstring(strings.concatenate(args))

    id := pipeline_init(world, &pdesc)
}
//#define ECS_PIPELINE(world, id, ...) \

//#define ecs_pipeline(world, ...)\
//struct pipeline : entity {
pipeline :: proc(world: ^World, desc: PipelineDesc) -> Entity
{
    desc := desc
    return ecs_pipeline_init(world, &desc)
}
//#endif