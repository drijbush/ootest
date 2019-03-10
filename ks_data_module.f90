Module ks_data_module

  Use         data_module, Only :         data
  Use    real_data_module, Only :    real_data
  Use complex_data_module, Only : complex_data

  Implicit None
  
  Type, Public ::  ks_data
     ! Wrapper for data types so that each member of an array of these
     ! things can have a different dynamic type
     Class( data ), Allocatable, Private :: ks
   Contains
     ! Public Methods
     Generic  , Public  :: Operator( * ) => mult_ks_by_ks
     Procedure, Public  :: create
     Generic  , Public  :: put => put_real, put_complex
     Generic  , Public  :: get => get_real, get_complex
     Procedure, Public  :: print
     ! Private implementations
     Procedure, Private :: mult_ks_by_ks
     Procedure, Private :: put_real, put_complex
     Procedure, Private :: get_real, get_complex
  End type ks_data

  Private

Contains

  Subroutine create( a, is_complex )

    Class( ks_data ), Intent(   Out ) :: a
    Logical         , Intent( In    ) :: is_complex

    If( is_complex ) Then
       Allocate( complex_data :: a%ks )
    Else
       Allocate( real_data :: a%ks )
    End If
    
    Call a%ks%create( is_complex )
    
  End Subroutine create

  Function mult_ks_by_ks( a, b ) Result( r )

    Implicit None
    Type ( ks_data ), Allocatable :: r
    Class( ks_data ), Intent( In ) :: a
    Type ( ks_data ), Intent( In ) :: b

    Allocate( r )
    Allocate( r%ks, source = a%ks )

    r%ks = a%ks * b%ks
    
  End Function mult_ks_by_ks

  Subroutine put_real( a, v )

    Class( ks_data ), Intent( InOut ) :: a
    Real            , Intent( In    ) :: v

    Call a%ks%put( v )
    
  End Subroutine put_real
  
  Subroutine put_complex( a, v )

    Class( ks_data ), Intent( InOut ) :: a
    Complex         , Intent( In    ) :: v

    Call a%ks%put( v )
    
  End Subroutine put_complex
  
  Subroutine get_real( a, v )

    Class( ks_data ), Intent( InOut ) :: a
    Real            , Intent(   Out ) :: v

    Call a%ks%get( v )
    
  End Subroutine get_real
  
  Subroutine get_complex( a, v )

    Class( ks_data ), Intent( InOut ) :: a
    Complex         , Intent(   Out ) :: v

    Call a%ks%get( v )
    
  End Subroutine get_complex

  Subroutine print( a, title )

    Class( ks_data )    , Intent( In )           :: a
    Character( Len = * ), Intent( In ), Optional :: title

    If( Present( title ) ) Then
       Call a%ks%print( title )
    Else
       Call a%ks%print
    End If
    
  End Subroutine print
  
End Module ks_data_module
