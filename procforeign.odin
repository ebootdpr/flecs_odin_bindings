package flecs

import "core:c"

when ODIN_OS == .Windows 
{
	foreign import flecs "system:flecs.lib"
}

@(default_calling_convention = "c")
foreign flecs 
{


	ecs_vec_init :: proc(allocator: ^Allocator, vec: ^Vec, size: size_t, elem_count: c.int32_t) -> ^Vec ---

	ecs_vec_init_if :: proc(vec: ^Vec, size: size_t) ---

	ecs_vec_fini :: proc(allocator: ^Allocator, vec: ^Vec, size: size_t) ---

	ecs_vec_reset :: proc(allocator: ^Allocator, vec: ^Vec, size: size_t) -> ^Vec ---

	ecs_vec_clear :: proc(vec: ^Vec) ---

	ecs_vec_append :: proc(allocator: ^Allocator, vec: ^Vec, size: size_t) -> rawptr ---

	ecs_vec_remove :: proc(vec: ^Vec, size: size_t, elem: c.int32_t) ---

	ecs_vec_remove_last :: proc(vec: ^Vec) ---


	ecs_vec_copy :: proc(allocator: ^Allocator, vec: ^Vec, size: size_t) -> Vec ---

	ecs_vec_reclaim :: proc(allocator: ^Allocator, vec: ^Vec, size: size_t) ---

	ecs_vec_set_size :: proc(allocator: ^Allocator, vec: ^Vec, size: size_t, elem_count: c.int32_t) ---

	ecs_vec_set_min_size :: proc(allocator: ^Allocator, vec: ^Vec, size: size_t, elem_count: c.int32_t) ---

	ecs_vec_set_min_count :: proc(allocator: ^Allocator, vec: ^Vec, size: size_t, elem_count: c.int32_t) ---

	ecs_vec_set_min_count_zeromem :: proc(allocator: ^Allocator, vec: ^Vec, size: size_t, elem_count: c.int32_t) ---

	ecs_vec_set_count :: proc(allocator: ^Allocator, vec: ^Vec, size: size_t, elem_count: c.int32_t) ---

	ecs_vec_grow :: proc(allocator: ^Allocator, vec: ^Vec, size: size_t, elem_count: c.int32_t) -> rawptr ---

	ecs_vec_count :: proc(vec: ^Vec) -> c.int32_t ---


	ecs_vec_size :: proc(vec: ^Vec) -> c.int32_t ---

	ecs_vec_get :: proc(vec: ^Vec, size: size_t, index: c.int32_t) -> rawptr ---

	ecs_vec_first :: proc(vec: ^Vec) -> rawptr ---

	ecs_vec_last :: proc(vec: ^Vec, size: size_t) -> rawptr ---

	ecs_sparse_init :: proc(sparse: ^Sparse, size: size_t) ---

	ecs_sparse_add :: proc(sparse: ^Sparse, size: size_t) -> rawptr ---

	ecs_sparse_last_id :: proc(sparse: ^Sparse) -> c.uint64_t ---

	ecs_sparse_count :: proc(sparse: ^Sparse) -> c.int32_t ---

	flecs_sparse_set_generation :: proc(sparse: ^Sparse, id: Entity) ---

	ecs_sparse_get_dense :: proc(sparse: ^Sparse, size: size_t, index: c.int32_t) -> rawptr ---

	ecs_sparse_get :: proc(sparse: ^Sparse, size: size_t, id: c.uint64_t) -> rawptr ---

	flecs_ballocator_init :: proc(ba: ^BlockAllocator, size: size_t) ---


	flecs_ballocator_new :: proc(size: size_t) -> ^BlockAllocator ---


	flecs_ballocator_fini :: proc(ba: ^BlockAllocator) ---


	flecs_ballocator_free :: proc(ba: ^BlockAllocator) ---

	flecs_balloc :: proc(allocator: ^BlockAllocator) -> rawptr ---

	flecs_bcalloc :: proc(allocator: ^BlockAllocator) -> rawptr ---


	flecs_bfree :: proc(allocator: ^BlockAllocator, memory: rawptr) ---


	flecs_brealloc :: proc(dst: ^BlockAllocator, src: ^BlockAllocator, memory: rawptr) -> rawptr ---

	flecs_bdup :: proc(ba: ^BlockAllocator, memory: rawptr) -> rawptr ---

	ecs_map_params_init :: proc(params: ^MapParams, allocator: ^Allocator) ---


	ecs_map_params_fini :: proc(params: ^MapParams) ---

	ecs_map_init :: proc(map_t: ^Map, allocator: ^Allocator) ---


	ecs_map_init_w_params :: proc(map_t: ^Map, params: ^MapParams) ---

	ecs_map_init_if :: proc(map_t: ^Map, allocator: ^Allocator) ---


	ecs_map_init_w_params_if :: proc(result: ^Map, params: ^MapParams) ---

	ecs_map_fini :: proc(map_t: ^Map) ---


	ecs_map_get :: proc(map_t: ^Map, key: map_key_t) -> ^ecs_map_val_t ---

	ecs_map_get_deref_ :: proc(map_t: ^Map, key: map_key_t) -> rawptr ---

	ecs_map_ensure :: proc(map_t: ^Map, key: map_key_t) -> ^ecs_map_val_t ---

	ecs_map_ensure_alloc :: proc(map_t: ^Map, size: size_t, key: map_key_t) -> rawptr ---

	ecs_map_insert :: proc(map_t: ^Map, key: map_key_t, value: ecs_map_val_t) ---

	ecs_map_insert_alloc :: proc(map_t: ^Map, size: size_t, key: map_key_t) -> rawptr ---

	ecs_map_remove :: proc(map_t: ^Map, key: map_key_t) -> ecs_map_val_t ---

	ecs_map_remove_free :: proc(map_t: ^Map, key: map_key_t) ---

	ecs_map_clear :: proc(map_t: ^Map) ---

	ecs_map_iter :: proc(map_t: ^Map) -> MapIter ---

	ecs_map_next :: proc(iter: ^MapIter) -> c.bool ---

	ecs_map_copy :: proc(dst: ^Map, src: ^Map) ---

	flecs_allocator_init :: proc(a: ^Allocator) ---


	flecs_allocator_fini :: proc(a: ^Allocator) ---


	flecs_allocator_get :: proc(a: ^Allocator, size: size_t) -> ^BlockAllocator ---

	flecs_strdup :: proc(a: ^Allocator, str: cstring) -> ^c.char ---

	flecs_strfree :: proc(a: ^Allocator, str: cstring) ---

	flecs_dup :: proc(a: ^Allocator, size: size_t, src: rawptr) -> rawptr ---
	// TODO: ...
	// ecs_strbuf_append::proc(
	//     buffer: ^StrBuf,
	//     fmt: cstring,
	//     ...) -> c.bool ---

	ecs_strbuf_vappend :: proc(buffer: ^StrBuf, fmt: cstring, args: va_list) -> c.bool ---

	ecs_strbuf_appendstr :: proc(buffer: ^StrBuf, str: cstring) -> c.bool ---

	// ecs_strbuf_appendch::proc(
	//     buffer: ^StrBuf,
	//     char ch) -> c.bool ---

	// ecs_strbuf_appendint::proc(
	//     buffer: ^StrBuf,
	//     int64_t v) -> c.bool ---

	// ecs_strbuf_appendflt::proc(
	//     buffer: ^StrBuf,
	//     double v,
	//     char nan_delim) -> c.bool ---

	ecs_strbuf_appendbool :: proc(buffer: ^StrBuf, v: c.bool) -> c.bool ---

	ecs_strbuf_mergebuff :: proc(dst_buffer: ^StrBuf, src_buffer: ^StrBuf) -> c.bool ---

	ecs_strbuf_appendstr_zerocpy :: proc(buffer: ^StrBuf, str: cstring) -> c.bool ---

	ecs_strbuf_appendstr_zerocpyn :: proc(buffer: ^StrBuf, str: cstring, n: c.int32_t) -> c.bool ---

	ecs_strbuf_appendstr_zerocpy_const :: proc(buffer: ^StrBuf, str: cstring) -> c.bool ---

	ecs_strbuf_appendstr_zerocpyn_const :: proc(buffer: ^StrBuf, str: cstring, n: c.int32_t) -> c.bool ---

	ecs_strbuf_appendstrn :: proc(buffer: ^StrBuf, str: cstring, n: c.int32_t) -> c.bool ---

	//TODO: ^char
	// ecs_strbuf_get::proc(
	//     buffer: ^StrBuf) -> ^char ---

	// ecs_strbuf_get_small::proc(
	//     buffer: ^StrBuf) -> ^char ---

	ecs_strbuf_reset :: proc(buffer: ^StrBuf) ---

	ecs_strbuf_list_push :: proc(buffer: ^StrBuf, list_open: cstring, separator: cstring) ---

	ecs_strbuf_list_pop :: proc(buffer: ^StrBuf, list_close: cstring) ---

	ecs_strbuf_list_next :: proc(buffer: ^StrBuf) ---

	// ecs_strbuf_list_appendch::proc(
	//     buffer: ^StrBuf,
	//     char ch) -> c.bool ---

	// ecs_strbuf_list_append::proc(
	//     buffer: ^StrBuf,
	//     fmt: cstring,
	//     ...) -> c.bool ---

	ecs_strbuf_list_appendstr :: proc(buffer: ^StrBuf, str: cstring) -> c.bool ---

	ecs_strbuf_list_appendstrn :: proc(buffer: ^StrBuf, str: cstring, n: c.int32_t) -> c.bool ---

	ecs_strbuf_written :: proc(buffer: ^StrBuf) -> c.int32_t ---

	ecs_os_init :: proc() ---

	ecs_os_fini :: proc() ---

	ecs_os_set_api :: proc(os_api: ^OSApi) ---

	ecs_os_get_api :: proc() -> OSApi ---

	ecs_os_set_api_defaults :: proc() ---

	ecs_os_dbg :: proc(file: cstring, line: c.int32_t, msg: cstring) ---

	ecs_os_trace :: proc(file: cstring, line: c.int32_t, msg: cstring) ---

	ecs_os_warn :: proc(file: cstring, line: c.int32_t, msg: cstring) ---

	ecs_os_err :: proc(file: cstring, line: c.int32_t, msg: cstring) ---

	ecs_os_fatal :: proc(file: cstring, line: c.int32_t, msg: cstring) ---

	//ecs_os_strerror::proc(err: c.int) -> ^char ---;

	//ecs_os_strset :: proc(str: cstring, value: cstring) --- TODO: RECHECK with os_api.odin

	// ecs_sleepf::proc(
	//     double t) ---

	// ecs_time_measure::proc(
	// start:  ^     ecs_time_t ) -> double ---

	// ecs_time_sub::proc(
	//     ecs_time_t t1,
	//     ecs_time_t t2) -> ecs_time_t ---

	// ecs_time_to_double::proc(
	//     ecs_time_t t) -> double ---

	ecs_os_memdup :: proc(src: rawptr, size: size_t) -> rawptr ---

	ecs_os_has_heap :: proc() -> c.bool ---

	ecs_os_has_threading :: proc() -> c.bool ---

	ecs_os_has_task_support :: proc() -> c.bool ---

	ecs_os_has_time :: proc() -> c.bool ---

	ecs_os_has_logging :: proc() -> c.bool ---

	ecs_os_has_dl :: proc() -> c.bool ---

	ecs_os_has_modules :: proc() -> c.bool ---

	ecs_module_path_from_c :: proc(c_name: cstring) -> ^c.char ---

	// ecs_default_ctor :: proc(ptr: rawptr, count: c.int32_t, ctx: ^TypeInfo) ---

	// ecs_asprintf::proc(
	//     fmt: cstring,
	//     ...) -> ^c.char ---


	flecs_to_snake_case :: proc(str: cstring) -> ^c.char ---


	//  extern const Entity ecs_id::proc(EcsComponent) ---;
	//  extern const Entity ecs_id::proc(EcsIdentifier) ---;
	//  extern const Entity ecs_id::proc(EcsIterable) ---;
	//  extern const Entity ecs_id::proc(EcsPoly) ---;
	//  extern const Entity ecs_id::proc(EcsTickSource) ---;
	//  extern const Entity ecs_id::proc(EcsPipelineQuery) ---;
	//  extern const Entity ecs_id::proc(EcsTimer) ---;
	//  extern const Entity ecs_id::proc(EcsRateFilter) ---;
	//  extern const Entity ecs_id::proc(EcsTarget) ---;
	//  extern const Entity ecs_id::proc(EcsPipeline) ---;

	ecs_init :: proc() -> ^World ---

	ecs_mini :: proc() -> ^World ---

	// ecs_init_w_args::proc(
	//     int argc,
	//     argv[]: cstring) -> ^World---

	ecs_fini :: proc(world: ^World) -> c.int ---

	ecs_is_fini :: proc(world: ^World) -> c.bool ---

	ecs_atfini :: proc(world: ^World, action: fini_action_t, ctx: rawptr) ---

	ecs_frame_begin :: proc(world: ^World, delta_time: ftime_t) -> ftime_t ---

	ecs_frame_end :: proc(world: ^World) ---

	ecs_run_post_frame :: proc(world: ^World, action: fini_action_t, ctx: rawptr) ---

	ecs_quit :: proc(world: ^World) ---

	ecs_should_quit :: proc(world: ^World) -> c.bool ---
	ecs_measure_frame_time :: proc(world: ^World, enable: c.bool) ---

	ecs_measure_system_time :: proc(world: ^World, enable: c.bool) ---

	ecs_set_target_fps :: proc(world: ^World, fps: ftime_t) ---


	ecs_readonly_begin :: proc(world: ^World) -> c.bool ---

	ecs_readonly_end :: proc(world: ^World) ---

	ecs_merge :: proc(world: ^World) ---

	ecs_defer_begin :: proc(world: ^World) -> c.bool ---

	ecs_is_deferred :: proc(world: ^World) -> c.bool ---

	ecs_defer_end :: proc(world: ^World) -> c.bool ---

	ecs_defer_suspend :: proc(world: ^World) ---

	ecs_defer_resume :: proc(world: ^World) ---

	ecs_set_automerge :: proc(world: ^World, automerge: c.bool) ---

	ecs_set_stage_count :: proc(world: ^World, stages: c.int32_t) ---

	ecs_get_stage_count :: proc(world: ^World) -> c.int32_t ---

	ecs_get_stage_id :: proc(world: ^World) -> c.int32_t ---

	ecs_get_stage :: proc(world: ^World, stage_id: c.int32_t) -> ^World ---

	ecs_stage_is_readonly :: proc(world: ^World) -> c.bool ---

	ecs_async_stage_new :: proc(world: ^World) -> ^World ---

	ecs_async_stage_free :: proc(stage: ^World) ---

	ecs_stage_is_async :: proc(stage: ^World) -> c.bool ---

	ecs_set_ctx :: proc(world: ^World, ctx: rawptr, ctx_free: ctx_free_t) ---

	ecs_set_binding_ctx :: proc(world: ^World, ctx: rawptr, ctx_free: ctx_free_t) ---

	ecs_get_ctx :: proc(world: ^World) -> rawptr ---

	ecs_get_binding_ctx :: proc(world: ^World) -> rawptr ---

	// ecs_get_world_info :: proc(world: ^World) -> ^ecs_world_info_t ---

	ecs_dim :: proc(world: ^World, entity_count: c.int32_t) ---

	ecs_set_entity_range :: proc(world: ^World, id_start: Entity, id_end: Entity) ---


	ecs_enable_range_check :: proc(world: ^World, enable: c.bool) -> c.bool ---


	ecs_get_max_id :: proc(world: ^World) -> Entity ---


	ecs_run_aperiodic :: proc(world: ^World, flags: ecs_flags32_t) ---

	// ecs_delete_empty_tables::proc(
	//     world: ^World,
	//     id: ecs_id_t ,
	//     uint16_t clear_generation,
	//     uint16_t delete_generation,
	//     int32_t min_id_count,
	//     double time_budget_seconds) -> c.int32_t ---

	// const World* ecs_get_world::proc(
	// poly:  ^      ecs_poly_t  ) ---;

	// ecs_get_entity::proc(
	// poly:  ^      ecs_poly_t  ) -> Entity ---

	// ecs_poly_is_::proc(
	// object:  ^      ecs_poly_t  ,
	//     int32_t type) -> c.bool ---

	// ecs_make_pair::proc(
	//     Entity first,
	//     Entity second) -> ecs_id_t ---

	ecs_new_id :: proc(world: ^World) -> Entity ---

	ecs_new_low_id :: proc(world: ^World) -> Entity ---

	ecs_new_w_id :: proc(world: ^World, id: ecs_id_t) -> Entity ---

	// ecs_new_w_table :: proc(world: ^World, table: ^Table) -> Entity ---

	ecs_entity_init :: proc(world: ^World, desc: ^EntityDesc) -> Entity ---


	ecs_bulk_init :: proc(world: ^World, desc: ^BulkDesc) -> ^Entity ---


	ecs_bulk_new_w_id :: proc(world: ^World, id: ecs_id_t, count: c.int32_t) -> ^Entity ---

	ecs_clone :: proc(world: ^World, dst: Entity, src: Entity, copy_value: c.bool) -> Entity ---

	ecs_delete :: proc(world: ^World, entity: Entity) ---


	ecs_delete_with :: proc(world: ^World, id: ecs_id_t) ---

	ecs_add_id :: proc(world: ^World, entity: Entity, id: ecs_id_t) ---

	ecs_remove_id :: proc(world: ^World, entity: Entity, id: ecs_id_t) ---

	ecs_override_id :: proc(world: ^World, entity: Entity, id: ecs_id_t) ---

	ecs_clear :: proc(world: ^World, entity: Entity) ---

	ecs_remove_all :: proc(world: ^World, id: ecs_id_t) ---

	ecs_set_with :: proc(world: ^World, id: ecs_id_t) -> Entity ---

	ecs_get_with :: proc(world: ^World) -> ecs_id_t ---

	ecs_enable :: proc(world: ^World, entity: Entity, enabled: c.bool) ---

	ecs_enable_id :: proc(world: ^World, entity: Entity, id: ecs_id_t, enable: c.bool) ---

	ecs_is_enabled_id :: proc(world: ^World, entity: Entity, id: ecs_id_t) -> c.bool ---

	ecs_get_id :: proc(world: ^World, entity: Entity, id: ecs_id_t) -> rawptr ---

	ecs_ref_init_id :: proc(world: ^World, entity: Entity, id: ecs_id_t) -> Ref ---

	ecs_ref_get_id :: proc(world: ^World, ref: ^Ref, id: ecs_id_t) -> rawptr ---

	ecs_ref_update :: proc(world: ^World, ref: ^Ref) ---

	ecs_get_mut_id :: proc(world: ^World, entity: Entity, id: ecs_id_t) -> rawptr ---

	ecs_get_mut_modified_id :: proc(world: ^World, entity: Entity, id: ecs_id_t) -> rawptr ---

	ecs_write_begin :: proc(world: ^World, entity: Entity) -> ^Record ---

	ecs_write_end :: proc(record: ^Record) ---
	ecs_read_begin :: proc(world: ^World, entity: Entity) -> ^Record ---

	ecs_read_end :: proc(record: ^Record) ---

	ecs_record_get_entity :: proc(record: ^Record) -> Entity ---

	ecs_record_get_id :: proc(world: ^World, record: ^Record, id: ecs_id_t) -> rawptr ---

	ecs_record_get_mut_id :: proc(world: ^World, record: ^Record, id: ecs_id_t) -> rawptr ---

	ecs_record_has_id :: proc(world: ^World, record: ^Record, id: ecs_id_t) -> c.bool ---

	ecs_emplace_id :: proc(world: ^World, entity: Entity, id: ecs_id_t) -> rawptr ---

	ecs_modified_id :: proc(world: ^World, entity: Entity, id: ecs_id_t) ---

	ecs_set_id :: proc(world: ^World, entity: Entity, id: ecs_id_t, size: size_t, ptr: rawptr) -> Entity ---

	ecs_is_valid :: proc(world: ^World, e: Entity) -> c.bool ---

	ecs_is_alive :: proc(world: ^World, e: Entity) -> c.bool ---

	ecs_strip_generation :: proc(e: Entity) -> ecs_id_t ---

	ecs_set_entity_generation :: proc(world: ^World, entity: Entity) ---

	ecs_get_alive :: proc(world: ^World, e: Entity) -> Entity ---

	ecs_ensure :: proc(world: ^World, entity: Entity) ---

	ecs_ensure_id :: proc(world: ^World, id: ecs_id_t) ---

	ecs_exists :: proc(world: ^World, entity: Entity) -> c.bool ---
	ecs_get_type :: proc(world: ^World, entity: Entity) -> ^Type ---

	ecs_get_table :: proc(world: ^World, entity: Entity) -> ^Table ---

	ecs_type_str :: proc(world: ^World, type: ^Type) -> ^c.char ---

	ecs_table_str :: proc(world: ^World, table: ^Table) -> ^c.char ---

	ecs_entity_str :: proc(world: ^World, entity: Entity) -> ^c.char ---

	ecs_has_id :: proc(world: ^World, entity: Entity, id: ecs_id_t) -> c.bool ---

	ecs_owns_id :: proc(world: ^World, entity: Entity, id: ecs_id_t) -> c.bool ---

	ecs_get_target :: proc(world: ^World, entity: Entity, rel: Entity, index: c.int32_t) -> Entity ---

	ecs_get_parent :: proc(world: ^World, entity: Entity) -> Entity ---


	ecs_get_target_for_id :: proc(world: ^World, entity: Entity, rel: Entity, id: ecs_id_t) -> Entity ---

	ecs_get_depth :: proc(world: ^World, entity: Entity, rel: Entity) -> c.int32_t ---

	//TODO:flatten ecs_flatten :: proc(world: ^World, pair: ecs_id_t, desc: ^ecs_flatten_desc_t) ---

	ecs_count_id :: proc(world: ^World, entity: ecs_id_t) -> c.int32_t ---
	ecs_get_name :: proc(world: ^World, entity: Entity) -> ^c.char ---
	ecs_get_symbol :: proc(world: ^World, entity: Entity) -> ^c.char ---


	ecs_set_name :: proc(world: ^World, entity: Entity, name: cstring) -> Entity ---


	ecs_set_symbol :: proc(world: ^World, entity: Entity, symbol: cstring) -> Entity ---


	ecs_set_alias :: proc(world: ^World, entity: Entity, alias: cstring) ---


	ecs_lookup :: proc(world: ^World, name: cstring) -> Entity ---

	ecs_lookup_child :: proc(world: ^World, parent: Entity, name: cstring) -> Entity ---

	ecs_lookup_path_w_sep :: proc(world: ^World, parent: Entity, path: cstring, sep: cstring, prefix: cstring, recursive: c.bool) -> Entity ---

	ecs_lookup_symbol :: proc(world: ^World, symbol: cstring, lookup_as_path: c.bool, recursive: c.bool) -> Entity ---

	ecs_get_path_w_sep :: proc(world: ^World, parent: Entity, child: Entity, sep: cstring, prefix: cstring) -> ^c.char ---

	ecs_new_from_path_w_sep :: proc(world: ^World, parent: Entity, path: cstring, sep: cstring, prefix: cstring) -> Entity ---

	ecs_add_path_w_sep :: proc(world: ^World, entity: Entity, parent: Entity, path: cstring, sep: cstring, prefix: cstring) -> Entity ---

	ecs_set_scope :: proc(world: ^World, scope: Entity) -> Entity ---

	ecs_get_scope :: proc(world: ^World) -> Entity ---


	ecs_set_name_prefix :: proc(world: ^World, prefix: cstring) -> ^c.char ---

	ecs_set_lookup_path :: proc(world: ^World, lookup_path: ^Entity) -> ^Entity ---

	ecs_get_lookup_path :: proc(world: ^World) -> ^Entity ---

	ecs_component_init :: proc(world: ^World, desc: ^ComponentDesc) -> Entity ---
	ecs_get_type_info :: proc(world: ^World, id: ecs_id_t) -> ^TypeInfo ---

	ecs_set_hooks_id :: proc(world: ^World, id: Entity, hooks: ^TypeHooks) ---
	ecs_get_hooks_id :: proc(world: ^World, id: Entity) -> ^TypeHooks ---

	ecs_id_is_tag :: proc(world: ^World, id: ecs_id_t) -> c.bool ---

	ecs_id_is_union :: proc(world: ^World, id: ecs_id_t) -> c.bool ---

	ecs_id_in_use :: proc(world: ^World, id: ecs_id_t) -> c.bool ---

	ecs_get_typeid :: proc(world: ^World, id: ecs_id_t) -> Entity ---

	ecs_id_match :: proc(id: ecs_id_t, pattern: ecs_id_t) -> c.bool ---

	ecs_id_is_pair :: proc(id: ecs_id_t) -> c.bool ---

	ecs_id_is_wildcard :: proc(id: ecs_id_t) -> c.bool ---

	ecs_id_is_valid :: proc(world: ^World, id: ecs_id_t) -> c.bool ---

	ecs_id_get_flags :: proc(world: ^World, id: ecs_id_t) -> ecs_flags32_t ---

	// ecs_id_flag_str::proc(
	//     id: ecs_id_t _flags) -> ^c.char ---;

	ecs_id_str :: proc(world: ^World, id: ecs_id_t) -> ^c.char ---

	ecs_id_str_buf :: proc(world: ^World, id: ecs_id_t, buf: ^StrBuf) ---

	ecs_term_iter :: proc(world: ^World, term: ^Term) -> Iter ---

	ecs_term_chain_iter :: proc(it: ^Iter, term: ^Term) -> Iter ---

	ecs_term_next :: proc(it: ^Iter) -> c.bool ---

	ecs_children :: proc(world: ^World, parent: Entity) -> Iter ---

	ecs_children_next :: proc(it: ^Iter) -> c.bool ---

	ecs_term_id_is_set :: proc(id: ^TermId) -> c.bool ---

	ecs_term_is_initialized :: proc(term: ^Term) -> c.bool ---

	ecs_term_match_this :: proc(term: ^Term) -> c.bool ---

	ecs_term_match_0 :: proc(term: ^Term) -> c.bool ---

	ecs_term_finalize :: proc(world: ^World, term: ^Term) -> c.int ---

	ecs_term_copy :: proc(src: ^Term) -> Term ---

	ecs_term_move :: proc(src: ^Term) -> Term ---

	ecs_term_fini :: proc(term: ^Term) ---


	ecs_filter_init :: proc(world: ^World, desc: ^FilterDesc) -> ^Filter ---

	ecs_filter_fini :: proc(filter: ^Filter) ---

	ecs_filter_finalize :: proc(world: ^World, filter: ^Filter) -> c.int ---

	ecs_filter_find_this_var :: proc(filter: ^Filter) -> c.int32_t ---

	ecs_term_str :: proc(world: ^World, term: ^Term) -> ^c.char ---

	ecs_filter_str :: proc(world: ^World, filter: ^Filter) -> ^c.char ---

	ecs_filter_iter :: proc(world: ^World, filter: ^Filter) -> Iter ---

	ecs_filter_chain_iter :: proc(it: ^Iter, filter: ^Filter) -> Iter ---

	ecs_filter_pivot_term :: proc(world: ^World, filter: ^Filter) -> c.int32_t ---

	ecs_filter_next :: proc(it: ^Iter) -> c.bool ---

	ecs_filter_next_instanced :: proc(it: ^Iter) -> c.bool ---

	ecs_filter_move :: proc(dst: ^Filter, src: ^Filter) ---

	ecs_filter_copy :: proc(dst: ^Filter, src: ^Filter) ---

	ecs_query_init :: proc(world: ^World, desc: ^QueryDesc) -> ^Query ---

	ecs_query_fini :: proc(query: ^Query) ---
	ecs_query_get_filter :: proc(query: ^Query) -> ^Filter ---

	ecs_query_iter :: proc(world: ^World, query: ^Query) -> Iter ---

	ecs_query_next :: proc(iter: ^Iter) -> c.bool ---

	ecs_query_next_instanced :: proc(iter: ^Iter) -> c.bool ---

	ecs_query_next_table :: proc(iter: ^Iter) -> c.bool ---

	ecs_query_populate :: proc(iter: ^Iter, when_changed: c.bool) -> c.int ---

	ecs_query_changed :: proc(query: ^Query, iter: ^Iter) -> c.bool ---

	ecs_query_skip :: proc(it: ^Iter) ---

	ecs_query_set_group :: proc(it: ^Iter, group_id: c.uint64_t) ---

	ecs_query_get_group_ctx :: proc(query: ^Query, group_id: c.uint64_t) -> rawptr ---
	ecs_query_get_group_info :: proc(query: ^Query, group_id: c.uint64_t) -> ^QueryGroupInfo ---

	ecs_query_orphaned :: proc(query: ^Query) -> c.bool ---

	ecs_query_str :: proc(query: ^Query) -> ^c.char ---

	Queryable_count :: proc(query: ^Query) -> c.int32_t ---

	ecs_query_empty_table_count :: proc(query: ^Query) -> c.int32_t ---

	ecs_query_entity_count :: proc(query: ^Query) -> c.int32_t ---

	ecs_query_get_ctx :: proc(query: ^Query) -> rawptr ---

	ecs_query_get_binding_ctx :: proc(query: ^Query) -> rawptr ---

	ecs_emit :: proc(world: ^World, desc: ^ecs_event_desc_t) ---

	ecs_enqueue :: proc(world: ^World, desc: ^ecs_event_desc_t) ---

	ecs_observer_init :: proc(world: ^World, desc: ^ObserverDesc) -> Entity ---

	ecs_observer_default_run_action :: proc(it: ^Iter) -> c.bool ---

	ecs_observer_get_ctx :: proc(world: ^World, observer: Entity) -> rawptr ---

	ecs_observer_get_binding_ctx :: proc(world: ^World, observer: Entity) -> rawptr ---

	ecs_iter_poly :: proc(world: ^World, poly: ^ecs_poly_t, iter: ^Iter, filter: ^Term) ---

	ecs_iter_next :: proc(it: ^Iter) -> c.bool ---

	ecs_iter_fini :: proc(it: ^Iter) ---

	ecs_iter_count :: proc(it: ^Iter) -> c.int32_t ---

	ecs_iter_is_true :: proc(it: ^Iter) -> c.bool ---

	ecs_iter_first :: proc(it: ^Iter) -> Entity ---

	ecs_iter_set_var :: proc(it: ^Iter, var_id: c.int32_t, entity: Entity) ---

	ecs_iter_set_var_as_table :: proc(it: ^Iter, var_id: c.int32_t, table: ^Table) ---

	ecs_iter_set_var_as_range :: proc(it: ^Iter, var_id: c.int32_t, range: ^TableRange) ---

	ecs_iter_get_var :: proc(it: ^Iter, var_id: c.int32_t) -> Entity ---

	ecs_iter_get_var_as_table :: proc(it: ^Iter, var_id: c.int32_t) -> ^Table ---

	ecs_iter_get_var_as_range :: proc(it: ^Iter, var_id: c.int32_t) -> TableRange ---

	ecs_iter_var_is_constrained :: proc(it: ^Iter, var_id: c.int32_t) -> c.bool ---

	ecs_iter_str :: proc(iter: ^Iter) -> ^c.char ---

	ecs_page_iter :: proc(iter: ^Iter, offset: c.int32_t, limit: c.int32_t) -> Iter ---

	ecs_page_next :: proc(it: ^Iter) -> c.bool ---

	ecs_worker_iter :: proc(iter: ^Iter, index: c.int32_t, count: c.int32_t) -> Iter ---

	ecs_worker_next :: proc(it: ^Iter) -> c.bool ---

	ecs_field_w_size :: proc(iter: ^Iter, size: size_t, index: c.int32_t) -> rawptr ---

	ecs_field_is_readonly :: proc(iter: ^Iter, index: c.int32_t) -> c.bool ---

	ecs_field_is_writeonly :: proc(iter: ^Iter, index: c.int32_t) -> c.bool ---

	ecs_field_is_set :: proc(iter: ^Iter, index: c.int32_t) -> c.bool ---

	ecs_field_id :: proc(iter: ^Iter, index: c.int32_t) -> ecs_id_t ---

	ecs_field_column_index :: proc(iter: ^Iter, index: c.int32_t) -> c.int32_t ---

	ecs_field_src :: proc(iter: ^Iter, index: c.int32_t) -> Entity ---


	ecs_field_size :: proc(iter: ^Iter, index: c.int32_t) -> size_t ---

	ecs_field_is_self :: proc(iter: ^Iter, index: c.int32_t) -> c.bool ---


	ecs_table_get_type :: proc(table: ^Table) -> ^Type ---


	ecs_table_get_type_index :: proc(world: ^World, table: ^Table, id: ecs_id_t) -> c.int32_t ---

	ecs_table_get_column_index :: proc(world: ^World, table: ^Table, id: ecs_id_t) -> c.int32_t ---

	ecs_table_column_count :: proc(table: ^Table) -> c.int32_t ---

	Tableype_to_column_index :: proc(table: ^Table, index: c.int32_t) -> c.int32_t ---

	ecs_table_column_to_type_index :: proc(table: ^Table, index: c.int32_t) -> c.int32_t ---

	ecs_table_get_column :: proc(table: ^Table, index: c.int32_t, offset: c.int32_t) -> rawptr ---

	ecs_table_get_id :: proc(world: ^World, table: ^Table, id: ecs_id_t, offset: c.int32_t) -> rawptr ---

	ecs_table_get_column_size :: proc(table: ^Table, index: c.int32_t) -> size_t ---


	ecs_table_count :: proc(table: ^Table) -> c.int32_t ---

	ecs_table_has_id :: proc(world: ^World, table: ^Table, id: ecs_id_t) -> c.bool ---

	ecs_table_get_depth :: proc(world: ^World, table: ^Table, rel: Entity) -> c.int32_t ---


	ecs_table_add_id :: proc(world: ^World, table: ^Table, id: ecs_id_t) -> ^Table ---

	ecs_table_find :: proc(world: ^World, ids: ^ecs_id_t, id_count: c.int32_t) -> ^Table ---

	ecs_table_remove_id :: proc(world: ^World, table: ^Table, id: ecs_id_t) -> ^Table ---

	ecs_table_lock :: proc(world: ^World, table: ^Table) ---

	ecs_table_unlock :: proc(world: ^World, table: ^Table) ---

	ecs_table_has_flags :: proc(table: ^Table, flags: ecs_flags32_t) -> c.bool ---

	ecs_table_swap_rows :: proc(world: ^World, table: ^Table, row_1: c.int32_t, row_2: c.int32_t) ---


	ecs_commit :: proc(world: ^World, entity: Entity, record: ^Record, table: ^Table, added: ^Type, removed: ^Type) -> c.bool ---

	ecs_record_find :: proc(world: ^World, entity: Entity) -> ^Record ---

	ecs_record_get_column :: proc(r: ^Record, column: c.int32_t, c_size: size_t) -> rawptr ---


	ecs_search :: proc(world: ^World, table: ^Table, id: ecs_id_t, id_out: ^ecs_id_t) -> c.int32_t ---

	ecs_search_offset :: proc(world: ^World, table: ^Table, offset: c.int32_t, id: ecs_id_t, id_out: ^ecs_id_t) -> c.int32_t ---

	// TODO: DOUBLE POINTER ecs_search_relation :: proc(world: ^World, table: ^Table, offset: c.int32_t, id: ecs_id_t, rel: Entity, flags: ecs_flags32_t, subject_out: ^Entity, id_out: ^ecs_id_t, tr_out: ^^ecs_table_record_t) -> c.int32_t ---

	ecs_value_init :: proc(world: ^World, type: Entity, ptr: rawptr) -> c.int ---

	ecs_value_init_w_type_info :: proc(world: ^World, ti: ^TypeInfo, ptr: rawptr) -> c.int ---

	ecs_value_new :: proc(world: ^World, type: Entity) -> rawptr ---

	ecs_value_fini :: proc(world: ^World, type: Entity, ptr: rawptr) -> c.int ---

	ecs_value_free :: proc(world: ^World, type: Entity, ptr: rawptr) -> c.int ---

	ecs_value_copy_w_type_info :: proc(world: ^World, ti: ^TypeInfo, dst: rawptr, src: rawptr) -> c.int ---

	ecs_value_copy :: proc(world: ^World, type: Entity, dst: rawptr, src: rawptr) -> c.int ---

	ecs_deprecated_ :: proc(file: cstring, line: c.int32_t, msg: cstring) ---

	ecs_log_push_ :: proc(level: c.int32_t) ---

	ecs_log_pop_ :: proc(level: c.int32_t) ---

	ecs_should_log :: proc(level: c.int32_t) -> c.bool ---
	ecs_strerror :: proc(error_code: c.int32_t) -> ^c.char ---

	// ecs_print_::proc(
	//     level: c.int32_t,
	//     file: cstring,
	//     line: c.int32_t,
	//     fmt: cstring,
	//     ...) ---

	ecs_printv_ :: proc(level: c.int, file: cstring, line: c.int32_t, fmt: cstring, args: va_list) ---

	// ecs_log_::proc(
	//     level: c.int32_t,
	//     file: cstring,
	//     line: c.int32_t,
	//     fmt: cstring,
	//     ...) ---

	ecs_logv_ :: proc(level: c.int, file: cstring, line: c.int32_t, fmt: cstring, args: va_list) ---

	// ecs_abort_::proc(
	//     error_code: c.int32_t,
	//     file: cstring,
	//     line: c.int32_t,
	//     fmt: cstring,
	//     ...) ---

	// ecs_assert_log_::proc(

	//     error_code: c.int32_t,
	//     condition_str: cstring,
	//     file: cstring,
	//     line: c.int32_t,
	//     fmt: cstring,
	//     ...) ---

	// ecs_parser_error_::proc(
	//     name: cstring,
	//     expr: cstring, 
	//     int64_t column,
	//     fmt: cstring,
	//     ...) ---

	ecs_parser_errorv_ :: proc(name: cstring, expr: cstring, column: c.int64_t, fmt: cstring, args: va_list) ---

	ecs_log_set_level :: proc(level: c.int) -> c.int ---

	ecs_log_get_level :: proc() -> c.int ---

	ecs_log_enable_colors :: proc(enabled: c.bool) -> c.bool ---

	ecs_log_enable_timestamp :: proc(enabled: c.bool) -> c.bool ---

	ecs_log_enable_timedelta :: proc(enabled: c.bool) -> c.bool ---

	ecs_log_last_error :: proc() -> c.int ---

	ecs_app_run :: proc(world: ^World, desc: ^AppDesc) -> c.int ---

	ecs_app_run_frame :: proc(world: ^World, desc: ^AppDesc) -> c.int ---
		//TODO: http
	// ecs_app_set_run_action :: proc(callback: ecs_app_run_action_t) -> c.int ---

	// ecs_app_set_frame_action :: proc(callback: ecs_app_frame_action_t) -> c.int ---

	// ecs_http_server_init :: proc(desc: ^ecs_http_server_desc_t) -> ^ecs_http_server_t ---

	// ecs_http_server_fini :: proc(server: ^ecs_http_server_t) ---

	// ecs_http_server_start :: proc(server: ^ecs_http_server_t) -> c.int ---

	// ecs_http_server_dequeue :: proc(server: ^ecs_http_server_t, delta_time: ftime_t) ---

	// ecs_http_server_stop :: proc(server: ^ecs_http_server_t) ---

	// ecs_http_server_http_request :: proc(srv: ^ecs_http_server_t, req: cstring, len: ecs_size_t, reply_out: ^ecs_http_reply_t) -> c.int ---

	// ecs_http_server_request :: proc(srv: ^ecs_http_server_t, method: cstring, req: cstring, reply_out: ^ecs_http_reply_t) -> c.int ---

	// ecs_http_server_ctx :: proc(srv: ^ecs_http_server_t) -> rawptr ---
	// ecs_http_get_header :: proc(req: ^ecs_http_request_t, name: ^char) -> ^c.char ---
	// ecs_http_get_param :: proc(req: ^ecs_http_request_t, name: ^char) -> ^c.char ---

	//  extern const Entity ecs_id::proc(EcsRest) ---;

	// ecs_rest_server_init :: proc(world: ^World, desc: ^ecs_http_server_desc_t) -> ^ecs_http_server_t ---

	// ecs_rest_server_fini :: proc(srv: ^ecs_http_server_t) ---

	FlecsRestImport :: proc(world: ^World) ---

	ecs_set_timeout :: proc(world: ^World, tick_source: Entity, timeout: ftime_t) -> Entity ---

	ecs_get_timeout :: proc(world: ^World, tick_source: Entity) -> ftime_t ---

	ecs_set_interval :: proc(world: ^World, tick_source: Entity, interval: ftime_t) -> Entity ---

	ecs_get_interval :: proc(world: ^World, tick_source: Entity) -> ftime_t ---

	ecs_start_timer :: proc(world: ^World, tick_source: Entity) ---

	ecs_stop_timer :: proc(world: ^World, tick_source: Entity) ---

	ecs_reset_timer :: proc(world: ^World, tick_source: Entity) ---

	ecs_randomize_timers :: proc(world: ^World) ---

	ecs_set_rate :: proc(world: ^World, tick_source: Entity, rate: c.int32_t, source: Entity) -> Entity ---

	ecs_set_tick_source :: proc(world: ^World, system: Entity, tick_source: Entity) ---

	FlecsTimerImport :: proc(world: ^World) ---

	ecs_pipeline_init :: proc(world: ^World, desc: ^PipelineDesc) -> Entity ---

	ecs_set_pipeline :: proc(world: ^World, pipeline: Entity) ---

	ecs_get_pipeline :: proc(world: ^World) -> Entity ---

	ecs_progress :: proc(world: ^World, delta_time: ftime_t) -> c.bool ---

	ecs_set_time_scale :: proc(world: ^World, scale: ftime_t) ---

	ecs_reset_clock :: proc(world: ^World) ---

	ecs_run_pipeline :: proc(world: ^World, pipeline: Entity, delta_time: ftime_t) ---

	ecs_set_threads :: proc(world: ^World, threads: c.int32_t) ---

	ecs_set_task_threads :: proc(world: ^World, task_threads: c.int32_t) ---

	ecs_using_task_threads :: proc(world: ^World) -> c.bool ---

	FlecsPipelineImport :: proc(world: ^World) ---

	ecs_system_init :: proc(world: ^World, desc: ^SystemDesc) -> Entity ---

	ecs_run :: proc(world: ^World, system: Entity, delta_time: ftime_t, param: rawptr) -> Entity ---

	ecs_run_worker :: proc(world: ^World, system: Entity, stage_current: c.int32_t, stage_count: c.int32_t, delta_time: ftime_t, param: rawptr) -> Entity ---

	ecs_run_w_filter :: proc(world: ^World, system: Entity, delta_time: ftime_t, offset: c.int32_t, limit: c.int32_t, param: rawptr) -> Entity ---

	ecs_system_get_query :: proc(world: ^World, system: Entity) -> ^Query ---

	ecs_system_get_ctx :: proc(world: ^World, system: Entity) -> rawptr ---

	ecs_system_get_binding_ctx :: proc(world: ^World, system: Entity) -> rawptr ---

	FlecsSystemImport :: proc(world: ^World) ---

	ecs_world_stats_get :: proc(world: ^World, stats: ^WorldStats) ---

	ecs_world_stats_reduce :: proc(dst: ^WorldStats, src: ^WorldStats) ---

	ecs_world_stats_reduce_last :: proc(stats: ^WorldStats, old: ^WorldStats, count: c.int32_t) ---

	ecs_world_stats_repeat_last :: proc(stats: ^WorldStats) ---

	ecs_world_stats_copy_last :: proc(dst: ^WorldStats, src: ^WorldStats) ---

	ecs_world_stats_log :: proc(world: ^World, stats: ^WorldStats) ---
		//TODO:STATS
	// ecs_query_stats_get :: proc(world: ^World, query: ^Query, stats: ^ecs_query_stats_t) ---

	// ecs_query_stats_reduce :: proc(dst: ^ecs_query_stats_t, src: ^ecs_query_stats_t) ---

	// ecs_query_stats_reduce_last :: proc(stats: ^ecs_query_stats_t, old: ^ecs_query_stats_t, count: c.int32_t) ---

	// ecs_query_stats_repeat_last :: proc(stats: ^ecs_query_stats_t) ---

	// ecs_query_stats_copy_last :: proc(dst: ^ecs_query_stats_t, src: ^ecs_query_stats_t) ---

	// ecs_system_stats_get :: proc(world: ^World, system: Entity, stats: ^ecs_system_stats_t) -> c.bool ---

	// ecs_system_stats_reduce :: proc(dst: ^ecs_system_stats_t, src: ^ecs_system_stats_t) ---

	// ecs_system_stats_reduce_last :: proc(stats: ^ecs_system_stats_t, old: ^ecs_system_stats_t, count: c.int32_t) ---

	// ecs_system_stats_repeat_last :: proc(stats: ^ecs_system_stats_t) ---

	// ecs_system_stats_copy_last :: proc(dst: ^ecs_system_stats_t, src: ^ecs_system_stats_t) ---

	// ecs_pipeline_stats_get :: proc(world: ^World, pipeline: Entity, stats: ^ecs_pipeline_stats_t) -> c.bool ---

	// ecs_pipeline_stats_fini :: proc(stats: ^ecs_pipeline_stats_t) ---

	// ecs_pipeline_stats_reduce :: proc(dst: ^ecs_pipeline_stats_t, src: ^ecs_pipeline_stats_t) ---

	// ecs_pipeline_stats_reduce_last :: proc(stats: ^ecs_pipeline_stats_t, old: ^ecs_pipeline_stats_t, count: c.int32_t) ---

	// ecs_pipeline_stats_repeat_last :: proc(stats: ^ecs_pipeline_stats_t) ---

	// ecs_pipeline_stats_copy_last :: proc(dst: ^ecs_pipeline_stats_t, src: ^ecs_pipeline_stats_t) ---

	ecs_metric_reduce :: proc(dst: ^Metric, src: ^Metric, t_dst: c.int32_t, t_src: c.int32_t) ---

	ecs_metric_reduce_last :: proc(m: ^Metric, t: c.int32_t, count: c.int32_t) ---

	ecs_metric_copy :: proc(m: ^Metric, dst: c.int32_t, src: c.int32_t) ---
	//  extern ECS_COMPONENT_DECLARE::proc(FlecsMetrics) ---;
	//  extern ECS_TAG_DECLARE::proc(EcsMetric) ---;
	//  extern ECS_TAG_DECLARE::proc(EcsCounter) ---;
	//  extern ECS_TAG_DECLARE::proc(EcsCounterIncrement) ---;
	//  extern ECS_TAG_DECLARE::proc(EcsCounterId) ---;
	//  extern ECS_TAG_DECLARE::proc(EcsGauge) ---;
	//  extern ECS_TAG_DECLARE::proc(EcsMetricInstance) ---;
	//  extern ECS_COMPONENT_DECLARE::proc(EcsMetricValue) ---;
	//  extern ECS_COMPONENT_DECLARE::proc(EcsMetricSource) ---;
		//TODO:METRIC DESC
	// ecs_metric_init :: proc(world: ^World, desc: ^ecs_metric_desc_t) -> Entity ---

	FlecsMetricsImport :: proc(world: ^World) ---
	//  extern ECS_COMPONENT_DECLARE::proc(FlecsAlerts) ---;
	//  extern ECS_COMPONENT_DECLARE::proc(EcsAlert) ---;
	//  extern ECS_COMPONENT_DECLARE::proc(EcsAlertInstance) ---;
	//  extern ECS_COMPONENT_DECLARE::proc(EcsAlertsActive) ---;
	//  extern ECS_COMPONENT_DECLARE::proc(EcsAlertTimeout) ---;
	//  extern ECS_TAG_DECLARE::proc(EcsAlertInfo) ---;
	//  extern ECS_TAG_DECLARE::proc(EcsAlertWarning) ---;
	//  extern ECS_TAG_DECLARE::proc(EcsAlertError) ---;
	//  extern ECS_TAG_DECLARE::proc(EcsAlertCritical) ---;
	//TODO: alert desc
	// ecs_alert_init :: proc(world: ^World, desc: ^ecs_alert_desc_t) -> Entity ---

	ecs_get_alert_count :: proc(world: ^World, entity: Entity, alert: Entity) -> c.int32_t ---

	ecs_get_alert :: proc(world: ^World, entity: Entity, alert: Entity) -> Entity ---

	FlecsAlertsImport :: proc(world: ^World) ---
	//  extern ECS_COMPONENT_DECLARE::proc(FlecsMonitor) ---;
	//  extern ECS_COMPONENT_DECLARE::proc(EcsWorldStats) ---;
	//  extern ECS_COMPONENT_DECLARE::proc(EcsWorldSummary) ---;
	//  extern ECS_COMPONENT_DECLARE::proc(EcsPipelineStats) ---;

	FlecsMonitorImport :: proc(world: ^World) ---

	FlecsCoreDocImport :: proc(world: ^World) ---
	//  extern const Entity ecs_id::proc(EcsDocDescription) ---;

	ecs_doc_set_name :: proc(world: ^World, entity: Entity, name: cstring) ---

	ecs_doc_set_brief :: proc(world: ^World, entity: Entity, description: cstring) ---

	ecs_doc_set_detail :: proc(world: ^World, entity: Entity, description: cstring) ---

	ecs_doc_set_link :: proc(world: ^World, entity: Entity, link: cstring) ---

	ecs_doc_set_color :: proc(world: ^World, entity: Entity, color: cstring) ---
	ecs_doc_get_name :: proc(world: ^World, entity: Entity) -> ^c.char ---
	ecs_doc_get_brief :: proc(world: ^World, entity: Entity) -> ^c.char ---
	ecs_doc_get_detail :: proc(world: ^World, entity: Entity) -> ^c.char ---
	ecs_doc_get_link :: proc(world: ^World, entity: Entity) -> ^c.char ---
	ecs_doc_get_color :: proc(world: ^World, entity: Entity) -> ^c.char ---

	FlecsDocImport :: proc(world: ^World) ---
	//TODO: from json desc
	// ecs_ptr_from_json :: proc(world: ^World, type: Entity, ptr: rawptr, json: cstring, desc: ^ecs_from_json_desc_t) -> ^c.char ---
	// ecs_entity_from_json :: proc(world: ^World, entity: Entity, json: cstring, desc: ^ecs_from_json_desc_t) -> ^c.char ---
	// ecs_world_from_json :: proc(world: ^World, json: cstring, desc: ^ecs_from_json_desc_t) -> ^c.char ---

	ecs_array_to_json :: proc(world: ^World, type: Entity, data: rawptr, count: c.int32_t) -> ^c.char ---

	ecs_array_to_json_buf :: proc(world: ^World, type: Entity, data: rawptr, count: c.int32_t, buf_out: ^StrBuf) -> c.int ---

	ecs_ptr_to_json :: proc(world: ^World, type: Entity, data: rawptr) -> ^c.char ---

	ecs_ptr_to_json_buf :: proc(world: ^World, type: Entity, data: rawptr, buf_out: ^StrBuf) -> c.int ---

	TypeInfoo_json :: proc(world: ^World, type: Entity) -> ^c.char ---

	TypeInfoo_json_buf :: proc(world: ^World, type: Entity, buf_out: ^StrBuf) -> c.int ---
		//TODO: more json sh1t
	// Entityo_json :: proc(world: ^World, entity: Entity, desc: ^Entityo_json_desc_t) -> ^c.char ---

	// Entityo_json_buf :: proc(world: ^World, entity: Entity, buf_out: ^StrBuf, desc: ^Entityo_json_desc_t) -> c.int ---

	// Itero_json :: proc(world: ^World, iter: ^Iter, desc: ^Itero_json_desc_t) -> ^c.char ---

	// Itero_json_buf :: proc(world: ^World, iter: ^Iter, buf_out: ^StrBuf, desc: ^Itero_json_desc_t) -> c.int ---

	// Worldo_json :: proc(world: ^World, desc: ^Worldo_json_desc_t) -> ^c.char ---

	// Worldo_json_buf :: proc(world: ^World, buf_out: ^StrBuf, desc: ^Worldo_json_desc_t) -> c.int ---
	//  extern ECS_DECLARE::proc(EcsUnitPrefixes) ---;
	//  extern ECS_DECLARE::proc(EcsYocto) ---;
	//  extern ECS_DECLARE::proc(EcsZepto) ---;
	//  extern ECS_DECLARE::proc(EcsAtto) ---;
	//  extern ECS_DECLARE::proc(EcsFemto) ---;
	//  extern ECS_DECLARE::proc(EcsPico) ---;
	//  extern ECS_DECLARE::proc(EcsNano) ---;
	//  extern ECS_DECLARE::proc(EcsMicro) ---;
	//  extern ECS_DECLARE::proc(EcsMilli) ---;
	//  extern ECS_DECLARE::proc(EcsCenti) ---;
	//  extern ECS_DECLARE::proc(EcsDeci) ---;
	//  extern ECS_DECLARE::proc(EcsDeca) ---;
	//  extern ECS_DECLARE::proc(EcsHecto) ---;
	//  extern ECS_DECLARE::proc(EcsKilo) ---;
	//  extern ECS_DECLARE::proc(EcsMega) ---;
	//  extern ECS_DECLARE::proc(EcsGiga) ---;
	//  extern ECS_DECLARE::proc(EcsTera) ---;
	//  extern ECS_DECLARE::proc(EcsPeta) ---;
	//  extern ECS_DECLARE::proc(EcsExa) ---;
	//  extern ECS_DECLARE::proc(EcsZetta) ---;
	//  extern ECS_DECLARE::proc(EcsYotta) ---;
	//  extern ECS_DECLARE::proc(EcsKibi) ---;
	//  extern ECS_DECLARE::proc(EcsMebi) ---;
	//  extern ECS_DECLARE::proc(EcsGibi) ---;
	//  extern ECS_DECLARE::proc(EcsTebi) ---;
	//  extern ECS_DECLARE::proc(EcsPebi) ---;
	//  extern ECS_DECLARE::proc(EcsExbi) ---;
	//  extern ECS_DECLARE::proc(EcsZebi) ---;
	//  extern ECS_DECLARE::proc(EcsYobi) ---;
	//  extern ECS_DECLARE::proc(EcsDuration) ---;
	//  extern     ECS_DECLARE::proc(EcsPicoSeconds) ---;
	//  extern     ECS_DECLARE::proc(EcsNanoSeconds) ---;
	//  extern     ECS_DECLARE::proc(EcsMicroSeconds) ---;
	//  extern     ECS_DECLARE::proc(EcsMilliSeconds) ---;
	//  extern     ECS_DECLARE::proc(EcsSeconds) ---;
	//  extern     ECS_DECLARE::proc(EcsMinutes) ---;
	//  extern     ECS_DECLARE::proc(EcsHours) ---;
	//  extern     ECS_DECLARE::proc(EcsDays) ---;
	//  extern ECS_DECLARE::proc(EcsTime) ---;
	//  extern     ECS_DECLARE::proc(EcsDate) ---;
	//  extern ECS_DECLARE::proc(EcsMass) ---;
	//  extern     ECS_DECLARE::proc(EcsGrams) ---;
	//  extern     ECS_DECLARE::proc(EcsKiloGrams) ---;
	//  extern ECS_DECLARE::proc(EcsElectricCurrent) ---;
	//  extern     ECS_DECLARE::proc(EcsAmpere) ---;
	//  extern ECS_DECLARE::proc(EcsAmount) ---;
	//  extern     ECS_DECLARE::proc(EcsMole) ---;
	//  extern ECS_DECLARE::proc(EcsLuminousIntensity) ---;
	//  extern     ECS_DECLARE::proc(EcsCandela) ---;
	//  extern ECS_DECLARE::proc(EcsForce) ---;
	//  extern     ECS_DECLARE::proc(EcsNewton) ---;
	//  extern ECS_DECLARE::proc(EcsLength) ---;
	//  extern     ECS_DECLARE::proc(EcsMeters) ---;
	//  extern         ECS_DECLARE::proc(EcsPicoMeters) ---;
	//  extern         ECS_DECLARE::proc(EcsNanoMeters) ---;
	//  extern         ECS_DECLARE::proc(EcsMicroMeters) ---;
	//  extern         ECS_DECLARE::proc(EcsMilliMeters) ---;
	//  extern         ECS_DECLARE::proc(EcsCentiMeters) ---;
	//  extern         ECS_DECLARE::proc(EcsKiloMeters) ---;
	//  extern     ECS_DECLARE::proc(EcsMiles) ---;
	//  extern     ECS_DECLARE::proc(EcsPixels) ---;
	//  extern ECS_DECLARE::proc(EcsPressure) ---;
	//  extern     ECS_DECLARE::proc(EcsPascal) ---;
	//  extern     ECS_DECLARE::proc(EcsBar) ---;
	//  extern ECS_DECLARE::proc(EcsSpeed) ---;
	//  extern     ECS_DECLARE::proc(EcsMetersPerSecond) ---;
	//  extern     ECS_DECLARE::proc(EcsKiloMetersPerSecond) ---;
	//  extern     ECS_DECLARE::proc(EcsKiloMetersPerHour) ---;
	//  extern     ECS_DECLARE::proc(EcsMilesPerHour) ---;
	//  extern ECS_DECLARE::proc(EcsTemperature) ---;
	//  extern     ECS_DECLARE::proc(EcsKelvin) ---;
	//  extern     ECS_DECLARE::proc(EcsCelsius) ---;
	//  extern     ECS_DECLARE::proc(EcsFahrenheit) ---;


	//  extern ECS_DECLARE::proc(EcsData) ---;
	//  extern     ECS_DECLARE::proc(EcsBits) ---;
	//  extern         ECS_DECLARE::proc(EcsKiloBits) ---;
	//  extern         ECS_DECLARE::proc(EcsMegaBits) ---;
	//  extern         ECS_DECLARE::proc(EcsGigaBits) ---;
	//  extern     ECS_DECLARE::proc(EcsBytes) ---;
	//  extern         ECS_DECLARE::proc(EcsKiloBytes) ---;
	//  extern         ECS_DECLARE::proc(EcsMegaBytes) ---;
	//  extern         ECS_DECLARE::proc(EcsGigaBytes) ---;
	//  extern         ECS_DECLARE::proc(EcsKibiBytes) ---;
	//  extern         ECS_DECLARE::proc(EcsMebiBytes) ---;
	//  extern         ECS_DECLARE::proc(EcsGibiBytes) ---;
	//  extern ECS_DECLARE::proc(EcsDataRate) ---;
	//  extern     ECS_DECLARE::proc(EcsBitsPerSecond) ---;
	//  extern     ECS_DECLARE::proc(EcsKiloBitsPerSecond) ---;
	//  extern     ECS_DECLARE::proc(EcsMegaBitsPerSecond) ---;
	//  extern     ECS_DECLARE::proc(EcsGigaBitsPerSecond) ---;
	//  extern     ECS_DECLARE::proc(EcsBytesPerSecond) ---;
	//  extern     ECS_DECLARE::proc(EcsKiloBytesPerSecond) ---;
	//  extern     ECS_DECLARE::proc(EcsMegaBytesPerSecond) ---;
	//  extern     ECS_DECLARE::proc(EcsGigaBytesPerSecond) ---;


	//  extern ECS_DECLARE::proc(EcsAngle) ---;
	//  extern     ECS_DECLARE::proc(EcsRadians) ---;
	//  extern     ECS_DECLARE::proc(EcsDegrees) ---;
	//  extern ECS_DECLARE::proc(EcsFrequency) ---;
	//  extern     ECS_DECLARE::proc(EcsHertz) ---;
	//  extern     ECS_DECLARE::proc(EcsKiloHertz) ---;
	//  extern     ECS_DECLARE::proc(EcsMegaHertz) ---;
	//  extern     ECS_DECLARE::proc(EcsGigaHertz) ---;
	//  extern ECS_DECLARE::proc(EcsUri) ---;
	//  extern     ECS_DECLARE::proc(EcsUriHyperlink) ---;
	//  extern     ECS_DECLARE::proc(EcsUriImage) ---;
	//  extern     ECS_DECLARE::proc(EcsUriFile) ---;
	//  extern ECS_DECLARE::proc(EcsAcceleration) ---;
	//  extern ECS_DECLARE::proc(EcsPercentage) ---;
	//  extern ECS_DECLARE::proc(EcsBel) ---;
	//  extern ECS_DECLARE::proc(EcsDeciBel) ---;

	FlecsUnitsImport :: proc(world: ^World) ---
	//  extern const Entity ecs_id::proc(EcsMetaType) ---;
	//  extern const Entity ecs_id::proc(EcsMetaTypeSerialized) ---;
	//  extern const Entity ecs_id::proc(EcsPrimitive) ---;
	//  extern const Entity ecs_id::proc(EcsEnum) ---;
	//  extern const Entity ecs_id::proc(EcsBitmask) ---;
	//  extern const Entity ecs_id::proc(EcsMember) ---;
	//  extern const Entity ecs_id::proc(EcsMemberRanges) ---;
	//  extern const Entity ecs_id::proc(EcsStruct) ---;
	//  extern const Entity ecs_id::proc(EcsArray) ---;
	//  extern const Entity ecs_id::proc(EcsVec) ---;
	//  extern const Entity ecs_id::proc(EcsOpaque) ---;
	//  extern const Entity ecs_id::proc(EcsUnit) ---;
	//  extern const Entity ecs_id::proc(EcsUnitPrefix) ---;
	//  extern const Entity ecs_id::proc(ecs_bool_t) ---;
	//  extern const Entity ecs_id::proc(ecs_char_t) ---;
	//  extern const Entity ecs_id::proc(ecs_byte_t) ---;
	//  extern const Entity ecs_id::proc(ecs_u8_t) ---;
	//  extern const Entity ecs_id::proc(ecs_u16_t) ---;
	//  extern const Entity ecs_id::proc(ecs_u32_t) ---;
	//  extern const Entity ecs_id::proc(ecs_u64_t) ---;
	//  extern const Entity ecs_id::proc(ecs_uptr_t) ---;
	//  extern const Entity ecs_id::proc(ecs_i8_t) ---;
	//  extern const Entity ecs_id::proc(ecs_i16_t) ---;
	//  extern const Entity ecs_id::proc(ecs_i32_t) ---;
	//  extern const Entity ecs_id::proc(ecs_i64_t) ---;
	//  extern const Entity ecs_id::proc(ecs_iptr_t) ---;
	//  extern const Entity ecs_id::proc(ecs_f32_t) ---;
	//  extern const Entity ecs_id::proc(ecs_f64_t) ---;
	//  extern const Entity ecs_id::proc(ecs_string_t) ---;
	//  extern const Entity ecs_id::proc(Entity) ---;
	//  extern const Entity ecs_id::proc(ecs_id_t) ---;


	//TODO: ecs_meta_cursor_t
	// ecs_meta_cursor :: proc(world: ^World, type: Entity, ptr: rawptr) -> ecs_meta_cursor_t ---

	// ecs_meta_get_ptr :: proc(cursor: ^ecs_meta_cursor_t) -> rawptr ---

	// ecs_meta_next :: proc(cursor: ^ecs_meta_cursor_t) -> c.int ---

	// ecs_meta_elem :: proc(cursor: ^ecs_meta_cursor_t, elem: c.int32_t) -> c.int ---

	// ecs_meta_member :: proc(cursor: ^ecs_meta_cursor_t, name: cstring) -> c.int ---

	// ecs_meta_dotmember :: proc(cursor: ^ecs_meta_cursor_t, name: cstring) -> c.int ---

	// ecs_meta_push :: proc(cursor: ^ecs_meta_cursor_t) -> c.int ---

	// ecs_meta_pop :: proc(cursor: ^ecs_meta_cursor_t) -> c.int ---

	// ecs_meta_is_collection :: proc(cursor: ^ecs_meta_cursor_t) -> c.bool ---

	// ecs_meta_get_type :: proc(cursor: ^ecs_meta_cursor_t) -> Entity ---

	// ecs_meta_get_unit :: proc(cursor: ^ecs_meta_cursor_t) -> Entity ---
	// ecs_meta_get_member :: proc(cursor: ^ecs_meta_cursor_t) -> ^c.char ---

	// ecs_meta_get_member_id :: proc(cursor: ^ecs_meta_cursor_t) -> Entity ---

	// ecs_meta_set_bool :: proc(cursor: ^ecs_meta_cursor_t, value: c.bool) -> c.int ---

	// ecs_meta_set_char :: proc(cursor: ^ecs_meta_cursor_t, value: c.char) -> c.int ---

	// ecs_meta_set_int :: proc(cursor: ^ecs_meta_cursor_t, value: c.int64_t) -> c.int ---

	// ecs_meta_set_uint :: proc(cursor: ^ecs_meta_cursor_t, value: c.uint64_t) -> c.int ---

	// ecs_meta_set_float :: proc(cursor: ^ecs_meta_cursor_t, value: c.double) -> c.int ---

	// ecs_meta_set_string :: proc(cursor: ^ecs_meta_cursor_t, value: cstring) -> c.int ---

	// ecs_meta_set_string_literal :: proc(cursor: ^ecs_meta_cursor_t, value: cstring) -> c.int ---

	// ecs_meta_set_entity :: proc(cursor: ^ecs_meta_cursor_t, value: Entity) -> c.int ---

	// ecs_meta_set_id :: proc(cursor: ^ecs_meta_cursor_t, value: ecs_id_t) -> c.int ---

	// ecs_meta_set_component :: proc(cursor: ^ecs_meta_cursor_t, value: ecs_id_t) -> c.int ---

	// ecs_meta_set_null :: proc(cursor: ^ecs_meta_cursor_t) -> c.int ---

	// ecs_meta_set_value :: proc(cursor: ^ecs_meta_cursor_t, value: ^ecs_value_t) -> c.int ---

	// ecs_meta_get_bool :: proc(cursor: ^ecs_meta_cursor_t) -> c.bool ---

	// ecs_meta_get_char :: proc(cursor: ^ecs_meta_cursor_t) -> char ---

	// ecs_meta_get_int :: proc(cursor: ^ecs_meta_cursor_t) -> int64_t ---

	// ecs_meta_get_uint :: proc(cursor: ^ecs_meta_cursor_t) -> Entity ---

	// ecs_meta_get_float :: proc(cursor: ^ecs_meta_cursor_t) -> double ---
	// ecs_meta_get_string :: proc(cursor: ^ecs_meta_cursor_t) -> ^c.char ---

	// ecs_meta_get_entity :: proc(cursor: ^ecs_meta_cursor_t) -> Entity ---
	

	//TODO: a lot of desc
	// ecs_meta_ptr_to_float :: proc(type_kind: ecs_primitive_kind_t, ptr: rawptr) -> c.double ---

	// ecs_primitive_init :: proc(world: ^World, desc: ^ecs_primitive_desc_t) -> Entity ---

	// ecs_enum_init :: proc(world: ^World, desc: ^ecs_enum_desc_t) -> Entity ---

	// ecs_bitmask_init :: proc(world: ^World, desc: ^ecs_bitmask_desc_t) -> Entity ---

	// ecs_array_init :: proc(world: ^World, desc: ^ecs_array_desc_t) -> Entity ---

	// ecs_Vec_init :: proc(world: ^World, desc: ^ecs_Vec_desc_t) -> Entity ---

	// ecs_struct_init :: proc(world: ^World, desc: ^ecs_struct_desc_t) -> Entity ---

	// ecs_opaque_init :: proc(world: ^World, desc: ^ecs_opaque_desc_t) -> Entity ---

	// ecs_unit_init :: proc(world: ^World, desc: ^ecs_unit_desc_t) -> Entity ---

	// ecs_unit_prefix_init :: proc(world: ^World, desc: ^ecs_unit_prefix_desc_t) -> Entity ---

	ecs_quantity_init :: proc(world: ^World, desc: ^EntityDesc) -> Entity ---

	FlecsMetaImport :: proc(world: ^World) ---

	ecs_chresc :: proc(out: cstring, input: c.char, delimiter: c.char) -> ^c.char ---

	ecs_stresc :: proc(out: cstring, size: size_t, delimiter: c.char, input: cstring) -> ecs_size_t ---

	ecs_astresc :: proc(delimiter: c.char, input: cstring) -> ^c.char ---
//TODO: ecs_vars_t
	// ecs_vars_init :: proc(world: ^World, vars: ^ecs_vars_t) ---

	// ecs_vars_fini :: proc(vars: ^ecs_vars_t) ---

	// ecs_vars_push :: proc(vars: ^ecs_vars_t) ---

	// ecs_vars_pop :: proc(vars: ^ecs_vars_t) -> c.int ---

	// ecs_vars_declare :: proc(vars: ^ecs_vars_t, name: cstring, type: Entity) -> ^ecs_expr_var_t ---

	// ecs_vars_declare_w_value :: proc(vars: ^ecs_vars_t, name: cstring, value: ^ecs_value_t) -> ^ecs_expr_var_t ---

	// ecs_vars_lookup :: proc(vars: ^ecs_vars_t, name: cstring) -> ^ecs_expr_var_t ---
	
	//TODO: ecs_parse_expr_desc_t
	// ecs_parse_expr :: proc(world: ^World, ptr: cstring, value: ^ecs_value_t, desc: ^ecs_parse_expr_desc_t) -> ^c.char ---

	ecs_ptr_to_expr :: proc(world: ^World, type: Entity, data: rawptr) -> ^c.char ---

	ecs_ptr_to_expr_buf :: proc(world: ^World, type: Entity, data: rawptr, buf: ^StrBuf) -> c.int ---

	ecs_ptr_to_str :: proc(world: ^World, type: Entity, data: rawptr) -> ^c.char ---

	ecs_ptr_to_str_buf :: proc(world: ^World, type: Entity, data: rawptr, buf: ^StrBuf) -> c.int ---
		//TODO: ecs_primitive_kind_t ecs_type_kind_t
	// ecs_primitive_to_expr_buf :: proc(world: ^World, kind: ecs_primitive_kind_t, data: rawptr, buf: ^StrBuf) -> c.int ---
	ecs_parse_expr_token :: proc(name: cstring, expr: cstring, ptr: cstring, token: cstring) -> ^c.char ---

	// ecs_interpolate_string :: proc(world: ^World, str: cstring, vars: ^ecs_vars_t) -> ^c.char ---

	// Itero_vars :: proc(iter: ^Iter, vars: ^ecs_vars_t, offset: c.int) ---

	// ecs_meta_from_desc :: proc(world: ^World, component: Entity, kind: ecs_type_kind_t, desc: cstring) -> c.int ---
		//TODO: EcsScript
	// ECS_COMPONENT_DECLARE :: proc(_: EcsScript) -> extern ---

	ecs_plecs_from_str :: proc(world: ^World, name: cstring, str: cstring) -> c.int ---

	ecs_plecs_from_file :: proc(world: ^World, filename: cstring) -> c.int ---
		//TODO: ecs_script_desc_t
	// ecs_script_init :: proc(world: ^World, desc: ^ecs_script_desc_t) -> Entity ---

	// ecs_script_update :: proc(world: ^World, script: Entity, instance: Entity, str: cstring, vars: ^ecs_vars_t) -> c.int ---

	ecs_script_clear :: proc(world: ^World, script: Entity, instance: Entity) ---

	FlecsScriptImport :: proc(world: ^World) ---

	ecs_rule_init :: proc(world: ^World, desc: ^FilterDesc) -> ^Rule ---

	ecs_rule_fini :: proc(rule: ^Rule) ---
	ecs_rule_get_filter :: proc(rule: ^Rule) -> ^Filter ---

	ecs_rule_var_count :: proc(rule: ^Rule) -> c.int32_t ---

	ecs_rule_find_var :: proc(rule: ^Rule, name: cstring) -> c.int32_t ---
	ecs_rule_var_name :: proc(rule: ^Rule, var_id: c.int32_t) -> ^c.char ---

	ecs_rule_var_is_entity :: proc(rule: ^Rule, var_id: c.int32_t) -> c.bool ---

	ecs_rule_iter :: proc(world: ^World, rule: ^Rule) -> Iter ---

	ecs_rule_next :: proc(it: ^Iter) -> c.bool ---

	ecs_rule_next_instanced :: proc(it: ^Iter) -> c.bool ---

	ecs_rule_str :: proc(rule: ^Rule) -> ^c.char ---

	ecs_rule_str_w_profile :: proc(rule: ^Rule, iter: ^Iter) -> ^c.char ---
	ecs_rule_parse_vars :: proc(rule: ^Rule, it: ^Iter, expr: cstring) -> ^c.char ---
	// TODO: ecs_snapshot_t
	// ecs_snapshot_take :: proc(world: ^World) -> ^ecs_snapshot_t ---

	// ecs_snapshot_take_w_iter :: proc(iter: ^Iter) -> ^ecs_snapshot_t ---

	// ecs_snapshot_restore :: proc(world: ^World, snapshot: ^ecs_snapshot_t) ---

	// ecs_snapshot_iter :: proc(snapshot: ^ecs_snapshot_t) -> Iter ---

	ecs_snapshot_next :: proc(iter: ^Iter) -> c.bool ---

	// ecs_snapshot_free :: proc(snapshot: ^ecs_snapshot_t) ---
	ecs_parse_ws :: proc(ptr: cstring) -> ^c.char ---
	ecs_parse_ws_eol :: proc(ptr: cstring) -> ^c.char ---
	ecs_parse_digit :: proc(ptr: cstring, token: cstring) -> ^c.char ---


	ecs_parse_token :: proc(name: cstring, expr: cstring, ptr: cstring, token_out: cstring, delim: c.char) -> ^c.char ---

	ecs_parse_term :: proc(world: ^World, name: cstring, expr: cstring, ptr: cstring, term_out: ^Term, extra_args: ^TermId) -> ^c.char ---


	ecs_set_os_api_impl :: proc() ---
		//TODO: ecs_module_action_t
	// ecs_import :: proc(world: ^World, module: ecs_module_action_t, module_name: cstring) -> Entity ---

	// ecs_import_c :: proc(world: ^World, module: ecs_module_action_t, module_name_c: cstring) -> Entity ---

	ecs_import_from_library :: proc(world: ^World, library_name: cstring, module_name: cstring) -> Entity ---

	ecs_module_init :: proc(world: ^World, c_name: cstring, desc: ^ComponentDesc) -> Entity ---

	ecs_cpp_get_type_name :: proc(type_name: cstring, func_name: cstring, len: size_t, front_len: size_t) -> ^c.char ---

	ecs_cpp_get_symbol_name :: proc(symbol_name: cstring, type_name: cstring, len: size_t) -> ^c.char ---

	ecs_cpp_get_constant_name :: proc(constant_name: cstring, func_name: cstring, len: size_t, back_len: size_t) -> ^c.char ---
	ecs_cpp_trim_module :: proc(world: ^World, type_name: cstring) -> ^c.char ---

	ecs_cpp_component_validate :: proc(world: ^World, id: Entity, name: cstring, symbol: cstring, size: size_t, alignment: size_t, implicit_name: c.bool) ---

	ecs_cpp_component_register :: proc(world: ^World, id: Entity, name: cstring, symbol: cstring, size: size_t, alignment: ecs_size_t, implicit_name: c.bool, existing_out: ^c.bool) -> Entity ---

	ecs_cpp_component_register_explicit :: proc(world: ^World, s_id: Entity, id: Entity, name: cstring, type_name: cstring, symbol: cstring, size: size_t, alignment: size_t, is_component: c.bool, existing_out: ^c.bool) -> Entity ---

	ecs_cpp_enum_init :: proc(world: ^World, id: Entity) ---

	ecs_cpp_enum_constant_register :: proc(world: ^World, parent: Entity, id: Entity, name: cstring, value: c.int) -> Entity ---

	ecs_cpp_reset_count_get :: proc() -> c.int32_t ---

	ecs_cpp_reset_count_inc :: proc() -> c.int32_t ---
	//TODO:member
	// ecs_cpp_last_member :: proc(world: ^World, type: Entity) -> ^ecs_member_t ---
}
