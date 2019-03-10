Module data_module

  !! Abstract type for storing real or complex data and the operations that can be applied
  
  Use container_module, Only : container

  Implicit None

  Type, Extends( container ), Public, Abstract :: data
     !! Abstract type to hold the data and associated operations
   Contains
     ! Public Methods
     Generic                                  , Public :: Operator( * ) => multiply
     ! Private implementations
     Procedure( multiply_interface ), Deferred, Private :: multiply
  End type data

  Private

  Abstract Interface
     Function multiply_interface( a, b ) Result( r )
       !! Interface for multiplying two pieces of data together
       Import data
       Implicit None
       Class( data ), Allocatable :: r
       Class( data ), Intent( In ) :: a
       Class( data ), Intent( In ) :: b
     End Function multiply_interface
  End Interface
  
End Module data_module
