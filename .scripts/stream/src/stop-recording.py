#!/usr/bin/env python
import asyncio
import simpleobsws
import time

loop = asyncio.get_event_loop()
ws = simpleobsws.obsws(host='127.0.0.1', port=4444) # Every possible argument has been passed, but none are required. See lib code for defaults.

async def stop_recording():
    await ws.connect() # Make the connection to OBS-Websocket
    retry_count = 0
    while True:
        result = await ws.call('StopRecording')
        print(result)
        if result['status'] == 'ok':
            break
        retry_count = retry_count + 1
        if retry_count == 10:
            break
        time.sleep(0.5)

    await ws.disconnect() # Clean things up by disconnecting. Only really required in a few specific situations, but good practice if you are done making requests or listening to events.

loop.run_until_complete(stop_recording())
