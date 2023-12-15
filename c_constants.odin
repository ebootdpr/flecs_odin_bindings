package flecs
import "core:c"

ftime_t :: c.float
MAX_JOBS_PER_WORKER :: 16
ECS_MAX_DEFER_STACK :: 8

FILTER_INIT : filter_t : {hdr = {magic = 0x65637366}}


// TODO: Remove this code if the defs in procs.odin work, uncomment otherwise
Ecs_Component_Id : Entity : 1
Ecs_Identifier_Id : Entity : 2
Ecs_Iterable_Id : Entity : 3
Ecs_Poly_Id : Entity : 4



Ecs_Child_Ofxd : Entity : FLECS_HI_COMPONENT_ID + 27

Ecs_Last_Internal_Component_Id :: Ecs_Poly_Id

Ecs_First_User_Component_Id :: 8

Ecs_First_User_Entity_Id :: FLECS_HI_COMPONENT_ID + 128

MEMBER_DESC_CACHE_SIZE :: 32

REST_DEFAULT_PORT :: 27750


/** NOTE: In flecs, ecs_poly_t is a type alias to a void. However,
* Odin doesn't have a void type, the closest is rawptr but that's
* actually a pointer to a void. Luckily, whenever poly is used in
* flecs, it's always used as a pointer to poly, so in flecs_odin
* we store Poly as a rawptr and never store pointers to Poly, just
* Poly itself.
*/
poly_t_ptr :: rawptr


// when #config(FLECS_LOW_FOOTPRINT, true)
// {
//     HI_COMPONENT_ID :: 16
//     HI_ID_RECORD_ID :: 16
//     SPARSE_PAGE_BITS :: 6
//     ENTITY_PAGE_BITS :: 6
//     USE_OS_ALLOC :: true
// } else
// {
//     HI_COMPONENT_ID :: 256
//     HI_ID_RECORD_ID :: 1024
//     SPARSE_PAGE_BITS :: 12
//     ENTITY_PAGE_BITS :: 12
// }

FLECS_HI_COMPONENT_ID :: 256
FLECS_HI_ID_RECORD_ID :: 1024
FLECS_SPARSE_PAGE_BITS :: 12
FLECS_ENTITY_PAGE_BITS :: 12

FLECS_ID_DESC_MAX :: 32
FLECS_TERM_DESC_MAX :: 16
FLECS_EVENT_DESC_MAX :: 8
FLECS_VARIABLE_COUNT_MAX :: 64
FLECS_QUERY_SCOPE_NESTING_MAX :: 8

/// API Types

id_t :: u64
Entity :: id_t

HTTP_HEADER_COUNT_MAX :: 32
HTTP_QUERY_PARAM_COUNT_MAX :: 32
HTTP_SEND_QUEUE_MAX :: 256

when ODIN_OS == .Windows
{
    HTTP_Socket :: c.ulonglong
} else
{
    HTTP_Socket :: c.int
}

OBJECT_MAGIC :: 0x6563736f


/// Handle types
os_thread_t :: c.uintptr_t
os_cond_t :: c.uintptr_t
os_mutex_t :: c.uintptr_t
os_dl_t :: c.uintptr_t
os_sock_t :: c.uintptr_t

// 64-bit thread id
os_thread_id_t :: u64


// ecs_pair_relation :: ecs_pair_first
pair_relation :: ecs_pair_first
// ecs_pair_object :: ecs_pair_second
pair_object :: ecs_pair_second
get_pair_object :: ecs_get_pair_second
set_pair_object :: ecs_set_pair_second



// ecs_poly_id ::(tag) ecs_pair(ecs_id(EcsPoly), tag)
// poly_id uses ecs_id




Map_Data :: u64
Map_Key :: Map_Data
Map_Val :: Map_Data
META_MAX_SCOPE_DEPTH :: 32
FLECS_ENTITY_PAGE_SIZE :: 1 << FLECS_ENTITY_PAGE_BITS
FLECS_ENTITY_PAGE_MASK :: FLECS_ENTITY_PAGE_SIZE - 1
COMPONENT_MASK :: ~ID_FLAGS_MASK

