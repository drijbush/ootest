Module ks_array_module

  Use ks_data_module, Only : ks_data

  Implicit None

  Type, Public :: ks_array
     Type( ks_data ), Dimension( : ), Allocatable :: ks
   Contains
     ! Public Methods
     Procedure, Public  :: create
     Generic  , Public  :: Operator( * ) => mult_ks_by_ks
     Generic  , Public  :: put           => put_real, put_complex
     Generic  , Public  :: get           => get_real, get_complex
     Procedure, Public  :: print
     ! Private implementations
     Procedure, Private :: mult_ks_by_ks
     Procedure, Private :: put_real, put_complex
     Procedure, Private :: get_real, get_complex
  End type ks_array

  Private

Contains

   Subroutine create( a, is_complex )

    Class( ks_array ),                 Intent(   Out ) :: a
    Logical          , Dimension( : ), Intent( In    ) :: is_complex

    Integer :: n_ks
    Integer :: ks

    n_ks = Size( is_complex )

    Allocate( a%ks( 1:n_ks ) )

    Do ks = 1, n_ks
       Call a%ks( ks )%create( is_complex( ks ) )
    End Do
    
  End Subroutine create

  Function mult_ks_by_ks( a, b ) Result( r )

    Implicit None
    Type ( ks_array ), Allocatable :: r
    Class( ks_array ), Intent( In ) :: a
    Type ( ks_array ), Intent( In ) :: b

    Integer :: n_ks
    Integer :: ks

    Allocate( r )
    Allocate( r%ks, source = a%ks )

    n_ks = Size( r%ks )

    Do ks = 1, n_ks
       r%ks( ks ) = a%ks( ks ) * b%ks( ks )
    End Do
    
  End Function mult_ks_by_ks

  Subroutine put_real( a, ks, v )

    Class( ks_array ), Intent( InOut ) :: a
    Integer          , Intent( In    ) :: ks
    Real             , Intent( In    ) :: v

    Call a%ks( ks )%put( v )

  End Subroutine put_real
  
  Subroutine put_complex( a, ks, v )

    Class( ks_array ), Intent( InOut ) :: a
    Integer          , Intent( In    ) :: ks
    Complex          , Intent( In    ) :: v

    Call a%ks( ks )%put( v )

  End Subroutine put_complex
  
  Subroutine get_real( a, ks, v )

    Class( ks_array ), Intent( InOut ) :: a
    Integer          , Intent( In    ) :: ks
    Real             , Intent(   Out ) :: v

    Call a%ks( ks )%get( v )

  End Subroutine get_real
  
  Subroutine get_complex( a, ks, v )

    Class( ks_array ), Intent( InOut ) :: a
    Integer          , Intent( In    ) :: ks
    Complex          , Intent(   Out ) :: v

    Call a%ks( ks )%get( v )

  End Subroutine get_complex

  Subroutine print( a, title )

    Class( ks_array )   , Intent( In )           :: a
    Character( Len = * ), Intent( In ), Optional :: title

    Integer :: n_ks
    Integer :: ks

    If( Present( title ) ) Then
       Write( *, * ) 'Data for array ', title
    End If

    n_ks = Size( a%ks )
    Do ks = 1, n_ks
       Call a%ks( ks )%print
    End Do

  End Subroutine print
  
End Module ks_array_module
