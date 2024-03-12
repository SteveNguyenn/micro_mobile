import { NativeModules, NativeEventEmitter } from 'react-native';
const { YodyFoodBridge } = NativeModules;
export default YodyFoodBridge;
export const YodyFoodEmitter = new NativeEventEmitter(YodyFoodBridge);
export const YodyFoodCallEvent = {
    
};