STRBUF_INIT : strbuf_t : {} //wtf is this
STRBUF_ELEMENT_SIZE :: 511
STRBUF_MAX_LIST_DEPTH :: 32
STACK_PAGE_SIZE :: 4096



// Ignore sizeof, alignof, deprecated, and align (Use Odin's builtin procs for those)
// Ignore Max and Min, use Odin's builtin procs for those as well
// Ignore cast, use cast()

// Ignore magic numbers


Var_Id :: u8
Rule_Lbl :: i16
Write_Flags :: flags64_t

Rule_Max_Var_Count :: 64
Var_None : Var_Id : 255
This_Name : cstring : "this"


Rule_Is_Entity :: 1 << 0
Rule_Is_Var :: 1 << 1
Rule_Is_Self :: 1 << 6

Rule_Src :: 0
Rule_First :: 2
Rule_Second :: 4

INVALID_OPERATION :: 1
INVALID_PARAMETER :: 2
CONSTRAINT_VIOLATED :: 3
OUT_OF_MEMORY :: 4
OUT_OF_RANGE :: 5
UNSUPPORTED :: 6
INTERNAL_ERROR :: 7
ALREADY_DEFINED :: 8
MISSING_OS_API :: 9
OPERATION_FAILED :: 10
INVALID_CONVERSION :: 11
ID_IN_USE :: 12
CYCLE_DETECTED :: 13
LEAK_DETECTED :: 14
INCONSISTENT_NAME :: 20
NAME_IN_USE :: 21
NOT_A_COMPONENT :: 22
INVALID_COMPONENT_SIZE :: 23
INVALID_COMPONENT_ALIGNMENT :: 24
COMPONENT_NOT_REGISTERED :: 25
INCONSISTENT_COMPONENT_ID :: 26
INCONSISTENT_COMPONENT_ACTION :: 27
MODULE_UNDEFINED :: 28
MISSING_SYMBOL :: 29
ALREADY_IN_USE :: 30
ACCESS_VIOLATION :: 40
COLUMN_INDEX_OUT_OF_RANGE :: 41
COLUMN_IS_NOT_SHARED :: 42
COLUMN_IS_SHARED :: 43
COLUMN_TYPE_MISMATCH :: 45
INVALID_WHILE_READONLY :: 70
LOCKED_STORAGE :: 71
INVALID_FROM_WORKER :: 72

BLACK :: "\033[1;30m"
RED :: "\033[0;31m"
GREEN :: "\033[0;32m"
YELLOW :: "\033[0;33m"
BLUE :: "\033[0;34m"
MAGENTA :: "\033[0;35m"
CYAN :: "\033[0;36m"
WHITE :: "\033[1;37m"
GREY :: "\033[0;37m"
NORMAL :: "\033[0;49m"
BOLD :: "\033[1;49m"



HTTP_REPLY_INIT : http_reply_t : http_reply_t {200, STRBUF_INIT, "OK", "application/json", STRBUF_INIT}


