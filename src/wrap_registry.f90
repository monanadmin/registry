! wrap_hello.f90
module wrap_registry
  implicit none

  private
  public :: registry

  interface
    subroutine c_registry(name) bind(C, name="registry")
      use iso_c_binding, only: c_char
      character(kind=c_char), dimension(*) :: name
    end subroutine c_registry
  end interface

contains

  subroutine registry(name)
    use iso_c_binding, only: c_char, c_null_char
    character(len=*), intent(in) :: name

    character(kind=c_char), dimension(len(name)+1) :: c_name
    integer :: i
    
    do i = 1, len(name)
      c_name(i) = name(i:i)
    end do
    c_name(len(name)+1) = c_null_char

    call c_registry(c_name)
  end subroutine registry

end module wrap_registry
