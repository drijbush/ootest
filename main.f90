Program test

  Use container_module

  Implicit None

  Type( container ) :: A
  Type( container ) :: B

  Call A%create( .False. )
  Call B%create( .True.  )

  Call A%put( 1.0 )
  Call B%put( ( 2.0, 3.0 ) )

  Call A%print
  Call B%print
  
End Program test
