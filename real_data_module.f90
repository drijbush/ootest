Module real_data_module

  Use data_module, Only : data

  Implicit None

  Type, Extends( data ), Public :: real_data
   Contains
     ! Public Methods
     !...
     ! Private implementations
     Procedure, Private :: multiply => multiply_real
  End type real_data

  Private

Contains

  Function multiply_real( a, b ) Result( r )

    Implicit None

    Class(      data ), Allocatable :: r

    Class( real_data ), Intent( In ) :: a
    Class(      data ), Intent( In ) :: b

    Allocate( real_data :: r )
    
    r%rdata = a%rdata * b%rdata
    
  End Function multiply_real
  
  
End Module real_data_module
