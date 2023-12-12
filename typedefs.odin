package flecs
// import "core:c"
// import "core:reflect"
// import "core:strings"




// typedef struct ecs_allocator_t ecs_allocator_t;
// typedef struct ecs_world_t ecs_world_t;
// typedef struct ecs_table_t ecs_table_t;
// typedef struct ecs_term_t ecs_term_t;
// typedef struct ecs_filter_t ecs_filter_t;
// typedef struct ecs_query_t ecs_query_t;
// typedef struct ecs_rule_t ecs_rule_t;
// typedef struct ecs_observer_t ecs_observer_t;
// typedef struct ecs_observable_t ecs_observable_t;
// typedef struct ecs_iter_t ecs_iter_t;
// typedef struct ecs_ref_t ecs_ref_t;
// typedef struct ecs_type_hooks_t ecs_type_hooks_t;
// typedef struct ecs_type_info_t ecs_type_info_t;
// typedef struct ecs_record_t ecs_record_t;
// typedef struct ecs_id_record_t ecs_id_record_t;
// typedef struct ecs_table_record_t ecs_table_record_t;
// typedef struct ecs_mixins_t ecs_mixins_t;
// typedef struct ecs_stage_t ecs_stage_t;
// typedef struct ecs_data_t ecs_data_t;
// typedef struct ecs_switch_t ecs_switch_t;
// typedef struct ecs_query_table_match_t ecs_query_table_match_t;
// typedef struct ecs_http_server_t ecs_http_server_t;
// typedef struct ecs_snapshot_t ecs_snapshot_t;









































// typedef struct ecs_vec_t {
//     void *array;
//     int32_t count;
//     int32_t size;
// #ifdef FLECS_SANITIZE
//     ecs_size_t elem_size;
// #endif
// } ecs_vec_t;
// ----
// typedef struct ecs_sparse_t {
//     ecs_vec_t dense;         /* Dense array with indices to sparse array. The
//                               * dense array stores both alive and not alive
//                               * sparse indices. The 'count' member keeps
//                               * track of which indices are alive. */

//     ecs_vec_t pages;         /* Chunks with sparse arrays & data */
//     ecs_size_t size;         /* Element size */
//     int32_t count;           /* Number of alive entries */
//     uint64_t max_id;         /* Local max index (if no global is set) */
//     struct ecs_allocator_t *allocator;
//     struct ecs_block_allocator_t *page_allocator;
// } ecs_sparse_t;
// ----
// typedef struct ecs_block_allocator_block_t {
//     void *memory;
//     struct ecs_block_allocator_block_t *next;
// } ecs_block_allocator_block_t;
// ----
// typedef struct ecs_block_allocator_chunk_header_t {
//     struct ecs_block_allocator_chunk_header_t *next;
// } ecs_block_allocator_chunk_header_t;
// ----
// typedef struct ecs_block_allocator_t {
//     ecs_block_allocator_chunk_header_t *head;
//     ecs_block_allocator_block_t *block_head;
//     ecs_block_allocator_block_t *block_tail;
//     int32_t chunk_size;
//     int32_t data_size;
//     int32_t chunks_per_block;
//     int32_t block_size;
//     int32_t alloc_count;
// } ecs_block_allocator_t;
// ----

// ----

// ----

// ----
// typedef struct ecs_bucket_entry_t {
//     ecs_map_key_t key;
//     ecs_map_val_t value;
//     struct ecs_bucket_entry_t *next;
// } ecs_bucket_entry_t;
// ----
// typedef struct ecs_bucket_t {
//     ecs_bucket_entry_t *first;
// } ecs_bucket_t;
// ----
// typedef struct ecs_map_t {
//     uint8_t bucket_shift;
//     bool shared_allocator;
//     ecs_bucket_t *buckets;
//     int32_t bucket_count;
//     int32_t count;
//     struct ecs_block_allocator_t *entry_allocator;
//     struct ecs_allocator_t *allocator;
// } ecs_map_t;
// ----
// typedef struct ecs_map_iter_t {
//     const ecs_map_t *map;
//     ecs_bucket_t *bucket;
//     ecs_bucket_entry_t *entry;
//     ecs_map_data_t *res;
// } ecs_map_iter_t;
// ----
// typedef struct ecs_map_params_t {
//     struct ecs_allocator_t *allocator;
//     struct ecs_block_allocator_t entry_allocator;
// } ecs_map_params_t;
// ----
// typedef struct ecs_strbuf_element {
//     bool buffer_embedded;
//     int32_t pos;
//     char *buf;
//     struct ecs_strbuf_element *next;
// } ecs_strbuf_element;
// ----
// typedef struct ecs_strbuf_element_embedded {
//     ecs_strbuf_element super;
//     char buf[ECS_STRBUF_ELEMENT_SIZE + 1];
// } ecs_strbuf_element_embedded;
// ----
// typedef struct ecs_strbuf_element_str {
//     ecs_strbuf_element super;
//     char *alloc_str;
// } ecs_strbuf_element_str;
// ----
// typedef struct ecs_strbuf_list_elem {
//     int32_t count;
//     const char *separator;
// } ecs_strbuf_list_elem;
// ----
// typedef struct ecs_strbuf_t {
//     /* When set by an application, append will write to this buffer */
//     char *buf;

//     /* The maximum number of characters that may be printed */
//     int32_t max;

//     /* Size of elements minus current element */
//     int32_t size;

//     /* The number of elements in use */
//     int32_t elementCount;

//     /* Always allocate at least one element */
//     ecs_strbuf_element_embedded firstElement;

//     /* The current element being appended to */
//     ecs_strbuf_element *current;

//     /* Stack that keeps track of number of list elements, used for conditionally
//      * inserting a separator */
//     ecs_strbuf_list_elem list_stack[ECS_STRBUF_MAX_LIST_DEPTH];
//     int32_t list_sp;

//     /* This is set to the output string after calling ecs_strbuf_get */
//     char *content;

//     /* This is set to the output string length after calling ecs_strbuf_get */
//     int32_t length;
// } ecs_strbuf_t;
// ----
// typedef struct ecs_time_t {
//     uint32_t sec;
//     uint32_t nanosec;
// } ecs_time_t;
// ----

// ----

// ----

// ----

// ----

// ----

// ----
// typedef void (*ecs_os_proc_t)(void
// ----
// typedef 
// void (*ecs_os_api_init_t)(void
// ----
// typedef 
// void (*ecs_os_api_fini_t)(void
// ----
// typedef 
// void* (*ecs_os_api_malloc_t)(
//     ecs_size_t size
// ----
// typedef 
// void (*ecs_os_api_free_t)(
//     void *ptr
// ----
// typedef
// void* (*ecs_os_api_realloc_t)(
//     void *ptr, 
//     ecs_size_t size
// ----
// typedef
// void* (*ecs_os_api_calloc_t)(
//     ecs_size_t size
// ----
// typedef
// char* (*ecs_os_api_strdup_t)(
//     const char *str
// ----
// typedef
// void* (*ecs_os_thread_callback_t)(
//     void
// ----
// typedef
// ecs_os_thread_t (*ecs_os_api_thread_new_t)(
//     ecs_os_thread_callback_t callback,
//     void *param
// ----
// typedef
// void* (*ecs_os_api_thread_join_t)(
//     ecs_os_thread_t thread
// ----
// typedef
// ecs_os_thread_id_t (*ecs_os_api_thread_self_t)(void
// ----
// typedef
// ecs_os_thread_t (*ecs_os_api_task_new_t)(
//     ecs_os_thread_callback_t callback,
//     void *param
// ----
// typedef
// void* (*ecs_os_api_task_join_t)(
//     ecs_os_thread_t thread
// ----
// typedef
// int32_t (*ecs_os_api_ainc_t)(
//     int32_t *value
// ----
// typedef
// int64_t (*ecs_os_api_lainc_t)(
//     int64_t *value
// ----
// typedef
// ecs_os_mutex_t (*ecs_os_api_mutex_new_t)(
//     void
// ----
// typedef
// void (*ecs_os_api_mutex_lock_t)(
//     ecs_os_mutex_t mutex
// ----
// typedef
// void (*ecs_os_api_mutex_unlock_t)(
//     ecs_os_mutex_t mutex
// ----
// typedef
// void (*ecs_os_api_mutex_free_t)(
//     ecs_os_mutex_t mutex
// ----
// typedef
// ecs_os_cond_t (*ecs_os_api_cond_new_t)(
//     void
// ----
// typedef
// void (*ecs_os_api_cond_free_t)(
//     ecs_os_cond_t cond
// ----
// typedef
// void (*ecs_os_api_cond_signal_t)(
//     ecs_os_cond_t cond
// ----
// typedef
// void (*ecs_os_api_cond_broadcast_t)(
//     ecs_os_cond_t cond
// ----
// typedef
// void (*ecs_os_api_cond_wait_t)(
//     ecs_os_cond_t cond,
//     ecs_os_mutex_t mutex
// ----
// typedef 
// void (*ecs_os_api_sleep_t)(
//     int32_t sec,
//     int32_t nanosec
// ----
// typedef 
// void (*ecs_os_api_enable_high_timer_resolution_t)(
//     bool enable
// ----
// typedef
// void (*ecs_os_api_get_time_t)(
//     ecs_time_t *time_out
// ----
// typedef
// uint64_t (*ecs_os_api_now_t)(void
// ----
// typedef
// void (*ecs_os_api_log_t)(
//     int32_t level,     /* Logging level */
//     const char *file,  /* File where message was logged */
//     int32_t line,      /* Line it was logged */
//     const char *msg
// ----
// typedef
// void (*ecs_os_api_abort_t)(
//     void
// ----
// typedef
// ecs_os_dl_t (*ecs_os_api_dlopen_t)(
//     const char *libname
// ----
// typedef
// ecs_os_proc_t (*ecs_os_api_dlproc_t)(
//     ecs_os_dl_t lib,
//     const char *procname
// ----
// typedef
// void (*ecs_os_api_dlclose_t)(
//     ecs_os_dl_t lib
// ----
// typedef
// char* (*ecs_os_api_module_to_path_t)(
//     const char *module_id
// ----
// typedef struct ecs_os_api_t {
//     /* API init / deinit */
//     ecs_os_api_init_t init_;
//     ecs_os_api_fini_t fini_;

