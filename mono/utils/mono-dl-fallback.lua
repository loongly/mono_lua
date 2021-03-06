
require('mono.utils.mono-publib')
ffi.cdef [[

enum {
	MONO_DL_EAGER = 0,
	MONO_DL_LAZY  = 1,
	MONO_DL_LOCAL = 2,
	MONO_DL_MASK  = 3
};

/*
 * This is the dynamic loader fallback API
 */
typedef struct MonoDlFallbackHandler MonoDlFallbackHandler;

/*
 * The "err" variable contents must be allocated using g_malloc or g_strdup
 */
typedef void* (*MonoDlFallbackLoad) (const char *name, int flags, char **err, void *user_data);
typedef void* (*MonoDlFallbackSymbol) (void *handle, const char *name, char **err, void *user_data);
typedef void* (*MonoDlFallbackClose) (void *handle, void *user_data);

MonoDlFallbackHandler *mono_dl_fallback_register (MonoDlFallbackLoad load_func, MonoDlFallbackSymbol symbol_func,
						  MonoDlFallbackClose close_func, void *user_data);

void                   mono_dl_fallback_unregister (MonoDlFallbackHandler *handler);
]]