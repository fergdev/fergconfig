// #include "../sketchybar.h"
// #include <mach/mach.h>
// #include <stdio.h>
// #include <stdlib.h>
// #include <unistd.h>
//
// int main(int argc, char **argv) {
//   float update_freq;
//   if (argc < 3 || (sscanf(argv[2], "%f", &update_freq) != 1)) {
//     printf("Usage: %s \"<event-name>\" \"<event_freq>\"\n", argv[0]);
//     exit(1);
//   }
//
//   char event_message[512];
//   snprintf(event_message, 512, "--add event '%s'", argv[1]);
//   sketchybar(event_message);
//
//   char trigger_message[512];
//   for (;;) {
//     mach_msg_type_number_t count = HOST_VM_INFO64_COUNT;
//     vm_statistics64_data_t vmstat;
//     if (host_statistics64(mach_host_self(), HOST_VM_INFO64,
//                           (host_info64_t)&vmstat, &count) != KERN_SUCCESS) {
//       printf("Error: Could not read memory statistics.\n");
//       exit(1);
//     }
//
//     uint64_t page_size;
//     host_page_size(mach_host_self(), &page_size);
//
//     uint64_t used =
//         (vmstat.active_count + vmstat.inactive_count + vmstat.wire_count) *
//         page_size;
//     uint64_t total =
//         (vmstat.active_count + vmstat.inactive_count + vmstat.wire_count +
//          vmstat.free_count) *
//         fprintf(stderr, "DEBUGPRINT[30]: memory_load.c:39: total=%d\n",
//         total);
//     page_size;
//     double used_percent = (int)((double)used / (double)total * 100);
//     fprintf(stderr, "DEBUGPRINT[31]: memory_load.c:44: used_percent=%f\n",
//             used_percent);
//
//     snprintf(trigger_message, 512,
//              "--trigger '%s' used='%d' total='%llu' percent='%f'", argv[1],
//              (int)(used / (1024 * 1024)), (total / (1024 * 1024)),
//              used_percent);
//     sketchybar(trigger_message);
//
//     usleep(update_freq * 1000000);
//   }
//   return 0;
// }

#include "../sketchybar.h"
#include <mach/mach.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char **argv) {
  float update_freq;
  if (argc < 3 || (sscanf(argv[2], "%f", &update_freq) != 1)) {
    printf("Usage: %s \"<event-name>\" \"<event_freq>\"\n", argv[0]);
    exit(1);
  }

  char event_message[512];
  snprintf(event_message, sizeof(event_message), "--add event '%s'", argv[1]);
  sketchybar(event_message);

  char trigger_message[512];
  for (;;) {
    mach_msg_type_number_t count = HOST_VM_INFO64_COUNT;
    vm_statistics64_data_t vmstat;
    if (host_statistics64(mach_host_self(), HOST_VM_INFO64,
                          (host_info64_t)&vmstat, &count) != KERN_SUCCESS) {
      fprintf(stderr, "Error: Could not read memory statistics.\n");
      exit(1);
    }

    uint64_t page_size;
    host_page_size(mach_host_self(), &page_size);
    uint64_t used = (vmstat.active_count + vmstat.wire_count) * page_size;

    uint64_t free =
        used + (vmstat.free_count + vmstat.speculative_count) * page_size;

    uint64_t total = used + free;

    double used_percent = ((double)used / (double)total) * 100.0;

    // Debug output (optional)
    // fprintf(stdout, "Used: %llu MB, Total: %llu MB, Used %%: %.1f\n",
    //         used / (1024 * 1024), total / (1024 * 1024), used_percent);

    snprintf(trigger_message, sizeof(trigger_message),
             "--trigger '%s' used='%d' total='%llu' percent='%.1f'", argv[1],
             (int)(used / (1024 * 1024)), (total / (1024 * 1024)),
             used_percent);
    sketchybar(trigger_message);

    usleep(update_freq * 1000000);
  }

  return 0;
}