//     /* Memory management */
//     ecs_os_api_malloc_t malloc_;
//     ecs_os_api_realloc_t realloc_;
//     ecs_os_api_calloc_t calloc_;
//     ecs_os_api_free_t free_;

//     /* Strings */
//     ecs_os_api_strdup_t strdup_;

//     /* Threads */
//     ecs_os_api_thread_new_t thread_new_;
//     ecs_os_api_thread_join_t thread_join_;
//     ecs_os_api_thread_self_t thread_self_;

//     /* Tasks */
//     ecs_os_api_thread_new_t task_new_;
//     ecs_os_api_thread_join_t task_join_;

//     /* Atomic increment / decrement */
//     ecs_os_api_ainc_t ainc_;
//     ecs_os_api_ainc_t adec_;
//     ecs_os_api_lainc_t lainc_;
//     ecs_os_api_lainc_t ladec_;

//     /* Mutex */
//     ecs_os_api_mutex_new_t mutex_new_;
//     ecs_os_api_mutex_free_t mutex_free_;
//     ecs_os_api_mutex_lock_t mutex_lock_;
//     ecs_os_api_mutex_lock_t mutex_unlock_;

//     /* Condition variable */
//     ecs_os_api_cond_new_t cond_new_;
//     ecs_os_api_cond_free_t cond_free_;
//     ecs_os_api_cond_signal_t cond_signal_;
//     ecs_os_api_cond_broadcast_t cond_broadcast_;
//     ecs_os_api_cond_wait_t cond_wait_;

//     /* Time */
//     ecs_os_api_sleep_t sleep_;
//     ecs_os_api_now_t now_;
//     ecs_os_api_get_time_t get_time_;

//     /* Logging */
//     ecs_os_api_log_t log_; /* Logging function. The level should be interpreted as: */
//                            /* >0: Debug tracing. Only enabled in debug builds. */
//                            /*  0: Tracing. Enabled in debug/release builds. */
//                            /* -2: Warning. An issue occurred, but operation was successful. */
//                            /* -3: Error. An issue occurred, and operation was unsuccessful. */
//                            /* -4: Fatal. An issue occurred, and application must quit. */

//     /* Application termination */
//     ecs_os_api_abort_t abort_;

//     /* Dynamic library loading */
//     ecs_os_api_dlopen_t dlopen_;
//     ecs_os_api_dlproc_t dlproc_;
//     ecs_os_api_dlclose_t dlclose_;

//     /* Overridable function that translates from a logical module id to a
//      * shared library filename */
//     ecs_os_api_module_to_path_t module_to_dl_;

//     /* Overridable function that translates from a logical module id to a
//      * path that contains module-specif resources or assets */
//     ecs_os_api_module_to_path_t module_to_etc_;

//     /* Trace level */
//     int32_t log_level_;

//     /* Trace indentation */
//     int32_t log_indent_;

//     /* Last error code */
//     int32_t log_last_error_;

//     /* Last recorded timestamp */
//     int64_t log_last_timestamp_;

//     /* OS API flags */
//     ecs_flags32_t flags_;
// } ecs_os_api_t;

// typedef struct {
//     ecs_id_t *array;
//     int32_t count;
// } ecs_type_t;
// ----
 
// ----
 
// ----
 
// ----
 
// ----
 
// ----
 
// ----
 
// ----
 
// ----
 
// ----
 
// ----
 
// ----
 
// ----
 
// ----
 
// ----
 
// ----

// ----
 
// ----
// typedef struct ecs_header_t {
//     int32_t magic; /* Magic number verifying it's a flecs object */
//     int32_t type;  /* Magic number indicating which type of flecs object */
//     ecs_mixins_t *mixins; /* Table with offsets to (optional) mixins */
// } ecs_header_t;
// ----
// typedef void (*ecs_run_action_t)(
//     ecs_iter_t *it
// ----
// typedef void (*ecs_iter_action_t)(
//     ecs_iter_t *it
// ----
// typedef void (*ecs_iter_init_action_t)(
//     const ecs_world_t *world,
//     const ecs_poly_t *iterable,
//     ecs_iter_t *it,
//     ecs_term_t *filter
// ----
// typedef bool (*ecs_iter_next_action_t)(
//     ecs_iter_t *it
// ----
// typedef void (*ecs_iter_fini_action_t)(
//     ecs_iter_t *it
// ----
// typedef int (*ecs_order_by_action_t)(
//     ecs_entity_t e1,
//     const void *ptr1,
//     ecs_entity_t e2,
//     const void *ptr2
// ----
// typedef void (*ecs_sort_table_action_t)(
//     ecs_world_t* world,
//     ecs_table_t* table,
//     ecs_entity_t* entities,
//     void* ptr,
//     int32_t size,
//     int32_t lo,
//     int32_t hi,
//     ecs_order_by_action_t order_by
// ----
// typedef uint64_t (*ecs_group_by_action_t)(
//     ecs_world_t *world,
//     ecs_table_t *table,
//     ecs_id_t group_id,
//     void *ctx
// ----
// typedef void* (*ecs_group_create_action_t)(
//     ecs_world_t *world,
//     uint64_t group_id,
//     void *group_by_ctx
// ----
// typedef void (*ecs_group_delete_action_t)(
//     ecs_world_t *world,
//     uint64_t group_id,
//     void *group_ctx,     /* return value from ecs_group_create_action_t */
//     void *group_by_ctx
// ----
// typedef void (*ecs_module_action_t)(
//     ecs_world_t *world
// ----
// typedef void (*ecs_fini_action_t)(
//     ecs_world_t *world,
//     void *ctx
// ----
// typedef void (*ecs_ctx_free_t)(
//     void *ctx
// ----
// typedef int (*ecs_compare_action_t)(
//     const void *ptr1,
//     const void *ptr2
// ----
// typedef uint64_t (*ecs_hash_value_action_t)(
//     const void *ptr
// ----
// typedef void (*ecs_xtor_t)(
//     void *ptr,
//     int32_t count,
//     const ecs_type_info_t *type_info
// ----
// typedef void (*ecs_copy_t)(
//     void *dst_ptr,
//     const void *src_ptr,
//     int32_t count,
//     const ecs_type_info_t *type_info
// ----
// typedef void (*ecs_move_t)(
//     void *dst_ptr,
//     void *src_ptr,
//     int32_t count,
//     const ecs_type_info_t *type_info
// ----
// typedef void (*ecs_poly_dtor_t)(
//     ecs_poly_t *poly
// ----
// typedef struct ecs_iterable_t {
//     ecs_iter_init_action_t init; /**< Callback that creates iterator. */
// } ecs_iterable_t;
// ----
// typedef enum ecs_inout_kind_t {
//     EcsInOutDefault,  /**< InOut for regular terms, In for shared terms */
//     EcsInOutNone,     /**< Term is neither read nor written */
//     EcsInOut,         /**< Term is both read and written */
//     EcsIn,            /**< Term is only read */
//     EcsOut,           /**< Term is only written */
// } ecs_inout_kind_t;
// ----
// typedef enum ecs_oper_kind_t {
//     EcsAnd,           /**< The term must match */
//     EcsOr,            /**< One of the terms in an or chain must match */
//     EcsNot,           /**< The term must not match */
//     EcsOptional,      /**< The term may match */
//     EcsAndFrom,       /**< Term must match all components from term id */
//     EcsOrFrom,        /**< Term must match at least one component from term id */
//     EcsNotFrom,       /**< Term must match none of the components from term id */
// } ecs_oper_kind_t;
// ----
// typedef struct ecs_term_id_t {
//     ecs_entity_t id;            /**< Entity id. If left to 0 and flags does not 
//                                  * specify whether id is an entity or a variable
//                                  * the id will be initialized to EcsThis. 
//                                  * To explicitly set the id to 0, leave the id
//                                  * member to 0 and set EcsIsEntity in flags. */

//     const char *name;           /**< Name. This can be either the variable name
//                                  * (when the EcsIsVariable flag is set) or an
//                                  * entity name. When ecs_term_t::move is true,
//                                  * the API assumes ownership over the string and
//                                  * will free it when the term is destroyed. */

//     ecs_entity_t trav;          /**< Relationship to traverse when looking for the
//                                  * component. The relationship must have
//                                  * the Traversable property. Default is IsA. */