EcsWorldQuitWorkers ::           (u32(1) << 0)
EcsWorldReadonly ::              (u32(1) << 1)
EcsWorldInit ::                  (u32(1) << 2)
EcsWorldQuit ::                  (u32(1) << 3)
EcsWorldFini ::                  (u32(1) << 4)
EcsWorldMeasureFrameTime ::      (u32(1) << 5)
EcsWorldMeasureSystemTime ::     (u32(1) << 6)
EcsWorldMultiThreaded ::         (u32(1) << 7)
EcsOsApiHighResolutionTimer ::   (u32(1) << 0)
EcsOsApiLogWithColors ::         (u32(1) << 1)
EcsOsApiLogWithTimeStamp ::      (u32(1) << 2)
EcsOsApiLogWithTimeDelta ::      (u32(1) << 3)
EcsEntityIsId ::                 (u32(1) << 31)
EcsEntityIsTarget ::             (u32(1) << 30)
EcsEntityIsTraversable ::        (u32(1) << 29)
EcsIdOnDeleteRemove ::            (u32(1) << 0)
EcsIdOnDeleteDelete ::            (u32(1) << 1)
EcsIdOnDeletePanic ::             (u32(1) << 2)
//  EcsIdOnDeleteMask\
//     (EcsIdOnDeletePanic|EcsIdOnDeleteRemove|EcsIdOnDeleteDelete)
EcsIdOnDeleteObjectRemove ::      (u32(1) << 3)
EcsIdOnDeleteObjectDelete ::      (u32(1) << 4)
EcsIdOnDeleteObjectPanic ::       (u32(1) << 5)
//  EcsIdOnDeleteObjectMask\
//     (EcsIdOnDeleteObjectPanic|EcsIdOnDeleteObjectRemove|\
//         EcsIdOnDeleteObjectDelete)
EcsIdExclusive ::                 (u32(1) << 6)
EcsIdDontInherit ::               (u32(1) << 7)
EcsIdTraversable ::               (u32(1) << 8)
EcsIdTag ::                       (u32(1) << 9)
EcsIdWith ::                      (u32(1) << 10)
EcsIdUnion ::                     (u32(1) << 11)
EcsIdAlwaysOverride ::            (u32(1) << 12)
EcsIdHasOnAdd ::                  (u32(1) << 16) 
EcsIdHasOnRemove ::               (u32(1) << 17) 
EcsIdHasOnSet ::                  (u32(1) << 18)
EcsIdHasUnSet ::                  (u32(1) << 19)
EcsIdHasOnTableFill ::            (u32(1) << 20)
EcsIdHasOnTableEmpty ::           (u32(1) << 21)
EcsIdHasOnTableCreate ::          (u32(1) << 22)
EcsIdHasOnTableDelete ::          (u32(1) << 23)
 EcsIdEventMask::\ 
    (EcsIdHasOnAdd|EcsIdHasOnRemove|EcsIdHasOnSet|EcsIdHasUnSet|\
        EcsIdHasOnTableFill|EcsIdHasOnTableEmpty|EcsIdHasOnTableCreate|\
            EcsIdHasOnTableDelete)
