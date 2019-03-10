Module data_module

  Use container_module, Only : container

  Implicit None

  Type, Extends( container ), Public, Abstract :: data
   Contains
     ! Public Methods
     Generic                                  , Public :: Operator( * ) => multiply
     ! Private implementations
     Procedure( multiply_interface ), Deferred, Private :: multiply
  End type data

  Private

  Abstract Interface
     Function multiply_interface( a, b ) Result( r )
       Import data
       Implicit None
       Class( data ), Allocatable :: r
       Class( data ), Intent( In ) :: a
       Class( data ), Intent( In ) :: b
     End Function multiply_interface
  End Interface
  
End Module data_module
