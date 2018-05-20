
target_compile_definitions(platform INTERFACE SCP_ANDROID)

set(PLATFORM_ANDROID TRUE CACHE INTERNAL "" FORCE)

MESSAGE("BUILDING FOR ANDROID")

if(${ANDROID_ABI} STREQUAL "armeabi-v7a")
    include_directories(${ANDROID_SYSROOT}/usr/include/arm-linux-androideabi)
elseif(${ANDROID_ABI} STREQUAL "arm64-v8a")
    include_directories(${ANDROID_SYSROOT}/usr/include/aarch64-linux-android)
else()
    include_directories(${ANDROID_SYSROOT}/usr/include/arm-linux-androideabi)
endif()

set(sdlDir "${CMAKE_CURRENT_LIST_DIR}/../lib/android/contrib/SDL2-2.0.8")
add_subdirectory(${sdlDir} EXCLUDE_FROM_ALL)
#set(SDL2_LIBRARY "")
#set(SDL2_INCLUDE_DIRS "${CMAKE_CURRENT_LIST_DIR}/lib/android/contrib/SDL2-2.0.8/include/")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -fno-rtti -fno-exceptions -Wall")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-c++11-narrowing")

message(CMAKE_C_FLAGS ${CMAKE_C_FLAGS})
message(CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS})
message(CMAKE_C_COMPILER ${CMAKE_C_COMPILER})
message(CMAKE_CXX_COMPILER ${CMAKE_CXX_COMPILER})
