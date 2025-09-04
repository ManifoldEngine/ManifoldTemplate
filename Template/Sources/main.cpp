#include <Core/CoreFwd.h>
#include <OpenGL/OpenGLSystem.h>
#include <ManImGui/ManImGuiSystem.h>
          
#if !MANI_CONSOLE_APP && MANI_WINDOWS
#include <windows.h>
#endif

using namespace Mani;

#if MANI_CONSOLE_APP
int main(int argc, char** argv)
#else
int WinMain(
    _In_        HINSTANCE   hInstance, 
    _In_opt_    HINSTANCE   hPrevInstance, 
    _In_        LPSTR       lpCmdLine, 
    _In_        int         nShowCmd
)
#endif
{
    Application app;
    World& world = app.getWorld();
    world.createSystem<OpenGLSystem>();
#if MANI_DEBUG
    world.createSystem<ManImGuiSystem>();
#endif
    app.run();

    return EXIT_SUCCESS;
}