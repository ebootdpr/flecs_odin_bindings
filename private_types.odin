package flecs

import "core:c"

// Private types defined in flecs.c

//#define FLECS_TABLE_H
/**
 * @file table.h
 * @brief Table storage implementation.
 */
//#define FLECS_TABLE_GRAPH_H
/**
 * @file table_graph.h
 * @brief Table graph types and functions.
 */

 //#define ECS_TABLE_DIFF_INIT { .added = {0}}

//typedef struct ecs_table_cache_hdr_t {
TableCacheHdr :: struct
{
    cache: ^TableCache,
    table: ^Table,
    prev: ^TableCacheHdr,
    next: ^TableCacheHdr,
    empty: bool,
}

// typedef struct ecs_table_cache_list_t {
TableCacheList :: struct
{
    first: ^TableCacheHdr,
    last: ^TableCacheHdr,
    count: c.int32_t,
}

//typedef struct ecs_table_cache_t {
TableCache :: struct
{
    index: Map,
    tables: TableCacheList,
    empty_tables: TableCacheList,
}

//typedef enum ecs_table_eventkind_t {
TableEventKind :: enum c.int
{
    TriggersForId,
    NoTriggersForId,
}

//typedef struct ecs_table_event_t {
TableEvent :: struct
{
    kind: TableEventKind,
    query: ^Query,
    component: Entity,
    event: Entity,
}



//typedef struct ecs_table_diff_builder_t {
TableDiffBuilder :: struct
{
    added: Vec,
    removed: Vec,
}

//typedef struct ecs_table_diff_t {
TableDiff :: struct
{
    added: Type,
    removed: Type,
}

//typedef struct ecs_graph_edge_hdr_t {
GraphEdgeHdr :: struct
{
    prev: ^GraphEdgeHdr,
    nex: ^GraphEdgeHdr,
}

//typedef struct ecs_graph_edge_t {
GraphEdge :: struct
{
    hdr: GraphEdgeHdr,
    from: ^Table,
    to: ^Table,
    diff: ^TableDiff,
    id: id_t,
}

//typedef struct ecs_graph_edges_t {
GraphEdges :: struct
{
    lo: [^]GraphEdge,
    hi: Map,
}


// typedef struct ecs_graph_node_t {
GraphNode :: struct
{
    add: GraphEdges,
    remove: GraphEdges,
    refs: GraphEdgeHdr,
}


/* Entity filter. This filters the entities of a matched table, for example when
 * it has disabled components or union relationships (switch). */
 ecs_entity_filter_t :: struct {
     sw_terms:Vec,              /* Terms with switch (union) entity filter */
     bs_terms:Vec,              /* Terms with bitset (toggle) entity filter */
     ft_terms:Vec,              /* Terms with components from flattened tree */
     flat_tree_column:c.int32_t,
}

ecs_entity_filter_iter_t :: struct {
    entity_filter:^ecs_entity_filter_t ,
    it:^Iter ,
    columns:[^]c.int32_t ,
    prev:^Table ,
    range:TableRange,
    bs_offset:c.int32_t,
    sw_offset:c.int32_t,
    sw_smallest:c.int32_t,
    flat_tree_offset:c.int32_t,
    target_count:c.int32_t,
}

QueryTableMatch :: struct
{
    
    next: ^QueryTableMatch,
    prev: ^QueryTableMatch,
    table: ^Table,
    count: c.int32_t,
    offset: c.int32_t,
    columns: [^]c.int32_t,
    storage_columns: [^]c.int32_t,
    ids: [^]id_t,
    sources: [^]Entity,
    refs: Vec,
    group_id: c.uint64_t,
    monitor: ^c.int32_t,
    entity_filter:^ecs_entity_filter_t,

    next_match: ^QueryTableMatch,


}

QueryTable :: struct
{
    hdr: TableCacheHdr,
    first: ^QueryTableMatch,
    last: ^QueryTableMatch,
    table_id: c.uint64_t,
    rematch_count: c.int32_t,
}

