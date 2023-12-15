package flecs

import "core:c"

allocator_t :: struct
{
    chunks: block_allocator_t,
    sizes: sparse_t,
}


ecs_doc_description_t :: struct
{
    value: cstring,
}


sparse_t :: struct
{
    dense: vec_t,
    pages: vec_t,
    size: size_t,
    count: i32,
    max_id_local: u64,
    max_id: ^u64,
    allocator: ^allocator_t,
    page_allocator: ^block_allocator_t,
}
vec_t :: struct
{
    array: rawptr,
    count: i32,
    size: i32,
}

switch_header_t :: struct
{
    element: i32,
    count: i32,
}

switch_node_t :: struct
{
    next: i32,
    prev: i32,
}

switch_t :: struct
{
    hdrs: map_t,
    nodes: vec_t,
    values: vec_t,
}


strbuf_element_t :: struct
{
    buffer_embedded: c.bool,
    pos: i32,
    buf: cstring,
    next: ^strbuf_element_t,
}

strbuf_element_embedded_t :: struct
{
    super: strbuf_element_t,
    buf: [STRBUF_ELEMENT_SIZE + 1]c.char,
}

strbuf_element_str_t :: struct
{
    super: strbuf_element_t,
    alloc_str: cstring,
}

strbuf_list_elem_t :: struct
{
    count: i32,
    separator: cstring,
}

strbuf_t :: struct
{
    buf: cstring,
    max: i32,
    size: i32,
    elementCount: i32,
    firstElement: strbuf_element_embedded_t,
    current: ^strbuf_element_t,
    list_stack: [STRBUF_MAX_LIST_DEPTH]strbuf_list_elem_t,
    list_sp: i32,
    content: cstring,
    length: i32,
}

app_desc_t :: struct
{
    target_fps: ftime_t,
    delta_time: ftime_t,
    threads: i32,
    frames: i32,
    enable_rest: c.bool,
    enable_monitor: c.bool,
    init: app_init_action_t,
    ctx: rawptr,
}

stage_t :: struct
{
    hdr: header_t,

    id: i32,

    
    defer_: i32,

    
    cmd:^Commands,
    cmd_stack: [ECS_MAX_DEFER_STACK]Commands,
    cmd_sp: i32,

    
    thread_ctx: ^world_t,
    world: ^world_t,
    thread: os_thread_t,

    
    post_frame_actions: vec_t,

    
    scope: Entity,
    with: Entity,
    base: Entity,
    lookup_path:  ^Entity, 

    
    auto_merge: c.bool,
    async: c.bool,

    
    allocators: stage_allocators_t,
    allocator: allocator_t,

    
    variables: vec_t,
    operations: vec_t,
}


expr_var_t :: struct
{
    name: cstring,
    value: value_t,
    owned: c.bool,
}

expr_var_scope_t :: struct
{
    var_index: hashmap_t,
    vars: vec_t,
    parent: ^expr_var_scope_t,
}




rule_var_t :: struct
{
    kind: i8,
    id: Var_Id,
    table_id: Var_Id,
    name: cstring,
}


rule_ref_t :: struct #raw_union 
{
    var: Var_Id,
    entity: Entity,
}

rule_op_t :: struct
{
    kind: u8,
    flags: flags8_t,
    field_index: i8,
    term_index: i8,
    prev: Rule_Lbl,
    next: Rule_Lbl,
    other: Rule_Lbl,
    match_flags: flags16_t,
    src: rule_ref_t,
    first: rule_ref_t,
    second: rule_ref_t,
    written: flags64_t,
}

rule_and_ctx_t :: struct
{
    idr: ^id_record_t,
    it: table_cache_iter_t,
    column: i16,
    remaining: i16,
}

trav_elem_t :: struct
{
    entity: Entity,
    idr: ^id_record_t,
    column: i32,
}

trav_cache_t :: struct
{
    id: id_t,
    idr: ^id_record_t,
    entities: vec_t,
    up: c.bool,
}

rule_trav_ctx_t :: struct
{
    and: rule_and_ctx_t,
    index: i32,
    offset: i32,
    count: i32,
    cache: ^trav_cache_t,
    yield_reflexive: c.bool,
}

rule_eq_ctx_t :: struct
{
    range: table_range_t,
    index: i32,
    name_col: i16,
    redo: c.bool,
}

rule_each_ctx_t :: struct
{
    row: i32,
}

rule_setthis_ctx_t :: struct
{
    range: table_range_t,
}

rule_ids_ctx_t :: struct
{
    cur: ^id_record_t,
}

rule_ctrlflow_ctx_t :: struct
{
    lbl: Rule_Lbl,
}

rule_cond_ctx_t :: struct
{
    cond: c.bool,
}

rule_op_ctx_t :: struct
{
    is: struct #raw_union
    {
        and: rule_and_ctx_t,
        trav: rule_trav_ctx_t,
        ids: rule_ids_ctx_t,
        eq: rule_eq_ctx_t,
        each: rule_each_ctx_t,
        setthis: rule_setthis_ctx_t,
        ctrlflow: rule_ctrlflow_ctx_t,
        cond: rule_cond_ctx_t,
    },
}

rule_compile_ctx_t :: struct
{
    ops: ^vec_t,
    written: Write_Flags,
    cond_written: Write_Flags,

    lbl_union: Rule_Lbl,
    lbl_not: Rule_Lbl,
    lbl_option: Rule_Lbl,
    lbl_cond_eval: Rule_Lbl,
    lbl_or: Rule_Lbl,
    lbl_none: Rule_Lbl,
    lbl_prev: Rule_Lbl,
}

