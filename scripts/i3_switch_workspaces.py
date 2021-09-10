import asyncio
from i3ipc.aio import Connection

DISPLAY_RIGHT = "DisplayPort-3"
DISPLAY_LEFT = "DisplayPort-2"

workspace_map = {
    '0':  DISPLAY_LEFT,
    '1':  DISPLAY_RIGHT,
    '2':  DISPLAY_RIGHT,
    '3':  DISPLAY_RIGHT,
    '4':  DISPLAY_RIGHT,
    '5':  DISPLAY_RIGHT,
    '6':  DISPLAY_LEFT,
    '7':  DISPLAY_LEFT,
    '8':  DISPLAY_LEFT,
    '9':  DISPLAY_LEFT,
}

async def main():
    i3 = await Connection().connect()

    for workspace, display in workspace_map.items():
        await i3.command('workspace ' + workspace)
        await i3.command('move workspace to output ' + display)



asyncio.run(main())