//     ecs_flags32_t flags;        /**< Term flags */
// } ecs_term_id_t;
// ----
 
// ----
 
// ----
 
// ----
 
// ----
// typedef struct ecs_event_record_t {
//     struct ecs_event_id_record_t *any;
//     struct ecs_event_id_record_t *wildcard;
//     struct ecs_event_id_record_t *wildcard_pair;
//     ecs_map_t event_ids; /* map<id, ecs_event_id_record_t> */
//     ecs_entity_t event;
// } ecs_event_record_t;
// ----
// typedef struct ecs_table_range_t {
//     ecs_table_t *table;
//     int32_t offset;       /* Leave both members to 0 to cover entire table */
//     int32_t count;       
// } ecs_table_range_t;
// ----
// typedef struct ecs_var_t {
//     ecs_table_range_t range; /* Set when variable stores a range of entities */
//     ecs_entity_t entity;     /* Set when variable stores single entity */

//     /* Most entities can be stored as a range by setting range.count to 1, 
//      * however in order to also be able to store empty entities in variables, 
//      * a separate entity member is needed. Both range and entity may be set at
//      * the same time, as long as they are consistent. */
// } ecs_var_t;
// ----
// typedef struct ecs_stack_cursor_t {
//     struct ecs_stack_cursor_t *prev;
//     struct ecs_stack_page_t *page;
//     int16_t sp;
//     bool is_free;
// #ifdef FLECS_DEBUG
//     struct ecs_stack_t *owner;
// #endif
// } ecs_stack_cursor_t;
// ----
// typedef struct ecs_page_iter_t {
//     int32_t offset;
//     int32_t limit;
//     int32_t remaining;
// } ecs_page_iter_t;
// ----
// typedef struct ecs_worker_iter_t {
//     int32_t index;
//     int32_t count;
// } ecs_worker_iter_t;
// ----
// typedef struct ecs_table_cache_iter_t {
//     struct ecs_table_cache_hdr_t *cur, *next;
//     struct ecs_table_cache_hdr_t *next_list;
// } ecs_table_cache_iter_t;
// ----
// typedef struct ecs_term_iter_t {
//     ecs_term_t term;
//     ecs_id_record_t *self_index;
//     ecs_id_record_t *set_index;

//     ecs_id_record_t *cur;
//     ecs_table_cache_iter_t it;
//     int32_t index;
//     int32_t observed_table_count;
    
//     ecs_table_t *table;
//     int32_t cur_match;
//     int32_t match_count;
//     int32_t last_column;

//     bool empty_tables;

//     /* Storage */
//     ecs_id_t id;
//     int32_t column;
//     ecs_entity_t subject;
//     ecs_size_t size;
//     void *ptr;
// } ecs_term_iter_t;
// ----
// typedef enum ecs_iter_kind_t {
//     EcsIterEvalCondition,
//     EcsIterEvalTables,
//     EcsIterEvalChain,
//     EcsIterEvalNone
// } ecs_iter_kind_t;
// ----
// typedef struct ecs_filter_iter_t {
//     const ecs_filter_t *filter;
//     ecs_iter_kind_t kind; 
//     ecs_term_iter_t term_iter;
//     int32_t matches_left;
//     int32_t pivot_term;
// } ecs_filter_iter_t;
// ----
// typedef struct ecs_query_iter_t {
//     ecs_query_t *query;
//     ecs_query_table_match_t *node, *prev, *last;
//     int32_t sparse_smallest;
//     int32_t sparse_first;
//     int32_t bitset_first;
//     int32_t skip_count;
// } ecs_query_iter_t;
// ----
// typedef struct ecs_snapshot_iter_t {
//     ecs_filter_t filter;
//     ecs_vec_t tables; /* ecs_table_leaf_t */
//     int32_t index;
// } ecs_snapshot_iter_t;
// ----
// typedef struct ecs_rule_op_profile_t {
//     int32_t count[2]; /* 0 = enter, 1 = redo */
// } ecs_rule_op_profile_t;
// ----
// typedef struct ecs_rule_iter_t {
//     const ecs_rule_t *rule;
//     struct ecs_var_t *vars;              /* Variable storage */
//     const struct ecs_rule_var_t *rule_vars;
//     const struct ecs_rule_op_t *ops;
//     struct ecs_rule_op_ctx_t *op_ctx;    /* Operation-specific state */
//     uint64_t *written;
//     ecs_flags32_t source_set;

// #ifdef FLECS_DEBUG
//     ecs_rule_op_profile_t *profile;
// #endif

//     int16_t op;
//     int16_t sp;
// } ecs_rule_iter_t;
// ----
// typedef struct ecs_iter_cache_t {
//     ecs_stack_cursor_t *stack_cursor; /* Stack cursor to restore to */
//     ecs_flags8_t used;       /* For which fields is the cache used */
//     ecs_flags8_t allocated;  /* Which fields are allocated */
// } ecs_iter_cache_t;
// ----
// typedef struct ecs_iter_private_t {
//     union {
//         ecs_term_iter_t term;
//         ecs_filter_iter_t filter;
//         ecs_query_iter_t query;
//         ecs_rule_iter_t rule;
//         ecs_snapshot_iter_t snapshot;
//         ecs_page_iter_t page;
//         ecs_worker_iter_t worker;
//     } iter;
// ----
// typedef struct {
//     ecs_vec_t keys;
//     ecs_vec_t values;
// } ecs_hm_bucket_t;
// ----
// typedef struct {
//     ecs_hash_value_action_t hash;
//     ecs_compare_action_t compare;
//     ecs_size_t key_size;
//     ecs_size_t value_size;
//     ecs_block_allocator_t *hashmap_allocator;
//     ecs_block_allocator_t bucket_allocator;
//     ecs_map_t impl;
// } ecs_hashmap_t;
// ----
// typedef struct {
//     ecs_map_iter_t it;
//     ecs_hm_bucket_t *bucket;
//     int32_t index;
// } flecs_hashmap_iter_t;
// ----
// typedef struct {
//     void *key;
//     void *value;
//     uint64_t hash;
// } flecs_hashmap_result_t;
// ----
// typedef struct ecs_entity_desc_t {
//     int32_t _canary;

//     ecs_entity_t id;      /**< Set to modify existing entity (optional) */

//     const char *name;     /**< Name of the entity. If no entity is provided, an
//                            * entity with this name will be looked up first. When
//                            * an entity is provided, the name will be verified
//                            * with the existing entity. */

//     const char *sep;      /**< Optional custom separator for hierarchical names.
//                            * Leave to NULL for default ('.') separator. Set to
//                            * an empty string to prevent tokenization of name. */

//     const char *root_sep; /**< Optional, used for identifiers relative to root */

//     const char *symbol;   /**< Optional entity symbol. A symbol is an unscoped
//                            * identifier that can be used to lookup an entity. The
//                            * primary use case for this is to associate the entity
//                            * with a language identifier, such as a type or
//                            * function name, where these identifiers differ from
//                            * the name they are registered with in flecs. For
//                            * example, C type "EcsPosition" might be registered
//                            * as "flecs.components.transform.Position", with the
//                            * symbol set to "EcsPosition". */

//     bool use_low_id;      /**< When set to true, a low id (typically reserved for
//                            * components) will be used to create the entity, if
//                            * no id is specified. */

//     /** Array of ids to add to the new or existing entity. */
//     ecs_id_t add[FLECS_ID_DESC_MAX];

//     /** String expression with components to add */
//     const char *add_expr;
// } ecs_entity_desc_t;
// ----
// typedef struct ecs_bulk_desc_t { 
//     int32_t _canary;

//     ecs_entity_t *entities; /**< Entities to bulk insert. Entity ids provided by
//                              * the application must be empty (cannot
//                              * have components). If no entity ids are provided, the
//                              * operation will create 'count' new entities. */

//     int32_t count;     /**< Number of entities to create/populate */

//     ecs_id_t ids[FLECS_ID_DESC_MAX]; /**< Ids to create the entities with */

//     void **data;       /**< Array with component data to insert. Each element in 
//                         * the array must correspond with an element in the ids
//                         * array. If an element in the ids array is a tag, the
//                         * data array must contain a NULL. An element may be
//                         * set to NULL for a component, in which case the
//                         * component will not be set by the operation. */

//     ecs_table_t *table; /**< Table to insert the entities into. Should not be set
//                          * at the same time as ids. When 'table' is set at the
//                          * same time as 'data', the elements in the data array
//                          * must correspond with the ids in the table's type. */

// } ecs_bulk_desc_t;
// ----
// typedef struct ecs_component_desc_t {
//     int32_t _canary;
    
//     /** Existing entity to associate with observer (optional) */
//     ecs_entity_t entity;

//     /** Parameters for type (size, hooks, ...) */
//     ecs_type_info_t type;
// } ecs_component_desc_t;
// ----
// typedef struct ecs_filter_desc_t {
//     int32_t _canary;

//     /** Terms of the filter. If a filter has more terms than 
//      * FLECS_TERM_DESC_MAX use terms_buffer */
//     ecs_term_t terms[FLECS_TERM_DESC_MAX];

//     /** For filters with lots of terms an outside array can be provided. */
//     ecs_term_t *terms_buffer;