rule_run_ctx_t :: struct
{
    written: [^]u64,
    op_index: Rule_Lbl,
    prev_index: Rule_Lbl,
    jump: Rule_Lbl,
    vars: [^]var_t, 
    it: ^iter_t,
    op_ctx: ^rule_op_ctx_t,
    world: ^world_t,
    rule: ^rule_t,
    rule_vars: [^]rule_var_t,
}

rule_var_cache_t :: struct
{
    var: rule_var_t,
    name: cstring,
}



type_t :: struct
{
    array: [^]id_t,
    count: i32,
}


ecs_entity_filter_t :: struct {
    sw_terms: vec_t,              
    bs_terms: vec_t,              
    ft_terms: vec_t,              
    flat_tree_column:c.int32_t,
}

ecs_entity_filter_iter_t :: struct {
   entity_filter:^ecs_entity_filter_t ,
   it: ^iter_t ,
   columns:[^]c.int32_t ,
   prev:^table_t ,
   range:table_range_t,
   bs_offset:c.int32_t,
   sw_offset:c.int32_t,
   sw_smallest:c.int32_t,
   flat_tree_offset:c.int32_t,
   target_count:c.int32_t,
}


ecs_event_id_record_t :: struct {
        
        self:map_t ,                  
        self_up:map_t ,               
        up:map_t ,                    
    
        observers:map_t ,             
    
        
        set_observers:map_t ,         
    
        
        entity_observers:map_t ,      
    
        
        observer_count:c.int32_t ,
    }


ecs_bitset_t :: struct  {
    data:^c.uint64_t,
    count: c.int32_t,
    size: size_t,
} 



 ecs_switch_header ::  struct {
    element:c.int32_t ,        
    count:c.int32_t ,          
}

 ecs_switch_node ::  struct {
    next:c.int32_t ,           
    prev:c.int32_t ,           
}

ecs_switch ::struct{    
    hdrs: map_t ,     
    nodes: vec_t ,    
    values: vec_t ,   
};






 ecs_pipeline_op_t::struct {
     offset:c.int32_t,             
     count:c.int32_t,              
     time_spent:c.double,          
     commands_enqueued:c.int64_t,  
     multi_threaded:bool,        
     no_readonly:bool,           
} 

 ecs_pipeline_state_t::struct {
    query:^query_t ,         
     ops: vec_t,              
     systems: vec_t,          

     last_system:Entity,   
    idr_inactive:^id_record_t , 
     match_count:c.int32_t,        
     rebuild_count:c.int32_t,      
    iters: ^iter_t ,          
     iter_count:c.int32_t,

    
    cur_op:^ecs_pipeline_op_t ,  
     cur_i:c.int32_t,              
     ran_since_merge:c.int32_t,    
     no_readonly:bool,           
}

 ecspipeline_t::struct {
    
    state:^ecs_pipeline_state_t ,
} 
world_t :: struct
{
    hdr: header_t,

    
    id_index_lo: ^id_record_t,
    id_index_hi: map_t,
    type_info: sparse_t,

    
    idr_wildcard: ^id_record_t,
    idr_wildcard_wildcard: ^id_record_t,
    idr_any: ^id_record_t,
    idr_isa_wildcard: ^id_record_t,
    idr_childof_0: ^id_record_t,
    idr_childof_wildcard: ^id_record_t,
    idr_identifier_name: ^id_record_t,

    
    self: ^world_t,
    observable: observable_t,
    iterable: iterable_t,

    
    event_id: i32,

    range_check_enabled: c.bool,
    
    
    store: store_t,

    
    pending_buffer: ^sparse_t,
    pending_tables: ^sparse_t,

    monitors: monitor_set_t,

    
    pipeline: Entity, 

    
    aliases: hashmap_t,
    symbols: hashmap_t,

    
    stages: [^]stage_t,
    stage_count: i32,

    
    worker_cond: os_cond_t,
    sync_cond: os_cond_t,
    sync_mutex: os_mutex_t,
    workers_running: i32,
    workers_waiting: i32,
    pq:^ecs_pipeline_state_t,        
    workers_use_task_api: c.bool,       


    
    world_start_time: time_t,
    frame_start_time: time_t,
    fps_sleep: ftime_t,

    
    info: world_info_t,

    
    flags: flags32_t,

    monitor_generation: i32,

    
    allocators: world_allocators_t,
    allocator: allocator_t,

    ctx: rawptr, 
    binding_ctx: rawptr,              

    ctx_free:ctx_free_t,         
    binding_ctx_free:ctx_free_t, 
    fini_actions: vec_t, 
}


table_t :: struct
    {                 
    id: u64, 
    flags: flags32_t,   
    column_count: i16,    
    type: type_t, 
    data: data_t, 
    node: graph_node_t,    
    dirty_state: [^]i32,    
    column_map: [^]i32,                         
    _: ^ecs_table__t,   
}



    ecs_table__t::struct {
        hash: u64,                   
            lock: i32,                    
            traversable_count: i32,       
            generation: u16,             
            record_count: i16,            
           
           records: [^]table_record_t , 
           name_index: ^hashmap_t ,       
       
           sw_columns: ^switch_t ,        
           bs_columns: ^bitset_t ,        
            sw_count: i16,
            sw_offset: i16,
            bs_count: i16,
            bs_offset: i16,
            ft_offset: i16,
       } 

term_t :: struct
{
    id: id_t,

    src: term_id_t,
    first: term_id_t,
    second: term_id_t,

    inout: InOut_Kind,
    oper: Oper_Kind,

    id_flags: id_t,
    name: cstring,

    field_index: i32,
    idr: ^id_record_t,

    flags: flags16_t,

    move: c.bool,
}

