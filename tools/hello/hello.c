#include <stdlib.h>
#include <stdio.h>
#include <mruby.h>
#include <mruby/irep.h>
#include <mruby/array.h>

int main(int argc, char *argv[])
{
  mrb_state *mrb;
  mrb_value ARGV;
  mrb_value rtn;
  int i;
  int return_value;

  mrb  = mrb_open();
  ARGV = mrb_ary_new_capa(mrb, argc);

  for (i = 0; i < argc; i++) {
    mrb_ary_push(mrb, ARGV, mrb_str_new_cstr(mrb, argv[i]));
  }
  mrb_define_global_const(mrb, "ARGV", ARGV);

  rtn = mrb_funcall(mrb, mrb_top_self(mrb), "__main__", 1, ARGV);

  return_value = EXIT_SUCCESS;

  if (mrb->exc) {
    mrb_print_error(mrb);
  }
  mrb_close(mrb);

  return return_value;
}
