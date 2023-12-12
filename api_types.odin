package flecs

import "core:c"

poly_t :: rawptr

id_t :: c.uint64_t

// ecs_entity_t
Entity :: id_t

Type :: struct
{
    array: [^]id_t,
    count: c.int32_t,
}

// struct ecs_world_t {
World :: struct
{
    hdr: Header,

    // Metadata
    id_index_lo:^IdRecord,
    id_index_hi: Map,
    type_info: Sparse,

    // Cached id to id records
    idr_wildcard: ^IdRecord,
    idr_wildcard_wildcard: ^IdRecord,
    idr_any: ^IdRecord,
    idr_isa_wildcard: ^IdRecord,
    idr_childof_0: ^IdRecord,
    idr_childof_wildcard:^IdRecord,
    idr_identifier_name:^IdRecord,

    /* -- Mixins -- */
    self: ^World,
    observable: Observable,
    iterable: Iterable,

    /* Unique id per generated event used to prevent duplicate notifications */
    event_id: c.int32_t,

    /* Is entity range checking enabled? */
    range_check_enabled: bool,

    /* --  Data storage -- */
    store: Store,

    /* --  Pending table event buffers -- */
    pending_buffer: ^Sparse,
    pending_tables: ^Sparse,

    /* Used to track when cache needs to be updated */
    monitors: MonitorSet,

    /* -- Systems -- */
    pipeline: Entity,

    /* -- Identifiers -- */
    aliases: Hashmap,
    symbols: Hashmap,

    /* -- Staging -- */
    stages: [^]Stage, //CHECK, plural word stage=stages=>[^]
    stage_count: c.int32_t,

    /* -- Multithreading -- */
    worker_cond: os_cond_t,
    sync_cond: os_cond_t,
    sync_mutex: os_mutex_t,
    workers_running: c.int32_t,
    workers_waiting: c.int32_t,
    pq:^ecs_pipeline_state_t,       /* Pointer to the pipeline for the workers to execute */
    workers_use_task_api:bool, 

    /* -- Time management -- */
    world_start_time: Time,
    frame_start_time: Time,
    fps_sleep: ftime_t,

    /* -- Metrics -- */
    info: WorldInfo,

    /* -- World flags -- */
    flags: flags32_t,

    monitor_generation:c.int32_t,

    /* -- Allocators -- */
    allocators: WorldAllocators,
    allocator: Allocator,

    ctx: rawptr,
    binding_ctx:rawptr,             /* Binding-specific context */

    ctx_free:ctx_free_t,         /**< Callback to free ctx */
    binding_ctx_free:ctx_free_t, /**< Callback to free binding_ctx */

    fini_actions: Vec,
}

/** A table is the Flecs equivalent of an archetype. Tables store all entities
 * with a specific set of components. Tables are automatically created when an
 * entity has a set of components not previously observed before. When a new
 * table is created, it is automatically matched with existing queries */
//In flecs.c, not in flecs.h
//  struct ecs_table_t {
    Table :: struct
    {                 
    id: c.uint64_t, /* Table id in sparse set */            
    flags: flags32_t,   /* Flags for testing table properties */           
    column_count: c.int16_t,    /* Number of components (excluding tags) */               
    type: Type, /* Vector with component ids */            
    data: Data, /* Component storage */        
    node: GraphNode,    /* Graph node */          
    dirty_state: ^c.int32_t,    /* Keep track of changes in columns */
    column_map: ^c.int32_t,               /* Map type index <-> column
                                           *  - 0..count(T):        type index -> column
                                           *  - count(T)..count(C): column -> type index
                                           */              
    _: ^ecs_table__t,   /* Infrequently accessed table metadata */
}

