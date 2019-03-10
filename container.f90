Module container_module

  Implicit None
  
  Type, Public, Abstract :: container
     Real   , Allocatable, Public :: rdata
     Complex, Allocatable, Public :: cdata
   Contains
     ! Public Methods
     Procedure, Public  :: create
     Generic  , Public  :: put => put_real, put_complex
     Generic  , Public  :: get => get_real, get_complex
     Procedure, Public  :: print
     ! Private implementations
     Procedure, Private :: put_real
     Procedure, Private :: put_complex
     Procedure, Private :: get_real
     Procedure, Private :: get_complex
  End type container

  Private

Contains

  Subroutine create( c, is_complex )

    Class( container ), Intent(   Out ) :: c
    Logical           , Intent( In    ) :: is_complex

    ! Init to silly values?
    If( is_complex ) Then
       Allocate( c%cdata )
    Else
       Allocate( c%rdata )
    End If

  End Subroutine create

    Subroutine put_real( c, data )

    Class( container ), Intent( InOut ) :: c
    Real              , Intent( In    ) :: data

    c%rdata = data
    
  End Subroutine put_real
  
  Subroutine put_complex( c, data )

    Class( container ), Intent( InOut ) :: c
    Complex           , Intent( In    ) :: data

    ! Should check for putting into wrong type
    c%cdata = data

  End Subroutine put_complex
    
  Subroutine get_real( c, data )

    Class( container ), Intent( InOut ) :: c
    Real              , Intent(   Out ) :: data

    data = c%rdata
    
  End Subroutine get_real
  
  Subroutine get_complex( c, data )

    Class( container ), Intent( InOut ) :: c
    Complex           , Intent(   Out ) :: data

    data = c%cdata
    
  End Subroutine get_complex

  Subroutine print( c, title )
  
    Class( container )  , Intent( In )           :: c
    Character( Len = * ), Intent( In ), Optional :: title

    If( Present( title ) ) Then
       Write( *, * ) 'Data for ', title
    End If
    
    If( Allocated( c%rdata ) ) Then
       Write( *, * ) 'rdata = ', c%rdata
    End If

    If( Allocated( c%cdata ) ) Then
       Write( *, * ) 'cdata = ', c%cdata
    End If

  End Subroutine print

End Module container_module

