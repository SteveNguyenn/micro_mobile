/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import React, { useEffect, useState } from 'react';
import {
  AppRegistry,
  SafeAreaView,
  StatusBar,
  StyleSheet,
  Text,
  useColorScheme,
  Image,
  View,
  TouchableOpacity
} from 'react-native';

import {
  Colors,
} from 'react-native/Libraries/NewAppScreen';

import Toast from 'react-native-toast-message';
import YodyEmployeeBridge from './YodyEmployeeBridge';


const App = (props) => {
  const isDarkMode = useColorScheme() === 'dark';
  const [count, setCount] = useState(props["input"])

  const backgroundStyle = {
    backgroundColor: isDarkMode ? Colors.darker : Colors.lighter,
    height: '100%',
    width: '100%'
  };

  const showSuccessToast = () => {
    Toast.show({
      type: 'success',
      text1: 'Notification',
      text2: 'Login success👋'
    });
  }

  useEffect(() => {
  }, [])

  const loginCallBack = (result) => {
    showSuccessToast();
  }

  return (
    <SafeAreaView style={backgroundStyle}>
      <StatusBar barStyle={isDarkMode ? 'light-content' : 'dark-content'} />
      <View style={styles.contentStyle}>
        <Text style={{fontSize: 40, fontWeight: '600'}}>{count}</Text>
      </View>
      <View style={styles.header}>
            <Image style={styles.image} source={require('./yody_employee_assets/icons/flutter.webp')}/>
            <TouchableOpacity onPress={() => {
            }}>
                <TouchableOpacity onPress={() => {
                    YodyEmployeeBridge.close();
                }}>
                    <Image style={[styles.image, {width: 24, height: 24}]} source={require('./yody_employee_assets/icons/close.png')}/>
                </TouchableOpacity>
            </TouchableOpacity>
      </View>
      <View style={styles.floating}>
        <TouchableOpacity onPress={() => {
            setCount(count + 1)
        }}>
            <View style={styles.button}>
                <Text>+</Text>
            </View>
        </TouchableOpacity>
        <TouchableOpacity onPress={() => {
          YodyEmployeeBridge.update({"result": count})
        }}>
            <View style={styles.button}>
                <Text>Send</Text>
            </View>
        </TouchableOpacity>
      </View>
      <Toast />
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
    contentStyle: {
        flexDirection: 'column',
        padding: 16,
        justifyContent: 'center',
        alignItems: 'center',
        flex: 1,
    },
    floating: {
        bottom: 60,                                                    
        right: 24, 
        left: 24,
        position: 'absolute',  
        flexDirection: "row",
        justifyContent: "space-between",    
    },
    button: {
        width: 48,
        height: 48,
        borderRadius: 8,
        backgroundColor: '#588548',
        justifyContent: 'center',
        alignItems: 'center'
    }, 
    header: {
        left: 24,
        right: 24,
        top: 100,
        justifyContent: 'space-between',
        position: 'absolute',  
        flexDirection: 'row',
        alignItems: 'center'
    },
    image: {
        width: 60,
        height: 60,
        resizeMode: "contain",
    }
});

AppRegistry.registerComponent(
  'yody_employee',
  () => App
);