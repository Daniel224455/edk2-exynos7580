#include <PiDxe.h>
#include <Library/KeypadDeviceHelperLib.h>

UINTN gBitmapScanCodes[BITMAP_NUM_WORDS(MAX_SCANCODE)] = {0};
UINTN gBitmapUnicodeChars[BITMAP_NUM_WORDS(MAX_UNCODE_CHAR)] = {0};