query_t :: struct
{
    hdr: header_t,
    filter: filter_t,
    cache: table_cache_t,
    list: query_table_list_t,
    groups: map_t,

    
    order_by_component: Entity,
    order_by: order_by_action_t,
    sort_table: sort_table_action_t,
    table_slices: vec_t,
    order_by_term: i32,

    
    group_by_id: Entity,
    group_by: group_by_action_t,
    on_group_create: group_create_action_t,
    on_group_delete: group_delete_action_t,
    group_by_ctx: rawptr,
    group_by_ctx_free: ctx_free_t,

    
    parent: ^query_t,
    subqueries: vec_t,

    
    flags: flags32_t,

    
    monitor_generation: i32,

    cascade_by: i32,
    match_count: i32,
    prev_match_count: i32,
    rematch_count: i32,

    
    ctx: rawptr,                       
    binding_ctx: rawptr,               
        
    ctx_free: ctx_free_t,        
    binding_ctx_free: ctx_free_t,
    

    
    iterable: iterable_t,
    dtor: poly_dtor_t,

    
    allocators: query_allocators_t,
}

filter_t :: struct
{
    hdr: header_t,

    terms: [^]term_t,
    term_count: i32,
    field_count: i32,

    owned: c.bool,
    terms_owned: c.bool,

    flags: flags32_t,

    variable_names: [1]cstring,
    sizes: [^]i32,

    
    entity: Entity,
    iterable: iterable_t,
    dtor: poly_dtor_t,
    world: ^world_t,
}

rule_t :: struct
{
    hdr: header_t,
    filter: filter_t,

    vars: [^]rule_var_t,
    var_count: i32,
    var_pub_count: i32,
    has_table_this: c.bool,
    tvar_index: hashmap_t,
    evar_index: hashmap_t,
    vars_cache: rule_var_cache_t,
    var_names: [^]cstring,
    src_vars: [^]Var_Id,

    ops: [^]rule_op_t,
    op_count: i32,

    iterable: iterable_t,
    dtor: poly_dtor_t,
}

observer_t :: struct
{
    hdr: header_t,

    filter: filter_t,

    
    events: [FLECS_EVENT_DESC_MAX]Entity,
    event_count: i32,

    callback: iter_action_t,
    run: run_action_t,

    ctx: rawptr,
    binding_ctx: rawptr,

    ctx_free: ctx_free_t,    binding_ctx_free: ctx_free_t,
    observable: ^observable_t,

    last_event_id: ^i32,
    last_event_id_storage: i32,

    register_id: id_t,
    term_index: i32,

    is_monitor: c.bool,

    is_multi: c.bool,

    
    dtor: poly_dtor_t,
}


type_hooks_t :: struct
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

type_info_t :: struct
{
    size: size_t,
    alignment: size_t,
    hooks: type_hooks_t,
    component: Entity,
    name: cstring,
}

id_record_t :: struct
{
    cache: table_cache_t,
    id: id_t,
    flags: flags32_t,
    type_info: ^type_info_t,
    name_index: ^hashmap_t,
    first: id_record_elem_t,
    second: id_record_elem_t,
    trav: id_record_elem_t,
    parent: ^id_record_t,
    refcount: i32,
    keep_alive: i32,
    reachable: reachable_cache_t,
}

table_record_t :: struct
{
    hdr: table_cache_hdr_t,
    index: i16,
    count: i16,
    column: i16,
}




mixins_t :: struct
{
    type_name: cstring,
    elems: [Mixin_Kind.Max]size_t,
}

header_t :: struct
{
    magic: i32,
    type_: i32,
    mixins: ^mixins_t,
}


iterable_t :: struct
{
    init: iter_init_action_t,
}


term_id_t :: struct
{
    id: Entity,
    name: cstring,
    trav: Entity,
    flags: flags32_t,
}

entity_desc_t :: struct
{
    _canary: i32,
    id: Entity,
    name: cstring,
    sep: cstring,
    root_sep: cstring,
    symbol: cstring,
    use_low_id: c.bool,
    add: [FLECS_ID_DESC_MAX]id_t,
    add_expr: cstring,
}

bulk_desc_t :: struct
{
    _canary: i32,
    entities: [^]Entity,
    count: i32,
    ids: [FLECS_ID_DESC_MAX]id_t,
    data: [^]rawptr,
    table: ^table_t,
}

component_desc_t :: struct
{
    _canary: i32,
    entity: Entity,
    type_: type_info_t,
}

filter_desc_t :: struct
{
    _canary: i32,
    terms: [FLECS_TERM_DESC_MAX]term_t,
    terms_buffer: [^]term_t,
    terms_buffer_count: i32,
    storage: ^filter_t,
    instanced: c.bool,
    flags: flags32_t,
    expr: cstring,
    entity: Entity,
}


query_desc_t ::struct {
     _canary: i32,
     filter: filter_desc_t,
     order_by_component: Entity,
     order_by: order_by_action_t,
     sort_table: sort_table_action_t,
     group_by_id: id_t,
     group_by: group_by_action_t,
    on_group_create: group_create_action_t,
    on_group_delete: group_delete_action_t,
    group_by_ctx: rawptr ,
    group_by_ctx_free: ctx_free_t,
    parent: ^query_t ,
    ctx: rawptr ,
    binding_ctx: rawptr ,
    ctx_free: ctx_free_t,  
    binding_ctx_free: ctx_free_t,
}

observer_desc_t :: struct
{
    _canary: i32,
    entity: Entity,
    filter: filter_desc_t,
    events: [FLECS_EVENT_DESC_MAX]Entity,
    yield_existing: c.bool,
    callback: iter_action_t,
    run: run_action_t,
    ctx: rawptr,
    binding_ctx: rawptr,
    ctx_free: ctx_free_t,    
    binding_ctx_free: ctx_free_t,    
    observable: poly_t_ptr,
    last_event_id: ^i32,
    term_index: i32,
}

