package flecs

import "core:c"

// Function Prototypes
run_action_t :: #type proc "c" (it: ^iter_t)
iter_action_t :: #type proc (it: ^iter_t)
iter_init_action_t :: #type proc "c" (world: ^world_t, iterable: poly_t_ptr, it: ^iter_t, filter: ^term_t)
iter_next_action_t :: #type proc "c" (it: ^iter_t) -> c.bool
iter_fini_action_t :: #type proc "c" (it: ^iter_t)
order_by_action_t :: #type proc "c" (e1: Entity, ptr1: rawptr, e2: Entity, ptr2: rawptr) -> c.int
sort_table_action_t :: #type proc "c" (world: ^world_t, table: ^table_t, entities: [^]Entity, ptr: rawptr, size: i32, lo: i32, hi: i32, order_by: order_by_action_t)
group_by_action_t :: #type proc "c" (world: ^world_t, table: ^table_t, group_id: id_t, ctx: rawptr) -> u64
group_create_action_t :: #type proc "c" (world: ^world_t, group_id: u64, group_by_ctx: rawptr) -> rawptr
group_delete_action_t :: #type proc "c" (world: ^world_t, group_id: u64, group_ctx: rawptr, group_by_ctx: rawptr)
module_action_t :: #type proc "c" (world: ^world_t)
fini_action_t :: #type proc "c" (world: ^world_t, ctx: rawptr)
ctx_free_t :: #type proc "c" (ctx: rawptr)
compare_action_t :: #type proc "c" (ptr1: rawptr, ptr2: rawptr) -> c.int
hash_value_action_t :: #type proc "c" (ptr: rawptr) -> u64
xtor_t :: #type proc "c" (ptr: rawptr, count: i32, type_info: ^type_info_t)
copy_t :: #type proc "c" (dst_ptr: rawptr, src_ptr: rawptr, count: i32, type_info: ^type_info_t)
move_t :: #type proc "c" (dst_ptr: rawptr, src_ptr: rawptr, count: i32, type_info: ^type_info_t)
poly_dtor_t :: #type proc "c" (poly: poly_t_ptr)

app_init_action_t :: #type proc "c" (world: ^world_t) -> c.int
app_run_action_t :: #type proc "c" (world: ^world_t, desc: ^app_desc_t) -> c.int
app_frame_action_t :: #type proc "c" (world: ^world_t, desc: ^app_desc_t) -> c.int


// Generic function pointer type
os_proc_t :: #type proc "c" ()

// OS API init & deinit
os_api_init_t :: #type proc "c" ()
os_api_fini_t :: #type proc "c" ()

// Memory management
os_api_malloc_t :: #type proc "c" (size: size_t) -> rawptr
os_api_free_t :: #type proc "c" (ptr: rawptr)
os_api_realloc_t :: #type proc "c" (ptr: rawptr, size: size_t) -> rawptr
os_api_calloc_t :: #type proc "c" (size: size_t) -> rawptr
os_api_strdup_t :: #type proc "c" (str: cstring) -> cstring

// Threads
os_thread_callback_t :: #type proc "c" (_: rawptr) -> rawptr
os_api_thread_new_t :: #type proc "c" (callback: os_thread_callback_t, param: rawptr) -> os_thread_t
os_api_thread_join_t :: #type proc "c" (thread: os_thread_t) -> rawptr
os_api_thread_self_t :: #type proc "c" () -> os_thread_id_t

// Tasks
os_api_task_new_t ::  #type proc "c" (callback: os_thread_callback_t,param: rawptr) -> os_thread_t
os_api_task_join_t :: #type proc "c" (thread:os_thread_t)->rawptr


// Atomic increment/decrement
os_api_ainc_t :: #type proc "c" (value: ^i32) -> i32
os_api_lainc_t :: #type proc "c" (value: ^i64) -> i64

// Mutex
os_api_mutex_new_t :: #type proc "c" () -> os_mutex_t
os_api_mutex_lock_t :: #type proc "c" (mutex: os_mutex_t)
os_api_mutex_unlock_t :: #type proc "c" (mutex: os_mutex_t)
os_api_mutex_free_t :: #type proc "c" (mutex: os_mutex_t)

// Condition variable
os_api_cond_new_t :: #type proc "c" () -> os_cond_t
os_api_cond_free_t :: #type proc "c" (cond: os_cond_t)
os_api_cond_signal_t :: #type proc "c" (cond: os_cond_t)
os_api_cond_broadcast_t :: #type proc "c" (cond: os_cond_t)
os_api_cond_wait_t :: #type proc "c" (cond: os_cond_t, mutex: os_mutex_t)
os_api_sleep_t :: #type proc "c" (sec: i32, nanosec: i32)
os_api_enable_high_timer_resolution_t :: #type proc "c" (enable: c.bool)
os_api_get_time_t :: #type proc "c" (time_out: ^time_t)
os_api_now_t :: #type proc "c" () -> u64

// Logging
os_api_log_t :: #type proc "c" (level: i32, file: cstring, line: i32, msg: cstring)

// Application termination
os_api_abort_t :: #type proc "c" ()

// Dynamic libraries
os_api_dlopen_t :: #type proc "c" (libname: cstring) -> os_dl_t
os_api_dlproc_t :: #type proc "c" (lib: os_dl_t, procname: cstring) -> os_proc_t
os_api_dlclose_t :: #type proc "c" (lib: os_dl_t)
os_api_module_to_path_t :: #type proc "c" (module_id: cstring) -> cstring


meta_serialize_t :: #type proc "c" (#by_ptr ser: serializer_t, src: rawptr) -> c.int
HTTP_Reply_Action :: #type proc "c" (request: ^http_request_t, reply: ^http_reply_t, ctx: rawptr) -> c.bool
