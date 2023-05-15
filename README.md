# hci_parking

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Finding A Parking Space
examples: https://handonghci.github.io/Courses/StudentProjects/HCI.html
### 1. Members
    김종순 박두현 안지원 옥준용 우욕균 임건호
### 2. Representative image (대표 이미지)
### 3. Background
#### 3-1 problems
    Since the COVID-19 situation has come to an end, a lot of students have returned to school 
    and the number of vehicles increased accordingly. Therefore, an insufficient parking lot 
    problem aroused. To solve this problem, we came up with the idea to show up parking spaces for 
    the users so that they can park more efficiently.The problem is that there are not enough 
    parking spaces to accommodate the increase in vehicles, which is causing inconvenience for 
    students, faculty, and staff. This problem is impacting the school's operations, as it is 
    creating delays and frustration for those who are unable to find a parking space, especially in 
    the crowded morning.
#### 3-2 existing cases, examples, similar studies
    There are already various services available that provide real-time parking space information. 
    Some well-known examples include "ParkWhiz", "SpotHero", "ParkMobile", and "ParkMe". These 
    services provide information on available parking spots and allow users to reserve a parking 
    space in their desired location. Companies such as "Park Assist" and "Smart Parking" use 
    cameras within parking lots to detect available parking spaces in real-time and provide this 
    information to users.
    In addition to providing real-time parking space information, there are also similar studies 
    being conducted. For example, "ParkNet" is a research project that uses deep learning models 
    for real-time parking space detection. The model detects available parking spaces based on the 
    video input from cameras in the parking lot.
    "ParkEyes" is another service that combines cameras, IoT sensors, and AI technology to provide 
    real-time information on the location of parked cars and available parking spaces within a 
    parking lot. This service helps users easily find their parked car within the parking lot.
    By referring to similar approaches used in these existing cases, this project can be developed 
    further.
#### 3-3 objectives
    The goal of this project is to create a parking service that enables drivers to easily
    locate available parking spots in Handong Global University's parking lots. This service aims
    to reduce the time and effort required for drivers to find a parking spot upon arrival.

### 4. Methods
#### 4-1 Target user
    Our target users are Handong students and faculty who use the Handong Smart campus 
    application and drive to school and look for a parking space in the crowded morning. The 
    Handong Smart campus application, which all Handong students use, allows students to access 
    diverse information in Handong. Since every Handong student has access to this application, it 
    will be great for our service to provide parking information through this existing 
    application. Through this application, we can solve the lack of parking lots.
#### 4-2 technologies
    AI model : SSD MobileNet (https://github.com/qfgaohao/pytorch-ssd)
    Input Data : Last image frame from Youtube live stream 
    Used Library : Youtube-dl, FFMPEG
    Databaase : Firebase
    Sever : 24 / 7 always activated which run our code unstoppable
    Flutter : a frame work which work with dart code and developing ios and android application
    simultaneously

#### 4-3 interaction (with sequence diagrams and descriptions)
![KakaoTalk_20230410_231239285](https://github.com/AnJW-HGU/2023_HCI_Parking/assets/82192969/df3d8071-bd7e-4b02-857f-8aef93d6cc29)

     1. Human Action: Run the Handong Smart Campus application
        Computer's ACtion: Shows the home screen of the application. The main screen shows diverse 
        menus such as “Attendance”, “Major school Notification”, “One click complaints” and our 
        tap, “Parking” section.
     2. Human Action: Press the Parking button on the app
        Computer's Action: The Handong Campus map screen appears and shows up the available parking 
        space by each parking lot on the campus. This is done by the machine learning algorithm 
        which classifies the car image on the live video of the parking lot. After it is 
        distinguished, the data is sent
      3. Human Action: When the user sets up the notification button, in a specific time period, 
         the app gives notifications.
         Computer's Action: Based on the user data, the application suggests whether the user 
         drives or not to the school
      4. Human Action: Press the number of parking places available on the icon shown on the map
          Computer's Action: The computer calculates based on the statistical data collected 
          through the users, and provides information about the parking space and which time will 
          have the higher chances of succeeding parking.
      
### 5. Results
#### 5-1 Screen capture images and descriptions of each screen
    스크린샷: 서버, firebase, application 단계마다
#### 5-2 User test and results
#### 5-3 Final demos (photos and videos)
### 6. Conclusion
#### 6-1 contributions
#### 6-2 limitation and future works
### 7. References
    https://github.com/chuanqi305/MobileNet-SSD
### 8. Source codes and outputs
