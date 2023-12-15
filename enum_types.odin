package flecs

import "core:c"

World_Flags :: enum u32
{
    Quit_Workers = 1 << 0,
    Readonly = 1 << 1,
    Init = 1 << 2,
    Quit = 1 << 3,
    Fini = 1 << 4,
    Measure_Frame_Time = 1 << 5,
    Measure_System_Time = 1 << 6,
    Multi_Threaded = 1 << 7,
}

OS_API_Flags :: enum u32
{
    High_Resolution_Timer = 1 << 0,
    Log_With_Colors = 1 << 1,
    Log_With_Time_Stamp = 1 << 2,
    Log_With_Time_Delta = 1 << 3,
}

Entity_Flags :: enum u32
{
    Is_Id = 1 << 31,
    Is_Target = 1 << 30,
    Is_Traversable = 1 << 29,
}

Id_Flags :: enum u32
{
    On_Delete_Remove = 1 << 0,
    On_Delete_Delete = 1 << 1,
    On_Delete_Panic = 1 << 2,
    On_Delete_Mask = (On_Delete_Remove|On_Delete_Delete|On_Delete_Panic),

    On_Delete_Object_Remove = 1 << 3,
    On_Delete_Object_Delete = 1 << 4,
    On_Delete_Object_Panic = 1 << 5,
    On_Delete_Object_Mask = (On_Delete_Object_Remove|On_Delete_Object_Delete|On_Delete_Object_Panic),

    Exclusive = 1 << 6,
    Dont_Inherit = 1 << 7,
    Traversable = 1 << 8,
    Tag = 1 << 9,
    With = 1 << 10,
    Union = 1 << 11,
    Always_Override = 1 << 12,

    Has_On_Add = 1 << 15,
    Has_On_Remove = 1 << 16,
    Has_On_Set = 1 << 17,
    Has_Un_Set = 1 << 18,
    Event_Mask = (Has_On_Add|Has_On_Remove|Has_On_Set|Has_Un_Set),

    Marked_For_Delete = 1 << 30,
}

// Ignore utilities

Iterator_Flags :: enum u32
{
    Is_Valid = 1 << 0,
    No_Data = 1 << 1,
    Is_Instanced = 1 << 2,
    Has_Shared = 1 << 3,
    Table_Only = 1 << 4,
    Entity_Optional = 1 << 5,
    No_Results = 1 << 6,
    Ignore_This = 1 << 7,
    Match_Var = 1 << 8,
    Has_Cond_Set = 1 << 10,
    Profile = 1 << 11,
}

Event_Filter_Flags :: enum u32
{
    Table_Only = 1 << 8,
    No_On_Set = 1 << 16,
}

Filter_Flags :: enum u32
{
    Match_This = 1 << 1,
    Match_Only_This = 1 << 2,
    Match_Prefab = 1 << 3,
    Match_Disabled = 1 << 4,
    Match_Empty_Tables = 1 << 5,
    Match_Anything = 1 << 6,
    No_Data = 1 << 7,
    Is_Instanced = 1 << 8,
    Populate = 1 << 9,
    Has_Cond_Set = 1 << 10,
    Unresolved_By_Name = 1 << 11,
}

Table_Flags :: enum u32
{
    Has_Builtins = 1 << 1,
    Is_Prefab = 1 << 2,
    Has_Is_A = 1 << 3,
    Has_Child_Of = 1 << 4,
    Has_Pairs = 1 << 5,
    Has_Module = 1 << 6,
    Is_Disabled = 1 << 7,
    Has_Ctors = 1 << 8,
    Has_Dtors = 1 << 9,
    Has_Copy = 1 << 10,
    Has_Move = 1 << 11,
    Has_Union = 1 << 12,
    Has_Toggle = 1 << 13,
    Has_Overrides = 1 << 14,

    Has_On_Add = 1 << 15,
    Has_On_Remove = 1 << 16,
    Has_On_Set = 1 << 17,
    Has_Un_Set = 1 << 18,

    Has_Observed = 1 << 20,
    Has_Target = 1 << 21,

    Marked_For_Delete = 1 << 30,

    // Composites
    Has_Lifecycle = (Has_Ctors|Has_Dtors),
    Is_Complex = (Has_Lifecycle|Has_Union|Has_Toggle),
    Has_Add_Actions = (Has_Is_A|Has_Union|Has_Ctors|Has_On_Add|Has_On_Set),
    Has_Remove_Actions = (Has_Is_A|Has_Dtors|Has_On_Remove|Has_Un_Set),
}

Var_Kind :: enum
{
    Entity,
    Table,
    Any,
}

Table_EventKind :: enum c.int
{
    Triggers_For_Id,
    No_Triggers_For_Id,
}

Iter_Kind :: enum
{
    Eval_Condition,
    Eval_Tables,
    Eval_Chain,
    Eval_None,
}