value_t :: struct
{
    type_: Entity,
    ptr: rawptr,
}

 world_info_t::struct {
     last_component_id: Entity,   
     min_id: Entity,              
     max_id: Entity,              
     delta_time_raw: ftime_t,       
     delta_time: ftime_t,           
     time_scale: ftime_t,           
     target_fps: ftime_t,           
     frame_time_total: ftime_t,     
     system_time_total: ftime_t,    
     emit_time_total: ftime_t,      
     merge_time_total: ftime_t,     
     world_time_total: ftime_t,     
     world_time_total_raw: ftime_t, 
     rematch_time_total: ftime_t,   
    
     frame_count_total: i64,        
     merge_count_total: i64,        
     rematch_count_total: i64,      
     id_create_total: i64,          
     id_delete_total: i64,          
     table_create_total: i64,       
     table_delete_total: i64,       
     pipeline_build_count_total: i64, 
     systems_ran_frame: i64,        
     observers_ran_frame: i64,      
     tag_id_count: i32,             
     component_id_count: i32,       
     pair_id_count: i32,            
     table_count: i32,              
     empty_table_count: i32,        
    
     cmd_t: struct {
         add_count: i64,             
         remove_count: i64,          
         delete_count: i64,          
         clear_count: i64,           
         set_count: i64,             
         get_mut_count: i64,         
         modified_count: i64,        
         other_count: i64,           
         discard_count: i64,         
         batched_entity_count: i64,  
         batched_command_count: i64, 
    },
    name_prefix: cstring ,          
}

query_group_info_t :: struct
{
    match_count: i32,
    table_count: i32,
    ctx: rawptr,
}



ecs_identifier_t :: struct
{
    value: cstring,
    length: size_t,
    hash: u64,
    index_hash: u64,
    index: ^hashmap_t,
}

ecs_component_t :: struct
{
    size: size_t,
    alignment: size_t,
}

ecs_poly_t :: struct
{
    poly: poly_t_ptr,
}

ecs_target_t :: struct
{
    count: i32,
    target: ^record_t,
}



hashed_string_t :: struct
{
    value: cstring,
    length: size_t,
    hash: u64,
}


table_event_t :: struct
{
    kind: Table_EventKind,
    query: ^query_t,
    component: Entity,
    event: Entity,
}



table_diff_t :: struct
{
    added: type_t,
    removed: type_t,
}

table_diff_builder_t :: struct
{
    added: vec_t,
    removed: vec_t,
}

graph_edge_hdr_t :: struct
{
    prev: ^graph_edge_hdr_t,
    next: ^graph_edge_hdr_t,
}

graph_edge_t :: struct
{
    hdr: graph_edge_hdr_t,
    from: ^table_t,
    to: ^table_t,
    diff: ^table_diff_t,
    id: id_t,
}

graph_edges_t :: struct
{
    lo: [^]graph_edge_t,
    hi: map_t,
}

graph_node_t :: struct
{
    add: graph_edges_t,
    remove: graph_edges_t,
    refs: graph_edge_hdr_t,
}


table_ext_t :: struct
{
    sw_columns: ^switch_t,
    bs_columns: ^bitset_t,
    sw_count: i16,
    sw_offset: i16,
    bs_count: i16,
    bs_offset: i16,
    ft_offset: i16,
}



table_cache_hdr_t :: struct
{
    cache: ^table_cache_t,
    table: ^table_t,
    prev: ^table_cache_hdr_t,
    next: ^table_cache_hdr_t,
    empty: c.bool,
}

table_cache_list_t :: struct
{
    first: ^table_cache_hdr_t,
    last: ^table_cache_hdr_t,
    count: i32,
}

table_cache_t :: struct
{
    index: map_t,
    tables: table_cache_list_t,
    empty_tables: table_cache_list_t,
}

switch_term_t :: struct
{
    sw_column: ^switch_t,
    sw_case: Entity,
    signature_column_index: i32,
}

bitset_term_t :: struct
{
    bs_column: ^bitset_t,
    column_index: i32,
}

flat_monitor_t :: struct
{
    table_state: i32,
    monitor: i32,
}

flat_table_term_t :: struct
{
    field_index: i32,
    term: ^term_t,
    monitor: vec_t,
}

entity_filter_t :: struct
{
    sw_terms: vec_t,
    bs_terms: vec_t,
    ft_terms: vec_t,
    flat_tree_column: i32,
}

entity_filter_iter_t :: struct
{
    entity_filter: ^entity_filter_t,
    it: ^iter_t,
    columns: [^]i32,
    prev: ^table_t,
    range: table_range_t,
    bs_offset: i32,
    sw_offset: i32,
    sw_smallest: i32,
    flat_tree_offset: i32,
    target_count: i32,
}



query_table_match_t :: struct
{
    next: ^query_table_match_t,
    prev: ^query_table_match_t,
    table: ^table_t ,              
																				
    offset:i32,                  
    count:i32,                   

    columns:[^]i32 ,                
    storage_columns:[^]i32 ,        
    ids: [^]id_t ,                   
    sources: [^]Entity ,           
    refs: vec_t,                  
    group_id: u64,               
    monitor: [^]i32 ,                
    entity_filter:^entity_filter_t , 

    
    next_match:^query_table_match_t,

}

query_table_t :: struct
{
    hdr: table_cache_hdr_t,
    first: ^query_table_match_t,
    last: ^query_table_match_t,
    table_id: u64,
    rematch_count: i32,
}