//typedef struct ecs_query_table_list_t {
QueryTableList :: struct
{
    first: ^QueryTableMatch,
    last: ^QueryTableMatch,
    info: QueryGroupInfo,
}

//typedef enum ecs_query_eventkind_t {
QueryEventKind :: enum c.int
{
    TableMatch,
    TableRematch,
    TableUnmatch,
    Orphan,
}

//typedef struct ecs_query_event_t {
QueryEvent :: struct
{
    kind: QueryEventKind,
    table: ^Table,
    parent_query: ^Query,
}

//typedef struct ecs_query_allocators_t {
QueryAllocators :: struct
{
    columns: BlockAllocator,
    ids: BlockAllocator,
    sources: BlockAllocator,
    sizes: BlockAllocator,
    monitors: BlockAllocator,
}

// RULES
RULE_MAX_VAR_COUNT :: 32
RULE_PAIR_PREDICATE :: 1
RULE_PAIR_OBJECT :: 2

RulePair :: struct
{
    first: struct #raw_union
    {
        reg: c.int32_t,
        id: Entity,
    },

    second: struct #raw_union
    {
        reg: c.int32_t,
        id: Entity,
    },

    reg_mask: c.int32_t,
    transitive: bool,
    final: bool,
    reflexive: bool,
    acyclic: bool,
    second_0: bool,
}

// RuleFilter :: struct
// {
//     mask: id_t,

//     wildcard: bool,
//     first_wildcard: bool,
//     second_wildcard: bool,
//     same_var: bool,

//     hi_var: c.int32_t,
//     lo_var: c.int32_t,
// }

RuleVarKind :: enum c.int8_t
{
    Table,
    Entity,
    Unknown,
}

RuleOpKind :: enum c.int
{
    Input,
    Select,
    With,
    SubSet,
    SuperSet,
    Store,
    Each,
    SetJmp,
    Jump,
    Not,
    InTable,
    Eq,
    Yield,
}

RuleOp :: struct
{
    kind: RuleOpKind,
    filter: RulePair,
    subject: Entity,

    on_pass: c.int32_t,
    on_fail: c.int32_t,
    frame: c.int32_t,
    term: c.int32_t,
    r_in: c.int32_t,
    r_out: c.int32_t,
    has_in: bool,
    has_out: bool,
}

RuleWithCtx :: struct
{
    idr: ^IdRecord,
    it: TableCacheIter,
    column: c.int32_t,
}

RuleSubSetFrame :: struct
{
    with_ctx: RuleWithCtx,
    table: ^Table,
    row: c.int32_t,
    column: c.int32_t,
}

RuleSubSetCtx :: struct
{
    storage: [16]RuleSubSetFrame,
    stack: [^]RuleSubSetFrame,
    sp: c.int32_t,
}

RuleSuperSetFrame :: struct
{
    table: ^Table,
    column: c.int32_t,
}

RuleSuperSetCtx :: struct
{
    storage: [16]RuleSuperSetFrame,
    stack: [^]RuleSuperSetFrame,
    idr: ^IdRecord,
    sp: c.int32_t,
}

RuleEachCtx :: struct
{
    row: c.int32_t,
}

RuleSetJmpCtx :: struct
{
    label: c.int32_t,
}

RuleOpCtx :: struct
{
    is: struct #raw_union
    {
        subset: RuleSubSetCtx,
        superset: RuleSuperSetCtx,
        with: RuleWithCtx,
        each: RuleEachCtx,
        setjmp: RuleSetJmpCtx,
    },
}

// uint8_t ecs_var_id_t
ecs_var_id_t :: c.uint8_t
//typedef struct ecs_rule_var_t {
RuleVar :: struct
{
    kind: RuleVarKind,
    anonymous: bool,
    id: c.int32_t,
    other: c.int32_t,
    occurs: c.int32_t,
    depth: c.int32_t,
    name: cstring,
}

RuleTermVars :: struct
{
    first: c.int32_t,
    src: c.int32_t,
    second: c.int32_t,
}

