import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hci_parking/util/color.dart';
import 'package:hci_parking/util/test_style.dart';

class HomeNoticeWidget {
  HomeNoticeWidget._();

  static Container get schoolNoticeWidget {
    return Container(
      width: 352.w,
      height: 190.h,
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 5.0,
            spreadRadius: 0.0,
            offset: const Offset(1.0, 1.0),
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 112.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor,
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset: const Offset(1.0, 0),
                    )
                  ],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '교내공지',
                    style: pretendardBlod14,
                  ),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Container(
                width: 112.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor,
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset: const Offset(1.0, 0),
                    )
                  ],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '학사일정',
                    style: pretendardMedium14.copyWith(
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Container(
                width: 112.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor,
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset: const Offset(1.0, 0),
                    )
                  ],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '이번주 알림',
                    style: pretendardMedium14.copyWith(
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          const NoticeText(
            info: "(학생식당) 라면 + 마요덮밥 코나 추가 운영",
            date: "03.27",
          ),
          const NoticeText(
            info: "[학생지원팀]환호여자중학교 1학기 대학생 학습 멘토링 멘토 모집 안내",
            date: "03.27",
          ),
          const NoticeText(
            info: "[ICT 창업학부]206호 205호 미팅룸 예약 신청 공지",
            date: "03.27",
          ),
          const NoticeText(
            info: "[총학생회] QT할래? 4월호 배부공지",
            date: "03.27",
          ),
          const NoticeText(
            info: "[손양원 College] 봄날의 Calling 이벤트 참여",
            date: "03.27",
          ),
          SizedBox(
            height: 10.h,
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: dividerColor,
          ),
          SizedBox(
            height: 36.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 13.w,
                ),
                Image.asset(
                  'asset/icons/refresh_icon.jpg',
                  width: 11,
                  height: 11,
                ),
                const Spacer(),
                Text(
                  '전체 공지 보기',
                  style: pretendardSemiBlod13.copyWith(
                    color: buttonColor,
                  ),
                ),
                SizedBox(
                  width: 21.w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Container get schoolTableWidget {
    return Container(
      width: 352.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 5.0,
            spreadRadius: 0.0,
            offset: const Offset(1.0, 1.0),
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 352.w,
            height: 40.h,
            decoration: const BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 13.w,
                ),
                Text(
                  '강의시간표',
                  style: pretendardBlod14.copyWith(
                    color: whiteColor,
                  ),
                ),
                const Spacer(),
                Text(
                  '3/27 (월)',
                  style: pretendardMedium14.copyWith(
                    color: whiteColor,
                  ),
                ),
                SizedBox(
                  width: 13.w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NoticeText extends StatelessWidget {
  const NoticeText({Key? key, required this.info, required this.date})
      : super(key: key);

  final String info;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 11.w),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.brightness_1,
              size: 3,
              color: blackColor,
            ),
            SizedBox(width: 14.w),
            SizedBox(
              width: 274.w,
              child: Text(
                info,
                overflow: TextOverflow.ellipsis,
                style: pretendardMedium13.copyWith(
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
        Text(
          date,
          style: pretendardMedium13.copyWith(
            color: greyColor3,
            height: 1.5,
          ),
        ),
        SizedBox(width: 11.w),
      ],
    );
  }
}
