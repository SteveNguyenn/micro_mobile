import { NativeModules, NativeEventEmitter } from 'react-native';
const { YodyEmployeeBridge } = NativeModules;
export default YodyEmployeeBridge;
export const YodyEmployeeEmitter = new NativeEventEmitter(YodyEmployeeBridge);
export const YodyEmployeeCallEvent = {
    
};