package flecs

import "core:c"

when ODIN_OS == .Windows
{
    foreign import flecs "system:flecs.lib"
}

// // _ Functions
// @(default_calling_convention = "c", link_prefix = "ecs_", private)
// foreign flecs
// {
//     // Map
//     map_get_deref_ :: proc(map_: ^Map, key: Map_Key) -> rawptr ---

//     // Misc
//     poly_is_ :: proc(object: poly_t_ptr, type_: i32) -> c.bool ---

//     // Log
//     deprecated_ :: proc(file: cstring, line: i32, msg: cstring) ---
//     log_push_ :: proc(level: i32) ---
//     log_pop_ :: proc(level: i32) ---
//     print_ :: proc(
//         level: i32,
//         file: cstring,
//         line: i32,
//         fmt: cstring,
//         #c_vararg _: ..any,
//     ) ---
//     printv_ :: proc(
//         level: c.int,
//         file: cstring,
//         line: i32,
//         fmt: cstring,
//         args: cstring,
//     ) ---
//     log_ :: proc(
//         level: i32,
//         file: cstring,
//         line: i32,
//         fmt: cstring,
//         #c_vararg _: ..any,
//     ) ---
//     logv_ :: proc(
//         level: c.int,
//         file: cstring,
//         line: i32,
//         fmt: cstring,
//         args: cstring,
//     ) ---
//     abort_ :: proc(
//         error_code: i32,
//         file: cstring,
//         line: i32,
//         fmt: cstring,
//         #c_vararg _: ..any,
//     ) ---
//     assert_ :: proc(
//         condition: c.bool,
//         error_code: i32,
//         condition_str: cstring,
//         file: cstring,
//         line: i32,
//         fmt: cstring,
//         #c_vararg _: ..any,
//     ) -> c.bool ---
//     parser_error_ :: proc(
//         name: cstring,
//         expr: cstring,
//         column: i64,
//         fmt: cstring,
//         #c_vararg _: ..any,
//     ) ---
//     parser_errorv_ :: proc(
//         name: cstring,
//         expr: cstring,
//         column: i64,
//         fmt: cstring,
//         args: cstring,
//     ) ---
// }

// // Public functions
// @(default_calling_convention = "c", link_prefix = "ecs_a")
// foreign flecs
// {
//     // OS API
//     os_init :: proc() ---
//     os_fini :: proc() ---
//     os_set_api :: proc(os_api: ^os_api_t) ---
//     os_get_api :: proc() -> os_api_t ---
//     os_set_api_defaults :: proc() ---
//     os_dbg :: proc(file: cstring, line: i32, message: cstring) ---
//     os_trace :: proc(file: cstring, line: i32, message: cstring) ---
//     os_warn :: proc(file: cstring, line: i32, message: cstring) ---
//     os_err :: proc(file: cstring, line: i32, message: cstring) ---
//     os_fatal :: proc(file: cstring, line: i32, message: cstring) ---
//     os_strerror :: proc(err: c.int) -> cstring ---
//     os_strset :: proc(str: [^]cstring, value: cstring) ---
//     sleepf :: proc(t: f64) ---
//     time_measure :: proc(start: ^time_t) -> f64 ---
//     time_sub :: proc(t1: time_t, t2: time_t) -> time_t ---
//     time_to_double :: proc(t: time_t) -> f64 ---
//     os_memdup :: proc(src: rawptr, size: size_t) -> rawptr ---
//     os_has_heap :: proc() -> c.bool ---
//     os_has_threading :: proc() -> c.bool ---
//     os_has_time :: proc() ->  c.bool ---
//     os_has_logging :: proc() -> c.bool ---
//     os_has_dl :: proc() -> c.bool ---
//     os_has_modules :: proc() -> c.bool ---

//     // API Support
//     module_path_from_c :: proc(c_name: cstring) -> cstring ---
//     default_ctor :: proc(ptr: rawptr, count: i32, ctx: ^Type_Info) ---
//     asprintf :: proc(fmt: cstring, #c_vararg args: ..any) -> cstring ---

//     // Map
//     map_params_init :: proc(params: ^Map_Params, allocator: ^Allocator) ---
//     map_params_fini :: proc(params: ^Map_Params) ---
//     map_init :: proc(map_: ^Map, allocator: ^Allocator) ---
//     map_init_w_params :: proc(map_: ^Map, params: ^Map_Params) ---
//     map_init_if :: proc(map_: ^Map, allocator: ^Allocator) ---
//     map_init_w_params_if :: proc(result: ^Map, params: ^Map_Params) ---
//     map_fini :: proc(map_: ^Map) ---
//     map_get :: proc(map_: ^Map, key: Map_Key) -> ^Map_Val ---
//     map_ensure :: proc(map_: ^Map, key: Map_Key) -> ^Map_Val ---
//     map_ensure_alloc :: proc(map_: ^Map, elem_size: size_t, key: Map_Key) -> rawptr ---
//     map_insert :: proc(map_: ^Map, key: Map_Key, value: Map_Val) ---
//     map_insert_alloc :: proc(map_: ^Map, elem_size: size_t, key: Map_Key) -> rawptr ---
//     map_remove :: proc(map_: ^Map, key: Map_Key) -> Map_Val ---
//     map_remove_free :: proc(map_: ^Map, key: Map_Key) ---
//     map_clear :: proc(map_: ^Map) ---
//     map_iter :: proc(map_: ^Map) -> Map_Iter ---
//     map_next :: proc(iter: ^Map_Iter) -> c.bool ---
//     map_copy :: proc(dst: ^Map, src: ^Map) ---

//     // Sparse
//     sparse_init :: proc(sparse: ^Sparse, elem_size: size_t) ---
//     sparse_add :: proc(sparse: ^Sparse, elem_size: size_t) -> rawptr ---
//     sparse_last_id :: proc(sparse: ^Sparse) -> u64 ---
//     sparse_count :: proc(sparse: ^Sparse) -> i32 ---
//     sparse_get_dense :: proc(sparse: ^Sparse, elem_size: size_t, index: i32) -> rawptr ---
//     sparse_get :: proc(sparse: ^Sparse, elem_size: size_t, id: u64) -> rawptr ---

//     // StrBuf
//     strbuf_append :: proc(buffer: ^StrBuf, fmt: cstring, #c_vararg args: ..any) -> c.bool ---
//     strbuf_vappend :: proc(buffer: ^StrBuf, fmt: cstring, #c_vararg args: ..any) -> c.bool ---
//     strbuf_appendstr :: proc(buffer: ^StrBuf, str: cstring) -> c.bool ---
//     strbuf_appendch :: proc(buffer: ^StrBuf, ch: c.char) -> c.bool ---
//     strbuf_appendint :: proc(buffer: ^StrBuf, v: i64) -> c.bool ---
//     strbuf_appendflt :: proc(buffer: ^StrBuf, v: c.double, nan_delim: c.char) -> c.bool ---
//     strbuf_mergebuff :: proc(dst_buffer: ^StrBuf, src_buffer: ^StrBuf) -> c.bool ---
//     strbuf_appendstr_zerocpy :: proc(buffer: ^StrBuf, str: cstring) -> c.bool ---
//     strbuf_appendstr_zerocpyn :: proc(buffer: ^StrBuf, str: cstring, n: i32) -> c.bool ---
//     strbuf_appendstr_zerocpy_const :: proc(buffer: ^StrBuf, str: cstring) -> c.bool ---
//     strbuf_appendstr_zerocpyn_const :: proc(buffer: ^StrBuf, str: cstring, n: i32) -> c.bool ---
//     strbuf_appendstrn :: proc(buffer: ^StrBuf, str: cstring, n: i32) -> c.bool ---
//     strbuf_get :: proc(buffer: ^StrBuf) -> cstring ---
//     strbuf_get_small :: proc(buffer: ^StrBuf) -> cstring ---
//     strbuf_reset :: proc(buffer: ^StrBuf) ---
//     strbuf_list_push :: proc(buffer: ^StrBuf, list_open: cstring, separator: cstring) ---
//     strbuf_list_pop :: proc(buffer: ^StrBuf, list_close: cstring) ---
//     strbuf_list_next :: proc(buffer: ^StrBuf) ---
//     strbuf_list_appendch :: proc(buffer: ^StrBuf, ch: c.char) -> c.bool ---
//     strbuf_list_append :: proc(buffer: ^StrBuf, fmt: cstring, #c_vararg args: ..any) -> c.bool ---
//     strbuf_list_appendstr :: proc(buffer: ^StrBuf, str: cstring) -> c.bool ---
//     strbuf_list_appendstrn :: proc(buffer: ^StrBuf, str: cstring, n: i32) -> c.bool ---
//     strbuf_written :: proc(buffer: ^StrBuf) -> i32 ---