//     /** Number of terms in array provided in terms_buffer. */
//     int32_t terms_buffer_count;

//     /** External storage to prevent allocation of the filter object */
//     ecs_filter_t *storage;

//     /** When true, terms returned by an iterator may either contain 1 or N 
//      * elements, where terms with N elements are owned, and terms with 1 element 
//      * are shared, for example from a parent or base entity. When false, the 
//      * iterator will at most return 1 element when the result contains both 
//      * owned and shared terms. */ 
//     bool instanced;

//     /** Flags for advanced usage */
//     ecs_flags32_t flags;

//     /** Filter expression. Should not be set at the same time as terms array */
//     const char *expr;

//     /** Entity associated with query (optional) */
//     ecs_entity_t entity;
// } ecs_filter_desc_t;
// ----
// typedef struct ecs_query_desc_t {
//     int32_t _canary;

//     /** Filter for the query */
//     ecs_filter_desc_t filter;

//     /** Component to be used by order_by */
//     ecs_entity_t order_by_component;

//     /** Callback used for ordering query results. If order_by_id is 0, the 
//      * pointer provided to the callback will be NULL. If the callback is not
//      * set, results will not be ordered. */
//     ecs_order_by_action_t order_by;

//     /** Callback used for ordering query results. Same as order_by,
//      * but more efficient. */
//     ecs_sort_table_action_t sort_table;

//     /** Id to be used by group_by. This id is passed to the group_by function and
//      * can be used identify the part of an entity type that should be used for
//      * grouping. */
//     ecs_id_t group_by_id;

//     /** Callback used for grouping results. If the callback is not set, results
//      * will not be grouped. When set, this callback will be used to calculate a
//      * "rank" for each entity (table) based on its components. This rank is then
//      * used to sort entities (tables), so that entities (tables) of the same
//      * rank are "grouped" together when iterated. */
//     ecs_group_by_action_t group_by;

//     /** Callback that is invoked when a new group is created. The return value of
//      * the callback is stored as context for a group. */
//     ecs_group_create_action_t on_group_create;

//     /** Callback that is invoked when an existing group is deleted. The return 
//      * value of the on_group_create callback is passed as context parameter. */
//     ecs_group_delete_action_t on_group_delete;

//     /** Context to pass to group_by */
//     void *group_by_ctx;

//     /** Function to free group_by_ctx */
//     ecs_ctx_free_t group_by_ctx_free;

//     /** If set, the query will be created as a subquery. A subquery matches at
//      * most a subset of its parent query. Subqueries do not directly receive
//      * (table) notifications from the world. Instead parent queries forward
//      * results to subqueries. This can improve matching performance, as fewer
//      * queries need to be matched with new tables.
//      * Subqueries can be nested. */
//     ecs_query_t *parent;

//     /** User context to pass to callback */
//     void *ctx;

//     /** Context to be used for language bindings */
//     void *binding_ctx;
    
//     /** Callback to free ctx */
//     ecs_ctx_free_t ctx_free;

//     /** Callback to free binding_ctx */     
//     ecs_ctx_free_t binding_ctx_free;
// } ecs_query_desc_t;
// ----
// typedef struct ecs_observer_desc_t {
//     int32_t _canary;

//     /** Existing entity to associate with observer (optional) */
//     ecs_entity_t entity;

//     /** Filter for observer */
//     ecs_filter_desc_t filter;

//     /** Events to observe (OnAdd, OnRemove, OnSet, UnSet) */
//     ecs_entity_t events[FLECS_EVENT_DESC_MAX];

//     /** When observer is created, generate events from existing data. For example,
//      * EcsOnAdd Position would match all existing instances of Position.
//      * This is only supported for events that are iterable (see EcsIterable) */
//     bool yield_existing;

//     /** Callback to invoke on an event, invoked when the observer matches. */
//     ecs_iter_action_t callback;

//     /** Callback invoked on an event. When left to NULL the default runner
//      * is used which matches the event with the observer's filter, and calls
//      * 'callback' when it matches. 
//      * A reason to override the run function is to improve performance, if there
//      * are more efficient way to test whether an event matches the observer than
//      * the general purpose query matcher. */
//     ecs_run_action_t run;

//     /** User context to pass to callback */
//     void *ctx;

//     /** Context to be used for language bindings */
//     void *binding_ctx;
    
//     /** Callback to free ctx */
//     ecs_ctx_free_t ctx_free;

//     /** Callback to free binding_ctx */     
//     ecs_ctx_free_t binding_ctx_free;

//     /** Observable with which to register the observer */
//     ecs_poly_t *observable;

//     /** Optional shared last event id for multiple observers. Ensures only one
//      * of the observers with the shared id gets triggered for an event */
//     int32_t *last_event_id;

//     /** Used for internal purposes */
//     int32_t term_index;
// } ecs_observer_desc_t;
// ----
// typedef struct ecs_event_desc_t {
//     /** The event id. Only observers for the specified event will be notified */
//     ecs_entity_t event;

//     /** Component ids. Only observers with a matching component id will be
//      * notified. Observers are guaranteed to get notified once, even if they
//      * match more than one id. */
//     const ecs_type_t *ids;

//     /** The table for which to notify. */
//     ecs_table_t *table;

//     /** Optional 2nd table to notify. This can be used to communicate the
//      * previous or next table, in case an entity is moved between tables. */
//     ecs_table_t *other_table;

//     /** Limit notified entities to ones starting from offset (row) in table */
//     int32_t offset;

//     /** Limit number of notified entities to count. offset+count must be less
//      * than the total number of entities in the table. If left to 0, it will be
//      * automatically determined by doing ecs_table_count(table) - offset. */
//     int32_t count;

//     /** Single-entity alternative to setting table / offset / count */
//     ecs_entity_t entity;

//     /** Optional context.
//      * The type of the param must be the event, where the event is a component.
//      * When an event is enqueued, the value of param is coped to a temporary
//      * storage of the event type. */
//     void *param;

//     /* Same as param, but with the guarantee that the value won't be modified. 
//      * When an event with a const parameter is enqueued, the value of the param
//      * is copied to a temporary storage of the event type. */
//     const void *const_param;

//     /** Observable (usually the world) */
//     ecs_poly_t *observable;

//     /** Event flags */
//     ecs_flags32_t flags;
// } ecs_event_desc_t;
// ----
// typedef struct ecs_value_t {
//     ecs_entity_t type;
//     void *ptr;
// } ecs_value_t;
// ----
// typedef struct ecs_world_info_t {
//     ecs_entity_t last_component_id;   /**< Last issued component entity id */
//     ecs_entity_t min_id;              /**< First allowed entity id */
//     ecs_entity_t max_id;              /**< Last allowed entity id */

//     ecs_ftime_t delta_time_raw;       /**< Raw delta time (no time scaling) */
//     ecs_ftime_t delta_time;           /**< Time passed to or computed by ecs_progress */
//     ecs_ftime_t time_scale;           /**< Time scale applied to delta_time */
//     ecs_ftime_t target_fps;           /**< Target fps */
//     ecs_ftime_t frame_time_total;     /**< Total time spent processing a frame */
//     ecs_ftime_t system_time_total;    /**< Total time spent in systems */
//     ecs_ftime_t emit_time_total;      /**< Total time spent notifying observers */
//     ecs_ftime_t merge_time_total;     /**< Total time spent in merges */
//     ecs_ftime_t world_time_total;     /**< Time elapsed in simulation */
//     ecs_ftime_t world_time_total_raw; /**< Time elapsed in simulation (no scaling) */
//     ecs_ftime_t rematch_time_total;   /**< Time spent on query rematching */
    
//     int64_t frame_count_total;        /**< Total number of frames */
//     int64_t merge_count_total;        /**< Total number of merges */
//     int64_t rematch_count_total;      /**< Total number of rematches */

//     int64_t id_create_total;          /**< Total number of times a new id was created */
//     int64_t id_delete_total;          /**< Total number of times an id was deleted */
//     int64_t table_create_total;       /**< Total number of times a table was created */
//     int64_t table_delete_total;       /**< Total number of times a table was deleted */
//     int64_t pipeline_build_count_total; /**< Total number of pipeline builds */
//     int64_t systems_ran_frame;        /**< Total number of systems ran in last frame */
//     int64_t observers_ran_frame;      /**< Total number of times observer was invoked */

//     int32_t tag_id_count;             /**< Number of tag (no data) ids in the world */
//     int32_t component_id_count;       /**< Number of component (data) ids in the world */
//     int32_t pair_id_count;            /**< Number of pair ids in the world */

//     int32_t table_count;              /**< Number of tables */
//     int32_t empty_table_count;        /**< Number of tables without entities */

