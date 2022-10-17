import { newData } from '../generated/DataMapping/DataMapping'
import { Data } from '../generated/schema'

export function handleNewData(event: newData): void {
  let data = new Data(event.params.id.toHex());
  data.data=event.params.data.toI32();
  data.save()
}