//     // Vec
//     vec_init :: proc(allocator: ^Allocator, vec: ^Vec, size: size_t, elem_count: i32) -> ^Vec ---
//     vec_init_if :: proc(vec: ^Vec, size: size_t) ---
//     vec_fini :: proc(allocator: ^Allocator, vec: ^Vec, size: size_t) ---
//     vec_reset :: proc(allocator: ^Allocator, vec: ^Vec, size: size_t) -> ^Vec ---
//     vec_clear :: proc(vec: ^Vec) ---
//     vec_append :: proc(allocator: ^Allocator, vec: ^Vec, size: size_t) -> rawptr ---
//     vec_remove :: proc(vec: ^Vec, size: size_t, elem: i32) ---
//     vec_remove_last :: proc(vec: ^Vec) ---
//     vec_copy :: proc(allocator: ^Allocator, vec: ^Vec, size: size_t) -> Vec ---
//     vec_reclaim :: proc(allocator: ^Allocator, vec: ^Vec, size: size_t) ---
//     vec_set_size :: proc(allocator: ^Allocator, vec: ^Vec, size: size_t, elem_count: i32) ---
//     vec_set_min_size :: proc(allocator: ^Allocator, vec: ^Vec, size: size_t, elem_count: i32) ---
//     vec_set_min_count :: proc(allocator: ^Allocator, vec: ^Vec, size: size_t, elem_count: i32) ---
//     vec_set_min_count_zeromem :: proc(allocator: ^Allocator, vec: ^Vec, size: size_t, elem_count: i32) ---
//     vec_set_count :: proc(allocator: ^Allocator, vec: ^Vec, size: size_t, elem_count: i32) ---
//     vec_grow :: proc(allocator: ^Allocator, vec: ^Vec, size: size_t, elem_count: i32) -> rawptr ---
//     vec_count :: proc(vec: ^Vec) -> i32 ---
//     vec_size :: proc(vec: ^Vec) -> i32 ---
//     vec_get :: proc(vec: ^Vec, size: size_t, index: i32) -> rawptr ---
//     vec_first :: proc(vec: ^Vec) -> rawptr ---
//     vec_last :: proc(vec: ^Vec, size: size_t) -> rawptr ---

//     // World
//     init :: proc() -> ^world_t ---
//     mini :: proc() -> ^world_t ---
//     init_w_args :: proc(argc: c.int, argv: []cstring) -> ^world_t ---
//     fini :: proc(world: ^world_t) -> c.int ---
//     is_fini :: proc(world: ^world_t) -> c.bool ---
//     atfini :: proc(world: ^world_t, action: fini_action_t, ctx: rawptr) ---

//     // Frame functions
//     frame_begin :: proc(world: ^world_t, delta_time: ftime_t) -> ftime_t ---
//     frame_end :: proc(world: ^world_t) ---
//     run_post_frame :: proc(world: ^world_t, action: fini_action_t, ctx: rawptr) ---
//     quit :: proc(world: ^world_t) ---
//     should_quit :: proc(world: ^world_t) -> c.bool ---
//     measure_frame_time :: proc(world: ^world_t, enable: c.bool) ---
//     measure_system_time :: proc(world: ^world_t, enable: c.bool) ---
//     set_target_fps :: proc(world: ^world_t, fps: ftime_t) ---

//     // Commands
//     readonly_begin :: proc(world: ^world_t) -> c.bool ---
//     readonly_end :: proc(world: ^world_t) ---
//     merge :: proc(world: ^world_t) ---
//     defer_begin :: proc(world: ^world_t) -> c.bool ---
//     is_deferred :: proc(world: ^world_t) -> c.bool ---
//     defer_end :: proc(world: ^world_t) -> c.bool ---
//     defer_suspend :: proc(world: ^world_t) ---
//     defer_resume :: proc(world: ^world_t) ---
//     set_automerge :: proc(world: ^world_t, automerge: c.bool) ---
//     set_stage_count :: proc(world: ^world_t, stages: i32) ---
//     get_stage_count :: proc(world: ^world_t) -> i32 ---
//     get_stage_id :: proc(world: ^world_t) -> i32 ---
//     get_stage :: proc(world: ^world_t, stage_id: i32) -> ^world_t ---
//     stage_is_readonly :: proc(world: ^world_t) -> c.bool ---
//     async_stage_new :: proc(world: ^world_t) -> ^world_t ---
//     async_stage_free :: proc(stage: ^world_t) ---
//     stage_is_async :: proc(stage: ^world_t) -> c.bool ---

//     // Misc
//     set_ctx :: proc(world: ^world_t, ctx: rawptr) ---
//     get_ctx :: proc(world: ^world_t) -> rawptr ---
//     get_world_info :: proc(world: ^world_t) -> ^world_t_Info ---
//     dim :: proc(world: ^world_t, entity_count: i32) ---
//     set_entity_range :: proc(world: ^world_t, id_start: Entity, id_end: Entity) ---
//     enable_range_check :: proc(world: ^world_t, enable: c.bool) -> c.bool ---
//     run_aperiodic :: proc(world: ^world_t, flags: flags32_t) ---
//     delete_empty_tables :: proc(
//         world: ^world_t,
//         id: id_t,
//         clear_generation: u16,
//         delete_generation: u16,
//         min_id_count: i32,
//         time_budget_seconds: f64,
//     ) -> i32 ---
//     get_world :: proc(poly: Poly) -> ^world_t ---
//     get_entity :: proc(poly: Poly) -> Entity ---
//     make_pair :: proc(first: Entity, second: Entity) -> Entity ---

//     // Entities
    
//     // Creating & Deleting
//     new_id :: proc(world: ^world_t) -> Entity ---
//     new_low_id :: proc(world: ^world_t) -> Entity ---
//     new_w_id :: proc(world: ^world_t, id: id_t) -> Entity ---
//     new_w_table :: proc(world: ^world_t, table: ^Table) -> Entity ---
//     entity_init :: proc(world: ^world_t, desc: ^Entity_Desc) -> Entity ---
//     bulk_init :: proc(world: ^world_t, desc: ^Bulk_Desc) -> [^]Entity ---
//     bulk_new_w_id :: proc(world: ^world_t, id: id_t, count: i32) -> [^]Entity ---
//     clone :: proc(
//         world: ^world_t,
//         dst: Entity,
//         src: Entity,
//         copy_value: c.bool,
//     ) -> Entity ---
//     delete :: proc(world: ^world_t, entity: Entity) ---
//     delete_with :: proc(world: ^world_t, id: Id) ---

//     // Adding & Removing
//     add_id :: proc(world: ^world_t, entity: Entity, id: Id) ---
//     remove_id :: proc(world: ^world_t, entity: Entity, id: Id) ---
//     override_id :: proc(world: ^world_t, entity: Entity, id: Id) ---
//     clear :: proc(world: ^world_t, entity: Entity) ---
//     remove_all :: proc(world: ^world_t, id: Id) ---
//     set_with :: proc(world: ^world_t, id: Id) -> Entity ---
//     get_with :: proc(world: ^world_t) -> Id ---

//     // Enable & Disabling
//     enable :: proc(world: ^world_t, entity: Entity, enabled: c.bool) ---
//     enable_id :: proc(world: ^world_t, entity: Entity, id: Id, enable: c.bool) ---
//     is_enabled_id :: proc(world: ^world_t, entity: Entity, id: Id) -> c.bool ---

//     // Getting & Setting
//     get_id :: proc(world: ^world_t, entity: Entity, id: Id) -> rawptr ---
//     ref_init_id :: proc(world: ^world_t, entity: Entity, id: Id) -> Ref ---
//     ref_get_id :: proc(world: ^world_t, ref: ^Ref, id: Id) -> rawptr ---
//     ref_update :: proc(world: ^world_t, ref: ^Ref) ---
//     get_mut_id :: proc(world: ^world_t, entity: Entity, id: Id) -> rawptr ---
//     write_begin :: proc(world: ^world_t, entity: Entity) -> ^Record ---
//     write_end :: proc(record: ^Record) ---
//     read_begin :: proc(world: ^world_t, entity: Entity) -> ^Record ---
//     read_end :: proc(record: ^Record) ---
//     record_get_entity :: proc(record: ^Record) -> Entity ---
//     record_get_id :: proc(world: ^world_t, record: ^Record, id: Id) -> rawptr ---
//     record_get_mut_id :: proc(world: ^world_t, record: ^Record, id: Id) -> rawptr ---
//     record_has_id :: proc(world: ^world_t, record: ^Record, id: Id) -> c.bool ---
//     emplace_id :: proc(world: ^world_t, entity: Entity, id: Id) -> rawptr ---
//     modified_id :: proc(world: ^world_t, entity: Entity, id: Id) ---
//     set_id :: proc(
//         world: ^world_t,
//         entity: Entity,
//         id: Id,
//         size: size_t,
//         ptr: rawptr,
//     ) -> Entity ---

//     // Entity Liveliness
//     is_valid :: proc(world: ^world_t, e: Entity) -> c.bool ---
//     is_alive :: proc(world: ^world_t, e: Entity) -> c.bool ---
//     strip_generation :: proc(e: Entity) -> Id ---
//     set_entity_generation :: proc(world: ^world_t, entity: Entity) ---
//     get_alive :: proc(world: ^world_t, e: Entity) -> Entity ---
//     ensure :: proc(world: ^world_t, entity: Entity) ---
//     ensure_id :: proc(world: ^world_t, id: Id) ---
//     exists :: proc(world: ^world_t, entity: Entity) -> c.bool ---

