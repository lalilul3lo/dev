import { describe, mock, test } from 'node:test';
import { strict as assert } from 'node:assert';

import registerEvent, { emitterInstance } from './index'

describe('registerEvent()', () => {
  test('it should register an event and invoke callback when event is emitted', () => {
    const callback = mock.fn();

    registerEvent('greet', callback);

    emitterInstance.emit('greet')

    assert.strictEqual(callback.mock.callCount(), 1)
  })
})

