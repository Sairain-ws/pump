//
//  ContentView1.swift
//  pump
//
//  Created by 驼人集团 on 2024/6/17.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isAgreed = false
    @State private var imageName: String = "weigouxuan"
    
    var body: some View {
        VStack(spacing: 100) {
           
            HStack()
            {
                VStack(alignment: .leading) {
                    Text("用户登录")
                        .font(.title)
                        .foregroundColor(Color("Blue"))
                    Text("欢迎使用中央监护管理系统")
                        .font(.headline)
                }.padding(20)
                Spacer()
            }
            
            HStack()
            {
                VStack(spacing: 50.0){
                    HStack(){
                        VStack(spacing: 20.0){
                            TextField("手机号码", text: $username)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)
                                .keyboardType(.numberPad)
                            SecureField("密码", text: $password)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)
                        }
                    }
                    HStack(){
                        VStack(spacing: 10.0){
                            Button(action: {
                                // 登录操作
                            }) {
                                Text("登录")
                                    .foregroundColor(.white)
                                    .frame(width: 300.0, height: 48)
                                    .background(Color("Blue"))
                                    .disabled(!isAgreed || username.count == 0 || password.count == 0)
                            }.cornerRadius(30)
                            
                            Text("无法登录时请联系医院管理员")
                                .foregroundColor(.gray)
                                .font(.caption)
                                .padding(.bottom)
                        }
                    }
                }
            }
            
            HStack(alignment: .bottom) {
                Button(action: {
                    // 按钮点击时执行的操作
                    print("按钮被点击");
                    imageName = imageName == "weigouxuan" ? "gouxuan" : "weigouxuan"
                }) {
                    Image(imageName) // 假设你在Assets中有一个名为buttonImage的图片
                        .resizable() // 使图片可调整大小
                        .frame(width: 25, height: 25) // 设置图片的大小
                        .cornerRadius(0) // 设置图片的圆角
                }
                
                Text("我已阅读并同意").font(Font.custom("Arial", size: 12)).lineLimit(1)
                Button(action: {
                    print("打开免责声明666");
                }){
                    Text("《用户协议与免责声明》")
                        .font(Font.custom("Arial", size: 12)).lineLimit(1)
                }
            }.padding(0)
        }
        .padding()
        .onAppear {
            UINavigationBar.appearance().isHidden = true
        }
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    // 颜色资源
    private var colors: [String: Color] {
        return [
            "Blue": SwiftUI.Color(red: 0.00, green: 0.28, blue: 1.00),
        ]
    }
    
    // 颜色属性
    private var Color: (String) -> Color {
        return { key in
            self.colors[key] ?? .black
        }
    }
}
