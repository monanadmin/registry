program Registry_f90
   use wrap_registry, only: registry
   implicit none
   character(len=256) :: arg
  
   call get_command_argument(1, arg)

  call registry(trim(arg))
  
end program Registry_f90