query_table_list_t :: struct
{
    first: ^query_table_match_t,
    last: ^query_table_match_t,
    info: query_group_info_t,
}

query_event_t :: struct
{
    kind: Query_EventKind,
    table: ^table_t,
    parent_query: ^query_t,
}

query_allocators_t :: struct
{
    columns: block_allocator_t,
    ids: block_allocator_t,
    sources: block_allocator_t,
    monitors: block_allocator_t,
}



event_id_record_t :: struct
{
    self: map_t,
    self_up: map_t,
    up: map_t,
    observers: map_t,
    set_observers: map_t,
    entity_observers: map_t,
    observer_count: i32,
}

world_allocators_t :: struct
{
    ptr: map_params_t,
    query_table_list: map_params_t,
    query_table: block_allocator_t,
    query_table_match: block_allocator_t,
    graph_edge_lo: block_allocator_t,
    graph_edge: block_allocator_t,
    id_record: block_allocator_t,
    id_record_chunk: block_allocator_t,
    table_diff: block_allocator_t,
    sparse_chunk: block_allocator_t,
    hashmap: block_allocator_t,
    diff_builder: table_diff_builder_t,
}

stage_allocators_t :: struct
{
    iter_stack: stack_t,
    deser_stack: stack_t,
    cmd_entry_chunk: block_allocator_t,
}


cmd_entry_t :: struct
{
    first: i32,
    last: i32,
}

cmd_1_t :: struct
{
    value: rawptr,
    size: size_t,
    clone_value: c.bool,
}

cmd_n_t :: struct
{
    entities: [^]Entity,
    count: i32,
}

cmd_t :: struct
{
    kind: Cmd_Kind,
    next_for_entity: i32,
    id: id_t,
    idr: ^id_record_t,
    entry:^cmd_entry_t,
    entity: Entity,

    is: struct #raw_union {
        _1: cmd_1_t,
        _n: cmd_n_t,
    },
}




Commands ::struct {
   queue: vec_t,
    stack: stack_t,          
    entries: sparse_t,       
} 





monitor_t :: struct
{
    queries: vec_t,
    is_dirty: c.bool,
}

monitor_set_t :: struct
{
    monitors: map_t,
    is_dirty: c.bool,
}

marked_id_t :: struct
{
    idr: ^id_record_t,
    id: id_t,
    action: Entity,
    delete_id: c.bool,
}


store_t :: struct
{
    entity_index: ecs_entity_index_t,
    tables: sparse_t,
    table_map: hashmap_t,
    root: table_t,
    records: vec_t,
    marked_ids: vec_t,
    depth_ids: vec_t,
    entity_to_depth: map_t,
}


ecs_script_t :: struct
{
    using_: vec_t,
    script: cstring,
    prop_defaults: vec_t,
    world: ^world_t,
}

script_desc_t :: struct
{
    entity: Entity,
    filename: cstring,
    str: cstring,
}



time_t :: struct
{
    sec: u32,
    nanosec: u32,
}


os_api_t :: struct
{
    
    init_: os_api_init_t,
    fini_: os_api_fini_t,

    
    malloc_: os_api_malloc_t,
    realloc_: os_api_realloc_t,
    calloc_: os_api_calloc_t,
    free_: os_api_free_t,

    
    strdup_: os_api_strdup_t,

    
    thread_new_: os_api_thread_new_t,
    thread_join_: os_api_thread_join_t,
    thread_self_: os_api_thread_self_t,

    
    ainc_: os_api_ainc_t,
    adec_: os_api_ainc_t,
    lainc_: os_api_lainc_t,
    ladec_: os_api_lainc_t,

    
    mutex_new_: os_api_mutex_new_t,
    mutex_free_: os_api_mutex_free_t,
    mutex_lock_: os_api_mutex_lock_t,
    mutex_unlock_: os_api_mutex_unlock_t,

    
    cond_new_: os_api_cond_new_t,
    cond_free_: os_api_cond_free_t,
    cond_signal_: os_api_cond_signal_t,
    cond_broadcast_: os_api_cond_broadcast_t,
    cond_wait_: os_api_cond_wait_t,

    
    sleep_: os_api_sleep_t,
    now_: os_api_now_t,
    get_time_: os_api_get_time_t,

    
    
    
    
    
    
    log_: os_api_log_t,

    
    abort_: os_api_abort_t,

    
    dlopen_: os_api_dlopen_t,
    dlproc_: os_api_dlproc_t,
    dlclose_: os_api_dlclose_t,

    
    module_to_dl_: os_api_module_to_path_t,

    
    module_to_etc_: os_api_module_to_path_t,

    
    log_level_: i32,

    
    log_indent_: i32,

    
    log_last_error_: i32,

    
    log_last_timestamp_: i64,

    
    flags_: flags32_t,
}

ecs_metric_value_t :: struct
{
    value: f64,
}

ecs_metric_source_t :: struct
{
    entity: Entity,
}

metric_desc_t :: struct
{
    entity: Entity,
    member: Entity,
    id: id_t,
    targets: c.bool,
    kind: Entity,
    brief: cstring,
}





ecs_meta_type_t :: struct
{
    kind: Type_Kind,
    existing: c.bool,
    partial: c.bool,
    size: size_t,
    alignment: size_t,
}

ecs_primitive_t :: struct
{
    kind: Primitive_Kind,
}

ecs_member_t :: struct
{
    type_: Entity,
    count: i32,
    unit: Entity,
    offset: i32,
}

member_t :: struct
{
    name: cstring,
    type_: Entity,
    count: i32,
    offset: i32,
    unit: Entity,
    size: size_t,
    member: Entity,
}

ecs_struct_t :: struct
{
    members: vec_t,
}