Iter_Cache_Bits :: enum u32
{
    Ids = 1 << 0,
    Columns = 1 << 1,
    Sources = 1 << 2,
    Ptrs = 1 << 3,
    Match_Indices = 1 << 4,
    Variables = 1 << 5,
    All = 255,
}


InOut_Kind :: enum
{
    InOut_Default,
    InOut_None,
    InOut,
    In,
    Out,
}

Oper_Kind :: enum
{
    And,
    Or,
    Not,
    Optional,
    And_From,
    Or_From,
    Not_From,
}

Term_Id_Flags :: enum flags32_t
{
    Self = flags32_t(1) << 1,
    Up = flags32_t(1) << 2,
    Down = flags32_t(1) << 3,
    Traverse_All = flags32_t(1) << 4,
    Cascade = flags32_t(1) << 5,
    Parent = flags32_t(1) << 6,
    Is_Variable = flags32_t(1) << 7,
    Is_Entity = flags32_t(1) << 8,
    Is_Name = flags32_t(1) << 9,
    Filter = flags32_t(1) << 10,
    Traverse_Flags = (Up|Down|Traverse_All|Self|Cascade|Parent),
}

Term_Flags :: enum
{
    Match_Any = 1 << 0,
    Match_Any_Src = 1 << 1,
    Src_First_Eq = 1 << 2,
    Src_Second_Eq = 1 << 3,
    Transitive = 1 << 4,
    Reflexive = 1 << 5,
    Id_Inherited = 1 << 6,
}


Query_EventKind :: enum
{
    Table_Match,
    Table_Rematch,
    Table_Unmatch,
    Orphan,
}

Type_Kind :: enum
{
    Primitive_Type,
    Bitmask_Type,
    Enum_Type,
    Struct_Type,
    Array_Type,
    Vector_Type,
    Opaque_Type,
    Type_Kind_Last = Vector_Type,
}


HTTP_Method :: enum
{
    Get,
    Post,
    Put,
    Delete,
    Options,
    Method_Unsupported,
}


Meta_Type_Op_Kind :: enum
{
    Array,
    Vector,
    Opaque,
    Push,
    Pop,
    Scope,
    Enum,
    Bitmask,
    Primitive,
    Bool,
    Char,
    Byte,
    U8,
    U16,
    U32,
    U64,
    I8,
    I16,
    I32,
    I64,
    F32,
    F64,
    UPtr,
    IPtr,
    String,
    Entity,
    Meta_Type_Op_Kind_Last = Entity,
}

Primitive_Kind :: enum
{
    Bool = 1,
    Char,
    Byte,
    U8,
    U16,
    U32,
    U64,
    I8,
    I16,
    I32,
    I64,
    F32,
    F64,
    UPtr,
    IPtr,
    String,
    Entity,
    Primitive_Kind_Last = Entity,
}


Cmd_Kind :: enum
{
    Cmd_Clone,
    Cmd_Bulk_New,
    Cmd_Add,
    Cmd_Remove,   
    Cmd_Set,
    Cmd_Emplace,
    Cmd_Mut,
    Cmd_Modified,
    Cmd_Modified_No_Hook,
    Cmd_Add_Modified,
    Cmd_Path,
    Cmd_Delete,
    Cmd_Clear,
    Cmd_On_Delete_Action,
    Cmd_Enable,
    Cmd_Disable,
    Cmd_Event,
    Cmd_Skip
}
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



Mixin_Kind :: enum c.int
{
    World,
    Entity,
    Observable,
    Iterable,
    Dtor,
    Max,
}

Rule_Op_Kind :: enum
{
    And,
    And_Id,
    With,
    And_Any,
    Trav,
    Ids_Right,
    Ids_Left,
    Each,
    Store,
    Union,
    End,
    Not,
    Pred_Eq,
    Pred_Neq,
    Pred_Eq_Name,
    Pred_Neq_Name,
    Pred_Eq_Match,
    Pred_Neq_Match,
    Set_Vars,
    Set_This,
    Set_Fixed,
    Set_Ids,
    Contain,
    Pair_Eq,
    Set_Cond,
    Jmp_Cond_False,
    Jmp_Not_Set,
    Yield,
    Nothing,
}

Query_Flags :: enum u32
{
    Has_Refs = 1 << 1,
    Is_Subquery = 1 << 2,
    Is_Orphaned = 1 << 3,
    Has_Out_Columns = 1 << 4,
    Has_Monitor = 1 << 5,
    Trivial_Iter = 1 << 6,
}

Aperiodic_Action_Flags :: enum u32
{
    Empty_Tables = 1 << 1,
    Component_Monitors = 1 << 2,
    Empty_Queries = 1 << 4,
}


/// Actions that drive iteration
Iter_Actions :: enum
{
    NextYield = 0, // Move onto next table, yield current
    Yield = -1, // Stay on current table, yield
    Next = 1, // Move to next table, don't yield
}