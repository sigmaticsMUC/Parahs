module Routes.Types(
  Type,
  string,
  double,
  int,
  float,
  json,
  xml,
  stringList,
  doubleList,
  intList,
  floatList
)where


type Type = String


string :: Type
{-# INLINE string #-}
string = "STRING"

double :: Type
{-# INLINE double #-}
double = "DOUBLE"

int :: Type
{-# INLINE int #-}
int = "INTEGER"

float :: Type
{-# INLINE float #-}
float = "FLOAT"

json :: Type
{-# INLINE json #-}
json = "JSON"

xml :: Type
{-# INLINE xml #-}
xml = "XML"

stringList :: Type
{-# INLINE stringList #-}
stringList = "LIST|STRING"

doubleList :: Type
{-# INLINE doubleList #-}
doubleList = "LIST|DOUBLE"

intList :: Type
{-# INLINE intList #-}
intList = "LIST|INTEGER"

floatList :: Type
{-# INLINE floatList #-}
floatList = "LIST|FLOAT"