/** Infrequently accessed data not stored inline in ecs_table_t */
//typedef struct ecs_table__t {
ecs_table__t::struct {
 hash: c.uint64_t,                   /* Type hash */
     lock: c.int32_t,                    /* Prevents modifications */
     traversable_count: c.int32_t,       /* Traversable relationship targets in table */
     generation: c.uint16_t,             /* Used for table cleanup */
     record_count: c.int16_t,            /* Table record count including wildcards */
    
    records: ^ecs_table_record_t , /* Array with table records */
    name_index: ^Hashmap ,       /* Cached pointer to name index */

    sw_columns: ^ecs_switch_t ,        /* Switch columns */
    bs_columns: ^ecs_bitset_t ,        /* Bitset columns */
     sw_count: c.int16_t,
     sw_offset: c.int16_t,
     bs_count: c.int16_t,
     bs_offset: c.int16_t,
     ft_offset: c.int16_t,
} 



//struct ecs_query_t { !!from flec.c
Query :: struct
{
    hdr: Header,

    /* Query filter */
    filter: Filter,

    /* Tables matched with query */
    cache: TableCache,

    /* Linked list with all matched non-empty tables, in iteration order */
    list: QueryTableList,

    /* Contains head/tail to nodes of query groups (if group_by is used) */
    groups: Map,

    /* Table sorting */
    order_by_component: Entity,
    order_by: order_by_action_t,
    sort_table: sort_table_action_t,
    table_slices: [^]Vec,
    order_by_term: c.int32_t,

    /* Table grouping */
    group_by_id: Entity,
    group_by: group_by_action_t,
    on_group_create: group_create_action_t,
    on_group_delete: group_delete_action_t,
    group_by_ctx: rawptr,
    group_by_ctx_free: ctx_free_t,

    /* Subqueries */
    parent: ^Query,
    subqueries: Vec, //CHECK: TODO: [^]

    /* Flags for query properties */
    flags: flags32_t,

    /* Monitor generation */
    monitor_generation:c.int32_t,

    cascade_by: c.int32_t,
    match_count: c.int32_t,
    prev_match_count: c.int32_t,
    rematch_count: c.int32_t,


    /* User context */
    ctx: rawptr,                     /* User context to pass to callback */
    binding_ctx: rawptr,             /* Context to be used for language bindings */
     
    ctx_free: ctx_free_t,         /** Callback to free ctx */
    binding_ctx_free: ctx_free_t, /** Callback to free binding_ctx */

    /* Mixins */
    iterable: ^Iterable,
    dtor: poly_dtor_t,
    entity: Entity,

    allocators: QueryAllocators,
}


Rule :: struct
{
    hdr: Header,

    world: ^World,
    operations: ^RuleOp,
    filter: Filter,
    vars: [RULE_MAX_VAR_COUNT]RuleVar,
    var_names: [RULE_MAX_VAR_COUNT]cstring,
    term_vars: [RULE_MAX_VAR_COUNT]RuleTermVars,
    var_eval_order: [RULE_MAX_VAR_COUNT]c.int32_t,

    var_count: c.int32_t,
    subj_var_count: c.int32_t,
    frame_count: c.int32_t,
    operation_count: c.int32_t,

    iterable: Iterable,
}


Observable :: struct
{
    events: ^Sparse,
}

Iter :: struct
{
    world: ^World,
    real_world: ^World,

    entities: [^]Entity,
    ptrs: [^]rawptr,
    sizes: [^]size_t,
    table: ^Table,
    other_table: ^Table,
    ids: [^]id_t,
    variables: [^]Var,
    columns: [^]c.int32_t,
    sources: [^]Entity,
    match_indices: [^]c.int32_t,

    references: [^]Ref,
    constrained_vars: flags64_t,
    group_id: c.uint64_t,
    field_count: c.int32_t,

    system: Entity,
    event: Entity,
    event_id: id_t,

    terms: [^]Term,
    table_count: c.int32_t,
    term_index: c.int32_t,
    variable_count: c.int32_t,
    variable_names: [^]cstring,

    param: rawptr,
    ctx: rawptr,
    binding_ctx: rawptr,

    delta_time: ftime_t,
    delta_system_time: ftime_t,

    frame_offset: c.int32_t,
    offset: c.int32_t,
    count: c.int32_t,
    instance_count: c.int32_t,

    flags: flags32_t,
    interrupted_by: Entity,
    priv: IterPrivate,

    next: iter_next_action_t,
    callback: iter_action_t,
    fini: iter_fini_action_t,
    chain_it: ^Iter,
}

