package flecs

import "core:c"

when ODIN_OS == .Windows 
{
	foreign import flecs "system:flecs.lib"
}

@(default_calling_convention = "c")
foreign flecs 
{


	ecs_vec_init :: proc(allocator: ^allocator_t, vec: ^vec_t, size: size_t, elem_count: c.int32_t) -> ^vec_t ---

	ecs_vec_init_if :: proc(vec: ^vec_t, size: size_t) ---

	ecs_vec_fini :: proc(allocator: ^allocator_t, vec: ^vec_t, size: size_t) ---

	ecs_vec_reset :: proc(allocator: ^allocator_t, vec: ^vec_t, size: size_t) -> ^vec_t ---

	ecs_vec_clear :: proc(vec: ^vec_t) ---

	ecs_vec_append :: proc(allocator: ^allocator_t, vec: ^vec_t, size: size_t) -> rawptr ---

	ecs_vec_remove :: proc(vec: ^vec_t, size: size_t, elem: c.int32_t) ---

	ecs_vec_remove_last :: proc(vec: ^vec_t) ---


	ecs_vec_copy :: proc(allocator: ^allocator_t, vec: ^vec_t, size: size_t) -> vec_t ---

	ecs_vec_reclaim :: proc(allocator: ^allocator_t, vec: ^vec_t, size: size_t) ---

	ecs_vec_set_size :: proc(allocator: ^allocator_t, vec: ^vec_t, size: size_t, elem_count: c.int32_t) ---

	ecs_vec_set_min_size :: proc(allocator: ^allocator_t, vec: ^vec_t, size: size_t, elem_count: c.int32_t) ---

	ecs_vec_set_min_count :: proc(allocator: ^allocator_t, vec: ^vec_t, size: size_t, elem_count: c.int32_t) ---

	ecs_vec_set_min_count_zeromem :: proc(allocator: ^allocator_t, vec: ^vec_t, size: size_t, elem_count: c.int32_t) ---

	ecs_vec_set_count :: proc(allocator: ^allocator_t, vec: ^vec_t, size: size_t, elem_count: c.int32_t) ---

	ecs_vec_grow :: proc(allocator: ^allocator_t, vec: ^vec_t, size: size_t, elem_count: c.int32_t) -> rawptr ---

	ecs_vec_count :: proc(vec: ^vec_t) -> c.int32_t ---


	ecs_vec_size :: proc(vec: ^vec_t) -> c.int32_t ---

	ecs_vec_get :: proc(vec: ^vec_t, size: size_t, index: c.int32_t) -> rawptr ---

	ecs_vec_first :: proc(vec: ^vec_t) -> rawptr ---

	ecs_vec_last :: proc(vec: ^vec_t, size: size_t) -> rawptr ---

	ecs_sparse_init :: proc(sparse: ^sparse_t, size: size_t) ---

	ecs_sparse_add :: proc(sparse: ^sparse_t, size: size_t) -> rawptr ---

	ecs_sparse_last_id :: proc(sparse: ^sparse_t) -> c.uint64_t ---

	ecs_sparse_count :: proc(sparse: ^sparse_t) -> c.int32_t ---

	flecs_sparse_set_generation :: proc(sparse: ^sparse_t, id: Entity) ---

	ecs_sparse_get_dense :: proc(sparse: ^sparse_t, size: size_t, index: c.int32_t) -> rawptr ---

	ecs_sparse_get :: proc(sparse: ^sparse_t, size: size_t, id: c.uint64_t) -> rawptr ---

	flecs_ballocator_init :: proc(ba: ^block_allocator_t, size: size_t) ---


	flecs_ballocator_new :: proc(size: size_t) -> ^block_allocator_t ---


	flecs_ballocator_fini :: proc(ba: ^block_allocator_t) ---


	flecs_ballocator_free :: proc(ba: ^block_allocator_t) ---

	flecs_balloc :: proc(allocator: ^block_allocator_t) -> rawptr ---

	flecs_bcalloc :: proc(allocator: ^block_allocator_t) -> rawptr ---


	flecs_bfree :: proc(allocator: ^block_allocator_t, memory: rawptr) ---


	flecs_brealloc :: proc(dst: ^block_allocator_t, src: ^block_allocator_t, memory: rawptr) -> rawptr ---

	flecs_bdup :: proc(ba: ^block_allocator_t, memory: rawptr) -> rawptr ---

	ecs_map_params_init :: proc(params: ^map_params_t, allocator: ^allocator_t) ---


	ecs_map_params_fini :: proc(params: ^map_params_t) ---

	ecs_map_init :: proc(map_t: ^map_t, allocator: ^allocator_t) ---


	ecs_map_init_w_params :: proc(map_t: ^map_t, params: ^map_params_t) ---

	ecs_map_init_if :: proc(map_t: ^map_t, allocator: ^allocator_t) ---


	ecs_map_init_w_params_if :: proc(result: ^map_t, params: ^map_params_t) ---

	ecs_map_fini :: proc(map_t: ^map_t) ---


	ecs_map_get :: proc(map_t: ^map_t, key: Map_Key) -> ^Map_Val ---

	ecs_map_get_deref_ :: proc(map_t: ^map_t, key: Map_Key) -> rawptr ---

	ecs_map_ensure :: proc(map_t: ^map_t, key: Map_Key) -> ^Map_Val ---

	ecs_map_ensure_alloc :: proc(map_t: ^map_t, size: size_t, key: Map_Key) -> rawptr ---

	ecs_map_insert :: proc(map_t: ^map_t, key: Map_Key, value: Map_Val) ---

	ecs_map_insert_alloc :: proc(map_t: ^map_t, size: size_t, key: Map_Key) -> rawptr ---

	ecs_map_remove :: proc(map_t: ^map_t, key: Map_Key) -> Map_Val ---

	ecs_map_remove_free :: proc(map_t: ^map_t, key: Map_Key) ---

	ecs_map_clear :: proc(map_t: ^map_t) ---

	ecs_map_iter :: proc(map_t: ^map_t) -> map_iter_t ---

	ecs_map_next :: proc(iter: ^map_iter_t) -> c.bool ---

	ecs_map_copy :: proc(dst: ^map_t, src: ^map_t) ---

	flecs_allocator_init :: proc(a: ^allocator_t) ---


	flecs_allocator_fini :: proc(a: ^allocator_t) ---


	flecs_allocator_get :: proc(a: ^allocator_t, size: size_t) -> ^block_allocator_t ---

	flecs_strdup :: proc(a: ^allocator_t, str: cstring) -> cstring ---//hmm: ^c.char ---


	flecs_strfree :: proc(a: ^allocator_t, str: cstring) ---

	flecs_dup :: proc(a: ^allocator_t, size: size_t, src: rawptr) -> rawptr ---
	// TODO: ...
	// ecs_strbuf_append::proc(
	//     buffer: ^strbuf_t,
	//     fmt: cstring,
	//     #c_vararg args:..any) -> c.bool ---

	ecs_strbuf_vappend :: proc(buffer: ^strbuf_t, fmt: cstring, #c_vararg args: ..any) -> c.bool ---

	ecs_strbuf_appendstr :: proc(buffer: ^strbuf_t, str: cstring) -> c.bool ---

	// ecs_strbuf_appendch::proc(
	//     buffer: ^strbuf_t,
	//     char ch) -> c.bool ---

	// ecs_strbuf_appendint::proc(
	//     buffer: ^strbuf_t,
	//     int64_t v) -> c.bool ---

	// ecs_strbuf_appendflt::proc(
	//     buffer: ^strbuf_t,
	//     double v,
	//     char nan_delim) -> c.bool ---

	ecs_strbuf_appendbool :: proc(buffer: ^strbuf_t, v: c.bool) -> c.bool ---

	ecs_strbuf_mergebuff :: proc(dst_buffer: ^strbuf_t, src_buffer: ^strbuf_t) -> c.bool ---

	ecs_strbuf_appendstr_zerocpy :: proc(buffer: ^strbuf_t, str: cstring) -> c.bool ---

	ecs_strbuf_appendstr_zerocpyn :: proc(buffer: ^strbuf_t, str: cstring, n: c.int32_t) -> c.bool ---

	ecs_strbuf_appendstr_zerocpy_const :: proc(buffer: ^strbuf_t, str: cstring) -> c.bool ---

	ecs_strbuf_appendstr_zerocpyn_const :: proc(buffer: ^strbuf_t, str: cstring, n: c.int32_t) -> c.bool ---

	ecs_strbuf_appendstrn :: proc(buffer: ^strbuf_t, str: cstring, n: c.int32_t) -> c.bool ---

	//TODO: ^char
	// ecs_strbuf_get::proc(
	//     buffer: ^StrBuf) -> ^char ---

	// ecs_strbuf_get_small::proc(
	//     buffer: ^StrBuf) -> ^char ---

	ecs_strbuf_reset :: proc(buffer: ^strbuf_t) ---

	ecs_strbuf_list_push :: proc(buffer: ^strbuf_t, list_open: cstring, separator: cstring) ---

	ecs_strbuf_list_pop :: proc(buffer: ^strbuf_t, list_close: cstring) ---

	ecs_strbuf_list_next :: proc(buffer: ^strbuf_t) ---

	// ecs_strbuf_list_appendch::proc(
	//     buffer: ^strbuf_t,
	//     char ch) -> c.bool ---

	// ecs_strbuf_list_append::proc(
	//     buffer: ^strbuf_t,
	//     fmt: cstring,
	//     #c_vararg args:..any) -> c.bool ---

	ecs_strbuf_list_appendstr :: proc(buffer: ^strbuf_t, str: cstring) -> c.bool ---

	ecs_strbuf_list_appendstrn :: proc(buffer: ^strbuf_t, str: cstring, n: c.int32_t) -> c.bool ---

	ecs_strbuf_written :: proc(buffer: ^strbuf_t) -> c.int32_t ---

	ecs_os_init :: proc() ---

	ecs_os_fini :: proc() ---

	ecs_os_set_api :: proc(os_api: ^os_api_t) ---

	ecs_os_get_api :: proc() -> os_api_t ---

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

	ecs_module_path_from_c :: proc(c_name: cstring) -> cstring ---//hmm: ^c.char ---


	// ecs_default_ctor :: proc(ptr: rawptr, count: c.int32_t, ctx: ^TypeInfo) ---

	// ecs_asprintf::proc(
	//     fmt: cstring,
	//     #c_vararg args:..any) -> cstring ---//hmm: ^c.char ---



	flecs_to_snake_case :: proc(str: cstring) -> cstring ---//hmm: ^c.char ---



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

	ecs_init :: proc() -> ^world_t ---

	ecs_mini :: proc() -> ^world_t ---

	// ecs_init_w_args::proc(
	//     int argc,
	//     argv[]: cstring) -> ^world_t---

	ecs_fini :: proc(world: ^world_t) -> c.int ---

	ecs_is_fini :: proc(world: ^world_t) -> c.bool ---

	ecs_atfini :: proc(world: ^world_t, action: fini_action_t, ctx: rawptr) ---

	ecs_frame_begin :: proc(world: ^world_t, delta_time: ftime_t) -> ftime_t ---

	ecs_frame_end :: proc(world: ^world_t) ---

	ecs_run_post_frame :: proc(world: ^world_t, action: fini_action_t, ctx: rawptr) ---

	ecs_quit :: proc(world: ^world_t) ---

	ecs_should_quit :: proc(world: ^world_t) -> c.bool ---
	ecs_measure_frame_time :: proc(world: ^world_t, enable: c.bool) ---

	ecs_measure_system_time :: proc(world: ^world_t, enable: c.bool) ---

	ecs_set_target_fps :: proc(world: ^world_t, fps: ftime_t) ---


	ecs_readonly_begin :: proc(world: ^world_t) -> c.bool ---

	ecs_readonly_end :: proc(world: ^world_t) ---

	ecs_merge :: proc(world: ^world_t) ---

	ecs_defer_begin :: proc(world: ^world_t) -> c.bool ---

	ecs_is_deferred :: proc(world: ^world_t) -> c.bool ---

	ecs_defer_end :: proc(world: ^world_t) -> c.bool ---

	ecs_defer_suspend :: proc(world: ^world_t) ---

	ecs_defer_resume :: proc(world: ^world_t) ---

	ecs_set_automerge :: proc(world: ^world_t, automerge: c.bool) ---

	ecs_set_stage_count :: proc(world: ^world_t, stages: c.int32_t) ---

	ecs_get_stage_count :: proc(world: ^world_t) -> c.int32_t ---

	ecs_get_stage_id :: proc(world: ^world_t) -> c.int32_t ---

	ecs_get_stage :: proc(world: ^world_t, stage_id: c.int32_t) -> ^world_t ---

	ecs_stage_is_readonly :: proc(world: ^world_t) -> c.bool ---

	ecs_async_stage_new :: proc(world: ^world_t) -> ^world_t ---

	ecs_async_stage_free :: proc(stage: ^world_t) ---

	ecs_stage_is_async :: proc(stage: ^world_t) -> c.bool ---

	ecs_set_ctx :: proc(world: ^world_t, ctx: rawptr, ctx_free: ctx_free_t) ---

	ecs_set_binding_ctx :: proc(world: ^world_t, ctx: rawptr, ctx_free: ctx_free_t) ---

	ecs_get_ctx :: proc(world: ^world_t) -> rawptr ---

	ecs_get_binding_ctx :: proc(world: ^world_t) -> rawptr ---

	// ecs_get_world_info :: proc(world: ^world_t) -> ^ecs_world_info_t ---

	ecs_dim :: proc(world: ^world_t, entity_count: c.int32_t) ---

	ecs_set_entity_range :: proc(world: ^world_t, id_start: Entity, id_end: Entity) ---


	ecs_enable_range_check :: proc(world: ^world_t, enable: c.bool) -> c.bool ---


	ecs_get_max_id :: proc(world: ^world_t) -> Entity ---


	ecs_run_aperiodic :: proc(world: ^world_t, flags: flags32_t) ---

	// ecs_delete_empty_tables::proc(
	//     world: ^world_t,
	//     id: id_t ,
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
	//     Entity second) -> id_t ---

	ecs_new_id :: proc(world: ^world_t) -> Entity ---

	ecs_new_low_id :: proc(world: ^world_t) -> Entity ---

	ecs_new_w_id :: proc(world: ^world_t, id: id_t) -> Entity ---

	// ecs_new_w_table :: proc(world: ^world_t, table: ^table_t) -> Entity ---

	ecs_entity_init :: proc(world: ^world_t, desc: ^entity_desc_t) -> Entity ---


	ecs_bulk_init :: proc(world: ^world_t, desc: ^bulk_desc_t) -> ^Entity ---


	ecs_bulk_new_w_id :: proc(world: ^world_t, id: id_t, count: c.int32_t) -> ^Entity ---

	ecs_clone :: proc(world: ^world_t, dst: Entity, src: Entity, copy_value: c.bool) -> Entity ---

	ecs_delete :: proc(world: ^world_t, entity: Entity) ---


	ecs_delete_with :: proc(world: ^world_t, id: id_t) ---

	ecs_add_id :: proc(world: ^world_t, entity: Entity, id: id_t) ---

	ecs_remove_id :: proc(world: ^world_t, entity: Entity, id: id_t) ---

	ecs_override_id :: proc(world: ^world_t, entity: Entity, id: id_t) ---

	ecs_clear :: proc(world: ^world_t, entity: Entity) ---

	ecs_remove_all :: proc(world: ^world_t, id: id_t) ---

	ecs_set_with :: proc(world: ^world_t, id: id_t) -> Entity ---

	ecs_get_with :: proc(world: ^world_t) -> id_t ---

	ecs_enable :: proc(world: ^world_t, entity: Entity, enabled: c.bool) ---

	ecs_enable_id :: proc(world: ^world_t, entity: Entity, id: id_t, enable: c.bool) ---

	ecs_is_enabled_id :: proc(world: ^world_t, entity: Entity, id: id_t) -> c.bool ---

	ecs_get_id :: proc(world: ^world_t, entity: Entity, id: id_t) -> rawptr ---

	ecs_ref_init_id :: proc(world: ^world_t, entity: Entity, id: id_t) -> ref_t ---

	ecs_ref_get_id :: proc(world: ^world_t, ref: ^ref_t, id: id_t) -> rawptr ---

	ecs_ref_update :: proc(world: ^world_t, ref: ^ref_t) ---

	ecs_get_mut_id :: proc(world: ^world_t, entity: Entity, id: id_t) -> rawptr ---

	ecs_get_mut_modified_id :: proc(world: ^world_t, entity: Entity, id: id_t) -> rawptr ---

	ecs_write_begin :: proc(world: ^world_t, entity: Entity) -> ^record_t ---

	ecs_write_end :: proc(record: ^record_t) ---
	ecs_read_begin :: proc(world: ^world_t, entity: Entity) -> ^record_t ---

	ecs_read_end :: proc(record: ^record_t) ---

	ecs_record_get_entity :: proc(record: ^record_t) -> Entity ---

	ecs_record_get_id :: proc(world: ^world_t, record: ^record_t, id: id_t) -> rawptr ---

	ecs_record_get_mut_id :: proc(world: ^world_t, record: ^record_t, id: id_t) -> rawptr ---

	ecs_record_has_id :: proc(world: ^world_t, record: ^record_t, id: id_t) -> c.bool ---

	ecs_emplace_id :: proc(world: ^world_t, entity: Entity, id: id_t) -> rawptr ---

	ecs_modified_id :: proc(world: ^world_t, entity: Entity, id: id_t) ---

	ecs_set_id :: proc(world: ^world_t, entity: Entity, id: id_t, size: size_t, ptr: rawptr) -> Entity ---

	ecs_is_valid :: proc(world: ^world_t, e: Entity) -> c.bool ---

	ecs_is_alive :: proc(world: ^world_t, e: Entity) -> c.bool ---

	ecs_strip_generation :: proc(e: Entity) -> id_t ---

	ecs_set_entity_generation :: proc(world: ^world_t, entity: Entity) ---

	ecs_get_alive :: proc(world: ^world_t, e: Entity) -> Entity ---

	ecs_ensure :: proc(world: ^world_t, entity: Entity) ---

	ecs_ensure_id :: proc(world: ^world_t, id: id_t) ---

	ecs_exists :: proc(world: ^world_t, entity: Entity) -> c.bool ---
	ecs_get_type :: proc(world: ^world_t, entity: Entity) -> ^type_t ---

	ecs_get_table :: proc(world: ^world_t, entity: Entity) -> ^table_t ---

	ecs_type_str :: proc(world: ^world_t, type: ^type_t) -> cstring ---//hmm: ^c.char ---


	ecs_table_str :: proc(world: ^world_t, table: ^table_t) -> cstring ---//hmm: ^c.char ---


	ecs_entity_str :: proc(world: ^world_t, entity: Entity) -> cstring ---//hmm: ^c.char ---


	ecs_has_id :: proc(world: ^world_t, entity: Entity, id: id_t) -> c.bool ---

	ecs_owns_id :: proc(world: ^world_t, entity: Entity, id: id_t) -> c.bool ---

	ecs_get_target :: proc(world: ^world_t, entity: Entity, rel: Entity, index: c.int32_t) -> Entity ---

	ecs_get_parent :: proc(world: ^world_t, entity: Entity) -> Entity ---


	ecs_get_target_for_id :: proc(world: ^world_t, entity: Entity, rel: Entity, id: id_t) -> Entity ---

	ecs_get_depth :: proc(world: ^world_t, entity: Entity, rel: Entity) -> c.int32_t ---

	ecs_flatten :: proc(world: ^world_t, pair: id_t, desc: ^flatten_desc_t) ---

	ecs_count_id :: proc(world: ^world_t, entity: id_t) -> c.int32_t ---
	ecs_get_name :: proc(world: ^world_t, entity: Entity) -> cstring ---//hmm: ^c.char ---

	ecs_get_symbol :: proc(world: ^world_t, entity: Entity) -> cstring ---//hmm: ^c.char ---



	ecs_set_name :: proc(world: ^world_t, entity: Entity, name: cstring) -> Entity ---


	ecs_set_symbol :: proc(world: ^world_t, entity: Entity, symbol: cstring) -> Entity ---


	ecs_set_alias :: proc(world: ^world_t, entity: Entity, alias: cstring) ---


	ecs_lookup :: proc(world: ^world_t, name: cstring) -> Entity ---

	ecs_lookup_child :: proc(world: ^world_t, parent: Entity, name: cstring) -> Entity ---

	ecs_lookup_path_w_sep :: proc(world: ^world_t, parent: Entity, path: cstring, sep: cstring, prefix: cstring, recursive: c.bool) -> Entity ---

	ecs_lookup_symbol :: proc(world: ^world_t, symbol: cstring, lookup_as_path: c.bool, recursive: c.bool) -> Entity ---

	ecs_get_path_w_sep :: proc(world: ^world_t, parent: Entity, child: Entity, sep: cstring, prefix: cstring) -> cstring ---//hmm: ^c.char ---


	ecs_new_from_path_w_sep :: proc(world: ^world_t, parent: Entity, path: cstring, sep: cstring, prefix: cstring) -> Entity ---

	ecs_add_path_w_sep :: proc(world: ^world_t, entity: Entity, parent: Entity, path: cstring, sep: cstring, prefix: cstring) -> Entity ---

	ecs_set_scope :: proc(world: ^world_t, scope: Entity) -> Entity ---

	ecs_get_scope :: proc(world: ^world_t) -> Entity ---


	ecs_set_name_prefix :: proc(world: ^world_t, prefix: cstring) -> cstring ---//hmm: ^c.char ---


	ecs_set_lookup_path :: proc(world: ^world_t, lookup_path: ^Entity) -> ^Entity ---

	ecs_get_lookup_path :: proc(world: ^world_t) -> ^Entity ---

	ecs_component_init :: proc(world: ^world_t, desc: ^component_desc_t) -> Entity ---
	ecs_get_type_info :: proc(world: ^world_t, id: id_t) -> ^type_info_t ---

	ecs_set_hooks_id :: proc(world: ^world_t, id: Entity, hooks: ^type_hooks_t) ---
	ecs_get_hooks_id :: proc(world: ^world_t, id: Entity) -> ^type_hooks_t ---

	ecs_id_is_tag :: proc(world: ^world_t, id: id_t) -> c.bool ---

	ecs_id_is_union :: proc(world: ^world_t, id: id_t) -> c.bool ---

	ecs_id_in_use :: proc(world: ^world_t, id: id_t) -> c.bool ---

	ecs_get_typeid :: proc(world: ^world_t, id: id_t) -> Entity ---

	ecs_id_match :: proc(id: id_t, pattern: id_t) -> c.bool ---

	ecs_id_is_pair :: proc(id: id_t) -> c.bool ---

	ecs_id_is_wildcard :: proc(id: id_t) -> c.bool ---

	ecs_id_is_valid :: proc(world: ^world_t, id: id_t) -> c.bool ---

	ecs_id_get_flags :: proc(world: ^world_t, id: id_t) -> flags32_t ---

	// ecs_id_flag_str::proc(
	//     id: id_t _flags) -> cstring ---//hmm: ^c.char ---
;

	ecs_id_str :: proc(world: ^world_t, id: id_t) -> cstring ---//hmm: ^c.char ---


	ecs_id_str_buf :: proc(world: ^world_t, id: id_t, buf: ^strbuf_t) ---

	ecs_term_iter :: proc(world: ^world_t, term: ^term_t) -> iter_t ---

	ecs_term_chain_iter :: proc(it: ^iter_t, term: ^term_t) -> iter_t ---

	ecs_term_next :: proc(it: ^iter_t) -> c.bool ---

	ecs_children :: proc(world: ^world_t, parent: Entity) -> iter_t ---

	ecs_children_next :: proc(it: ^iter_t) -> c.bool ---

	ecs_term_id_is_set :: proc(id: ^term_id_t) -> c.bool ---

	ecs_term_is_initialized :: proc(term: ^term_t) -> c.bool ---

	ecs_term_match_this :: proc(term: ^term_t) -> c.bool ---

	ecs_term_match_0 :: proc(term: ^term_t) -> c.bool ---

	ecs_term_finalize :: proc(world: ^world_t, term: ^term_t) -> c.int ---

	ecs_term_copy :: proc(src: ^term_t) -> term_t ---

	ecs_term_move :: proc(src: ^term_t) -> term_t ---

	ecs_term_fini :: proc(term: ^term_t) ---


	ecs_filter_init :: proc(world: ^world_t, desc: ^filter_desc_t) -> ^filter_t ---

	ecs_filter_fini :: proc(filter: ^filter_t) ---

	ecs_filter_finalize :: proc(world: ^world_t, filter: ^filter_t) -> c.int ---

	ecs_filter_find_this_var :: proc(filter: ^filter_t) -> c.int32_t ---

	ecs_term_str :: proc(world: ^world_t, term: ^term_t) -> cstring ---//hmm: ^c.char ---


	ecs_filter_str :: proc(world: ^world_t, filter: ^filter_t) -> cstring ---//hmm: ^c.char ---


	ecs_filter_iter :: proc(world: ^world_t, filter: ^filter_t) -> iter_t ---

	ecs_filter_chain_iter :: proc(it: ^iter_t, filter: ^filter_t) -> iter_t ---

	ecs_filter_pivot_term :: proc(world: ^world_t, filter: ^filter_t) -> c.int32_t ---

	ecs_filter_next :: proc(it: ^iter_t) -> c.bool ---

	ecs_filter_next_instanced :: proc(it: ^iter_t) -> c.bool ---

	ecs_filter_move :: proc(dst: ^filter_t, src: ^filter_t) ---

	ecs_filter_copy :: proc(dst: ^filter_t, src: ^filter_t) ---

	ecs_query_init :: proc(world: ^world_t, desc: ^query_desc_t) -> ^query_t ---

	ecs_query_fini :: proc(query: ^query_t) ---
	ecs_query_get_filter :: proc(query: ^query_t) -> ^filter_t ---

	ecs_query_iter :: proc(world: ^world_t, query: ^query_t) -> iter_t ---

	ecs_query_next :: proc(iter: ^iter_t) -> c.bool ---

	ecs_query_next_instanced :: proc(iter: ^iter_t) -> c.bool ---

	ecs_query_next_table :: proc(iter: ^iter_t) -> c.bool ---

	ecs_query_populate :: proc(iter: ^iter_t, when_changed: c.bool) -> c.int ---

	ecs_query_changed :: proc(query: ^query_t, iter: ^iter_t) -> c.bool ---

	ecs_query_skip :: proc(it: ^iter_t) ---

	ecs_query_set_group :: proc(it: ^iter_t, group_id: c.uint64_t) ---

	ecs_query_get_group_ctx :: proc(query: ^query_t, group_id: c.uint64_t) -> rawptr ---
	ecs_query_get_group_info :: proc(query: ^query_t, group_id: c.uint64_t) -> ^query_group_info_t ---

	ecs_query_orphaned :: proc(query: ^query_t) -> c.bool ---

	ecs_query_str :: proc(query: ^query_t) -> cstring ---//hmm: ^c.char ---


	Queryable_count :: proc(query: ^query_t) -> c.int32_t ---

	ecs_query_empty_table_count :: proc(query: ^query_t) -> c.int32_t ---

	ecs_query_entity_count :: proc(query: ^query_t) -> c.int32_t ---

	ecs_query_get_ctx :: proc(query: ^query_t) -> rawptr ---

	ecs_query_get_binding_ctx :: proc(query: ^query_t) -> rawptr ---

	ecs_emit :: proc(world: ^world_t, desc: ^event_desc_t) ---

	ecs_enqueue :: proc(world: ^world_t, desc: ^event_desc_t) ---

	ecs_observer_init :: proc(world: ^world_t, desc: ^observer_desc_t) -> Entity ---

	ecs_observer_default_run_action :: proc(it: ^iter_t) -> c.bool ---

	ecs_observer_get_ctx :: proc(world: ^world_t, observer: Entity) -> rawptr ---

	ecs_observer_get_binding_ctx :: proc(world: ^world_t, observer: Entity) -> rawptr ---

	ecs_iter_poly :: proc(world: ^world_t, poly: ^ecs_poly_t, iter: ^iter_t, filter: ^term_t) ---

	ecs_iter_next :: proc(it: ^iter_t) -> c.bool ---

	ecs_iter_fini :: proc(it: ^iter_t) ---

	ecs_iter_count :: proc(it: ^iter_t) -> c.int32_t ---

	ecs_iter_is_true :: proc(it: ^iter_t) -> c.bool ---

	ecs_iter_first :: proc(it: ^iter_t) -> Entity ---

	ecs_iter_set_var :: proc(it: ^iter_t, var_id: c.int32_t, entity: Entity) ---

	ecs_iter_set_var_as_table :: proc(it: ^iter_t, var_id: c.int32_t, table: ^table_t) ---

	ecs_iter_set_var_as_range :: proc(it: ^iter_t, var_id: c.int32_t, range: ^table_range_t) ---

	ecs_iter_get_var :: proc(it: ^iter_t, var_id: c.int32_t) -> Entity ---

	ecs_iter_get_var_as_table :: proc(it: ^iter_t, var_id: c.int32_t) -> ^table_t ---

	ecs_iter_get_var_as_range :: proc(it: ^iter_t, var_id: c.int32_t) -> table_range_t ---

	ecs_iter_var_is_constrained :: proc(it: ^iter_t, var_id: c.int32_t) -> c.bool ---

	ecs_iter_str :: proc(iter: ^iter_t) -> cstring ---//hmm: ^c.char ---


	ecs_page_iter :: proc(iter: ^iter_t, offset: c.int32_t, limit: c.int32_t) -> iter_t ---

	ecs_page_next :: proc(it: ^iter_t) -> c.bool ---

	ecs_worker_iter :: proc(iter: ^iter_t, index: c.int32_t, count: c.int32_t) -> iter_t ---

	ecs_worker_next :: proc(it: ^iter_t) -> c.bool ---

	ecs_field_w_size :: proc(iter: ^iter_t, size: size_t, index: c.int32_t) -> rawptr ---

	ecs_field_is_readonly :: proc(iter: ^iter_t, index: c.int32_t) -> c.bool ---

	ecs_field_is_writeonly :: proc(iter: ^iter_t, index: c.int32_t) -> c.bool ---

	ecs_field_is_set :: proc(iter: ^iter_t, index: c.int32_t) -> c.bool ---

	ecs_field_id :: proc(iter: ^iter_t, index: c.int32_t) -> id_t ---

	ecs_field_column_index :: proc(iter: ^iter_t, index: c.int32_t) -> c.int32_t ---

	ecs_field_src :: proc(iter: ^iter_t, index: c.int32_t) -> Entity ---


	ecs_field_size :: proc(iter: ^iter_t, index: c.int32_t) -> size_t ---

	ecs_field_is_self :: proc(iter: ^iter_t, index: c.int32_t) -> c.bool ---


	ecs_table_get_type :: proc(table: ^table_t) -> ^type_t ---


	ecs_table_get_type_index :: proc(world: ^world_t, table: ^table_t, id: id_t) -> c.int32_t ---

	ecs_table_get_column_index :: proc(world: ^world_t, table: ^table_t, id: id_t) -> c.int32_t ---

	ecs_table_column_count :: proc(table: ^table_t) -> c.int32_t ---

	Tableype_to_column_index :: proc(table: ^table_t, index: c.int32_t) -> c.int32_t ---

	ecs_table_column_to_type_index :: proc(table: ^table_t, index: c.int32_t) -> c.int32_t ---

	ecs_table_get_column :: proc(table: ^table_t, index: c.int32_t, offset: c.int32_t) -> rawptr ---

	ecs_table_get_id :: proc(world: ^world_t, table: ^table_t, id: id_t, offset: c.int32_t) -> rawptr ---

	ecs_table_get_column_size :: proc(table: ^table_t, index: c.int32_t) -> size_t ---


	ecs_table_count :: proc(table: ^table_t) -> c.int32_t ---

	ecs_table_has_id :: proc(world: ^world_t, table: ^table_t, id: id_t) -> c.bool ---

	ecs_table_get_depth :: proc(world: ^world_t, table: ^table_t, rel: Entity) -> c.int32_t ---


	ecs_table_add_id :: proc(world: ^world_t, table: ^table_t, id: id_t) -> ^table_t ---

	ecs_table_find :: proc(world: ^world_t, ids: ^id_t, id_count: c.int32_t) -> ^table_t ---

	ecs_table_remove_id :: proc(world: ^world_t, table: ^table_t, id: id_t) -> ^table_t ---

	ecs_table_lock :: proc(world: ^world_t, table: ^table_t) ---

	ecs_table_unlock :: proc(world: ^world_t, table: ^table_t) ---

	ecs_table_has_flags :: proc(table: ^table_t, flags: flags32_t) -> c.bool ---

	ecs_table_swap_rows :: proc(world: ^world_t, table: ^table_t, row_1: c.int32_t, row_2: c.int32_t) ---


	ecs_commit :: proc(world: ^world_t, entity: Entity, record: ^record_t, table: ^table_t, added: ^type_t, removed: ^type_t) -> c.bool ---

	ecs_record_find :: proc(world: ^world_t, entity: Entity) -> ^record_t ---

	ecs_record_get_column :: proc(r: ^record_t, column: c.int32_t, c_size: size_t) -> rawptr ---


	ecs_search :: proc(world: ^world_t, table: ^table_t, id: id_t, id_out: ^id_t) -> c.int32_t ---

	ecs_search_offset :: proc(world: ^world_t, table: ^table_t, offset: c.int32_t, id: id_t, id_out: ^id_t) -> c.int32_t ---

	// TODO: DOUBLE POINTER ecs_search_relation :: proc(world: ^world_t, table: ^table_t, offset: c.int32_t, id: id_t, rel: Entity, flags: flags32_t, subject_out: ^Entity, id_out: ^id_t, tr_out: ^^ecs_table_record_t) -> c.int32_t ---

	ecs_value_init :: proc(world: ^world_t, type: Entity, ptr: rawptr) -> c.int ---

	ecs_value_init_w_type_info :: proc(world: ^world_t, ti: ^type_info_t, ptr: rawptr) -> c.int ---

	ecs_value_new :: proc(world: ^world_t, type: Entity) -> rawptr ---

	ecs_value_fini :: proc(world: ^world_t, type: Entity, ptr: rawptr) -> c.int ---

	ecs_value_free :: proc(world: ^world_t, type: Entity, ptr: rawptr) -> c.int ---

	ecs_value_copy_w_type_info :: proc(world: ^world_t, ti: ^type_info_t, dst: rawptr, src: rawptr) -> c.int ---

	ecs_value_copy :: proc(world: ^world_t, type: Entity, dst: rawptr, src: rawptr) -> c.int ---

	ecs_deprecated_ :: proc(file: cstring, line: c.int32_t, msg: cstring) ---

	ecs_log_push_ :: proc(level: c.int32_t) ---

	ecs_log_pop_ :: proc(level: c.int32_t) ---

	ecs_should_log :: proc(level: c.int32_t) -> c.bool ---
	ecs_strerror :: proc(error_code: c.int32_t) -> cstring ---//hmm: ^c.char ---


	ecs_print_::proc(
	    level: c.int32_t,
	    file: cstring,
	    line: c.int32_t,
	    fmt: cstring, #c_vararg args:..any) ---

	ecs_printv_ :: proc(level: c.int, file: cstring, line: c.int32_t, fmt: cstring, #c_vararg args: ..any) ---

	ecs_log_::proc(
	    level: c.int32_t,
	    file: cstring,
	    line: c.int32_t,
	    fmt: cstring,
	    #c_vararg args:..any) ---

	ecs_logv_ :: proc(level: c.int, file: cstring, line: c.int32_t, fmt: cstring, #c_vararg args: ..any) ---

	ecs_abort_::proc(
	    error_code: c.int32_t,
	    file: cstring,
	    line: c.int32_t,
	    fmt: cstring,
	    #c_vararg args:..any) ---

	ecs_assert_log_::proc(

	    error_code: c.int32_t,
	    condition_str: cstring,
	    file: cstring,
	    line: c.int32_t,
	    fmt: cstring,
	    #c_vararg args:..any) ---

	ecs_parser_error_::proc(
	    name: cstring,
	    expr: cstring, 
	    column:i64,
	    fmt: cstring,
	    #c_vararg args:..any) ---

	ecs_parser_errorv_ :: proc(name: cstring, expr: cstring, column: c.int64_t, fmt: cstring, #c_vararg args: ..any) ---

	ecs_log_set_level :: proc(level: c.int) -> c.int ---

	ecs_log_get_level :: proc() -> c.int ---

	ecs_log_enable_colors :: proc(enabled: c.bool) -> c.bool ---

	ecs_log_enable_timestamp :: proc(enabled: c.bool) -> c.bool ---

	ecs_log_enable_timedelta :: proc(enabled: c.bool) -> c.bool ---

	ecs_log_last_error :: proc() -> c.int ---

	ecs_app_run :: proc(world: ^world_t, desc: ^app_desc_t) -> c.int ---

	ecs_app_run_frame :: proc(world: ^world_t, desc: ^app_desc_t) -> c.int ---
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
	// ecs_http_get_header :: proc(req: ^ecs_http_request_t, name: ^char) -> cstring ---//hmm: ^c.char ---

	// ecs_http_get_param :: proc(req: ^ecs_http_request_t, name: ^char) -> cstring ---//hmm: ^c.char ---


	//  extern const Entity ecs_id::proc(EcsRest) ---;

	// ecs_rest_server_init :: proc(world: ^world_t, desc: ^ecs_http_server_desc_t) -> ^ecs_http_server_t ---

	// ecs_rest_server_fini :: proc(srv: ^ecs_http_server_t) ---

	FlecsRestImport :: proc(world: ^world_t) ---

	ecs_set_timeout :: proc(world: ^world_t, tick_source: Entity, timeout: ftime_t) -> Entity ---

	ecs_get_timeout :: proc(world: ^world_t, tick_source: Entity) -> ftime_t ---

	ecs_set_interval :: proc(world: ^world_t, tick_source: Entity, interval: ftime_t) -> Entity ---

	ecs_get_interval :: proc(world: ^world_t, tick_source: Entity) -> ftime_t ---

	ecs_start_timer :: proc(world: ^world_t, tick_source: Entity) ---

	ecs_stop_timer :: proc(world: ^world_t, tick_source: Entity) ---

	ecs_reset_timer :: proc(world: ^world_t, tick_source: Entity) ---

	ecs_randomize_timers :: proc(world: ^world_t) ---

	ecs_set_rate :: proc(world: ^world_t, tick_source: Entity, rate: c.int32_t, source: Entity) -> Entity ---

	ecs_set_tick_source :: proc(world: ^world_t, system: Entity, tick_source: Entity) ---

	FlecsTimerImport :: proc(world: ^world_t) ---

	ecs_pipeline_init :: proc(world: ^world_t, desc: ^pipeline_desc_t) -> Entity ---

	ecs_set_pipeline :: proc(world: ^world_t, pipeline: Entity) ---

	ecs_get_pipeline :: proc(world: ^world_t) -> Entity ---

	ecs_progress :: proc(world: ^world_t, delta_time: ftime_t) -> c.bool ---

	ecs_set_time_scale :: proc(world: ^world_t, scale: ftime_t) ---

	ecs_reset_clock :: proc(world: ^world_t) ---

	ecs_run_pipeline :: proc(world: ^world_t, pipeline: Entity, delta_time: ftime_t) ---

	ecs_set_threads :: proc(world: ^world_t, threads: c.int32_t) ---

	ecs_set_task_threads :: proc(world: ^world_t, task_threads: c.int32_t) ---

	ecs_using_task_threads :: proc(world: ^world_t) -> c.bool ---

	FlecsPipelineImport :: proc(world: ^world_t) ---

	// ecs_system_init :: proc(world: ^world_t, desc: ^SystemDesc) -> Entity --- //hmm

	ecs_run :: proc(world: ^world_t, system: Entity, delta_time: ftime_t, param: rawptr) -> Entity ---

	ecs_run_worker :: proc(world: ^world_t, system: Entity, stage_current: c.int32_t, stage_count: c.int32_t, delta_time: ftime_t, param: rawptr) -> Entity ---

	ecs_run_w_filter :: proc(world: ^world_t, system: Entity, delta_time: ftime_t, offset: c.int32_t, limit: c.int32_t, param: rawptr) -> Entity ---

	ecs_system_get_query :: proc(world: ^world_t, system: Entity) -> ^query_t ---

	ecs_system_get_ctx :: proc(world: ^world_t, system: Entity) -> rawptr ---

	ecs_system_get_binding_ctx :: proc(world: ^world_t, system: Entity) -> rawptr ---

	FlecsSystemImport :: proc(world: ^world_t) ---
		//TODO:STATS hmm

	// ecs_world_stats_get :: proc(world: ^world_t, stats: ^world_tStats) ---

	// ecs_world_stats_reduce :: proc(dst: ^world_tStats, src: ^world_tStats) ---

	// ecs_world_stats_reduce_last :: proc(stats: ^world_tStats, old: ^world_tStats, count: c.int32_t) ---

	// ecs_world_stats_repeat_last :: proc(stats: ^world_tStats) ---

	// ecs_world_stats_copy_last :: proc(dst: ^world_tStats, src: ^world_tStats) ---

	// ecs_world_stats_log :: proc(world: ^world_t, stats: ^world_tStats) ---
	
	// ecs_query_stats_get :: proc(world: ^world_t, query: ^query_t, stats: ^ecs_query_stats_t) ---

	// ecs_query_stats_reduce :: proc(dst: ^ecs_query_stats_t, src: ^ecs_query_stats_t) ---

	// ecs_query_stats_reduce_last :: proc(stats: ^ecs_query_stats_t, old: ^ecs_query_stats_t, count: c.int32_t) ---

	// ecs_query_stats_repeat_last :: proc(stats: ^ecs_query_stats_t) ---

	// ecs_query_stats_copy_last :: proc(dst: ^ecs_query_stats_t, src: ^ecs_query_stats_t) ---

	// ecs_system_stats_get :: proc(world: ^world_t, system: Entity, stats: ^ecs_system_stats_t) -> c.bool ---

	// ecs_system_stats_reduce :: proc(dst: ^ecs_system_stats_t, src: ^ecs_system_stats_t) ---

	// ecs_system_stats_reduce_last :: proc(stats: ^ecs_system_stats_t, old: ^ecs_system_stats_t, count: c.int32_t) ---

	// ecs_system_stats_repeat_last :: proc(stats: ^ecs_system_stats_t) ---

	// ecs_system_stats_copy_last :: proc(dst: ^ecs_system_stats_t, src: ^ecs_system_stats_t) ---

	// ecs_pipeline_stats_get :: proc(world: ^world_t, pipeline: Entity, stats: ^ecs_pipeline_stats_t) -> c.bool ---

	// ecs_pipeline_stats_fini :: proc(stats: ^ecs_pipeline_stats_t) ---

	// ecs_pipeline_stats_reduce :: proc(dst: ^ecs_pipeline_stats_t, src: ^ecs_pipeline_stats_t) ---

	// ecs_pipeline_stats_reduce_last :: proc(stats: ^ecs_pipeline_stats_t, old: ^ecs_pipeline_stats_t, count: c.int32_t) ---

	// ecs_pipeline_stats_repeat_last :: proc(stats: ^ecs_pipeline_stats_t) ---

	// ecs_pipeline_stats_copy_last :: proc(dst: ^ecs_pipeline_stats_t, src: ^ecs_pipeline_stats_t) ---

	// ecs_metric_reduce :: proc(dst: ^Metric, src: ^Metric, t_dst: c.int32_t, t_src: c.int32_t) ---

	// ecs_metric_reduce_last :: proc(m: ^Metric, t: c.int32_t, count: c.int32_t) ---

	// ecs_metric_copy :: proc(m: ^Metric, dst: c.int32_t, src: c.int32_t) ---
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
	// ecs_metric_init :: proc(world: ^world_t, desc: ^ecs_metric_desc_t) -> Entity ---

	FlecsMetricsImport :: proc(world: ^world_t) ---
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
	// ecs_alert_init :: proc(world: ^world_t, desc: ^ecs_alert_desc_t) -> Entity ---

	ecs_get_alert_count :: proc(world: ^world_t, entity: Entity, alert: Entity) -> c.int32_t ---

	ecs_get_alert :: proc(world: ^world_t, entity: Entity, alert: Entity) -> Entity ---

	FlecsAlertsImport :: proc(world: ^world_t) ---
	//  extern ECS_COMPONENT_DECLARE::proc(FlecsMonitor) ---;
	//  extern ECS_COMPONENT_DECLARE::proc(EcsWorldStats) ---;
	//  extern ECS_COMPONENT_DECLARE::proc(EcsWorldSummary) ---;
	//  extern ECS_COMPONENT_DECLARE::proc(EcsPipelineStats) ---;

	FlecsMonitorImport :: proc(world: ^world_t) ---

	FlecsCoreDocImport :: proc(world: ^world_t) ---
	//  extern const Entity ecs_id::proc(EcsDocDescription) ---;

	ecs_doc_set_name :: proc(world: ^world_t, entity: Entity, name: cstring) ---

	ecs_doc_set_brief :: proc(world: ^world_t, entity: Entity, description: cstring) ---

	ecs_doc_set_detail :: proc(world: ^world_t, entity: Entity, description: cstring) ---

	ecs_doc_set_link :: proc(world: ^world_t, entity: Entity, link: cstring) ---

	ecs_doc_set_color :: proc(world: ^world_t, entity: Entity, color: cstring) ---
	ecs_doc_get_name :: proc(world: ^world_t, entity: Entity) -> cstring ---//hmm: ^c.char ---

	ecs_doc_get_brief :: proc(world: ^world_t, entity: Entity) -> cstring ---//hmm: ^c.char ---

	ecs_doc_get_detail :: proc(world: ^world_t, entity: Entity) -> cstring ---//hmm: ^c.char ---

	ecs_doc_get_link :: proc(world: ^world_t, entity: Entity) -> cstring ---//hmm: ^c.char ---

	ecs_doc_get_color :: proc(world: ^world_t, entity: Entity) -> cstring ---//hmm: ^c.char ---


	FlecsDocImport :: proc(world: ^world_t) ---
	//TODO: from json desc
	// ecs_ptr_from_json :: proc(world: ^world_t, type: Entity, ptr: rawptr, json: cstring, desc: ^ecs_from_json_desc_t) -> cstring ---//hmm: ^c.char ---

	// ecs_entity_from_json :: proc(world: ^world_t, entity: Entity, json: cstring, desc: ^ecs_from_json_desc_t) -> cstring ---//hmm: ^c.char ---

	// ecs_world_from_json :: proc(world: ^world_t, json: cstring, desc: ^ecs_from_json_desc_t) -> cstring ---//hmm: ^c.char ---


	ecs_array_to_json :: proc(world: ^world_t, type: Entity, data: rawptr, count: c.int32_t) -> cstring ---//hmm: ^c.char ---


	ecs_array_to_json_buf :: proc(world: ^world_t, type: Entity, data: rawptr, count: c.int32_t, buf_out: ^strbuf_t) -> c.int ---

	ecs_ptr_to_json :: proc(world: ^world_t, type: Entity, data: rawptr) -> cstring ---//hmm: ^c.char ---


	ecs_ptr_to_json_buf :: proc(world: ^world_t, type: Entity, data: rawptr, buf_out: ^strbuf_t) -> c.int ---

	TypeInfoo_json :: proc(world: ^world_t, type: Entity) -> cstring ---//hmm: ^c.char ---


	TypeInfoo_json_buf :: proc(world: ^world_t, type: Entity, buf_out: ^strbuf_t) -> c.int ---
		//TODO: more json sh1t
	// Entityo_json :: proc(world: ^world_t, entity: Entity, desc: ^Entityo_json_desc_t) -> cstring ---//hmm: ^c.char ---


	// Entityo_json_buf :: proc(world: ^world_t, entity: Entity, buf_out: ^strbuf_t, desc: ^Entityo_json_desc_t) -> c.int ---

	// Itero_json :: proc(world: ^world_t, iter: ^iter_t, desc: ^Itero_json_desc_t) -> cstring ---//hmm: ^c.char ---


	// Itero_json_buf :: proc(world: ^world_t, iter: ^iter_t, buf_out: ^strbuf_t, desc: ^Itero_json_desc_t) -> c.int ---

	// Worldo_json :: proc(world: ^world_t, desc: ^world_to_json_desc_t) -> cstring ---//hmm: ^c.char ---


	// Worldo_json_buf :: proc(world: ^world_t, buf_out: ^strbuf_t, desc: ^world_to_json_desc_t) -> c.int ---
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

	FlecsUnitsImport :: proc(world: ^world_t) ---
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
	//  extern const Entity ecs_id::proc(id_t) ---;


	//TODO: ecs_meta_cursor_t
	// ecs_meta_cursor :: proc(world: ^world_t, type: Entity, ptr: rawptr) -> ecs_meta_cursor_t ---

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
	// ecs_meta_get_member :: proc(cursor: ^ecs_meta_cursor_t) -> cstring ---//hmm: ^c.char ---


	// ecs_meta_get_member_id :: proc(cursor: ^ecs_meta_cursor_t) -> Entity ---

	// ecs_meta_set_bool :: proc(cursor: ^ecs_meta_cursor_t, value: c.bool) -> c.int ---

	// ecs_meta_set_char :: proc(cursor: ^ecs_meta_cursor_t, value: c.char) -> c.int ---

	// ecs_meta_set_int :: proc(cursor: ^ecs_meta_cursor_t, value: c.int64_t) -> c.int ---

	// ecs_meta_set_uint :: proc(cursor: ^ecs_meta_cursor_t, value: c.uint64_t) -> c.int ---

	// ecs_meta_set_float :: proc(cursor: ^ecs_meta_cursor_t, value: c.double) -> c.int ---

	// ecs_meta_set_string :: proc(cursor: ^ecs_meta_cursor_t, value: cstring) -> c.int ---

	// ecs_meta_set_string_literal :: proc(cursor: ^ecs_meta_cursor_t, value: cstring) -> c.int ---

	// ecs_meta_set_entity :: proc(cursor: ^ecs_meta_cursor_t, value: Entity) -> c.int ---

	// ecs_meta_set_id :: proc(cursor: ^ecs_meta_cursor_t, value: id_t) -> c.int ---

	// ecs_meta_set_component :: proc(cursor: ^ecs_meta_cursor_t, value: id_t) -> c.int ---

	// ecs_meta_set_null :: proc(cursor: ^ecs_meta_cursor_t) -> c.int ---

	// ecs_meta_set_value :: proc(cursor: ^ecs_meta_cursor_t, value: ^ecs_value_t) -> c.int ---

	// ecs_meta_get_bool :: proc(cursor: ^ecs_meta_cursor_t) -> c.bool ---

	// ecs_meta_get_char :: proc(cursor: ^ecs_meta_cursor_t) -> char ---

	// ecs_meta_get_int :: proc(cursor: ^ecs_meta_cursor_t) -> int64_t ---

	// ecs_meta_get_uint :: proc(cursor: ^ecs_meta_cursor_t) -> Entity ---

	// ecs_meta_get_float :: proc(cursor: ^ecs_meta_cursor_t) -> double ---
	// ecs_meta_get_string :: proc(cursor: ^ecs_meta_cursor_t) -> cstring ---//hmm: ^c.char ---


	// ecs_meta_get_entity :: proc(cursor: ^ecs_meta_cursor_t) -> Entity ---
	

	//TODO: a lot of desc
	// ecs_meta_ptr_to_float :: proc(type_kind: ecs_primitive_kind_t, ptr: rawptr) -> c.double ---

	// ecs_primitive_init :: proc(world: ^world_t, desc: ^ecs_primitive_desc_t) -> Entity ---

	// ecs_enum_init :: proc(world: ^world_t, desc: ^ecs_enum_desc_t) -> Entity ---

	// ecs_bitmask_init :: proc(world: ^world_t, desc: ^ecs_bitmask_desc_t) -> Entity ---

	// ecs_array_init :: proc(world: ^world_t, desc: ^ecs_array_desc_t) -> Entity ---

	// ecs_Vec_init :: proc(world: ^world_t, desc: ^ecs_Vec_desc_t) -> Entity ---

	// ecs_struct_init :: proc(world: ^world_t, desc: ^ecs_struct_desc_t) -> Entity ---

	// ecs_opaque_init :: proc(world: ^world_t, desc: ^ecs_opaque_desc_t) -> Entity ---

	// ecs_unit_init :: proc(world: ^world_t, desc: ^ecs_unit_desc_t) -> Entity ---

	// ecs_unit_prefix_init :: proc(world: ^world_t, desc: ^ecs_unit_prefix_desc_t) -> Entity ---

	ecs_quantity_init :: proc(world: ^world_t, desc: ^entity_desc_t) -> Entity ---

	FlecsMetaImport :: proc(world: ^world_t) ---

	ecs_chresc :: proc(out: cstring, input: c.char, delimiter: c.char) -> cstring ---//hmm: ^c.char ---


	ecs_stresc :: proc(out: cstring, size: size_t, delimiter: c.char, input: cstring) -> size_t ---

	ecs_astresc :: proc(delimiter: c.char, input: cstring) -> cstring ---//hmm: ^c.char ---

//TODO: ecs_vars_t
	// ecs_vars_init :: proc(world: ^world_t, vars: ^ecs_vars_t) ---

	// ecs_vars_fini :: proc(vars: ^ecs_vars_t) ---

	// ecs_vars_push :: proc(vars: ^ecs_vars_t) ---

	// ecs_vars_pop :: proc(vars: ^ecs_vars_t) -> c.int ---

	// ecs_vars_declare :: proc(vars: ^ecs_vars_t, name: cstring, type: Entity) -> ^ecs_expr_var_t ---

	// ecs_vars_declare_w_value :: proc(vars: ^ecs_vars_t, name: cstring, value: ^ecs_value_t) -> ^ecs_expr_var_t ---

	// ecs_vars_lookup :: proc(vars: ^ecs_vars_t, name: cstring) -> ^ecs_expr_var_t ---
	
	//TODO: ecs_parse_expr_desc_t
	// ecs_parse_expr :: proc(world: ^world_t, ptr: cstring, value: ^ecs_value_t, desc: ^ecs_parse_expr_desc_t) -> cstring ---//hmm: ^c.char ---


	ecs_ptr_to_expr :: proc(world: ^world_t, type: Entity, data: rawptr) -> cstring ---//hmm: ^c.char ---


	ecs_ptr_to_expr_buf :: proc(world: ^world_t, type: Entity, data: rawptr, buf: ^strbuf_t) -> c.int ---

	ecs_ptr_to_str :: proc(world: ^world_t, type: Entity, data: rawptr) -> cstring ---//hmm: ^c.char ---


	ecs_ptr_to_str_buf :: proc(world: ^world_t, type: Entity, data: rawptr, buf: ^strbuf_t) -> c.int ---
		//TODO: ecs_primitive_kind_t ecs_type_kind_t
	// ecs_primitive_to_expr_buf :: proc(world: ^world_t, kind: ecs_primitive_kind_t, data: rawptr, buf: ^StrBuf) -> c.int ---
	ecs_parse_expr_token :: proc(name: cstring, expr: cstring, ptr: cstring, token: cstring) -> cstring ---//hmm: ^c.char ---


	// ecs_interpolate_string :: proc(world: ^world_t, str: cstring, vars: ^ecs_vars_t) -> cstring ---//hmm: ^c.char ---


	// Itero_vars :: proc(iter: ^iter_t, vars: ^ecs_vars_t, offset: c.int) ---

	// ecs_meta_from_desc :: proc(world: ^world_t, component: Entity, kind: ecs_type_kind_t, desc: cstring) -> c.int ---
		//TODO: EcsScript
	// ECS_COMPONENT_DECLARE :: proc(_: EcsScript) -> extern ---

	ecs_plecs_from_str :: proc(world: ^world_t, name: cstring, str: cstring) -> c.int ---

	ecs_plecs_from_file :: proc(world: ^world_t, filename: cstring) -> c.int ---
		//TODO: ecs_script_desc_t
	// ecs_script_init :: proc(world: ^world_t, desc: ^ecs_script_desc_t) -> Entity ---

	// ecs_script_update :: proc(world: ^world_t, script: Entity, instance: Entity, str: cstring, vars: ^ecs_vars_t) -> c.int ---

	ecs_script_clear :: proc(world: ^world_t, script: Entity, instance: Entity) ---

	FlecsScriptImport :: proc(world: ^world_t) ---

	ecs_rule_init :: proc(world: ^world_t, desc: ^filter_desc_t) -> ^rule_t ---

	ecs_rule_fini :: proc(rule: ^rule_t) ---
	ecs_rule_get_filter :: proc(rule: ^rule_t) -> ^filter_t ---

	ecs_rule_var_count :: proc(rule: ^rule_t) -> c.int32_t ---

	ecs_rule_find_var :: proc(rule: ^rule_t, name: cstring) -> c.int32_t ---
	ecs_rule_var_name :: proc(rule: ^rule_t, var_id: c.int32_t) -> cstring ---//hmm: ^c.char ---


	ecs_rule_var_is_entity :: proc(rule: ^rule_t, var_id: c.int32_t) -> c.bool ---

	ecs_rule_iter :: proc(world: ^world_t, rule: ^rule_t) -> iter_t ---

	ecs_rule_next :: proc(it: ^iter_t) -> c.bool ---

	ecs_rule_next_instanced :: proc(it: ^iter_t) -> c.bool ---

	ecs_rule_str :: proc(rule: ^rule_t) -> cstring ---//hmm: ^c.char ---


	ecs_rule_str_w_profile :: proc(rule: ^rule_t, iter: ^iter_t) -> cstring ---//hmm: ^c.char ---

	ecs_rule_parse_vars :: proc(rule: ^rule_t, it: ^iter_t, expr: cstring) -> cstring ---//hmm: ^c.char ---

	// TODO: ecs_snapshot_t
	// ecs_snapshot_take :: proc(world: ^world_t) -> ^ecs_snapshot_t ---

	// ecs_snapshot_take_w_iter :: proc(iter: ^iter_t) -> ^ecs_snapshot_t ---

	// ecs_snapshot_restore :: proc(world: ^world_t, snapshot: ^ecs_snapshot_t) ---

	// ecs_snapshot_iter :: proc(snapshot: ^ecs_snapshot_t) -> iter_t ---

	ecs_snapshot_next :: proc(iter: ^iter_t) -> c.bool ---

	// ecs_snapshot_free :: proc(snapshot: ^ecs_snapshot_t) ---
	ecs_parse_ws :: proc(ptr: cstring) -> cstring ---//hmm: ^c.char ---

	ecs_parse_ws_eol :: proc(ptr: cstring) -> cstring ---//hmm: ^c.char ---

	ecs_parse_digit :: proc(ptr: cstring, token: cstring) -> cstring ---//hmm: ^c.char ---



	ecs_parse_token :: proc(name: cstring, expr: cstring, ptr: cstring, token_out: cstring, delim: c.char) -> cstring ---//hmm: ^c.char ---


	ecs_parse_term :: proc(world: ^world_t, name: cstring, expr: cstring, ptr: cstring, term_out: ^term_t, extra_args: ^term_id_t) -> cstring ---//hmm: ^c.char ---



	ecs_set_os_api_impl :: proc() ---
		//TODO: ecs_module_action_t
	// ecs_import :: proc(world: ^world_t, module: ecs_module_action_t, module_name: cstring) -> Entity ---

	// ecs_import_c :: proc(world: ^world_t, module: ecs_module_action_t, module_name_c: cstring) -> Entity ---

	ecs_import_from_library :: proc(world: ^world_t, library_name: cstring, module_name: cstring) -> Entity ---

	ecs_module_init :: proc(world: ^world_t, c_name: cstring, desc: ^component_desc_t) -> Entity ---

	ecs_cpp_get_type_name :: proc(type_name: cstring, func_name: cstring, len: size_t, front_len: size_t) -> cstring ---//hmm: ^c.char ---


	ecs_cpp_get_symbol_name :: proc(symbol_name: cstring, type_name: cstring, len: size_t) -> cstring ---//hmm: ^c.char ---


	ecs_cpp_get_constant_name :: proc(constant_name: cstring, func_name: cstring, len: size_t, back_len: size_t) -> cstring ---//hmm: ^c.char ---

	ecs_cpp_trim_module :: proc(world: ^world_t, type_name: cstring) -> cstring ---//hmm: ^c.char ---


	ecs_cpp_component_validate :: proc(world: ^world_t, id: Entity, name: cstring, symbol: cstring, size: size_t, alignment: size_t, implicit_name: c.bool) ---

	ecs_cpp_component_register :: proc(world: ^world_t, id: Entity, name: cstring, symbol: cstring, size: size_t, alignment: size_t, implicit_name: c.bool, existing_out: ^c.bool) -> Entity ---

	ecs_cpp_component_register_explicit :: proc(world: ^world_t, s_id: Entity, id: Entity, name: cstring, type_name: cstring, symbol: cstring, size: size_t, alignment: size_t, is_component: c.bool, existing_out: ^c.bool) -> Entity ---

	ecs_cpp_enum_init :: proc(world: ^world_t, id: Entity) ---

	ecs_cpp_enum_constant_register :: proc(world: ^world_t, parent: Entity, id: Entity, name: cstring, value: c.int) -> Entity ---

	ecs_cpp_reset_count_get :: proc() -> c.int32_t ---

	ecs_cpp_reset_count_inc :: proc() -> c.int32_t ---
	//TODO:member
	// ecs_cpp_last_member :: proc(world: ^world_t, type: Entity) -> ^ecs_member_t ---
}