EcsIdMarkedForDelete ::           (u32(1) << 30)
//  ECS_ID_ON_DELETE(flags) \
//     ((ecs_entity_t[]){0, EcsRemove, EcsDelete, 0, EcsPanic}\
//         [((flags) & EcsIdOnDeleteMask)])
//  ECS_ID_ON_DELETE_TARGET(flags) ECS_ID_ON_DELETE(flags >> 3)
//  ECS_ID_ON_DELETE_FLAG(id) (u32(1) << ((id) - EcsRemove))
//  ECS_ID_ON_DELETE_TARGET_FLAG(id) (u32(1) << (3 + ((id) - EcsRemove)))
EcsIterIsValid ::                 (u32(1) << u32(0))  
EcsIterNoData ::                  (u32(1) << u32(1))  
EcsIterIsInstanced ::             (u32(1) << u32(2))  
EcsIterHasShared ::               (u32(1) << u32(3))  
EcsIterTableOnly ::               (u32(1) << u32(4))  
EcsIterEntityOptional ::          (u32(1) << u32(5))  
EcsIterNoResults ::               (u32(1) << u32(6))  
EcsIterIgnoreThis ::              (u32(1) << u32(7))  
EcsIterMatchVar ::                (u32(1) << u32(8))  
EcsIterHasCondSet ::              (u32(1) << u32(10)) 
EcsIterProfile ::                 (u32(1) << u32(11)) 
EcsEventTableOnly ::              (u32(1) << u32(4))   
EcsEventNoOnSet ::                (u32(1) << u32(16))  
EcsFilterMatchThis ::             (u32(1) << u32(1))  
EcsFilterMatchOnlyThis ::         (u32(1) << u32(2))  
EcsFilterMatchPrefab ::           (u32(1) << u32(3))  
EcsFilterMatchDisabled ::         (u32(1) << u32(4))  
EcsFilterMatchEmptyTables ::      (u32(1) << u32(5))  
EcsFilterMatchAnything ::         (u32(1) << u32(6))  
EcsFilterNoData ::                (u32(1) << u32(7))  
EcsFilterIsInstanced ::           (u32(1) << u32(8))  
EcsFilterPopulate ::              (u32(1) << u32(9))  
EcsFilterHasCondSet ::            (u32(1) << u32(10)) 
EcsFilterUnresolvedByName ::      (u32(1) << u32(11)) 
EcsFilterHasPred ::               (u32(1) << u32(12)) 
EcsFilterHasScopes ::             (u32(1) << u32(13)) 
EcsTableHasBuiltins ::            (u32(1) << u32(1))  
EcsTableIsPrefab ::               (u32(1) << u32(2))  
EcsTableHasIsA ::                 (u32(1) << u32(3))  
EcsTableHasChildOf ::             (u32(1) << u32(4))  
EcsTableHasName ::                (u32(1) << u32(5))  
EcsTableHasPairs ::               (u32(1) << u32(6))  
EcsTableHasModule ::              (u32(1) << u32(7))  
EcsTableIsDisabled ::             (u32(1) << u32(8))  
EcsTableHasCtors ::               (u32(1) << u32(9))
EcsTableHasDtors ::               (u32(1) << u32(10))
EcsTableHasCopy ::                (u32(1) << u32(11))
EcsTableHasMove ::                (u32(1) << u32(12))
EcsTableHasUnion ::               (u32(1) << u32(13))
EcsTableHasToggle ::              (u32(1) << u32(14))
EcsTableHasOverrides ::           (u32(1) << u32(15))
EcsTableHasOnAdd ::               (u32(1) << u32(16)) 
EcsTableHasOnRemove ::            (u32(1) << u32(17))
EcsTableHasOnSet ::               (u32(1) << u32(18))
EcsTableHasUnSet ::               (u32(1) << u32(19))
EcsTableHasOnTableFill ::         (u32(1) << u32(20))
EcsTableHasOnTableEmpty ::        (u32(1) << u32(21))
EcsTableHasOnTableCreate ::       (u32(1) << u32(22))
EcsTableHasOnTableDelete ::       (u32(1) << u32(23))
EcsTableHasTraversable ::         (u32(1) << u32(25))
EcsTableHasTarget ::              (u32(1) << u32(26))
EcsTableMarkedForDelete ::        (u32(1) << u32(30))
 EcsTableHasLifecycle ::       (EcsTableHasCtors | EcsTableHasDtors)
EcsTableIsComplex    ::       (EcsTableHasLifecycle | EcsTableHasUnion | EcsTableHasToggle)
EcsTableHasAddActions  ::     (EcsTableHasIsA | EcsTableHasUnion | EcsTableHasCtors | EcsTableHasOnAdd | EcsTableHasOnSet)
EcsTableHasRemoveActions ::   (EcsTableHasIsA | EcsTableHasDtors | EcsTableHasOnRemove | EcsTableHasUnSet)
EcsQueryHasRefs  ::              (u32(1) << u32(1))  
EcsQueryIsSubquery ::             (u32(1) << u32(2))  
EcsQueryIsOrphaned ::             (u32(1) << u32(3))  
EcsQueryHasOutTerms ::            (u32(1) << u32(4))  
EcsQueryHasNonThisOutTerms ::     (u32(1) << u32(5))  
EcsQueryHasMonitor ::             (u32(1) << u32(6))  
EcsQueryTrivialIter ::            (u32(1) << u32(7))  
EcsAperiodicEmptyTables ::        (u32(1) << u32(1))  
EcsAperiodicComponentMonitors ::  (u32(1) << u32(2))  
EcsAperiodicEmptyQueries ::       (u32(1) << u32(4))  