Ref :: struct
{
    entity: Entity,
    id: Entity,
    tr: ^TableRecord,
    record: ^Record,
}

Mixins :: struct
{
    type_name: cstring,
    elems: [MixinKind.Max]size_t,
}

// Function Prototypes
run_action_t :: #type proc "c" (it: ^Iter)
iter_action_t :: #type proc (it: ^Iter)
iter_init_action_t :: #type proc "c" (world: ^World, iterable: ^poly_t, it: ^Iter, filter: ^Term)
iter_next_action_t :: #type proc "c" (it: ^Iter) -> c.bool
iter_fini_action_t :: #type proc "c" (it: ^Iter)
order_by_action_t :: #type proc "c" (e1: Entity, ptr1: rawptr, e2: Entity, ptr2: rawptr) -> c.int
sort_table_action_t :: #type proc "c" (world: ^World, table: ^Table, entities: [^]Entity, ptr: rawptr, size: c.int32_t, lo: c.int32_t, hi: c.int32_t, order_by: order_by_action_t)
group_by_action_t :: #type proc "c" (world: ^World, table: ^Table, group_id: id_t, ctx: rawptr) -> c.uint64_t
group_create_action_t :: #type proc "c" (world: ^World, group_id: c.uint64_t, group_by_ctx: rawptr) -> rawptr
group_delete_action_t :: #type proc "c" (world: ^World, group_id: c.uint64_t, group_ctx: rawptr, group_by_ctx: rawptr)
module_action_t :: #type proc "c" (world: ^World)
fini_action_t :: #type proc "c" (world: ^World, ctx: rawptr)
ctx_free_t :: #type proc "c" (ctx: rawptr)
compare_action_t :: #type proc "c" (ptr1: rawptr, ptr2: rawptr) -> c.int
hash_value_action_t :: #type proc "c" (ptr: rawptr) -> c.uint64_t
xtor_t :: #type proc "c" (ptr: rawptr, count: c.int32_t, type_info: ^TypeInfo)
copy_t :: #type proc "c" (dst_ptr: rawptr, src_ptr: rawptr, count: c.int32_t, type_info: ^TypeInfo)
move_t :: #type proc "c" (dst_ptr: rawptr, src_ptr: rawptr, count: c.int32_t, type_info: ^TypeInfo)
poly_dtor_t :: #type proc "c" (poly: ^poly_t)

// typedef enum ecs_mixin_kind_t { !!flecs.c
MixinKind :: enum
{
    World,
    Entity,
    Observable,
    Iterable,
    Dtor,
    Max,
}

//typedef struct ecs_header_t {
Header :: struct
{
    magic: c.int32_t,
    type: c.int32_t,
    mixins: ^Mixins,
}

//typedef struct ecs_iterable_t {
Iterable :: struct
{
    init: iter_init_action_t,
}

//typedef enum ecs_inout_kind_t {
InOutKind :: enum c.int
{
    InOutDefault,
    InOutNone,
    InOut,
    In,
    Out,
}

//typedef enum ecs_oper_kind_t {
OperKind :: enum c.int
{
    And,
    Or,
    Not,
    Optional,
    AndFrom,
    OrFrom,
    NotFrom,
}

//#define EcsSelf                       (1u << 1)
TermFlags :: enum u32
{
    Self = u32(1) << 1,
    Up = u32(1) << 2,
    Down = u32(1) << 3,
    TraverseAll = u32(1) << 4,
    Cascade = u32(1) << 5,
    Desc = u32(1) << 6,
    Parent = u32(1) << 7,
    IsVariable = u32(1) << 8,
    IsEntity = u32(1) << 9,
    IsName = u32(1) << 10,
    Filter = u32(1) << 11,
    TraverseFlags = (Up|Down|Self|Cascade|Parent),
}
TermMoreFlags :: enum u32{

    TermMatchAny = u32(1) << 0,
    TermMatchAnySrc = u32(1) << 1,
    TermSrcFirstEq = u32(1) << 2,
    TermSrcSecondEq = u32(1) << 3,
    TermTransitive = u32(1) << 4,
    TermReflexive = u32(1) << 5,
    TermIdInherited = u32(1) << 6,
    TermMatchDisabled = u32(1) << 7,
    TermMatchPrefab = u32(1) << 8,
}