enum_constant_t :: struct
{
    name: cstring,
    value: i32,
    constant: Entity,
}

ecs_enum_t :: struct
{
    constants: map_t,
}

bitmask_constant_t :: struct
{
    name: cstring,
    value: flags32_t,
    constant: Entity,
}

ecs_bitmask_t :: struct
{
    constants: map_t,
}

ecs_array_t :: struct
{
    type_: Entity,
    count: i32,
}

ecs_vector_t :: struct
{
    type_: Entity,
}

serializer_t :: struct
{
    value: proc "c" (ser: ^serializer_t, type_: Entity, value: rawptr) -> c.int,
    member: proc "c" (ser: ^serializer_t, member: cstring) -> c.int,
    world: ^world_t,
    ctx: rawptr,
}



ecs_opaque_t :: struct
{
    as_type: Entity,
    serialize: meta_serialize_t,
    assign_bool: proc "c" (dst: rawptr, value: c.bool),
    assign_char: proc "c" (dst: rawptr, value: c.char),
    assign_int: proc "c" (dst: rawptr, value: i64),
    assign_uint: proc "c" (dst: rawptr, value: u64),
    assign_float: proc "c" (dst: rawptr, value: f64),
    assign_string: proc "c" (dst: rawptr, value: cstring),
    assign_entity: proc "c" (dst: rawptr, world: ^world_t, entity: Entity),
    assign_null: proc "c" (dst: rawptr),
    clear: proc "c" (dst: rawptr),
    ensure_element: proc "c" (dst: rawptr, elem: size_t) -> rawptr,
    ensure_member: proc "c" (dst: rawptr, member: cstring) -> rawptr,
    count: proc "c" (dst: rawptr) -> size_t,
    resize: proc "c" (dst: rawptr, count: size_t),
}

unit_translation_t :: struct
{
    factor: i32,
    power: i32,
}

ecs_unit_t :: struct
{
    symbol: cstring,
    prefix: Entity,
    base: Entity,
    over: Entity,
    translation: unit_translation_t,
}

ecs_unit_prefix_t :: struct
{
    symbol: cstring,
    translation: unit_translation_t,
}


meta_type_op_t :: struct
{
    kind: Meta_Type_Op_Kind,
    offset: size_t,
    count: i32,
    name: cstring,
    op_count: i32,
    size: size_t,
    type_: Entity,
    unit: Entity,
    members: ^hashmap_t,
}

ecs_meta_type_serialized_t :: struct
{
    ops: vec_t,
}



meta_scope_t :: struct
{
    type_: Entity,
    ops: [^]meta_type_op_t,
    op_count: i32,
    op_cur: i32,
    elem_cur: i32,
    prev_depth: i32,
    ptr: rawptr,

    comp: ^ecs_component_t,
    opaque: ^ecs_opaque_t,
    vector: ^vec_t,
    members: ^hashmap_t,
    is_collection: c.bool,
    is_inline_array: c.bool,
    is_empty_scope: c.bool,
}

meta_cursor_t :: struct
{
    world: ^world_t,
    scope: [META_MAX_SCOPE_DEPTH]meta_scope_t,
    depth: i32,
    valid: c.bool,
    is_primitive_scope: c.bool,

    lookup_action: proc "c" (_: ^world_t, _: cstring, _: rawptr) -> Entity,
    lookup_ctx: rawptr,
}

primitive_desc_t :: struct
{
    entity: Entity,
    kind: Primitive_Kind,
}

enum_desc_t :: struct
{
    entity: Entity,
    constants: [MEMBER_DESC_CACHE_SIZE]enum_constant_t,
}

bitmask_desc_t :: struct
{
    entity: Entity,
    constants: [MEMBER_DESC_CACHE_SIZE]bitmask_constant_t,
}

array_desc_t :: struct
{
    entity: Entity,
    type_: Entity,
    count: i32,
}

vector_desc_t :: struct
{
    entity: Entity,
    type_: Entity,
}

struct_desc_t :: struct
{
    entity: Entity,
    members: [MEMBER_DESC_CACHE_SIZE]member_t,
}

opaque_desc_t :: struct
{
    entity: Entity,
    type_: ecs_opaque_t,
}


http_send_request_t :: struct
{
    sock: HTTP_Socket,
    headers: cstring,
    header_length: i32,
    content: cstring,
    content_length: i32,
}

http_send_queue_t :: struct
{
    requests: [HTTP_SEND_QUEUE_MAX]http_send_request_t,
    head: i32,
    tail: i32,
    thread: os_thread_t,
    wait_ms: i32,
}



http_server_t :: struct
{
    should_run: c.bool,
    running: c.bool,
    sock: HTTP_Socket,
    lock: os_mutex_t,
    thread: os_thread_t,
    callback: HTTP_Reply_Action,
    ctx: rawptr,
    connections: sparse_t,
    requests: sparse_t,
    initialized: c.bool,
    port: u16,
    ipaddr: cstring,
    dequeue_timeout: f64,
    stats_timeout: f64,
    request_time: f64,
    request_time_total: f64,
    requests_processed: i32,
    requests_processed_total: i32,
    dequeue_count: i32,
    send_queue: http_send_queue_t,
    request_cache: hashmap_t,
}

http_connection_t :: struct
{
    id: u64,
    server: ^http_server_t,
    host: [128]c.char,
    port: [16]c.char,
}

http_key_value_t :: struct
{
    key: cstring,
    value: cstring,
}

http_request_t :: struct
{
    id: u64,
    method: HTTP_Method,
    path: cstring,
    body: cstring,
    headers: [HTTP_HEADER_COUNT_MAX]http_key_value_t,
    params: [HTTP_HEADER_COUNT_MAX]http_key_value_t,
    header_count: i32,
    param_count: i32,
    conn: ^http_connection_t,
}