//typedef struct ecs_monitor_t {
Monitor :: struct
{
    queries: Vec, //CHECK: TODO: it was a pointer
    is_dirty: bool,
}
//
MonitorSet :: struct
{
    monitors: Map,
    is_dirty: bool,
}
//
MarkedId :: struct
{
    idr: ^IdRecord,
    id: id_t,
    action: Entity,
    delete_id: bool,
}
//
Store :: struct
{
    entity_index: Sparse,
    tables: Sparse,
    table_map: Hashmap,
    root: Table,
    records: Vec,
    marked_ids: Vec,
    depth_ids: Vec ,
    entity_to_depth: Map,
}

WorldAllocators :: struct
{
    ptr: MapParams,
    query_table_list: MapParams,
    query_table: BlockAllocator,
    query_table_match: BlockAllocator,
    graph_edge_lo: BlockAllocator,
    graph_edge: BlockAllocator,
    id_record: BlockAllocator,
    table_diff: BlockAllocator,
    sparse_chunk: BlockAllocator,
    hashmap: BlockAllocator,

    diff_builder: TableDiffBuilder,
}

ECS_EVENT_DESC_ID_COUNT_MAX ::8

//typedef struct ecs_event_desc_t {
EventDesc :: struct
{
    event: Entity,
    ids: [^]Type,
    table: ^Table,
    other_table: ^Table,
    offset: c.int32_t,
    count: c.int32_t,
    entity: Entity,
    param: rawptr,
    const_param: rawptr,
    observable: ^poly_t,
    flags: flags32_t,
}
//#define FLECS_BITSET_H
ecs_bitset_t :: struct  {
    data:^c.uint64_t,
    count: c.int32_t,
    size: ecs_size_t,
} 

//#define FLECS_SWITCH_LIST_H

 ecs_switch_header_t ::  struct {
    element:c.int32_t ,        /* First element for value */
    count:c.int32_t ,          /* Number of elements for value */
}

 ecs_switch_node_t ::  struct {
    next:c.int32_t ,           /* Next node in list */
    prev:c.int32_t ,           /* Prev node in list */
}

ecs_switch_t ::struct{    
    hdrs: Map ,     /* map<uint64_t, ecs_switch_header_t> */
    nodes: Vec ,    /* vec<ecs_switch_node_t> */
    values: Vec ,   /* vec<uint64_t> */
};


// #define FLECS_PIPELINE_PRIVATE_H


/** Instruction data for pipeline.
 * This type is the element type in the "ops" vector of a pipeline. */
 ecs_pipeline_op_t::struct {
     offset:c.int32_t,             /* Offset in systems vector */
     count:c.int32_t,              /* Number of systems to run before next op */
     time_spent:c.double,          /* Time spent merging commands for sync point */
     commands_enqueued:c.int64_t,  /* Number of commands enqueued for sync point */
     multi_threaded:bool,        /* Whether systems can be ran multi threaded */
     no_readonly:bool,           /* Whether systems are staged or not */
} 

 ecs_pipeline_state_t::struct {
    query:^Query ,         /* Pipeline query */
     ops:Vec,              /* Pipeline schedule */
     systems:Vec,          /* Vector with system ids */

     last_system:Entity,   /* Last system ran by pipeline */
    idr_inactive:^IdRecord , /* Cached record for quick inactive test */
     match_count:c.int32_t,        /* Used to track of rebuild is necessary */
     rebuild_count:c.int32_t,      /* Number of pipeline rebuilds */
    iters:^Iter ,          /* Iterator for worker(s) */
     iter_count:c.int32_t,

    /* Members for continuing pipeline iteration after pipeline rebuild */
    cur_op:^ecs_pipeline_op_t ,  /* Current pipeline op */
     cur_i:c.int32_t,              /* Index in current result */
     ran_since_merge:c.int32_t,    /* Index in current op */
     no_readonly:bool,           /* Is pipeline in readonly mode */
}

 EcsPipeline::struct {
    /* Stable ptr so threads can safely access while entity/components move */
    state:^ecs_pipeline_state_t ,
} 