package flecs

import "core:c"

WorldFlags :: enum uint
{
    QuitWorkers = 1 << 0,
    Readonly = 1 << 1,
    Init = 1 << 2,
    Quit = 1 << 3,
    Fini = 1 << 4,
    MeasureFrameTime = 1 << 5,
    MeasureSystemTime = 1 << 6,
    MultiThreaded = 1 << 7,
}

OSApiFlags :: enum uint
{
    HighResolutionTimer = 1 << 0,
    LogWithColors = 1 << 1,
    LogWithTimeStamp = 1 << 2,
    LogWithTimeDelta = 1 << 3,
}

EntityFlags :: enum uint
{
    IsId = 1 << 31,
    IsTarget = 1 << 30,
    IsTraversable = 1 << 29,
}

IdFlags :: enum uint
{
    OnDeleteRemove = 1 << 0,
    OnDeleteDelete = 1 << 1,
    OnDeletePanic = 1 << 2,
    OnDeleteMask = (OnDeletePanic|OnDeleteRemove|OnDeleteDelete),
    
    OnDeleteObjectRemove = 1 << 3,
    OnDeleteObjectDelete = 1 << 4,
    OnDeleteObjectPanic = 1 << 5,
    OnDeleteObjectMask = (OnDeleteObjectPanic|OnDeleteObjectRemove|OnDeleteObjectDelete),

    Exclusive = 1 << 6,
    DontInherit = 1 << 7,
    Traversable = 1 << 8,
    Tag = 1 << 9,
    With = 1 << 10,
    Union = 1 << 11,
    AlwaysOverride = 1 << 12,
    HasOnAdd = 1 << 16, // Same values as table flags
    HasOnRemove = 1 << 17,
    HasOnSet = 1 << 18,
    HasUnSet = 1 << 19,
    HasOnTableFill  = 1 << 2,
    HasOnTableEmpty = 1 << 2,
    HasOnTableCreate = 1 << 2,
    HasOnTableDelete = 1 << 2,
    EventMask = (HasOnAdd|HasOnRemove|HasOnSet|HasUnSet|HasOnTableFill|HasOnTableEmpty|HasOnTableCreate|HasOnTableDelete),

    MarkedForDelete = 1 << 30,
}

IterFlags :: enum uint
{
    IsValid = 1 << 0,
    NoData = 1 << 1,
    IsInstanced = 1 << 2,
    HasShared = 1 << 3,
    TableOnly = 1 << 4,
    EntityOptional = 1 << 5,
    NoResults = 1 << 6,
    IgnoreThis = 1 << 7,
    MatchVar = 1 << 8,
    HasCondSet = 1 << 10, 
    Profile = 1 << 11, 
}

EventFlags :: enum uint
{
    TableOnly = 1 << 4,
    NoOnSet = 1 << 16,
}

FilterFlags :: enum uint
{
    MatchThis = 1 << 1,
    MatchOnlyThis = 1 << 2,
    MatchPrefab = 1 << 3,
    MatchDisabled = 1 << 4,
    MatchEmptyTables = 1 << 5,
    MatchAnything = 1 << 6,
    NoData = 1 << 7,
    IsInstanced = 1 << 8,
    Populate = 1 << 9,
    HasCondSet = 1 << 10, 
    UnresolvedByName = 1 << 11, 
    HasPred = 1 << 12, 
    HasScopes = 1 << 13, 
}

TableFlags :: enum uint
{
    HasBuiltins = 1 << 1,
    IsPrefab = 1 << 2,
    HasIsA = 1 << 3,
    HasChildOf = 1 << 4,
    HasName = 1 << 5,
    HasPairs = 1 << 6,
    HasModule = 1 << 7,
    IsDisabled = 1 << 8,
    HasCtors = 1 << 9,
    HasDtors = 1 << 10,
    HasCopy = 1 << 11,
    HasMove = 1 << 12,
    HasUnion = 1 << 13,
    HasToggle = 1 << 14,
    HasOverrides = 1 << 15,

    HasOnAdd = 1 << 16,
    HasOnRemove = 1 << 17,
    HasOnSet = 1 << 18,
    HasUnSet = 1 << 19,

    HasOnTableFill = 1 << 20,
    HasOnTableEmpty = 1 << 21,
    HasOnTableCreate = 1 << 22,
    HasOnTableDelete = 1 << 23,
    HasTraversable = 1 << 25,
    HasTarget = 1 << 26,

    HasObserved = 1 << 20,
    MarkedForDelete = 1 << 30,

    HasLifecycle = (HasCtors | HasDtors),
    IsComplex = (HasLifecycle | HasUnion | HasToggle),
    HasAddActions = (HasIsA | HasUnion | HasCtors | HasOnAdd | HasOnSet),
    HasRemoveActions = (HasIsA | HasDtors | HasOnRemove | HasUnSet),
}

QueryFlags :: enum uint
{
    HasRefs = 1 << 1,
    IsSubquery = 1 << 2,
    IsOrphaned = 1 << 3,
    HasOutTerms = 1 << 4,
    HasNonThisOutTerms = 1 << 5,
    HasMonitor = 1 << 6,
    TrivialIter = 1 << 7,
}

AperiodicFlags :: enum uint
{
    EmptyTables = 1 << 1,
    ComponentMonitors = 1 << 2,
    EmptyQueries = 1 << 4,
}