//typedef struct ecs_term_id_t {
TermId :: struct
{
    id: Entity,
    name: cstring,
    trav: Entity,
    flags: flags32_t,
}

// Term, Filter, Observer, TypeHooks, TypeInfo
// struct ecs_term_t {
    Term :: struct
    {
        id: id_t,
        src: TermId,
        first: TermId,
        second: TermId,
    
        inout: InOutKind,
        oper: OperKind,
        id_flags: id_t,
        name: cstring,
        field_index: c.int32_t,
        idr:  ^IdRecord,     
        flags: ecs_flags16_t,    
        move: bool,
    }
    
//struct ecs_filter_t {
Filter :: struct
{
    hdr: Header,

    terms: [^]Term,
    term_count: c.int32_t,
    field_count: c.int32_t,

    owned: bool,
    terms_owned: bool,
    flags: flags32_t,

    variable_names: [1]cstring,
    sizes: [^]c.int32_t,

    entity: Entity,
    iterable: Iterable,
    dtor: poly_dtor_t,
    world: ^World,
}

//struct ecs_observer_t {
Observer :: struct
{
    hdr: Header,

    filter: Filter,

    events: [FLECS_EVENT_DESC_MAX]Entity,
    event_count: c.int32_t,

    callback: iter_action_t,
    run: run_action_t,
    ctx: rawptr,
    binding_ctx: rawptr,
    ctx_free: ctx_free_t,
    binding_ctx_free: ctx_free_t,
    observable: ^Observable,
    last_event_id: ^c.int32_t,
    last_event_id_storage: c.int32_t,
    register_id: id_t,
    term_index: c.int32_t,
    is_monitor: bool,
    is_multi: bool,


    dtor: poly_dtor_t,
}


TypeHooks :: struct
{
    ctor: xtor_t,
    dtor: xtor_t,
    copy: copy_t,
    move: move_t,

    copy_ctor: copy_t,
    move_ctor: move_t,
    ctor_move_dtor: move_t,
    move_dtor: move_t,
    
    on_add: iter_action_t,
    on_set: iter_action_t,
    on_remove: iter_action_t,

    ctx: rawptr,
    binding_ctx: rawptr,

    ctx_free: ctx_free_t,
    binding_ctx_free: ctx_free_t,
}

TypeInfo :: struct
{
    size: size_t,
    alignment: size_t,
    hooks: TypeHooks,
    component: Entity,
    name: cstring,
}

//#define FLECS_API_TYPES_H
//flecs.c
// #define ECS_MAX_JOBS_PER_WORKER (16)
ECS_MAX_JOBS_PER_WORKER ::8
// #define ECS_MAX_JOBS_PER_WORKER (16)
ECS_MAX_DEFER_STACK :: 8

/** Types for deferred operations */
ecs_cmd_kind_t ::enum {
    EcsCmdClone,
    EcsCmdBulkNew,
    EcsCmdAdd,
    EcsCmdRemove,   
    EcsCmdSet,
    EcsCmdEmplace,
    EcsCmdMut,
    EcsCmdModified,
    EcsCmdModifiedNoHook,
    EcsCmdAddModified,
    EcsCmdPath,
    EcsCmdDelete,
    EcsCmdClear,
    EcsCmdOnDeleteAction,
    EcsCmdEnable,
    EcsCmdDisable,
    EcsCmdEvent,
    EcsCmdSkip
}

