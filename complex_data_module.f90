Module complex_data_module

  Use data_module, Only : data

  Implicit None

  Type, Extends( data ), Public :: complex_data
   Contains
     ! Public Methods
     !...
     ! Private implementations
     Procedure, Private :: multiply => multiply_complex
  End type complex_data

  Private

Contains

  Function multiply_complex( a, b ) Result( r )

    Implicit None

    Class(         data ), Allocatable :: r

    Class( complex_data ), Intent( In ) :: a
    Class(         data ), Intent( In ) :: b

    Allocate( complex_data :: r )
    
    r%cdata = a%cdata * b%cdata
    
  End Function multiply_complex
  
  
End Module complex_data_module