//     // Entity Information
//     get_type :: proc(world: ^world_t, entity: Entity) -> ^Type ---
//     get_table :: proc(world: ^world_t, entity: Entity) -> ^Table ---
//     type_str :: proc(world: ^world_t, type_: ^Type) -> cstring ---
//     table_str :: proc(world: ^world_t, table: ^Table) -> cstring ---
//     entity_str :: proc(world: ^world_t, entity: Entity) -> cstring ---
//     has_id :: proc(world: ^world_t, entity: Entity, id: Id) -> c.bool ---
//     get_target :: proc(
//         world: ^world_t, 
//         entity: Entity, 
//         rel: Entity, 
//         index: i32,
//     ) -> Entity ---
//     get_parent :: proc(world: ^world_t, entity: Entity) -> Entity ---
//     get_target_for_id :: proc(
//         world: ^world_t,
//         entity: Entity,
//         rel: Entity,
//         id: Id,
//     ) -> Entity ---
//     get_depth :: proc(
//         world: ^world_t,
//         entity: Entity,
//         rel: Entity,
//     ) -> i32 ---
//     flatten :: proc(
//         world: ^world_t,
//         pair: Id,
//         desc: ^Flatten_Desc,
//     ) ---
//     count_id :: proc(world: ^world_t, entity: Id) -> i32 ---

//     // Entity Names
//     get_name :: proc(world: ^world_t, entity: Entity) -> cstring ---
//     get_symbol :: proc(world: ^world_t, entity: Entity) -> cstring ---
//     set_name :: proc(world: ^world_t, entity: Entity, name: cstring) -> Entity ---
//     set_symbol :: proc(world: ^world_t, entity: Entity, symbol: cstring) -> Entity ---
//     set_alias :: proc(world: ^world_t, entity: Entity, alias: cstring) ---
//     lookup :: proc(world: ^world_t, name: cstring) -> Entity ---
//     lookup_child :: proc(world: ^world_t, parent: Entity, name: cstring) -> Entity ---
//     lookup_path_w_sep :: proc(
//         world: ^world_t,
//         parent: Entity,
//         path: cstring,
//         sep: cstring,
//         prefix: cstring,
//         recursive: c.bool,
//     ) -> Entity ---
//     lookup_symbol :: proc(
//         world: ^world_t,
//         symbol: cstring,
//         lookup_as_path: c.bool,
//         recursive: c.bool,
//     ) -> Entity ---
//     get_path_w_sep :: proc(
//         world: ^world_t,
//         parent: Entity,
//         child: Entity,
//         sep: cstring,
//         prefix: cstring,
//     ) -> cstring ---
//     get_path_w_sep_buf :: proc(
//         world: ^world_t,
//         parent: Entity,
//         child: Entity,
//         sep: cstring,
//         prefix: cstring,
//         buf: ^StrBuf,
//     ) ---
//     new_from_path_w_sep :: proc(
//         world: ^world_t,
//         parent: Entity,
//         path: cstring,
//         sep: cstring,
//         prefix: cstring,
//     ) -> Entity ---
//     add_path_w_sep :: proc(
//         world: ^world_t,
//         entity: Entity,
//         parent: Entity,
//         path: cstring,
//         sep: cstring,
//         prefix: cstring,
//     ) -> Entity ---
//     set_scope :: proc(world: ^world_t, scope: Entity) -> Entity ---
//     get_scope :: proc(world: ^world_t) -> Entity ---
//     set_name_prefix :: proc(world: ^world_t, prefix: cstring) -> cstring ---
//     set_lookup_path :: proc(
//         world: ^world_t,
//         lookup_path: [^]Entity,
//     ) -> [^]Entity ---
//     get_lookup_path :: proc(world: ^world_t) -> [^]Entity ---

//     // Components
//     component_init :: proc(world: ^world_t, desc: ^Component_Desc) -> Entity ---
//     set_hooks_id :: proc(world: ^world_t, id: Entity, hooks: ^Type_Hooks) ---
//     get_hooks_id :: proc(world: ^world_t, id: Entity) -> ^Type_Hooks ---

//     // Ids
//     id_is_tag :: proc(world: ^world_t, id: Id) -> c.bool ---
//     id_is_union :: proc(world: ^world_t, id: Id) -> c.bool ---
//     id_in_use :: proc(world: ^world_t, id: Id) -> c.bool ---
//     get_type_info :: proc(world: ^world_t, id: Id) -> ^Type_Info ---
//     get_typeid :: proc(world: ^world_t, id: Id) -> Entity ---
//     id_match :: proc(id: Id, pattern: Id) -> c.bool ---
//     id_is_pair :: proc(id: Id) -> c.bool ---
//     id_is_wildcard :: proc(id: Id) -> c.bool ---
//     id_is_valid :: proc(world: ^world_t, id: Id) -> c.bool ---
//     id_get_flags :: proc(world: ^world_t, id: Id) -> flags32_t ---
//     id_flag_str :: proc(id_flags: Id) -> cstring ---
//     id_str :: proc(world: ^world_t, id: Id) -> cstring ---
//     id_str_buf :: proc(world: ^world_t, id: Id, buf: ^StrBuf) ---

//     // Filters
//     term_iter :: proc(world: ^world_t, term: ^Term) -> Iter ---
//     term_chain_iter :: proc(it: ^Iter, term: ^Term) -> Iter ---
//     term_next :: proc(it: ^Iter) -> c.bool ---
//     children :: proc(world: ^world_t, parent: Entity) -> Iter ---
//     children_next :: proc(it: ^Iter) -> c.bool ---
//     term_id_is_set :: proc(id: ^Term_Id) -> c.bool ---
//     term_is_initialized :: proc(term: ^Term) -> c.bool ---
//     term_match_this :: proc(term: ^Term) -> c.bool ---
//     term_match_0 :: proc(term: ^Term) -> c.bool ---
//     term_finalize :: proc(world: ^world_t, term: ^Term) -> c.int ---
//     term_copy :: proc(src: ^Term) -> Term ---
//     term_move :: proc(src: ^Term) -> Term ---
//     term_fini :: proc(term: ^Term) ---
//     filter_init :: proc(world: ^world_t, desc: ^Filter_Desc) -> ^Filter ---
//     filter_fini :: proc(filter: ^Filter) ---
//     filter_finalize :: proc(world: ^world_t, filter: ^Filter) -> c.int ---
//     filter_find_this_var :: proc(filter: ^Filter) -> i32 ---
//     term_str :: proc(world: ^world_t, term: ^Term) -> cstring ---
//     filter_str :: proc(world: ^world_t, filter: ^Filter) -> cstring ---
//     filter_iter :: proc(world: ^world_t, filter: ^Filter) -> Iter ---
//     filter_chain_iter :: proc(it: ^Iter, filter: ^Filter) -> Iter ---
//     filter_pivot_term :: proc(world: ^world_t, filter: ^Filter) -> i32 ---
//     filter_next :: proc(it: ^Iter) -> c.bool ---
//     filter_next_instanced :: proc(it: ^Iter) -> c.bool ---
//     filter_move :: proc(dst: ^Filter, src: ^Filter) ---
//     filter_copy :: proc(dst: ^Filter, src: ^Filter) ---

//     // Queries
//     query_init :: proc(world: ^world_t, desc: ^query_t_Desc) -> ^query_t ---
//     query_fini :: proc(query: ^query_t) ---
//     query_get_filter :: proc(query: ^query_t) -> ^Filter ---
//     query_iter :: proc(world: ^world_t, query: ^query_t) -> Iter ---
//     query_next :: proc(iter: ^Iter) -> c.bool ---
//     query_next_instanced :: proc(iter: ^Iter) -> c.bool ---
//     query_next_table :: proc(iter: ^Iter) -> c.bool ---
//     query_populate :: proc(iter: ^Iter, when_changed: c.bool) -> c.int ---
//     query_changed :: proc(query: ^query_t, it: ^Iter) -> c.bool ---
//     query_skip :: proc(it: ^Iter) ---
//     query_set_group :: proc(it: ^Iter, group_id: u64) ---
//     query_get_group_ctx :: proc(query: ^query_t, group_id: u64) -> rawptr ---
//     query_get_group_info :: proc(query: ^query_t, group_id: u64) -> ^query_t_Group_Info ---
//     query_orphaned :: proc(query: ^query_t) -> c.bool ---
//     query_str :: proc(query: ^query_t) -> cstring ---
//     query_table_count :: proc(query: ^query_t) -> i32 ---
//     query_empty_table_count :: proc(query: ^query_t) -> i32 ---
//     query_entity_count :: proc(query: ^query_t) -> i32 ---

//     // Observers
//     emit :: proc(world: ^world_t, desc: ^Event_Desc) ---
//     observer_init :: proc(world: ^world_t, desc: ^Observer_Desc) -> Entity ---
//     observer_default_run_action :: proc(it: ^Iter) -> c.bool ---
//     observer_get_ctx :: proc(world: ^world_t, observer: Entity) -> rawptr ---
//     observer_get_binding_ctx :: proc(world: ^world_t, observer: Entity) -> rawptr ---