http_reply_t :: struct
{
    code: c.int,
    body: strbuf_t,
    status: cstring,
    content_type: cstring,
    headers: strbuf_t,
}


from_json_desc_t :: struct
{
    name: cstring,
    expr: cstring,
    lookup_action: proc "c" (_: ^world_t, value: cstring, ctx: rawptr) -> Entity,
    lookup_ctx: rawptr,
}

entity_to_json_desc_t :: struct
{
    serialize_path: c.bool,
    serialize_meta_ids: c.bool,
    serialize_label: c.bool,
    serialize_brief: c.bool,
    serialize_link: c.bool,
    serialize_color: c.bool,
    serialize_id_labels: c.bool,
    serialize_base: c.bool,
    serialize_private: c.bool,
    serialize_hidden: c.bool,
    serialize_values: c.bool,
    serialize_type_info: c.bool,
}

ENTITY_TO_JSON_INIT : entity_to_json_desc_t : entity_to_json_desc_t {
    true, false, false, false, false, false, false, true, false, false, false, false,
}

iter_to_json_desc_t :: struct
{
    serialize_term_ids: c.bool,
    serialize_ids: c.bool,
    serialize_sources: c.bool,
    serialize_variables: c.bool,
    serialize_is_set: c.bool,
    serialize_values: c.bool,
    serialize_entities: c.bool,
    serialize_entity_labels: c.bool,
    serialize_entity_ids: c.bool,
    serialize_entity_names: c.bool,
    serialize_variable_labels: c.bool,
    serialize_variable_ids: c.bool,
    serialize_colors: c.bool,
    measure_eval_duration: c.bool,
    serialize_type_info: c.bool,
    serialize_table: c.bool,
}

pipeline_desc_t :: struct
{
    entity: Entity,
    query: query_desc_t,
}


ITER_TO_JSON_INIT : iter_to_json_desc_t : iter_to_json_desc_t {
    true, true, true, true, true, true, true, false, false, false, false, false, false, false, false, false,
}

world_to_json_desc_t :: struct
{
    serialize_builtin: c.bool,
    serialize_modules: c.bool,
}

id_record_elem_t :: struct
{
    prev: ^id_record_t,
    next: ^id_record_t,
}

reachable_elem_t :: struct
{
    tr: ^table_record_t,
    record: ^record_t,
    src: Entity,
    id: id_t,
}

reachable_cache_t :: struct
{
    generation: i32,
    current: i32,
    ids: vec_t,
}



http_server_desc_t :: struct
{
    callback: HTTP_Reply_Action,
    ctx: rawptr,
    port: u16,
    ipaddr: cstring,
    send_queue_wait_ms: i32,
}


unit_desc_t :: struct
{
    entity: Entity,
    symbol: cstring,
    quantity: Entity,
    base: Entity,
    over: Entity,
    translation: unit_translation_t,
    prefix: Entity,
}

unit_prefix_desc_t :: struct
{
    entity: Entity,
    symbol: cstring,
    translation: unit_translation_t,
}



bucket_entry_t :: struct
{
    key: Map_Key,
    value: Map_Val,
    next: ^bucket_entry_t,
}

hm_bucket_t :: struct
{
    keys: vec_t,
    values: vec_t,
}

hashmap_t :: struct
{
    hash: hash_value_action_t,
    compare: compare_action_t,
    key_size: size_t,
    value_size: size_t,
    hashmap_allocator: ^block_allocator_t,
    bucket_allocator: block_allocator_t,
    impl: map_t,
}

hashmap_iter_t :: struct
{
    it: map_iter_t,
    bucket: ^hm_bucket_t,
    index: i32,
}

hashmap_result_t :: struct
{
    key: rawptr,
    value: rawptr,
    hash: u64,
}


bucket_t :: struct
{
    first: ^bucket_entry_t,
}

map_t :: struct
{
    bucket_shift: u8,
    shared_allocator: c.bool,
    buckets: [^]bucket_t,
    bucket_count: i32,
    count: i32,
    entry_allocator: ^block_allocator_t,
    allocator: ^allocator_t,
}

map_iter_t :: struct
{
    map_: ^map_t,
    bucket: ^bucket_t,
    entry: ^bucket_entry_t,
    res: [^]Map_Data,
}

map_params_t :: struct
{
    allocator: ^allocator_t,
    entry_allocator: block_allocator_t,
}

ecs_stats_header_t :: struct
{
    elapsed: ftime_t,
    reduce_count: i32,
}

action_elem_t :: struct
{
    action: fini_action_t,
    ctx: rawptr,
}





 ecs_entity_index_page_t::struct {
    records:[FLECS_ENTITY_PAGE_SIZE]record_t,
} 

 ecs_entity_index_t::struct {
     dense: vec_t,
     pages: vec_t,
     alive_count,i32,
     max_id,u64,
    page_allocator:block_allocator_t,
    allocator:^allocator_t,
}


flatten_desc_t :: struct
{
    keep_names: c.bool,
    lose_depth: c.bool,
}

ecs_rest_t :: struct
{
    port: u16,
    ipaddr: cstring,
    impl: rawptr,
}

event_desc_t :: struct
{
    event: Entity,
    ids: ^type_t,
    table: ^table_t,
    other_table: ^table_t,
    offset: i32,
    count: i32,
    entity: Entity,
    param: rawptr,
    observable: poly_t_ptr,
    flags: flags32_t,
}


parse_expr_desc_t :: struct
{
    name: cstring,
    expr: cstring,
    lookup_action: proc "c" (_: ^world_t, value: cstring, ctx: rawptr) -> Entity,
    lookup_ctx: rawptr,
    vars: ^vars_t, 
}