flags8_t :: u8
flags16_t :: u16
flags32_t :: u32
flags64_t :: u64
size_t :: i32
// #define ECS_SIZEOF(T) ECS_CAST(ecs_size_t, sizeof(T))
// #define ECS_ALIGNOF(T) ((int64_t)&((struct { char c; T d; } *)0)->d)
// #define ECS_ALIGN(size, alignment) (ecs_size_t)((((((size_t)size) - 1) / ((size_t)alignment)) + 1) * ((size_t)alignment))
// #define ECS_MAX(a, b) (((a) > (b)) ? a : b)
// #define ECS_MIN(a, b) (((a) < (b)) ? a : b)
// #define ECS_CAST(T, V) ((T)(V))
// #define ECS_CONST_CAST(type, value) ((type)(uintptr_t)(value))
// #define ECS_PTR_CAST(type, value) ((type)(uintptr_t)(value))
// #define ECS_EQ(a, b) (ecs_os_memcmp(&(a), &(b), sizeof(a)) == 0)
// #define ECS_NEQ(a, b) (!ECS_EQ(a, b))
// #define ECS_EQZERO(a) ECS_EQ(a, (uint64_t){0})
// #define ECS_NEQZERO(a) ECS_NEQ(a, (uint64_t){0})
// #define ECS_CONCAT(a, b) a ## b
 ecs_world_t_magic ::     (0x65637377)
 ecs_stage_t_magic ::     (0x65637373)
 ecs_query_t_magic ::     (0x65637371)
 ecs_rule_t_magic ::      (0x65637375)
 ecs_table_t_magic ::     (0x65637374)
 ecs_filter_t_magic ::    (0x65637366)
 ecs_trigger_t_magic ::   (0x65637372)
 ecs_observer_t_magic ::  (0x65637362)
/// Entity ID Macros


FLECS_SPARSE_PAGE_SIZE :: 1 << FLECS_SPARSE_PAGE_BITS
 ECS_ROW_MASK :: u32(0x0FFFFFFF)
 ECS_ROW_FLAGS_MASK ::             ~ECS_ROW_MASK
// #define ECS_RECORD_TO_ROW(v)          (ECS_CAST(int32_t, (ECS_CAST(uint32_t, v) & ECS_ROW_MASK)))
// #define ECS_RECORD_TO_ROW_FLAGS(v)    (ECS_CAST(uint32_t, v) & ECS_ROW_FLAGS_MASK)
// #define ECS_ROW_TO_RECORD(row, flags) (ECS_CAST(uint32_t, (ECS_CAST(uint32_t, row) | (flags))))
//should be 72057594037927936 ID_FLAGS_MASK
//18446744073709551615 //thanks google bard, fk u chat shitpity
//18374686479671623680
//18446744073709551086
// ID_FLAGS_MASK :: u64(255) << 56
// ID_FLAGS_MASK :: u64(18446744073709551615)
ID_FLAGS_MASK :: u64(18446744073709551086)
ENTITY_MASK :: u64(0xFFFFFFFF)
GENERATION_MASK :: u64(0xFFFF) << 32
ECS_ID_FLAGS_MASK ::             (cast(c.ulonglong)0xFF << 56) //60
ECS_ENTITY_MASK ::               (cast(c.ulonglong)0xFFFFFFFF)
ECS_GENERATION_MASK ::           (cast(c.ulonglong)0xFFFF << 32)
// #define ECS_GENERATION(e)             ((e & ECS_GENERATION_MASK) >> 32)
// #define ECS_GENERATION_INC(e)         ((e & ~ECS_GENERATION_MASK) | ((0xFFFF & (ECS_GENERATION(e) + 1)) << 32))
// #define ECS_COMPONENT_MASK            (~ECS_ID_FLAGS_MASK)
// #define ECS_HAS_ID_FLAG(e, flag)      ((e) & ECS_##flag)
// #define ECS_IS_PAIR(id)               (((id) & ECS_ID_FLAGS_MASK) == ECS_PAIR)
// #define ECS_PAIR_FIRST(e)             (ecs_entity_t_hi(e & ECS_COMPONENT_MASK))
// #define ECS_PAIR_SECOND(e)            (ecs_entity_t_lo(e))
// #define ECS_HAS_RELATION(e, rel)      (ECS_HAS_ID_FLAG(e, PAIR) && (ECS_PAIR_FIRST(e) == rel))
// #define ecs_id(T) FLECS_ID##T##ID_
// #define ecs_entity_t_lo(value) ECS_CAST(uint32_t, value)
// #define ecs_entity_t_hi(value) ECS_CAST(uint32_t, (value) >> 32)
// #define ecs_entity_t_comb(lo, hi) ((ECS_CAST(uint64_t, hi) << 32) + ECS_CAST(uint32_t, lo))
// #define ecs_pair(pred, obj) (ECS_PAIR | ecs_entity_t_comb(obj, pred))
// #define ecs_pair_t(pred, obj) (ECS_PAIR | ecs_entity_t_comb(obj, ecs_id(pred)))
// #define ecs_pair_first(world, pair) ecs_get_alive(world, ECS_PAIR_FIRST(pair))
// #define ecs_pair_second(world, pair) ecs_get_alive(world, ECS_PAIR_SECOND(pair))
ecs_pair_relation :: ecs_pair_first
ecs_pair_object :: ecs_pair_second
// #define ecs_poly_id(tag) ecs_pair(ecs_id(EcsPoly), tag)
// #define ECS_TABLE_LOCK(world, table) ecs_table_lock(world, table)
// #define ECS_TABLE_UNLOCK(world, table) ecs_table_unlock(world, table)
 EcsIterNextYield ::  (0)   
 EcsIterYield ::      (-1)  
 EcsIterNext ::  (1)   