//     // Iterators
//     iter_poly :: proc(world: ^world_t, poly: Poly, iter: ^Iter, filter: ^Filter) ---
//     iter_next :: proc(it: ^Iter) -> c.bool ---
//     iter_fini :: proc(it: ^Iter) ---
//     iter_count :: proc(it: ^Iter) -> i32 ---
//     iter_is_true :: proc(it: ^Iter) -> c.bool ---
//     iter_first :: proc(it: ^Iter) -> Entity ---
//     iter_set_var :: proc(it: ^Iter, var_id: i32, entity: Entity) ---
//     iter_set_var_as_table :: proc(it: ^Iter, var_id: i32, table: ^Table) ---
//     iter_set_var_as_range :: proc(it: ^Iter, var_id: i32, range: ^Table_Range) ---
//     iter_get_var :: proc(it: ^Iter, var_id: i32) -> Entity ---
//     iter_get_var_as_table :: proc(it: ^Iter, var_id: i32) -> ^Table ---
//     iter_get_var_as_range :: proc(it: ^Iter, var_id: i32) -> Table_Range ---
//     iter_var_is_constrained :: proc(it: ^Iter, var_id: i32) -> c.bool ---
//     page_iter :: proc(it: ^Iter, offset: i32, limit: i32) -> Iter ---
//     page_next :: proc(it: ^Iter) -> c.bool ---
//     worker_iter :: proc(it: ^Iter, index: i32, count: i32) -> Iter ---
//     worker_next :: proc(it: ^Iter) -> c.bool ---
//     field_w_size :: proc(it: ^Iter, size: size_t, index: i32) -> rawptr ---
//     field_is_readonly :: proc(it: ^Iter, index: i32) -> c.bool ---
//     field_is_writeonly :: proc(it: ^Iter, index: i32) -> c.bool ---
//     field_is_set :: proc(it: ^Iter, index: i32) -> c.bool ---
//     field_id :: proc(it: ^Iter, index: i32) -> Id ---
//     field_column_index :: proc(it: ^Iter, index: i32) -> i32 ---
//     field_src :: proc(it: ^Iter, index: i32) -> Entity ---
//     field_size :: proc(it: ^Iter, index: i32) -> Size ---
//     field_is_self :: proc(it: ^Iter, index: i32) -> c.bool ---
//     iter_str :: proc(it: ^Iter) -> cstring ---

//     // Tables
//     table_get_type :: proc(table: ^Table) -> ^Type ---
//     table_get_column :: proc(table: ^Table, index: i32, offset: i32) -> rawptr ---
//     table_get_column_size :: proc(table: ^Table, index: i32) -> Size ---
//     table_has_id :: proc(world: ^world_t, table: ^Table, id: Id) -> c.bool ---
//     table_get_id :: proc(world: ^world_t, table: ^Table, id: Id, offset: i32) -> rawptr ---
//     table_get_depth :: proc(world: ^world_t, table: ^Table, rel: Entity) -> i32 ---
//     table_type_to_column_index :: proc(table: ^Table, index: i32) -> i32 ---
//     table_column_to_type_index :: proc(table: ^Table, index: i32) -> i32 ---
//     table_count :: proc(table: ^Table) -> i32 ---
//     table_add_id :: proc(world: ^world_t, table: ^Table, id: Id) -> ^Table ---
//     table_find :: proc(world: ^world_t, ids: [^]Id, id_count: i32) -> ^Table ---
//     table_remove_id :: proc(world: ^world_t, table: ^Table, id: Id) -> ^Table ---
//     table_lock :: proc(world: ^world_t, table: ^Table) ---
//     table_unlock :: proc(world: ^world_t, table: ^Table) ---
//     table_has_flags :: proc(table: ^Table,flags:flags32_t) -> c.bool ---
//     table_swap_rows :: proc(world: ^world_t, table: ^Table, row_1: i32, row_2: i32) ---
//     commit :: proc(
//         world: ^world_t,
//         entity: Entity,
//         record: ^Record,
//         table: ^Table,
//         added: ^Type,
//         removed: ^Type,
//     ) -> c.bool ---
//     record_find :: proc(world: ^world_t, entity: Entity) -> ^Record ---
//     record_get_column :: proc(r: ^Record, column: i32, c_size: size_t) -> rawptr ---
//     search :: proc(world: ^world_t, table: ^Table, id: Id, id_out: ^Id = nil) -> i32 ---
//     search_offset :: proc(
//         world: ^world_t,
//         table: ^Table,
//         offset: i32,
//         id: Id,
//         id_out: ^Id = nil,
//     ) -> i32 ---
//     search_relation :: proc(
//         world: ^world_t,
//         table: ^Table,
//         offset: i32,
//         id: Id,
//         rel: Entity,
//         flags: flags32_t,
//         subject_out: ^Entity,
//         id_out: ^Id = nil,
//         tr_out: [^]^Table_Record,
//     ) -> i32 ---

//     // Values
//     value_init :: proc(world: ^world_t, type_: Entity, ptr: rawptr) -> c.int ---
//     value_init_w_type_info :: proc(world: ^world_t, ti: ^Type_Info, ptr: rawptr) -> c.int ---
//     value_new :: proc(world: ^world_t, type_: Entity) -> rawptr ---
//     value_new_w_type_info :: proc(world: ^world_t, ti: ^Type_Info) -> rawptr ---
//     value_fini_w_type_info :: proc(world: ^world_t, ti: ^Type_Info, ptr: rawptr) -> c.int ---
//     value_fini :: proc(world: ^world_t, type_: Entity, ptr: rawptr) -> c.int ---
//     value_free :: proc(world: ^world_t, type_: Entity, ptr: rawptr) -> c.int ---
//     value_copy_w_type_info :: proc(
//         world: ^world_t,
//         ti: ^Type_Info,
//         dst: rawptr,
//         src: rawptr,
//     ) -> c.int ---
//     value_copy :: proc(
//         world: ^world_t,
//         type_: Entity,
//         dst: rawptr,
//         src: rawptr,
//     ) -> c.int ---
//     value_move_w_type_info :: proc(
//         world: ^world_t,
//         ti: ^Type_Info,
//         dst: rawptr,
//         src: rawptr,
//     ) -> c.int ---
//     value_move :: proc(
//         world: ^world_t,
//         type_: Entity,
//         dst: rawptr,
//         src: rawptr,
//     ) -> c.int ---
//     value_move_ctor_w_type_info :: proc(
//         world: ^world_t,
//         ti: ^Type_Info,
//         dst: rawptr,
//         src: rawptr,
//     ) -> c.int ---
//     value_move_ctor :: proc(
//         world: ^world_t,
//         type_: Entity,
//         dst: rawptr,
//         src: rawptr,
//     ) -> c.int ---

//     // App
//     app_run :: proc(world: ^world_t, desc: ^App_Desc) -> c.int ---
//     app_run_frame :: proc(world: ^world_t, desc: ^App_Desc) -> c.int ---
//     app_set_run_action :: proc(callback: App_Run_Action) -> c.int ---
//     app_set_frame_action :: proc(callback: App_Frame_Action) -> c.int ---

//     // Doc
//     doc_set_name :: proc(world: ^world_t, entity: Entity, name: cstring) ---
//     doc_set_brief :: proc(world: ^world_t, entity: Entity, desc: cstring) ---
//     doc_set_detail :: proc(world: ^world_t, entity: Entity, desc: cstring) ---
//     doc_set_link :: proc(world: ^world_t, entity: Entity, link: cstring) ---
//     doc_set_color :: proc(world: ^world_t, entity: Entity, color: cstring) ---
//     doc_get_name :: proc(world: ^world_t, entity: Entity) -> cstring ---
//     doc_get_brief :: proc(world: ^world_t, entity: Entity) -> cstring ---
//     doc_get_detail :: proc(world: ^world_t, entity: Entity) -> cstring ---
//     doc_get_link :: proc(world: ^world_t, entity: Entity) -> cstring ---
//     doc_get_color :: proc(world: ^world_t, entity: Entity) -> cstring ---

//     // Expr
//     chresc :: proc(out: cstring, in_: c.char, delimiter: c.char) -> cstring ---
//     stresc :: proc(out: cstring, size: size_t, delimiter: c.char, in_: cstring) -> Size ---
//     astresc :: proc(delimiter: c.char, in_: cstring) -> cstring ---
//     vars_init :: proc(world: ^world_t, vars: ^Vars) ---
//     vars_fini :: proc(vars: ^Vars) ---
//     vars_push :: proc(vars: ^Vars) ---
//     vars_pop :: proc(vars: ^Vars) -> c.int ---
//     vars_declare :: proc(vars: ^Vars, name: cstring, type_: Entity) -> ^Expr_Var ---
//     vars_declare_w_value :: proc(vars: ^Vars, name: cstring, value: ^Value) -> ^Expr_Var ---
//     vars_lookup :: proc(vars: ^Vars, name: cstring) -> ^Expr_Var ---
//     parse_expr :: proc(
//         world: ^world_t, 
//         ptr: cstring, 
//         value: ^Value, 
//         desc: ^Parse_Expr_Desc,
//     ) -> cstring ---
//     ptr_to_expr :: proc(world: ^world_t, type_: Entity, data: rawptr) -> cstring ---
//     ptr_to_expr_buf :: proc(
//         world: ^world_t, 
//         type_: Entity, 
//         data: rawptr, 
//         buf: ^StrBuf,
//     ) -> c.int ---
//     primitive_to_expr_buf :: proc(
//         world: ^world_t,
//         kind: Primitive_Kind,
//         data: rawptr,
//         buf: ^StrBuf,
//     ) -> c.int ---
//     parse_expr_token :: proc(
//         name: cstring,
//         expr: cstring,
//         ptr: cstring,
//         token: cstring,
//     ) -> cstring ---