//     /* -- Command counts -- */
//     struct {
//         int64_t add_count;             /**< add commands processed */
//         int64_t remove_count;          /**< remove commands processed */
//         int64_t delete_count;          /**< delete commands processed */
//         int64_t clear_count;           /**< clear commands processed */
//         int64_t set_count;             /**< set commands processed */
//         int64_t get_mut_count;         /**< get_mut/emplace commands processed */
//         int64_t modified_count;        /**< modified commands processed */
//         int64_t other_count;           /**< other commands processed */
//         int64_t discard_count;         /**< commands discarded, happens when entity is no longer alive when running the command */
//         int64_t batched_entity_count;  /**< entities for which commands were batched */
//         int64_t batched_command_count; /**< commands batched */
//     } cmd;
// ----
// typedef struct ecs_query_group_info_t {
//     int32_t match_count;  /**< How often tables have been matched/unmatched */
//     int32_t table_count;  /**< Number of tables in group */
//     void *ctx;            /**< Group context, returned by on_group_create */
// } ecs_query_group_info_t;
// ----
// typedef struct EcsIdentifier {
//     char *value;          /**< Identifier string */
//     ecs_size_t length;    /**< Length of identifier */
//     uint64_t hash;        /**< Hash of current value */
//     uint64_t index_hash;  /**< Hash of existing record in current index */
//     ecs_hashmap_t *index; /**< Current index */
// } EcsIdentifier;
// ----
// typedef struct EcsComponent {
//     ecs_size_t size;           /**< Component size */
//     ecs_size_t alignment;      /**< Component alignment */
// } EcsComponent;
// ----
// typedef struct EcsPoly {
//     ecs_poly_t *poly;          /**< Pointer to poly object */
// } EcsPoly;
// ----
// typedef struct EcsTarget {
//     int32_t count;
//     ecs_record_t *target;
// } EcsTarget;
// ----

// ----
// typedef struct ecs_flatten_desc_t {
//     /* When true, the flatten operation will not remove names from entities in
//      * the flattened tree. This may fail if entities from different subtrees
//      * have the same name. */
//     bool keep_names;

//     /* When true, the flattened tree won't contain information about the 
//      * original depth of the entities. This can reduce fragmentation, but may
//      * cause existing code, such as cascade queries, to no longer work. */
//     bool lose_depth;
// } ecs_flatten_desc_t;
// ----
// typedef enum ecs_journal_kind_t {
//     EcsJournalNew,
//     EcsJournalMove,
//     EcsJournalClear,
//     EcsJournalDelete,
//     EcsJournalDeleteWith,
//     EcsJournalRemoveAll,
//     EcsJournalTableEvents
// } ecs_journal_kind_t;
// ----
// typedef int(*ecs_app_init_action_t)(
//     ecs_world_t *world
// ----
// typedef struct ecs_app_desc_t {
//     ecs_ftime_t target_fps;   /**< Target FPS. */
//     ecs_ftime_t delta_time;   /**< Frame time increment (0 for measured values) */
//     int32_t threads;          /**< Number of threads. */
//     int32_t frames;           /**< Number of frames to run (0 for infinite) */
//     bool enable_rest;         /**< Enables ECS access over HTTP, necessary for explorer */
//     bool enable_monitor;      /**< Periodically collect statistics */
//     uint16_t port;            /**< HTTP port used by REST API */

//     ecs_app_init_action_t init; /**< If set, function is ran before starting the
//                                  * main loop. */

//     void *ctx;                /**< Reserved for custom run/frame actions */
// } ecs_app_desc_t;
// ----
// typedef int(*ecs_app_run_action_t)(
//     ecs_world_t *world, 
//     ecs_app_desc_t *desc
// ----
// typedef int(*ecs_app_frame_action_t)(
//     ecs_world_t *world, 
//     const ecs_app_desc_t *desc
// ----
 
// ----
// typedef struct {
//     uint64_t id;
//     ecs_http_server_t *server;

//     char host[128];
//     char port[16];
// } ecs_http_connection_t;
// ----
// typedef struct {
//     const char *key;
//     const char *value;
// } ecs_http_key_value_t;
// ----
// typedef enum {
//     EcsHttpGet,
//     EcsHttpPost,
//     EcsHttpPut,
//     EcsHttpDelete,
//     EcsHttpOptions,
//     EcsHttpMethodUnsupported
// } ecs_http_method_t;
// ----
// typedef struct {
//     uint64_t id;

//     ecs_http_method_t method;
//     char *path;
//     char *body;
//     ecs_http_key_value_t headers[ECS_HTTP_HEADER_COUNT_MAX];
//     ecs_http_key_value_t params[ECS_HTTP_HEADER_COUNT_MAX];
//     int32_t header_count;
//     int32_t param_count;

//     ecs_http_connection_t *conn;
// } ecs_http_request_t;
// ----
// typedef struct {
//     int code;                   /**< default = 200 */
//     ecs_strbuf_t body;          /**< default = "" */
//     const char* status;         /**< default = OK */
//     const char* content_type;   /**< default = application/json */
//     ecs_strbuf_t headers;       /**< default = "" */
// } ecs_http_reply_t;
// ----
// typedef bool (*ecs_http_reply_action_t)(
//     const ecs_http_request_t* request, 
//     ecs_http_reply_t *reply,
//     void *ctx
// ----
// typedef struct {
//     ecs_http_reply_action_t callback; /**< Function called for each request  */
//     void *ctx;                        /**< Passed to callback (optional) */
//     uint16_t port;                    /**< HTTP port */
//     const char *ipaddr;               /**< Interface to listen on (optional) */
//     int32_t send_queue_wait_ms;       /**< Send queue wait time when empty */
// } ecs_http_server_desc_t;
// ----
// typedef struct {
//     uint16_t port;      /**< Port of server (optional, default = 27750) */
//     char *ipaddr;       /**< Interface address (optional, default = 0.0.0.0) */
//     void *impl;
// } EcsRest;
// ----
// typedef struct EcsTimer {
//     ecs_ftime_t timeout;         /**< Timer timeout period */
//     ecs_ftime_t time;            /**< Incrementing time value */
//     ecs_ftime_t overshoot;       /**< Used to correct returned interval time */
//     int32_t fired_count;         /**< Number of times ticked */
//     bool active;                 /**< Is the timer active or not */
//     bool single_shot;            /**< Is this a single shot timer */
// } EcsTimer;
// ----
// typedef struct EcsRateFilter {
//     ecs_entity_t src;            /**< Source of the rate filter */
//     int32_t rate;                /**< Rate of the rate filter */
//     int32_t tick_count;          /**< Number of times the rate filter ticked */
//     ecs_ftime_t time_elapsed;    /**< Time elapsed since last tick */
// } EcsRateFilter;
// ----
// typedef struct ecs_pipeline_desc_t {
//     /* Existing entity to associate with pipeline (optional) */
//     ecs_entity_t entity;
    
//     /* Query descriptor. The first term of the query must match the EcsSystem
//      * component. */
//     ecs_query_desc_t query;
// } ecs_pipeline_desc_t;
// ----
// typedef struct EcsTickSource {
//     bool tick;                 /**< True if providing tick */
//     ecs_ftime_t time_elapsed;  /**< Time elapsed since last tick */
// } EcsTickSource;
// ----
// typedef struct ecs_system_desc_t {
//     int32_t _canary;

//     /** Existing entity to associate with system (optional) */
//     ecs_entity_t entity;

//     /** System query parameters */
//     ecs_query_desc_t query;

//     /** Callback that is invoked when a system is ran. 
//      * When left to NULL, the default system runner is used, which calls the 
//      * "callback" action for each result returned from the system's query. 
//      * 
//      * It should not be assumed that the input iterator can always be iterated
//      * with ecs_query_next. When a system is multithreaded and/or paged, the
//      * iterator can be either a worker or paged iterator. Future use cases may
//      * introduce additional inputs for a system, such as rules and filters. The
//      * correct function to use for iteration is ecs_iter_next.
//      * 
//      * An implementation can test whether the iterator is a query iterator by
//      * testing whether the it->next value is equal to ecs_query_next. */
//     ecs_run_action_t run;

//     /** Callback that is ran for each result returned by the system's query. This
//      * means that this callback can be invoked multiple times per system per
//      * frame, typically once for each matching table. */
//     ecs_iter_action_t callback;

//     /** Context to be passed to callback (as ecs_iter_t::param) */
//     void *ctx;

//     /** Binding context, for when system is implemented in other language */
//     void *binding_ctx;

//     /** Functions that are invoked during system cleanup to free context data.
//      * When set, functions are called unconditionally, even when the ctx
//      * pointers are NULL. */
//     ecs_ctx_free_t ctx_free;
//     ecs_ctx_free_t binding_ctx_free;

//     /** Interval in seconds at which the system should run */
//     ecs_ftime_t interval;

//     /** Rate at which the system should run */
//     int32_t rate;

//     /** External tick source that determines when system ticks */
//     ecs_entity_t tick_source;

//     /** If true, system will be ran on multiple threads */
//     bool multi_threaded;

//     /** If true, system will have access to the actual world. Cannot be true at the
//      * same time as multi_threaded. */
//     bool no_readonly;
// } ecs_system_desc_t;
// ----
// typedef struct ecs_gauge_t {
//     ecs_float_t avg[ECS_STAT_WINDOW];
//     ecs_float_t min[ECS_STAT_WINDOW];
//     ecs_float_t max[ECS_STAT_WINDOW];
// } ecs_gauge_t;
// ----
//#define ECS_STAT_WINDOW (60)
//TODO:
// typedef struct ecs_counter_t {
//     ecs_gauge_t rate;                     /**< Keep track of deltas too */
//     double value[ECS_STAT_WINDOW];
// } ecs_counter_t;
// ----
// typedef union ecs_metric_t {
//     ecs_gauge_t gauge;
//     ecs_counter_t counter;
// } ecs_metric_t;
// ----
// typedef struct ecs_world_stats_t {
//     int64_t first_;