ECS_STRBUF_ELEMENT_SIZE :: (511)
ECS_STRBUF_MAX_LIST_DEPTH :: (32)


 EcsSelf ::                       (u32(1) << 1)  
EcsUp ::                         (u32(1) << 2)  
EcsDown ::                       (u32(1) << 3)  
EcsTraverseAll ::                (u32(1) << 4)  
EcsCascade ::                    (u32(1) << 5)  
EcsDesc ::                       (u32(1) << 6)  
EcsParent ::                     (u32(1) << 7)  
EcsIsVariable ::                 (u32(1) << 8)  
EcsIsEntity ::                   (u32(1) << 9)  
EcsIsName ::                     (u32(1) << 10) 
EcsFilter ::                     (u32(1) << 11) 
EcsTraverseFlags ::              (EcsUp|EcsDown|EcsTraverseAll|EcsSelf|EcsCascade|EcsDesc|EcsParent)
EcsTermMatchAny ::               (u32(1) << 0)
EcsTermMatchAnySrc ::            (u32(1) << 1)
EcsTermSrcFirstEq ::             (u32(1) << 2)
EcsTermSrcSecondEq ::            (u32(1) << 3)
EcsTermTransitive ::             (u32(1) << 4)
EcsTermReflexive ::              (u32(1) << 5)
EcsTermIdInherited ::            (u32(1) << 6)
EcsTermMatchDisabled ::          (u32(1) << 7)
EcsTermMatchPrefab ::            (u32(1) << 8)

 flecs_iter_cache_ids ::           (u32(1) << u32(0))
 flecs_iter_cache_columns ::       (u32(1) << u32(1))
 flecs_iter_cache_sources ::       (u32(1) << u32(2))
 flecs_iter_cache_ptrs ::          (u32(1) << u32(3))
 flecs_iter_cache_match_indices :: (u32(1) << u32(4))
 flecs_iter_cache_variables ::     (u32(1) << u32(5))
 flecs_iter_cache_all ::           (255)

  ECS_MAX_COMPONENT_ID ::  (~(cast(u32)(ECS_ID_FLAGS_MASK>> 32)))
  ECS_MAX_RECURSION ::  (512)
  ECS_MAX_TOKEN_SIZE ::  (256)
  FLECS_ID0ID_ ::  0