//     // HTTP
//     http_request_received_count: i64
//     http_request_invalid_count: i64
//     http_request_handled_ok_count: i64
//     http_request_handled_error_count: i64
//     http_request_not_handled_count: i64
//     http_request_preflight_count: i64
//     http_send_ok_count: i64
//     http_send_error_count: i64
//     http_busy_count: i64

//     http_server_init :: proc(desc: ^HTTP_Server_Desc) -> ^HTTP_Server ---
//     http_server_fini :: proc(server: ^HTTP_Server) ---
//     http_server_start :: proc(server: ^HTTP_Server) -> c.int ---
//     http_server_dequeue :: proc(server: ^HTTP_Server, delta_time: ftime_t) ---
//     http_server_stop :: proc(server: ^HTTP_Server) ---
//     http_server_http_request :: proc(
//         srv: ^HTTP_Server,
//         req: cstring,
//         len: size_t,
//         reply_out: ^HTTP_Reply,
//     ) -> c.int ---
//     http_server_request :: proc(
//         srv: ^HTTP_Server,
//         method: cstring,
//         req: cstring,
//         reply_out: ^HTTP_Reply,
//     ) -> c.int ---
//     http_server_ctx :: proc(srv: ^HTTP_Server) -> rawptr ---
//     http_get_header :: proc(req: ^HTTP_Request, name: cstring) -> cstring ---
//     http_get_param :: proc(req: ^HTTP_Request, name: cstring) -> cstring ---

//     // JSON
//     ptr_from_json :: proc(
//         world: ^world_t,
//         type_: Entity,
//         ptr: rawptr,
//         json: cstring,
//         desc: ^From_JSON_Desc,
//     ) -> cstring ---
//     entity_from_json :: proc(
//         world: ^world_t,
//         entity: Entity,
//         json: cstring,
//         desc: ^From_JSON_Desc,
//     ) -> cstring ---
//     world_from_json :: proc(
//         world: ^world_t,
//         json: cstring,
//         desc: ^From_JSON_Desc,
//     ) -> cstring ---
//     array_to_json :: proc(
//         world: ^world_t,
//         type_: Entity,
//         data: rawptr,
//         count: i32,
//     ) -> cstring ---
//     array_to_json_buf :: proc(
//         world: ^world_t,
//         type_: Entity,
//         data: rawptr,
//         count: i32,
//         buf_out: ^StrBuf,
//     ) -> c.int ---
//     ptr_to_json :: proc(
//         world: ^world_t,
//         type_: Entity,
//         data: rawptr,
//     ) -> cstring ---
//     ptr_to_json_buf :: proc(
//         world: ^world_t,
//         type_: Entity,
//         data: rawptr,
//         buf_out: ^StrBuf,
//     ) -> c.int ---
//     type_info_to_json :: proc(
//         world: ^world_t,
//         type_: Entity,
//     ) -> cstring ---
//     type_info_to_json_buf :: proc(
//         world: ^world_t,
//         type_: Entity,
//         buf_out: ^StrBuf,
//     ) -> c.int ---
//     entity_to_json :: proc(
//         world: ^world_t,
//         entity: Entity,
//         desc: ^Entity_To_JSON_Desc,
//     ) -> cstring ---
//     entity_to_json_buf :: proc(
//         world: ^world_t,
//         entity: Entity,
//         buf_out: ^StrBuf,
//         desc: ^Entity_To_JSON_Desc,
//     ) -> c.int ---
//     iter_to_json :: proc(
//         world: ^world_t,
//         iter: ^Iter,
//         desc: ^Iter_To_JSON_Desc,
//     ) -> cstring ---
//     iter_to_json_buf :: proc(
//         world: ^world_t,
//         iter: ^Iter,
//         buf_out: ^StrBuf,
//         desc: ^Iter_To_JSON_Desc,
//     ) -> c.int ---
//     world_to_json :: proc(
//         world: ^world_t,
//         desc: ^world_t_To_JSON_Desc,
//     ) -> cstring ---
//     world_to_json_buf :: proc(
//         world: ^world_t,
//         buf_out: ^StrBuf,
//         desc: ^world_t_To_JSON_Desc,
//     ) -> c.int ---

//     // Log
//     should_log :: proc(level: i32) -> c.bool ---
//     strerror :: proc(error_code: i32) -> cstring ---
//     log_set_level :: proc(level: c.int) -> c.int ---
//     log_get_level :: proc() -> c.int ---
//     log_enable_colors :: proc(enabled: c.bool) -> c.bool ---
//     log_enable_timestamp :: proc(enabled: c.bool) -> c.bool ---
//     log_enable_timedelta :: proc(enabled: c.bool) -> c.bool ---
//     log_last_error :: proc() -> c.int ---

//     // Meta
//     meta_from_desc :: proc(
//         world: ^world_t,
//         component: Entity,
//         kind: Type_Kind,
//         desc: cstring,
//     ) -> c.int ---
//     meta_cursor :: proc(world: ^world_t, type_: Entity, ptr: rawptr) -> Meta_Cursor ---
//     meta_get_ptr :: proc(cursor: ^Meta_Cursor) -> rawptr ---
//     meta_next :: proc(cursor: ^Meta_Cursor) -> c.int ---
//     meta_elem :: proc(cursor: ^Meta_Cursor, elem: i32) -> c.int ---
//     meta_member :: proc(cursor: ^Meta_Cursor, name: cstring) -> c.int ---
//     meta_dotmember :: proc(cursor: ^Meta_Cursor, name: cstring) -> c.int ---
//     meta_push :: proc(cursor: ^Meta_Cursor) -> c.int ---
//     meta_pop :: proc(cursor: ^Meta_Cursor) -> c.int ---
//     meta_is_collection :: proc(cursor: ^Meta_Cursor) -> c.bool ---
//     meta_get_type :: proc(cursor: ^Meta_Cursor) -> Entity ---
//     meta_get_unit :: proc(cursor: ^Meta_Cursor) -> Entity ---
//     meta_get_member :: proc(cursor: ^Meta_Cursor) -> cstring ---
//     meta_set_bool :: proc(cursor: ^Meta_Cursor, value: c.bool) -> c.int ---
//     meta_set_char :: proc(cursor: ^Meta_Cursor, value: c.char) -> c.int ---
//     meta_set_int :: proc(cursor: ^Meta_Cursor, value: i64) -> c.int ---
//     meta_set_uint :: proc(cursor: ^Meta_Cursor, value: u64) -> c.int ---
//     meta_set_float :: proc(cursor: ^Meta_Cursor, value: f64) -> c.int ---
//     meta_set_string :: proc(cursor: ^Meta_Cursor, value: cstring) -> c.int ---
//     meta_set_string_literal :: proc(cursor: ^Meta_Cursor, value: cstring) -> c.int ---
//     meta_set_entity :: proc(cursor: ^Meta_Cursor, value: Entity) -> c.int ---
//     meta_set_null :: proc(cursor: ^Meta_Cursor) -> c.int ---
//     meta_set_value :: proc(cursor: ^Meta_Cursor, value: ^Value) -> c.int ---
//     meta_get_bool :: proc(cursor: ^Meta_Cursor) -> c.bool ---
//     meta_get_char :: proc(cursor: ^Meta_Cursor) -> c.char ---
//     meta_get_int :: proc(cursor: ^Meta_Cursor) -> i64 ---
//     meta_get_uint :: proc(cursor: ^Meta_Cursor) -> u64 ---
//     meta_get_float :: proc(cursor: ^Meta_Cursor) -> f64 ---
//     meta_get_string :: proc(cursor: ^Meta_Cursor) -> cstring ---
//     meta_get_entity :: proc(cursor: ^Meta_Cursor) -> Entity ---
//     meta_ptr_to_float :: proc(type_kind: Primitive_Kind, ptr: rawptr) -> f64 ---
//     primitive_init :: proc(world: ^world_t, desc: ^Primitive_Desc) -> Entity ---
//     enum_init :: proc(world: ^world_t, desc: ^Enum_Desc) -> Entity ---
//     bitmask_init :: proc(world: ^world_t, desc: ^Bitmask_Desc) -> Entity ---
//     array_init :: proc(world: ^world_t, desc: ^Array_Desc) -> Entity ---
//     vector_init :: proc(world: ^world_t, desc: ^Vector_Desc) -> Entity ---
//     struct_init :: proc(world: ^world_t, desc: ^Struct_Desc) -> Entity ---
//     opaque_init :: proc(world: ^world_t, desc: ^Opaque_Desc) -> Entity ---
//     unit_init :: proc(world: ^world_t, desc: ^Unit_Desc) -> Entity ---
//     unit_prefix_init :: proc(world: ^world_t, desc: ^Unit_Prefix_Desc) -> Entity ---
//     quantity_init :: proc(world: ^world_t, desc: ^Entity_Desc) -> Entity ---

