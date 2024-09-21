import * as Lab from '@hapi/lab';
import { expect } from '@hapi/code';
import subject from '.';

const lab = Lab.script();
const { describe, it } = lab;
export { lab };

describe('subject', () => {
  it('should add to integers', async () => {
    expect(subject(40, 2)).to.equal(42);
  });
});