//     /* Entities */
//     struct {
//         ecs_metric_t count;               /**< Number of entities */
//         ecs_metric_t not_alive_count;     /**< Number of not alive (recyclable) entity ids */
//     } entities;
// ----
// typedef struct ecs_query_stats_t {
//     int64_t first_;
//     ecs_metric_t matched_table_count;       /**< Matched non-empty tables */    
//     ecs_metric_t matched_empty_table_count; /**< Matched empty tables */
//     ecs_metric_t matched_entity_count;      /**< Number of matched entities */
//     int64_t last_;

//     /** Current position in ringbuffer */
//     int32_t t; 
// } ecs_query_stats_t;
// ----
// typedef struct ecs_system_stats_t {
//     int64_t first_;
//     ecs_metric_t time_spent;       /**< Time spent processing a system */
//     ecs_metric_t invoke_count;     /**< Number of times system is invoked */
//     int64_t last_;

//     bool task;                     /**< Is system a task */

//     ecs_query_stats_t query;
// } ecs_system_stats_t;
// ----
// typedef struct ecs_sync_stats_t {
//     int64_t first_;
//     ecs_metric_t time_spent;
//     ecs_metric_t commands_enqueued;
//     int64_t last_;

//     int32_t system_count;
//     bool multi_threaded;
//     bool no_readonly;
// } ecs_sync_stats_t;
// ----
// typedef struct ecs_pipeline_stats_t
// ----
// typedef struct EcsMetricValue {
//     double value;
// } EcsMetricValue;
// ----
// typedef struct EcsMetricSource {
//     ecs_entity_t entity;
// } EcsMetricSource;
// ----
// typedef struct ecs_metric_desc_t {
//     int32_t _canary;

//     /** Entity associated with metric */
//     ecs_entity_t entity;
    
//     /** Entity associated with member that stores metric value. Must not be set
//      * at the same time as id. Cannot be combined with EcsCounterId. */
//     ecs_entity_t member;

//     /* Member dot expression. Can be used instead of member and supports nested
//      * members. Must be set together with id and should not be set at the same 
//      * time as member. */
//     const char *dotmember;

//     /** Tracks whether entities have the specified component id. Must not be set
//      * at the same time as member. */
//     ecs_id_t id;

//     /** If id is a (R, *) wildcard and relationship R has the OneOf property,
//      * setting this value to true will track individual targets. 
//      * If the kind is EcsCountId and the id is a (R, *) wildcard, this value
//      * will create a metric per target. */
//     bool targets;

//     /** Must be EcsGauge, EcsCounter, EcsCounterIncrement or EcsCounterId */
//     ecs_entity_t kind;

//     /** Description of metric. Will only be set if FLECS_DOC addon is enabled */
//     const char *brief;
// } ecs_metric_desc_t;
// ----
// typedef struct EcsAlertInstance {
//     char *message;
// } EcsAlertInstance;
// ----
// typedef struct EcsAlertsActive {
//     int32_t info_count;
//     int32_t warning_count;
//     int32_t error_count;
//     ecs_map_t alerts;
// } EcsAlertsActive;
// ----
// typedef struct ecs_alert_severity_filter_t {
//     ecs_entity_t severity; /* Severity kind */
//     ecs_id_t with;         /* Component to match */
//     const char *var;       /* Variable to match component on. Do not include the
//                             * '$' character. Leave to NULL for $this. */
//     int32_t _var_index;    /* Index of variable in filter (do not set) */
// } ecs_alert_severity_filter_t;
// ----
// typedef struct ecs_alert_desc_t { 
//     int32_t _canary;

//     /** Entity associated with alert */
//     ecs_entity_t entity;

//     /** Alert query. An alert will be created for each entity that matches the
//      * specified query. The query must have at least one term that uses the
//      * $this variable (default). */
//     ecs_filter_desc_t filter;

//     /** Template for alert message. This string is used to generate the alert
//      * message and may refer to variables in the query result. The format for
//      * the template expressions is as specified by ecs_interpolate_string.
//      * 
//      * Examples:
//      *   "$this has Position but not Velocity"
//      *   "$this has a parent entity $parent without Position"
//      */
//     const char *message;

//     /** User friendly name. Will only be set if FLECS_DOC addon is enabled. */
//     const char *doc_name;

//     /** Description of alert. Will only be set if FLECS_DOC addon is enabled */
//     const char *brief;

//     /** Metric kind. Must be EcsAlertInfo, EcsAlertWarning, EcsAlertError or 
//      * EcsAlertCritical. Defaults to EcsAlertError. */
//     ecs_entity_t severity;

//     /** Severity filters can be used to assign different severities to the same
//      * alert. This prevents having to create multiple alerts, and allows 
//      * entities to transition between severities without resetting the 
//      * alert duration (optional). */
//     ecs_alert_severity_filter_t severity_filters[ECS_ALERT_MAX_SEVERITY_FILTERS];

//     /** The retain period specifies how long an alert must be inactive before it
//      * is cleared. This makes it easier to track noisy alerts. While an alert is
//      * inactive its duration won't increase. 
//      * When the retain period is 0, the alert will clear immediately after it no
//      * longer matches the alert query. */
//     ecs_ftime_t retain_period;

//     /** Alert when member value is out of range. Uses the warning/error ranges
//      * assigned to the member in the MemberRanges component (optional). */
//     ecs_entity_t member;

//     /** (Component) id of member to monitor. If left to 0 this will be set to
//      * the parent entity of the member (optional). */
//     ecs_id_t id;

//     /** Variable from which to fetch the member (optional). When left to NULL
//      * 'id' will be obtained from $this. */
//     const char *var;
// } ecs_alert_desc_t;
// ----
// typedef struct {
//     ecs_ftime_t elapsed;
//     int32_t reduce_count;
// } EcsStatsHeader;
// ----
// typedef struct {
//     EcsStatsHeader hdr; 
//     ecs_world_stats_t stats;
// } EcsWorldStats;
// ----
// typedef struct {
//     EcsStatsHeader hdr;
//     ecs_pipeline_stats_t stats;
// } EcsPipelineStats;
// ----
// typedef struct {
//     /* Target FPS */
//     double target_fps;          /**< Target FPS */

//     /* Total time */
//     double frame_time_total;    /**< Total time spent processing a frame */
//     double system_time_total;   /**< Total time spent in systems */
//     double merge_time_total;    /**< Total time spent in merges */

//     /* Last frame time */
//     double frame_time_last;     /**< Time spent processing a frame */
//     double system_time_last;    /**< Time spent in systems */
//     double merge_time_last;     /**< Time spent in merges */
// } EcsWorldSummary;
// ----
// typedef struct EcsDocDescription {
//     char *value;
// } EcsDocDescription;
// ----
// typedef struct ecs_from_json_desc_t {
//     const char *name; /**< Name of expression (used for logging) */
//     const char *expr; /**< Full expression (used for logging) */

//     /** Callback that allows for specifying a custom lookup function. The 
//      * default behavior uses ecs_lookup_fullpath */
//     ecs_entity_t (*lookup_action)(
//         const ecs_world_t*, 
//         const char *value, 
//         void *ctx);
//     void *lookup_ctx;
// } ecs_from_json_desc_t;
// ----
// typedef struct ecs_entity_to_json_desc_t {
//     bool serialize_path;       /**< Serialize full pathname */
//     bool serialize_label;      /**< Serialize doc name */
//     bool serialize_brief;      /**< Serialize brief doc description */
//     bool serialize_link;       /**< Serialize doc link (URL) */
//     bool serialize_color;      /**< Serialize doc color */
//     bool serialize_ids;        /**< Serialize (component) ids */
//     bool serialize_id_labels;  /**< Serialize labels of (component) ids */
//     bool serialize_base;       /**< Serialize base components */
//     bool serialize_private;    /**< Serialize private components */
//     bool serialize_hidden;     /**< Serialize ids hidden by override */
//     bool serialize_values;     /**< Serialize component values */
//     bool serialize_type_info;  /**< Serialize type info (requires serialize_values) */
//     bool serialize_alerts;     /**< Serialize active alerts for entity */
//     ecs_entity_t serialize_refs; /**< Serialize references (incoming edges) for relationship */
//     bool serialize_matches;    /**< Serialize which queries entity matches with */
// } ecs_entity_to_json_desc_t;
// ----
// typedef struct ecs_iter_to_json_desc_t {
//     bool serialize_term_ids;        /**< Serialize query term component ids */
//     bool serialize_term_labels;     /**< Serialize query term component id labels */
//     bool serialize_ids;             /**< Serialize actual (matched) component ids */
//     bool serialize_id_labels;       /**< Serialize actual (matched) component id labels */
//     bool serialize_sources;         /**< Serialize sources */
//     bool serialize_variables;       /**< Serialize variables */
//     bool serialize_is_set;          /**< Serialize is_set (for optional terms) */
//     bool serialize_values;          /**< Serialize component values */
//     bool serialize_private;         /**< Serialize component values */
//     bool serialize_entities;        /**< Serialize entities (for This terms) */
//     bool serialize_entity_labels;   /**< Serialize doc name for entities */
//     bool serialize_entity_ids;      /**< Serialize numerical ids for entities */
//     bool serialize_entity_names;    /**< Serialize names (not paths) for entities */
//     bool serialize_variable_labels; /**< Serialize doc name for variables */
//     bool serialize_variable_ids;    /**< Serialize numerical ids for variables */
//     bool serialize_colors;          /**< Serialize doc color for entities */
//     bool measure_eval_duration;     /**< Serialize evaluation duration */
//     bool serialize_type_info;       /**< Serialize type information */
//     bool serialize_table;           /**< Serialize entire table vs. matched components */
// } ecs_iter_to_json_desc_t;
// ----
// typedef struct ecs_world_to_json_desc_t {
//     bool serialize_builtin;    /**< Exclude flecs modules & contents */
//     bool serialize_modules;    /**< Exclude modules & contents */
// } ecs_world_to_json_desc_t;
// ----

