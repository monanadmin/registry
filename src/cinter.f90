module cinter
   implicit none
   
   private
   public :: c_registry

   interface
      subroutine registry(file_name) bind(C, file_name="Registry_processed.xml")
      use iso_c_binding, only: c_char
      character(kind=c_char), dimension(*) :: file_name
    end subroutine registry
   end interface

contains

   subroutine c_registry(file_name)
      use iso_c_binding, only: c_char, c_null_char
      character(len=*), intent(in) :: file_name

      character(kind=c_char), dimension(len(name)+1) :: c_file_name
      integer :: i

      do i = 1, len(file_name)
         c_file_name(i) = file_name(i:i)
      end do
      c_file_name(len(file_name)+1) = c_null_char

      call registry(c_file_name)

   end subroutine c_registry

end module cinter