/* Entity specific metadata for command in queue */
 ecs_cmd_entry_t::struct {
     first: c.int32_t,
     last: c.int32_t,                    /* If -1, a delete command was inserted */
}

 ecs_cmd_1_t::struct {
    value:rawptr,                     /* Component value (used by set / get_mut) */
    size: ecs_size_t,                 /* Size of value */
    clone_value:bool ,                /* Clone entity with value (used for clone) */ 
}

 ecs_cmd_n_t::struct {
    entities: [^]Entity,  
     count: c.int32_t,
} 

 ecs_cmd_t::struct {
    kind: ecs_cmd_kind_t,             /* Command kind */
     next_for_entity: c.int32_t,         /* Next operation for entity */    
     id:ecs_id_t,                     /* (Component) id */
     idr:^IdRecord,            /* Id record (only for set/mut/emplace) */
    entry:^ecs_cmd_entry_t,
    entity: Entity,             /* Entity id */

    is: union { ecs_cmd_1_t,  ecs_cmd_n_t},
}

// /* Data structures that store the command queue */
 ecs_commands_t ::struct {
    queue: Vec,
     stack: Stack,          /* Temp memory used by deferred commands */
     entries: Sparse,       /* <entity, op_entry_t> - command batching */
} 


Stage :: struct
{
    hdr: Header,

    // Unique id
    id: c.int32_t,

    // Deferred command queue
    _defer: c.int32_t,
    commands: ^ecs_commands_t,
    cmd_stack: [ECS_MAX_DEFER_STACK]ecs_commands_t,
    defer_stack: Stack,
}

//struct ecs_record_t {
Record :: struct
{
    //ecs_id_record_t *idr,
    table: ^Table,
    row: c.uint32_t,
    dense: c.int32_t,  
}

// typedef struct ecs_column_t {
ecs_column_t :: struct  {
     data: Vec,                 /* Vector with component data */
     id: ecs_id_t,                     /* Component id */
     ti: ^TypeInfo ,             /* Component type info */
     size: ecs_size_t,                 /* Component size */
} 


//struct ecs_data_t {
Data :: struct
{
    entities: Vec,
    columns: [^]ecs_column_t,
    // records: Vec,
    // sw_columns: [^]Switch,
    // bs_columns: [^]Bitset,
}

// Sparse

Switch :: struct
{
    hdrs: Map,
    nodes: Vec,
    values: Vec,
}


// typedef struct ecs_reachable_elem_t {
when ODIN_DEBUG==true {
    ecs_reachable_elem_t :: struct{
        tr: ^ecs_table_record_t ,
        record: ^Record ,
         src: ecs_entity_t,
         id: ecs_id_t,
         table: ^ecs_table_t,
    }
    
}else{
    ecs_reachable_elem_t :: struct{
        tr: ^ecs_table_record_t ,
        record: ^Record ,
         src: Entity,
         id: ecs_id_t,
    }

}


// typedef struct ecs_reachable_cache_t {
ecs_reachable_cache_t ::struct {
    generation: c.int32_t ,
    current:    c.int32_t ,
    ids:    Vec , /* vec<reachable_elem_t> */
}


//struct ecs_id_record_t {
IdRecord :: struct
{
    cache: TableCache,
    id: id_t,
    flags: flags32_t,

    type_info: ^TypeInfo,
    name_index: ^Hashmap,

    first: IdRecordElem,
    second: IdRecordElem,
    trav: IdRecordElem,

    parent: ^IdRecord,
    refcount: c.int32_t,
    
        /* Keep alive count. This count must be 0 when the id record is deleted. If
     * it is not 0, an application attempted to delete an id that was still
     * queried for. */
     keep_alive: c.int32_t,

     /* Cache invalidation counter */
     reachable: ecs_reachable_cache_t,
}

QueryTableNode :: struct
{
    next: ^QueryTableNode,
    prev: ^QueryTableNode,
    table: ^Table,
    group_id: c.uint64_t,
    offset: c.int32_t,
    count: c.int32_t,
    match: ^QueryTableMatch,
}