record_t :: struct
{
    idr: ^id_record_t,
    table: ^table_t,
    row: u32,
}

data_t :: struct
{
    entities: vec_t,
    records: vec_t,
    columns: ^vec_t,
}

stack_t :: struct
{
    first: stack_page_t,
    cur: ^stack_page_t,
}

block_allocator_block_t :: struct
{
    memory: rawptr,
    next: ^block_allocator_block_t,
}

block_allocator_chunk_header_t :: struct
{
    next: ^block_allocator_chunk_header_t,
}

block_allocator_t :: struct
{
    head: ^block_allocator_chunk_header_t,
    block_head: ^block_allocator_block_t,
    block_tail: ^block_allocator_block_t,
    chunk_size: i32,
    data_size: i32,
    chunks_per_block: i32,
    block_size: i32,
    alloc_count: i32,
}

bitset_t :: struct
{
    data: [^]u64,
    count: i32,
    size: size_t,
}



event_record_t :: struct
{
    any_: ^event_id_record_t,
    wildcard: ^event_id_record_t,
    wildcard_pair: ^event_id_record_t,
    event_ids: map_t,
    event: Entity,
}

observable_t :: struct
{
    on_add: event_record_t,
    on_remove: event_record_t,
    on_set: event_record_t,
    un_set: event_record_t,
    on_wildcard: event_record_t,
    events: sparse_t,
}



table_range_t :: struct
{
    table: ^table_t,
    offset: i32,
    count: i32,
}

var_t :: struct
{
    range: table_range_t,
    entity: Entity,
}
vars_t :: struct
{
    world: ^world_t,
    root: expr_var_scope_t,
    cur: ^expr_var_scope_t,
}

ref_t :: struct
{
    entity: Entity,
    id: Entity,
    tr: ^table_record_t,
    record: ^record_t,
}

stack_page_t :: struct
{
    data: rawptr,
    next: ^stack_page_t,
    sp: i16,
    id: u32,
}

stack_cursor_t :: struct
{
    cur: ^stack_page_t,
    sp: i16,
}

page_iter_t :: struct
{
    offset: i32,
    limit: i32,
    remaining: i32,
}

worker_iter_t :: struct
{
    index: i32,
    count: i32,
}

table_cache_iter_t :: struct
{
    cur: ^table_cache_hdr_t,
    next: ^table_cache_hdr_t,
    next_list: [^]table_cache_hdr_t,
}

term_iter_t :: struct
{
    term: term_t,
    self_index: ^id_record_t,
    set_index: ^id_record_t,

    cur: ^id_record_t,
    it: table_cache_iter_t,
    index: i32,
    observed_table_count: i32,

    table: ^table_t,
    cur_match: i32,
    match_count: i32,
    last_column: i32,

    empty_tables: c.bool,

    
    id: id_t,
    column: i32,
    subject: Entity,
    size: size_t,
    ptr: rawptr,
}


filter_iter_t :: struct
{
    filter: ^filter_t,
    kind: Iter_Kind,
    term_iter: term_iter_t,
    matches_left: i32,
    pivot_term: i32,
}

query_iter_t :: struct
{
    query: ^query_t,
    node: ^query_table_match_t,
    prev: ^query_table_match_t,
    last: ^query_table_match_t,
    sparse_smallest: i32,
    sparse_first: i32,
    bitset_first: i32,
    skip_count: i32,
}

snapshot_iter_t :: struct
{
    filter: filter_t,
    tables: vec_t,
    index: i32,
}

rule_op_profile_t :: struct
{
    count: [2]i32,
}

rule_iter_t :: struct
{
    rule: ^rule_t,
    vars: [^]var_t, 
    rule_vars: [^]rule_var_t,
    ops: [^]rule_op_t,
    op_ctx: ^rule_op_ctx_t,
    written: ^u64,
    

    redo: c.bool,
    op: i16,
    sp: i16,
}


iter_cache_t :: struct
{
    stack_cursor: ^stack_cursor_t,
    used: flags8_t,
    allocated: flags8_t,
}

iter_private_t :: struct
{
    iter: struct #raw_union {
        term: term_iter_t,
        filter: filter_iter_t,
        query: query_iter_t,
        rule: rule_iter_t,
        snapshot: snapshot_iter_t,
        page: page_iter_t,
        worker: worker_iter_t,
    },

    entity_iter: rawptr,
    cache: iter_cache_t,
}

iter_t :: struct
{
    
    world: ^world_t,
    real_world: ^world_t,

    
    entities: [^]Entity,
    ptrs: [^]rawptr,
    sizes: [^]size_t,
    table: ^table_t,
    other_table: ^table_t,
    ids: [^]id_t,
    variables: [^]var_t, 
    columns: [^]i32,
    sources: [^]Entity,
    match_indices: [^]i32,

    references: [^]ref_t,
    constrained_vars: flags64_t,
    group_id: u64,
    field_count: i32,

    
    system: Entity,
    event: Entity,
    event_id: id_t,

    
    terms: [^]term_t,
    table_count: i32,
    term_index: i32,
    variable_count: i32,
    variable_names: [^]cstring,

    
    param: rawptr,
    ctx: rawptr,
    binding_ctx: rawptr,

    
    delta_time: ftime_t,
    delta_system_time: ftime_t,

    
    frame_offset: i32,
    offset: i32,
    count: i32,
    instance_count: i32,

    
    flags: flags32_t,

    interrupted_by: Entity,
    
    priv: iter_private_t,

    
    next: iter_next_action_t,
    callback: iter_action_t,
    fini: iter_fini_action_t,
    chain_it: ^iter_t,
}