// ----

// ----

// ----

// ----

// ----

// ----

// ----

// ----

// ----

// ----

// ----

// ----

// ----

// ----

// ----

// ----
// typedef enum ecs_type_kind_t {
//     EcsPrimitiveType,
//     EcsBitmaskType,
//     EcsEnumType,
//     EcsStructType,
//     EcsArrayType,
//     EcsVectorType,
//     EcsOpaqueType,
//     EcsTypeKindLast = EcsOpaqueType
// } ecs_type_kind_t;
// ----
// typedef struct EcsMetaType {
//     ecs_type_kind_t kind;
//     bool existing;         /**< Did the type exist or is it populated from reflection */
//     bool partial;          /**< Is the reflection data a partial type description */
// } EcsMetaType;
// ----
// typedef enum ecs_primitive_kind_t {
//     EcsBool = 1,
//     EcsChar,
//     EcsByte,
//     EcsU8,
//     EcsU16,
//     EcsU32,
//     EcsU64,
//     EcsI8,
//     EcsI16,
//     EcsI32,
//     EcsI64,
//     EcsF32,
//     EcsF64,
//     EcsUPtr,
//     EcsIPtr,
//     EcsString,
//     EcsEntity,
//     EcsId,
//     EcsPrimitiveKindLast = EcsId
// } ecs_primitive_kind_t;
// ----
// typedef struct EcsPrimitive {
//     ecs_primitive_kind_t kind;
// } EcsPrimitive;
// ----
// typedef struct EcsMember {
//     ecs_entity_t type;
//     int32_t count;
//     ecs_entity_t unit;
//     int32_t offset;
// } EcsMember;
// ----
// typedef struct ecs_member_value_range_t {
//     double min;
//     double max;
// } ecs_member_value_range_t;
// ----
// typedef struct EcsMemberRanges {
//     ecs_member_value_range_t value;
//     ecs_member_value_range_t warning;
//     ecs_member_value_range_t error;
// } EcsMemberRanges;
// ----
// typedef struct ecs_member_t {
//     /** Must be set when used with ecs_struct_desc_t */
//     const char *name;
//     ecs_entity_t type;

//     /** May be set when used with ecs_struct_desc_t */
//     int32_t count;
//     int32_t offset;

//     /** May be set when used with ecs_struct_desc_t, will be auto-populated if
//      * type entity is also a unit */
//     ecs_entity_t unit;

//     /** Numerical range that specifies which values member can assume. This 
//      * range may be used by UI elements such as a progress bar or slider. The
//      * value of a member should not exceed this range. */
//     ecs_member_value_range_t range;

//     /** Numerical range outside of which the value represents an error. This 
//      * range may be used by UI elements to style a value. */
//     ecs_member_value_range_t error_range;

//     /** Numerical range outside of which the value represents an warning. This 
//      * range may be used by UI elements to style a value. */
//     ecs_member_value_range_t warning_range;

//     /** Should not be set by ecs_struct_desc_t */
//     ecs_size_t size;
//     ecs_entity_t member;
// } ecs_member_t;
// ----
// typedef struct EcsStruct {
//     /** Populated from child entities with Member component */
//     ecs_vec_t members; /* vector<ecs_member_t> */
// } EcsStruct;
// ----
// typedef struct ecs_enum_constant_t {
//     /** Must be set when used with ecs_enum_desc_t */
//     const char *name;

//     /** May be set when used with ecs_enum_desc_t */
//     int32_t value;

//     /** Should not be set by ecs_enum_desc_t */
//     ecs_entity_t constant;
// } ecs_enum_constant_t;
// ----
// typedef struct EcsEnum {
//     /** Populated from child entities with Constant component */
//     ecs_map_t constants; /* map<i32_t, ecs_enum_constant_t> */
// } EcsEnum;
// ----
// typedef struct ecs_bitmask_constant_t {
//     /** Must be set when used with ecs_bitmask_desc_t */
//     const char *name;

//     /** May be set when used with ecs_bitmask_desc_t */
//     ecs_flags32_t value;

//     /** Should not be set by ecs_bitmask_desc_t */
//     ecs_entity_t constant;
// } ecs_bitmask_constant_t;
// ----
// typedef struct EcsBitmask {
//     /* Populated from child entities with Constant component */
//     ecs_map_t constants; /* map<u32_t, ecs_bitmask_constant_t> */
// } EcsBitmask;
// ----
// typedef struct EcsArray {
//     ecs_entity_t type; /**< Element type */
//     int32_t count;     /**< Number of elements */
// } EcsArray;
// ----
// typedef struct EcsVector {
//     ecs_entity_t type; /**< Element type */
// } EcsVector;
// ----
// typedef struct ecs_serializer_t {
//     /* Serialize value */
//     int (*value)(
//         const struct ecs_serializer_t *ser, /**< Serializer */
//         ecs_entity_t type,                  /**< Type of the value to serialize */
//         const void *value);                 /**< Pointer to the value to serialize */

//     /* Serialize member */
//     int (*member)(
//         const struct ecs_serializer_t *ser, /**< Serializer */
//         const char *member);                /**< Member name */

//     const ecs_world_t *world;
//     void *ctx;
// } ecs_serializer_t;
// ----
// typedef struct ecs_serializer_t {
//     /* Serialize value */
//     int (*value_)(
//         const struct ecs_serializer_t *ser,
//         ecs_entity_t type,
//         const void *value);

//     /* Serialize member */
//     int (*member_)(
//         const struct ecs_serializer_t *ser,
//         const char *name);

//     /* Serialize value */
//     int value(ecs_entity_t type, const void *value) const;
    
//     /* Serialize value */
//     template <typename T>
//     int value(const T& value) const;

//     /* Serialize member */
//     int member(const char *name) const;

//     const ecs_world_t *world;
//     void *ctx;
// } ecs_serializer_t;
// ----
// typedef int (*ecs_meta_serialize_t)(
//     const ecs_serializer_t *ser,
//     const void *src
// ----
// typedef struct EcsOpaque {
//     ecs_entity_t as_type;              /**< Type that describes the serialized output */
//     ecs_meta_serialize_t serialize;    /**< Serialize action */

//     /* Deserializer interface 
//      * Only override the callbacks that are valid for the opaque type. If a
//      * deserializer attempts to assign a value type that is not supported by the
//      * interface, a conversion error is thrown.
//      */

//     /** Assign bool value */
//     void (*assign_bool)(
//         void *dst, 
//         bool value);

//     /** Assign char value */
//     void (*assign_char)(
//         void *dst, 
//         char value);

//     /** Assign int value */
//     void (*assign_int)(
//         void *dst, 
//         int64_t value);

//     /** Assign unsigned int value */
//     void (*assign_uint)(
//         void *dst, 
//         uint64_t value);

//     /** Assign float value */
//     void (*assign_float)(
//         void *dst, 
//         double value);

//     /** Assign string value */
//     void (*assign_string)(
//         void *dst, 
//         const char *value);

//     /** Assign entity value */
//     void (*assign_entity)(
//         void *dst,
//         ecs_world_t *world,
//         ecs_entity_t entity);

//     /** Assign (component) id value */
//     void (*assign_id)(
//         void *dst,
//         ecs_world_t *world,
//         ecs_id_t id);

//     /** Assign null value */
//     void (*assign_null)(
//         void *dst);

//     /** Clear collection elements */
//     void (*clear)(
//         void *dst);

//     /** Ensure & get collection element */
//     void* (*ensure_element)(
//         void *dst, 
//         size_t elem);

//     /** Ensure & get element */
//     void* (*ensure_member)(
//         void *dst, 
//         const char *member);

//     /** Return number of elements */
//     size_t (*count)(
//         const void *dst);
    
//     /** Resize to number of elements */
//     void (*resize)(
//         void *dst, 
//         size_t count);
// } EcsOpaque;
// ----
// typedef struct ecs_unit_translation_t {
//     int32_t factor; /**< Factor to apply (e.g. "1000", "1000000", "1024") */
//     int32_t power;  /**< Power to apply to factor (e.g. "1", "3", "-9") */
// } ecs_unit_translation_t;
// ----
// typedef struct EcsUnit {
//     char *symbol;
//     ecs_entity_t prefix; /**< Order of magnitude prefix relative to derived */
//     ecs_entity_t base;   /**< Base unit (e.g. "meters") */
//     ecs_entity_t over;   /**< Over unit (e.g. "per second") */
//     ecs_unit_translation_t translation; /**< Translation for derived unit */
// } EcsUnit;
// ----
// typedef struct EcsUnitPrefix {
//     char *symbol;        /**< Symbol of prefix (e.g. "K", "M", "Ki") */
//     ecs_unit_translation_t translation; /**< Translation of prefix */
// } EcsUnitPrefix;
// ----
// typedef enum ecs_meta_type_op_kind_t {
//     EcsOpArray,
//     EcsOpVector,
//     EcsOpOpaque,
//     EcsOpPush,
//     EcsOpPop,

