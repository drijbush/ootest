Module real_data_module

  !! Implements the methods for real data
  
  Use data_module, Only : data

  Implicit None

  Type, Extends( data ), Public :: real_data
     !! A data type for real data
   Contains
     ! Public Methods
     !...
     ! Private implementations
     Procedure, Private :: multiply => multiply_real
  End type real_data

  Private

Contains

  Function multiply_real( a, b ) Result( r )

    !! Multiply two real pieces of data together

    Implicit None

    Class(      data ), Allocatable :: r

    Class( real_data ), Intent( In ) :: a
    Class(      data ), Intent( In ) :: b

    Allocate( real_data :: r )
    
    r%rdata = a%rdata * b%rdata
    
  End Function multiply_real
  
  
End Module real_data_module