//     // Metrics
//     metric_init :: proc(world: ^world_t, desc: ^Metric_Desc) -> Entity ---

//     // Module
//     @(link_name="import") import_module :: proc(
//         world: ^world_t,
//         module: Module_Action,
//         module_name: cstring,
//     ) -> Entity ---
//     import_c :: proc(
//         world: ^world_t,
//         module: Module_Action,
//         module_name_c: cstring,
//     ) -> Entity ---
//     import_from_library :: proc(
//         world: ^world_t,
//         library_name: cstring,
//         module_name: cstring,
//     ) -> Entity ---
//     module_init :: proc(
//         world: ^world_t,
//         c_name: cstring,
//         desc: ^Component_Desc,
//     ) -> Entity ---

//     // OS API Impl
//     set_os_api_impl :: proc() ---

//     // Parser
//     parse_ws :: proc(ptr: cstring) -> cstring ---
//     parse_ws_eol :: proc(ptr: cstring) -> cstring ---
//     parse_identifier :: proc(
//         name: cstring,
//         expr: cstring,
//         ptr: cstring,
//         token_out: cstring,
//     ) -> cstring ---
//     parse_digit :: proc(
//         ptr: cstring,
//         token: cstring,
//     ) -> cstring ---
//     parse_token :: proc(
//         name: cstring,
//         expr: cstring,
//         ptr: cstring,
//         token_out: cstring,
//         delim: c.char,
//     ) -> cstring ---
//     parse_term :: proc(
//         world: ^world_t,
//         name: cstring,
//         expr: cstring,
//         ptr: cstring,
//         term_out: ^Term,
//     ) -> cstring ---

//     // Pipeline
//     pipeline_init :: proc(world: ^world_t, desc: ^Pipeline_Desc) -> Entity ---
//     set_pipeline :: proc(world: ^world_t, pipeline: Entity) ---
//     get_pipeline :: proc(world: ^world_t) -> Entity ---
//     progress :: proc(world: ^world_t, delta_time: ftime_t) -> c.bool ---
//     set_time_scale :: proc(world: ^world_t, scale: ftime_t) ---
//     reset_clock :: proc(world: ^world_t) ---
//     run_pipeline :: proc(world: ^world_t, pipeline: Entity, delta_time: ftime_t) ---
//     set_threads :: proc(world: ^world_t, threads: i32) ---
    
//     // Plecs
//     plecs_from_str :: proc(world: ^world_t, name: cstring, str: cstring) -> c.int ---
//     plecs_from_file :: proc(world: ^world_t, filename: cstring) -> c.int ---
//     script_init :: proc(world: ^world_t, desc: ^Script_Desc) -> Entity ---
//     script_update :: proc(
//         world: ^world_t,
//         script: Entity,
//         instance: Entity,
//         str: cstring,
//         vars: ^Vars,
//     ) -> c.int ---
//     script_clear :: proc(world: ^world_t, script: Entity, instance: Entity) ---

//     // REST
//     rest_server_init :: proc(world: ^world_t, desc: ^HTTP_Server_Desc) -> ^HTTP_Server ---
//     rest_server_fini :: proc(srv: ^HTTP_Server) ---

//     // Rules
//     rule_init :: proc(world: ^world_t, desc: ^Filter_Desc) -> ^Rule ---
//     rule_fini :: proc(rule: ^Rule) ---
//     rule_get_filter :: proc(rule: ^Rule) -> ^Filter ---
//     rule_var_count :: proc(rule: ^Rule) -> i32 ---
//     rule_find_var :: proc(rule: ^Rule, name: cstring) -> i32 ---
//     rule_var_name :: proc(rule: ^Rule, var_id: i32) -> cstring ---
//     rule_var_is_entity :: proc(rule: ^Rule, var_id: i32) -> c.bool ---
//     rule_iter :: proc(world: ^world_t, rule: ^Rule) -> Iter ---
//     rule_next :: proc(it: ^Iter) -> c.bool ---
//     rule_next_instanced :: proc(it: ^Iter) -> c.bool ---
//     rule_str :: proc(rule: ^Rule) -> cstring ---
//     rule_str_w_profile :: proc(rule: ^Rule, it: ^Iter) -> cstring ---
//     rule_parse_vars :: proc(rule: ^Rule, it: ^Iter, expr: cstring) -> cstring ---
// }

// // Flecs functions
// @(default_calling_convention = "c", link_prefix = "flecs_")
// foreign flecs
// {
//     // Allocator
//     allocator_init :: proc(a: ^Allocator) ---
//     allocator_fini :: proc(a: ^Allocator) ---
//     allocator_get :: proc(a: ^Allocator, size: size_t) -> ^Block_Allocator ---
//     strdup :: proc(a: ^Allocator, str: cstring) -> cstring ---
//     strfree :: proc(a: ^Allocator, str: cstring) ---
//     dup :: proc(a: ^Allocator, size: size_t, src: rawptr) -> rawptr ---

//     // Block_Allocator
//     ballocator_init :: proc(ba: ^Block_Allocator, size: size_t) ---
//     ballocator_new :: proc(size: size_t) -> ^Block_Allocator ---
//     ballocator_fini :: proc(ba: ^Block_Allocator) ---
//     ballocator_free :: proc(ba: ^Block_Allocator) ---
//     balloc :: proc(allocator: ^Block_Allocator) -> rawptr ---
//     bcalloc :: proc(allocator: ^Block_Allocator) -> rawptr ---
//     bfree :: proc(allocator: ^Block_Allocator, memory: rawptr) ---
//     brealloc :: proc(dst: ^Block_Allocator, src: ^Block_Allocator, memory: rawptr) -> rawptr ---
//     bdup :: proc(ba: ^Block_Allocator, memory: rawptr) -> rawptr ---

//     // Sparse
//     sparse_set_generation :: proc(sparse: ^Sparse, id: u64) ---
// }

