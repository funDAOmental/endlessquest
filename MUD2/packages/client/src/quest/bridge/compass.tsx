
const uint64_max = BigInt('18446744073709551615'); //new BN('0xffffffffffffffff', 16);

export interface Compass {
  north: number
  east: number
  west: number
  south: number
}

export const mask_Dir = uint64_max
export const mask_North = (mask_Dir << 192n)
export const mask_East = (mask_Dir << 128n)
export const mask_West = (mask_Dir << 64n)
export const mask_South = mask_Dir

export const coordToCompass = (coord: bigint): Compass => {
  return {
    north: Number((coord >> 192n) & mask_Dir),
    east: Number((coord >> 128n) & mask_Dir),
    west: Number((coord >> 64n) & mask_Dir),
    south: Number(coord & mask_Dir),
  }
}

const slugSeparator = ',';
export const compassToSlug = (compass: Compass, separator = true): string => {
  let result = '';
  result += (compass.south > 0 ? `S${compass.south}` : `N${compass.north ?? 0}`);
  if (separator) result += slugSeparator;
  result += (compass.west > 0 ? `W${compass.west}` : `E${compass.east ?? 0}`);
  return result;
}

export const coordToSlug = (coord: bigint): string => {
  return compassToSlug(coordToCompass(coord))
}