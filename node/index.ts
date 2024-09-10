import { EventEmitter } from 'node:events';

class MyEmitter extends EventEmitter { }

export const emitterInstance = new MyEmitter();

export default (eventName: string, callback: () => void) => {
  emitterInstance.on(eventName, callback)
}