/// Externs
@(default_calling_convention = "c")
foreign flecs
{
    
  
    ECS_PAIR: c.ulonglong
    ECS_OVERRIDE: c.ulonglong
    ECS_TOGGLE: c.ulonglong
    ECS_AND: c.ulonglong

@(link_name="EcsComponent") EcsComponent_ID:  Entity
@(link_name="EcsIdentifier") EcsIdentifier_ID:  Entity
@(link_name="EcsIterable") EcsIterable_ID:  Entity
@(link_name="EcsPoly") EcsPoly_ID:  Entity
@(link_name="EcsTickSource") EcsTickSource_ID:  Entity
@(link_name="EcsPipelineQuery") EcsPipelineQuery_ID:  Entity
@(link_name="EcsTimer") EcsTimer_ID:  Entity
@(link_name="EcsRateFilter") EcsRateFilter_ID:  Entity
@(link_name="EcsFlecs") EcsFlecs_ID:  Entity
@(link_name="EcsFlecsCore") EcsFlecsCore_ID:  Entity
@(link_name="EcsWorld") EcsWorld_ID:  Entity
@(link_name="EcsWildcard") EcsWildcard_ID:  Entity
@(link_name="EcsAny") EcsAny_ID:  Entity
@(link_name="EcsThis") EcsThis_ID:  Entity
@(link_name="EcsVariable") EcsVariable_ID:  Entity
@(link_name="EcsTransitive") EcsTransitive_ID:  Entity
@(link_name="EcsReflexive") EcsReflexive_ID:  Entity
@(link_name="EcsFinal") EcsFinal_ID:  Entity
@(link_name="EcsDontInherit") EcsDontInherit_ID:  Entity
@(link_name="EcsAlwaysOverride") EcsAlwaysOverride_ID:  Entity
@(link_name="EcsSymmetric") EcsSymmetric_ID:  Entity
@(link_name="EcsExclusive") EcsExclusive_ID:  Entity
@(link_name="EcsAcyclic") EcsAcyclic_ID:  Entity
@(link_name="EcsTraversable") EcsTraversable_ID:  Entity
@(link_name="EcsWith") EcsWith_ID:  Entity
@(link_name="EcsOneOf") EcsOneOf_ID:  Entity
@(link_name="EcsTag") EcsTag_ID:  Entity
@(link_name="EcsUnion") EcsUnion_ID:  Entity
@(link_name="EcsName") EcsName_ID:  Entity
@(link_name="EcsSymbol") EcsSymbol_ID:  Entity
@(link_name="EcsAlias") EcsAlias_ID:  Entity
@(link_name="EcsChildOf") EcsChildOf_ID:  Entity
@(link_name="EcsIsA") EcsIsA_ID:  Entity
@(link_name="EcsDependsOn") EcsDependsOn_ID:  Entity
@(link_name="EcsSlotOf") EcsSlotOf_ID:  Entity
@(link_name="EcsModule") EcsModule_ID:  Entity
@(link_name="EcsPrivate") EcsPrivate_ID:  Entity
@(link_name="EcsPrefab") EcsPrefab_ID:  Entity
@(link_name="EcsDisabled") EcsDisabled_ID:  Entity
@(link_name="EcsOnAdd") EcsOnAdd_ID:  Entity
@(link_name="EcsOnRemove") EcsOnRemove_ID:  Entity
@(link_name="EcsOnSet") EcsOnSet_ID:  Entity
@(link_name="EcsUnSet") EcsUnSet_ID:  Entity
@(link_name="EcsMonitor") EcsMonitor_ID:  Entity
@(link_name="EcsOnTableCreate") EcsOnTableCreate_ID:  Entity
@(link_name="EcsOnTableDelete") EcsOnTableDelete_ID:  Entity
@(link_name="EcsOnTableEmpty") EcsOnTableEmpty_ID:  Entity
@(link_name="EcsOnTableFill") EcsOnTableFill_ID:  Entity
@(link_name="EcsOnDelete") EcsOnDelete_ID:  Entity
@(link_name="EcsOnDeleteTarget") EcsOnDeleteTarget_ID:  Entity
@(link_name="EcsRemove") EcsRemove_ID:  Entity
@(link_name="EcsDelete") EcsDelete_ID:  Entity
@(link_name="EcsPanic") EcsPanic_ID:  Entity
@(link_name="EcsTarget") EcsTarget_ID:  Entity
@(link_name="EcsFlatten") EcsFlatten_ID:  Entity
@(link_name="EcsDefaultChildComponent") EcsDefaultChildComponent_ID:  Entity
@(link_name="EcsPredEq") EcsPredEq_ID:  Entity
@(link_name="EcsPredMatch") EcsPredMatch_ID:  Entity
@(link_name="EcsPredLookup") EcsPredLookup_ID:  Entity
@(link_name="EcsScopeOpen") EcsScopeOpen_ID:  Entity
@(link_name="EcsScopeClose") EcsScopeClose_ID:  Entity
@(link_name="EcsEmpty") EcsEmpty_ID:  Entity
@(link_name="EcsPipeline") EcsPipeline_ID:  Entity
@(link_name="EcsOnStart") EcsOnStart_ID:  Entity
@(link_name="EcsPreFrame") EcsPreFrame_ID:  Entity
@(link_name="EcsOnLoad") EcsOnLoad_ID:  Entity
@(link_name="EcsPostLoad") EcsPostLoad_ID:  Entity
@(link_name="EcsPreUpdate") EcsPreUpdate_ID:  Entity
@(link_name="EcsOnUpdate") EcsOnUpdate_ID:  Entity
@(link_name="EcsOnValidate") EcsOnValidate_ID:  Entity
@(link_name="EcsPostUpdate") EcsPostUpdate_ID:  Entity
@(link_name="EcsPreStore") EcsPreStore_ID:  Entity
@(link_name="EcsOnStore") EcsOnStore_ID:  Entity
@(link_name="EcsPostFrame") EcsPostFrame_ID:  Entity
@(link_name="EcsPhase") EcsPhase_ID:  Entity
@(link_name="EcsRest") EcsRest_ID:  Entity
@(link_name="EcsDocDescription") EcsDocDescription_ID:  Entity
@(link_name="EcsDocBrief") EcsDocBrief_ID:  Entity
@(link_name="EcsDocDetail") EcsDocDetail_ID:  Entity
@(link_name="EcsDocLink") EcsDocLink_ID:  Entity
@(link_name="EcsDocColor") EcsDocColor_ID:  Entity
@(link_name="EcsMetaType") EcsMetaType_ID:  Entity
@(link_name="EcsMetaTypeSerialized") EcsMetaTypeSerialized_ID:  Entity
@(link_name="EcsPrimitive") EcsPrimitive_ID:  Entity
@(link_name="EcsEnum") EcsEnum_ID:  Entity
@(link_name="EcsBitmask") EcsBitmask_ID:  Entity
@(link_name="EcsMember") EcsMember_ID:  Entity
@(link_name="EcsMemberRanges") EcsMemberRanges_ID:  Entity
@(link_name="EcsStruct") EcsStruct_ID:  Entity
@(link_name="EcsArray") EcsArray_ID:  Entity
@(link_name="EcsVector") EcsVector_ID:  Entity
@(link_name="EcsOpaque") EcsOpaque_ID:  Entity
@(link_name="EcsUnit") EcsUnit_ID:  Entity
@(link_name="EcsUnitPrefix") EcsUnitPrefix_ID:  Entity
@(link_name="EcsConstant") EcsConstant_ID:  Entity
@(link_name="EcsQuantity") EcsQuantity_ID:  Entity
@(link_name="ecs_bool_t") ecs_bool_t_ID:  Entity
@(link_name="ecs_char_t") ecs_char_t_ID:  Entity
@(link_name="ecs_byte_t") ecs_byte_t_ID:  Entity
@(link_name="ecs_u8_t") ecs_u8_t_ID:  Entity
@(link_name="ecs_u16_t") ecs_u16_t_ID:  Entity
@(link_name="ecs_u32_t") ecs_u32_t_ID:  Entity
@(link_name="ecs_u64_t") ecs_u64_t_ID:  Entity
@(link_name="ecs_uptr_t") ecs_uptr_t_ID:  Entity
@(link_name="ecs_i8_t") ecs_i8_t_ID:  Entity
@(link_name="ecs_i16_t") ecs_i16_t_ID:  Entity
@(link_name="ecs_i32_t") ecs_i32_t_ID:  Entity
@(link_name="ecs_i64_t") ecs_i64_t_ID:  Entity
@(link_name="ecs_iptr_t") ecs_iptr_t_ID:  Entity
@(link_name="ecs_f32_t") ecs_f32_t_ID:  Entity
@(link_name="ecs_f64_t") ecs_f64_t_ID:  Entity
@(link_name="ecs_string_t") ecs_string_t_ID:  Entity
@(link_name="ecs_entity_t") ecs_entity_t_ID:  Entity


@(link_name="EcsQuery") EcsQuery_ID:  Entity
@(link_name="EcsObserver") EcsObserver_ID:  Entity
@(link_name="EcsSystem") EcsSystem_ID:  Entity



// FLECS_API extern ecs_os_api_t ecs_os_api

// FLECS_API extern ecs_filter_t ECS_FILTER_INIT

@(link_name="FlecsMetrics") FlecsMetrics_ID:  Entity
@(link_name="EcsMetricValue") EcsMetricValue_ID:  Entity
@(link_name="EcsMetricSource") EcsMetricSource_ID:  Entity
@(link_name="FlecsAlerts") FlecsAlerts_ID:  Entity
@(link_name="EcsAlert") EcsAlert_ID:  Entity
@(link_name="EcsAlertInstance") EcsAlertInstance_ID:  Entity
@(link_name="EcsAlertsActive") EcsAlertsActive_ID:  Entity
@(link_name="EcsAlertTimeout") EcsAlertTimeout_ID:  Entity
@(link_name="FlecsMonitor") FlecsMonitor_ID:  Entity
@(link_name="EcsWorldStats") EcsWorldStats_ID:  Entity
@(link_name="EcsWorldSummary") EcsWorldSummary_ID:  Entity
@(link_name="EcsPipelineStats") EcsPipelineStats_ID:  Entity
@(link_name="EcsScript") EcsScript_ID:  Entity


@(link_name="EcsMetric") EcsMetric_ID:  Entity
@(link_name="EcsCounter") EcsCounter_ID:  Entity
@(link_name="EcsCounterIncrement") EcsCounterIncrement_ID:  Entity
@(link_name="EcsCounterId") EcsCounterId_ID:  Entity
@(link_name="EcsGauge") EcsGauge_ID:  Entity
@(link_name="EcsMetricInstance") EcsMetricInstance_ID:  Entity
@(link_name="EcsAlertInfo") EcsAlertInfo_ID:  Entity
@(link_name="EcsAlertWarning") EcsAlertWarning_ID:  Entity
@(link_name="EcsAlertError") EcsAlertError_ID:  Entity
@(link_name="EcsAlertCritical") EcsAlertCritical_ID:  Entity


@(link_name="EcsPeriod1s") EcsPeriod1s_ID:  Entity

@(link_name="EcsPeriod1m") EcsPeriod1m_ID:  Entity

@(link_name="EcsPeriod1h") EcsPeriod1h_ID:  Entity

@(link_name="EcsPeriod1d") EcsPeriod1d_ID:  Entity

@(link_name="EcsPeriod1w") EcsPeriod1w_ID:  Entity

@(link_name="EcsUnitPrefixes") EcsUnitPrefixes_ID:  Entity 
@(link_name="EcsYocto") EcsYocto_ID:  Entity
@(link_name="EcsZepto") EcsZepto_ID:  Entity
@(link_name="EcsAtto") EcsAtto_ID:  Entity
@(link_name="EcsFemto") EcsFemto_ID:  Entity
@(link_name="EcsPico") EcsPico_ID:  Entity
@(link_name="EcsNano") EcsNano_ID:  Entity
@(link_name="EcsMicro") EcsMicro_ID:  Entity
@(link_name="EcsMilli") EcsMilli_ID:  Entity
@(link_name="EcsCenti") EcsCenti_ID:  Entity
@(link_name="EcsDeci") EcsDeci_ID:  Entity
@(link_name="EcsDeca") EcsDeca_ID:  Entity
@(link_name="EcsHecto") EcsHecto_ID:  Entity
@(link_name="EcsKilo") EcsKilo_ID:  Entity
@(link_name="EcsMega") EcsMega_ID:  Entity
@(link_name="EcsGiga") EcsGiga_ID:  Entity
@(link_name="EcsTera") EcsTera_ID:  Entity
@(link_name="EcsPeta") EcsPeta_ID:  Entity
@(link_name="EcsExa") EcsExa_ID:  Entity
@(link_name="EcsZetta") EcsZetta_ID:  Entity
@(link_name="EcsYotta") EcsYotta_ID:  Entity
@(link_name="EcsKibi") EcsKibi_ID:  Entity
@(link_name="EcsMebi") EcsMebi_ID:  Entity
@(link_name="EcsGibi") EcsGibi_ID:  Entity
@(link_name="EcsTebi") EcsTebi_ID:  Entity
@(link_name="EcsPebi") EcsPebi_ID:  Entity
@(link_name="EcsExbi") EcsExbi_ID:  Entity
@(link_name="EcsZebi") EcsZebi_ID:  Entity
@(link_name="EcsYobi") EcsYobi_ID:  Entity
@(link_name="EcsDuration") EcsDuration_ID:  Entity
@(link_name="EcsPicoSeconds") EcsPicoSeconds_ID:  Entity
@(link_name="EcsNanoSeconds") EcsNanoSeconds_ID:  Entity
@(link_name="EcsMicroSeconds") EcsMicroSeconds_ID:  Entity
@(link_name="EcsMilliSeconds") EcsMilliSeconds_ID:  Entity
@(link_name="EcsSeconds") EcsSeconds_ID:  Entity
@(link_name="EcsMinutes") EcsMinutes_ID:  Entity
@(link_name="EcsHours") EcsHours_ID:  Entity
@(link_name="EcsDays") EcsDays_ID:  Entity
@(link_name="EcsTime") EcsTime_ID:  Entity
@(link_name="EcsDate") EcsDate_ID:  Entity
@(link_name="EcsMass") EcsMass_ID:  Entity
@(link_name="EcsGrams") EcsGrams_ID:  Entity
@(link_name="EcsKiloGrams") EcsKiloGrams_ID:  Entity
@(link_name="EcsElectricCurrent") EcsElectricCurrent_ID:  Entity
@(link_name="EcsAmpere") EcsAmpere_ID:  Entity
@(link_name="EcsAmount") EcsAmount_ID:  Entity
@(link_name="EcsMole") EcsMole_ID:  Entity
@(link_name="EcsLuminousIntensity") EcsLuminousIntensity_ID:  Entity
@(link_name="EcsCandela") EcsCandela_ID:  Entity
@(link_name="EcsForce") EcsForce_ID:  Entity
@(link_name="EcsNewton") EcsNewton_ID:  Entity
@(link_name="EcsLength") EcsLength_ID:  Entity
@(link_name="EcsMeters") EcsMeters_ID:  Entity
@(link_name="EcsPicoMeters") EcsPicoMeters_ID:  Entity
@(link_name="EcsNanoMeters") EcsNanoMeters_ID:  Entity
@(link_name="EcsMicroMeters") EcsMicroMeters_ID:  Entity
@(link_name="EcsMilliMeters") EcsMilliMeters_ID:  Entity
@(link_name="EcsCentiMeters") EcsCentiMeters_ID:  Entity
@(link_name="EcsKiloMeters") EcsKiloMeters_ID:  Entity
@(link_name="EcsMiles") EcsMiles_ID:  Entity
@(link_name="EcsPixels") EcsPixels_ID:  Entity
@(link_name="EcsPressure") EcsPressure_ID:  Entity
@(link_name="EcsPascal") EcsPascal_ID:  Entity
@(link_name="EcsBar") EcsBar_ID:  Entity
@(link_name="EcsSpeed") EcsSpeed_ID:  Entity
@(link_name="EcsMetersPerSecond") EcsMetersPerSecond_ID:  Entity
@(link_name="EcsKiloMetersPerSecond") EcsKiloMetersPerSecond_ID:  Entity
@(link_name="EcsKiloMetersPerHour") EcsKiloMetersPerHour_ID:  Entity
@(link_name="EcsMilesPerHour") EcsMilesPerHour_ID:  Entity
@(link_name="EcsTemperature") EcsTemperature_ID:  Entity
@(link_name="EcsKelvin") EcsKelvin_ID:  Entity
@(link_name="EcsCelsius") EcsCelsius_ID:  Entity
@(link_name="EcsFahrenheit") EcsFahrenheit_ID:  Entity
@(link_name="EcsData") EcsData_ID:  Entity
@(link_name="EcsBits") EcsBits_ID:  Entity
@(link_name="EcsKiloBits") EcsKiloBits_ID:  Entity
@(link_name="EcsMegaBits") EcsMegaBits_ID:  Entity
@(link_name="EcsGigaBits") EcsGigaBits_ID:  Entity
@(link_name="EcsBytes") EcsBytes_ID:  Entity
@(link_name="EcsKiloBytes") EcsKiloBytes_ID:  Entity
@(link_name="EcsMegaBytes") EcsMegaBytes_ID:  Entity
@(link_name="EcsGigaBytes") EcsGigaBytes_ID:  Entity
@(link_name="EcsKibiBytes") EcsKibiBytes_ID:  Entity
@(link_name="EcsMebiBytes") EcsMebiBytes_ID:  Entity
@(link_name="EcsGibiBytes") EcsGibiBytes_ID:  Entity
@(link_name="EcsDataRate") EcsDataRate_ID:  Entity
@(link_name="EcsBitsPerSecond") EcsBitsPerSecond_ID:  Entity
@(link_name="EcsKiloBitsPerSecond") EcsKiloBitsPerSecond_ID:  Entity
@(link_name="EcsMegaBitsPerSecond") EcsMegaBitsPerSecond_ID:  Entity
@(link_name="EcsGigaBitsPerSecond") EcsGigaBitsPerSecond_ID:  Entity
@(link_name="EcsBytesPerSecond") EcsBytesPerSecond_ID:  Entity
@(link_name="EcsKiloBytesPerSecond") EcsKiloBytesPerSecond_ID:  Entity
@(link_name="EcsMegaBytesPerSecond") EcsMegaBytesPerSecond_ID:  Entity
@(link_name="EcsGigaBytesPerSecond") EcsGigaBytesPerSecond_ID:  Entity
@(link_name="EcsAngle") EcsAngle_ID:  Entity
@(link_name="EcsRadians") EcsRadians_ID:  Entity
@(link_name="EcsDegrees") EcsDegrees_ID:  Entity
@(link_name="EcsFrequency") EcsFrequency_ID:  Entity
@(link_name="EcsHertz") EcsHertz_ID:  Entity
@(link_name="EcsKiloHertz") EcsKiloHertz_ID:  Entity
@(link_name="EcsMegaHertz") EcsMegaHertz_ID:  Entity
@(link_name="EcsGigaHertz") EcsGigaHertz_ID:  Entity
@(link_name="EcsUri") EcsUri_ID:  Entity
@(link_name="EcsUriHyperlink") EcsUriHyperlink_ID:  Entity
@(link_name="EcsUriImage") EcsUriImage_ID:  Entity
@(link_name="EcsUriFile") EcsUriFile_ID:  Entity
@(link_name="EcsAcceleration") EcsAcceleration_ID:  Entity
@(link_name="EcsPercentage") EcsPercentage_ID:  Entity
@(link_name="EcsBel") EcsBel_ID:  Entity
@(link_name="EcsDeciBel") EcsDeciBel_ID:  Entity



    @(link_name="EcsFlag") Ecs_Flag_ID: Entity
    @(link_name="EcsFlecsInternals") Ecs_Flecs_Internals_ID: Entity



    // Global OS API
    @(link_name="ecs_os_api") Global_OS_API: os_api_t



    rest_request_count: i64
    rest_entity_count: i64
    rest_entity_error_count: i64
    rest_query_count: i64
    rest_query_error_count: i64
    rest_query_name_count: i64
    rest_query_name_error_count: i64
    rest_query_name_from_cache_count: i64
    rest_enable_count: i64
    rest_enable_error_count: i64
    rest_delete_count: i64
    rest_delete_error_count: i64
    rest_world_stats_count: i64
    rest_pipeline_stats_count: i64
    rest_stats_error_count: i64

}

/// Module imports
@(default_calling_convention = "c", link_prefix = "Flecs")
foreign flecs
{
    DocImport :: proc(world: ^world_t) ---
    MetaImport :: proc(world: ^world_t) ---
    MetricsImport :: proc(world: ^world_t) ---
    MonitorImport :: proc(world: ^world_t) ---
    PipelineImport :: proc(world: ^world_t) ---
    ScriptImport :: proc(world: ^world_t) ---
    RestImport :: proc(world: ^world_t) ---
}