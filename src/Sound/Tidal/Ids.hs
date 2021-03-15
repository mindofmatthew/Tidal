{-# LANGUAGE FlexibleInstances #-}

module Sound.Tidal.Ids where

{-
    Ids.hs - Polymorphic pattern identifiers
    Copyright (C) 2020, Alex McLean and contributors

    This library is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this library.  If not, see <http://www.gnu.org/licenses/>.
-}

-- | Typeclass for things that can be coerced to a string and used as an identifier.
-- | Similar to Show, but contrained to a small number of types and designed so that
-- | similar cases (such as 1 and "1") refer to the same object.
class ID a where
  toID :: a -> String

-- | Similar typeclass for cases where an optional list of ids is also appropriate.
class IDs a where
  toIDs :: a -> [String]

instance ID i => IDs [i] where
  toIDs = map toID

-- Integers and strings can both be used for functions which require a single ID
-- or potentially many IDs
instance ID Integer where
  toID i = show i

instance IDs Integer where
  toIDs i = [show i]

instance ID String where
  toID i = i

instance IDs String where
  toIDs i = [i]