TableRecord :: struct
{
    hdr: TableCacheHdr,
    column: c.int32_t,
    count: c.int32_t,
}

// Allocator

// Observable, Record

TableRange :: struct
{
    table: ^Table,
    offset: c.int32_t,
    count: c.int32_t,
}

Var :: struct
{
    range: TableRange,
    entity: Entity,
}

// Ref

StackPage :: struct
{
    data: rawptr,
    next: ^StackPage,
    sp: c.int16_t,
    id: c.uint32_t,
}

StackCursor :: struct
{
    cur: ^StackPage,
    sp: c.int16_t,
}

PageIter :: struct
{
    offset: c.int32_t,
    limit: c.int32_t,
    remaining: c.int32_t,
}

WorkerIter :: struct
{
    index: c.int32_t,
    count: c.int32_t,
}

TableCacheIter :: struct
{
    cur: ^TableCacheHdr,
    next: ^TableCacheHdr,
    next_list: [^]TableCacheHdr,
}

TermIter :: struct
{
    term: Term,
    self_index: ^IdRecord,
    set_index: ^IdRecord,

    cur: ^IdRecord,
    it: TableCacheIter,
    index: c.int32_t,
    observed_table_count: c.int32_t,

    table: ^Table,
    cur_match: c.int32_t,
    match_count: c.int32_t,
    last_column: c.int32_t,

    empty_tables: bool,

    id: id_t,
    column: c.int32_t,
    subject: Entity,
    size: size_t,
    ptr: rawptr,
}

IterKind :: enum c.int
{
    Condition,
    Tables,
    Chain,
    None,
}

FilterIter :: struct
{
    filter: ^Filter,
    kind: IterKind,
    term_iter: TermIter,
    matches_left: c.int32_t,
    pivot_term: c.int32_t,
}

QueryIter :: struct
{
    query: ^Query,
    node: ^QueryTableNode,
    prev: ^QueryTableNode,
    last: ^QueryTableNode,
    sparse_smallest: c.int32_t,
    sparse_first: c.int32_t,
    bitset_first: c.int32_t,
    skip_count: c.int32_t,
}

SnapshotIter :: struct
{
    filter: Filter,
    tables: ^Vec,
    index: c.int32_t,
}

SparseIter :: struct
{
    sparse: ^Sparse,
    ids: [^]c.uint64_t,
    size: size_t,
    i: c.int32_t,
    count: c.int32_t,
}

RuleIter :: struct
{
    rule: ^Rule,
    registers: [^]Var,
    op_ctx: ^RuleOpCtx,
    columns: [^]c.int32_t,
    entity: Entity,
    redo: bool,
    op: c.int32_t,
    sp: c.int32_t,
}

iter_cache_ids :: u32(1) << u32(0)
iter_cache_columns :: u32(1) << u32(1)
iter_cache_sources :: u32(1) << u32(2)
iter_cache_sizes :: u32(1) << u32(3)
iter_cache_ptrs :: u32(1) << u32(4)
iter_cache_match_indices :: u32(1) << u32(5)
iter_cache_variables :: u32(1) << u32(6)
iter_cache_all :: 255

IterCache :: struct
{
    stack_cursor: StackCursor,
    used: flags8_t,
    allocated: flags8_t,
}

IterPrivate :: struct
{
    iter: struct #raw_union
    {
        term: TermIter,
        filter: FilterIter,
        query: QueryIter,
        rule: RuleIter,
        snapshot: SnapshotIter,
        page: PageIter,
        worker: WorkerIter,
    },
    cache: IterCache,
}

// Iter definition

// struct ecs_table_record_t {
ecs_table_record_t :: struct {
    hdr:TableCacheHdr ,  /* Table cache header */
    index:c.int16_t ,              /* First type index where id occurs in table */
    count:c.int16_t ,              /* Number of times id occurs in table */
    column:c.int16_t ,             /* First column index where id occurs */
}

IdRecordElem :: struct
{
    prev: ^IdRecord,
    next: ^IdRecord,
}