//     EcsOpScope, /**< Marks last constant that can open/close a scope */

//     EcsOpEnum,
//     EcsOpBitmask,

//     EcsOpPrimitive, /**< Marks first constant that's a primitive */

//     EcsOpBool,
//     EcsOpChar,
//     EcsOpByte,
//     EcsOpU8,
//     EcsOpU16,
//     EcsOpU32,
//     EcsOpU64,
//     EcsOpI8,
//     EcsOpI16,
//     EcsOpI32,
//     EcsOpI64,
//     EcsOpF32,
//     EcsOpF64,
//     EcsOpUPtr,
//     EcsOpIPtr,
//     EcsOpString,
//     EcsOpEntity,
//     EcsOpId,
//     EcsMetaTypeOpKindLast = EcsOpId
// } ecs_meta_type_op_kind_t;
// ----
// typedef struct ecs_meta_type_op_t {
//     ecs_meta_type_op_kind_t kind;
//     ecs_size_t offset;      /**< Offset of current field */
//     int32_t count;
//     const char *name;       /**< Name of value (only used for struct members) */
//     int32_t op_count;       /**< Number of operations until next field or end */
//     ecs_size_t size;        /**< Size of type of operation */
//     ecs_entity_t type;      /**< Type entity */
//     int32_t member_index;   /**< Index of member in struct */
//     ecs_hashmap_t *members; /**< string -> member index (structs only) */
// } ecs_meta_type_op_t;
// ----
// typedef struct EcsMetaTypeSerialized {
//     ecs_vec_t ops;      /**< vector<ecs_meta_type_op_t> */
// } EcsMetaTypeSerialized;
// ----
// typedef struct ecs_meta_scope_t {
//     ecs_entity_t type;        /**< The type being iterated */
//     ecs_meta_type_op_t *ops;  /**< The type operations (see ecs_meta_type_op_t) */
//     int32_t op_count;         /**< Number of operations in ops array to process */
//     int32_t op_cur;           /**< Current operation */
//     int32_t elem_cur;         /**< Current element (for collections) */
//     int32_t prev_depth;       /**< Depth to restore, in case dotmember was used */
//     void *ptr;                /**< Pointer to the value being iterated */

//     const EcsComponent *comp; /**< Pointer to component, in case size/alignment is needed */
//     const EcsOpaque *opaque;  /**< Opaque type interface */ 
//     ecs_vec_t *vector;        /**< Current vector, in case a vector is iterated */
//     ecs_hashmap_t *members;   /**< string -> member index */
//     bool is_collection;       /**< Is the scope iterating elements? */
//     bool is_inline_array;     /**< Is the scope iterating an inline array? */
//     bool is_empty_scope;      /**< Was scope populated (for collections) */
// } ecs_meta_scope_t;
// ----
// typedef struct ecs_meta_cursor_t {
//     const ecs_world_t *world;
//     ecs_meta_scope_t scope[ECS_META_MAX_SCOPE_DEPTH];
//     int32_t depth;
//     bool valid;
//     bool is_primitive_scope;  /**< If in root scope, this allows for a push for primitive types */

//     /* Custom entity lookup action for overriding default ecs_lookup_fullpath */
//     ecs_entity_t (*lookup_action)(const ecs_world_t*, const char*, void*);
//     void *lookup_ctx;
// } ecs_meta_cursor_t;
// ----
// typedef struct ecs_primitive_desc_t {
//     ecs_entity_t entity; /**< Existing entity to use for type (optional) */
//     ecs_primitive_kind_t kind;
// } ecs_primitive_desc_t;
// ----
// typedef struct ecs_enum_desc_t {
//     ecs_entity_t entity; /**< Existing entity to use for type (optional) */
//     ecs_enum_constant_t constants[ECS_MEMBER_DESC_CACHE_SIZE];
// } ecs_enum_desc_t;
// ----
// typedef struct ecs_bitmask_desc_t {
//     ecs_entity_t entity; /**< Existing entity to use for type (optional) */
//     ecs_bitmask_constant_t constants[ECS_MEMBER_DESC_CACHE_SIZE];
// } ecs_bitmask_desc_t;
// ----
// typedef struct ecs_array_desc_t {
//     ecs_entity_t entity; /**< Existing entity to use for type (optional) */
//     ecs_entity_t type;
//     int32_t count;
// } ecs_array_desc_t;
// ----
// typedef struct ecs_vector_desc_t {
//     ecs_entity_t entity; /**< Existing entity to use for type (optional) */
//     ecs_entity_t type;
// } ecs_vector_desc_t;
// ----
// typedef struct ecs_struct_desc_t {
//     ecs_entity_t entity; /**< Existing entity to use for type (optional) */
//     ecs_member_t members[ECS_MEMBER_DESC_CACHE_SIZE];
// } ecs_struct_desc_t;
// ----
// typedef struct ecs_opaque_desc_t {
//     ecs_entity_t entity;
//     EcsOpaque type;
// } ecs_opaque_desc_t;
// ----
// typedef struct ecs_unit_desc_t {
//     /** Existing entity to associate with unit (optional) */
//     ecs_entity_t entity;

//     /** Unit symbol, e.g. "m", "%", "g". (optional) */
//     const char *symbol;

//     /** Unit quantity, e.g. distance, percentage, weight. (optional) */
//     ecs_entity_t quantity;

//     /** Base unit, e.g. "meters" (optional) */
//     ecs_entity_t base;

//     /** Over unit, e.g. "per second" (optional) */
//     ecs_entity_t over;

//     /** Translation to apply to derived unit (optional) */
//     ecs_unit_translation_t translation;

//     /** Prefix indicating order of magnitude relative to the derived unit. If set
//      * together with "translation", the values must match. If translation is not
//      * set, setting prefix will autopopulate it.
//      * Additionally, setting the prefix will enforce that the symbol (if set)
//      * is consistent with the prefix symbol + symbol of the derived unit. If the
//      * symbol is not set, it will be auto populated. */
//     ecs_entity_t prefix;
// } ecs_unit_desc_t;
// ----
// typedef struct ecs_unit_prefix_desc_t {
//     /** Existing entity to associate with unit prefix (optional) */
//     ecs_entity_t entity;

//     /** Unit symbol, e.g. "m", "%", "g". (optional) */
//     const char *symbol;

//     /** Translation to apply to derived unit (optional) */
//     ecs_unit_translation_t translation;
// } ecs_unit_prefix_desc_t;
// ----
// typedef struct ecs_expr_var_t {
//     char *name;
//     ecs_value_t value;
//     bool owned; /* Set to false if ecs_vars_t should not take ownership of var */
// } ecs_expr_var_t;
// ----
// typedef struct ecs_expr_var_scope_t {
//     ecs_hashmap_t var_index;
//     ecs_vec_t vars;
//     struct ecs_expr_var_scope_t *parent;
// } ecs_expr_var_scope_t;
// ----
// typedef struct ecs_vars_t {
//     ecs_world_t *world;
//     ecs_expr_var_scope_t root;
//     ecs_expr_var_scope_t *cur;
// } ecs_vars_t;
// ----
// typedef struct ecs_parse_expr_desc_t {
//     const char *name;
//     const char *expr;
//     ecs_entity_t (*lookup_action)(
//         const ecs_world_t*, 
//         const char *value, 
//         void *ctx);
//     void *lookup_ctx;
//     ecs_vars_t *vars;
// } ecs_parse_expr_desc_t;
// ----
// typedef struct __VA_ARGS__ name

// #define ECS_STRUCT_ECS_META_IMPL ECS_STRUCT_IMPL

// #define ECS_STRUCT_IMPL(name, type_desc)\
//     extern ECS_COMPONENT_DECLARE(name
// ----
// typedef enum __VA_ARGS__ name

// #define ECS_ENUM_ECS_META_IMPL ECS_ENUM_IMPL

// #define ECS_ENUM_IMPL(name, type_desc)\
//     extern ECS_COMPONENT_DECLARE(name
// ----
// typedef enum __VA_ARGS__ name

// #define ECS_BITMASK_ECS_META_IMPL ECS_BITMASK_IMPL

// #define ECS_BITMASK_IMPL(name, type_desc)\
//     extern ECS_COMPONENT_DECLARE(name
// ----
// typedef struct EcsScript {
//     ecs_vec_t using_;
//     char *script;
//     ecs_vec_t prop_defaults;
//     ecs_world_t *world;
// } EcsScript;
// ----
// typedef struct ecs_script_desc_t {
//     ecs_entity_t entity;      /* Set to customize entity handle associated with script */
//     const char *filename;     /* Set to load script from file */
//     const char *str;          /* Set to parse script from string */
// } ecs_script_desc_t;
// ----
 
