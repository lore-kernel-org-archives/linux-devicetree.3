Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEE8345CBE
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 21:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785618179; cv=none; b=dPcfLcDaGbGEmZxvyXcA1uDpaeXvxB78QZCYC9OYjAwt1xQRVewgbAVftKMVKhs2NsCwg1O30L6Iq/X50hzSo/C7j3bhmxSmYcSu4oBMQxKUH4nXDG68YbJpg2qa8cpgGQcz0gDv0sSAvKRmPL663wqzIIluzhpNtJnXW2meXow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785618179; c=relaxed/simple;
	bh=dGRnJ/ViI7FCUrJ6sPAZE8J3PYCdg5ixZ0vKvqVL7Wg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vCN/MPmU0oXilPAjwa9hF6Xy95dIB7jfvBVICxqVDp2M50DAnVLtlSka4ur8cLr05B9Jmx/N8mA7EuP208Qy+uViZQygJr3L00lmPohBmZdmS+AvHOV5zj56zNnnoKfVrkB57wQWBlGF9YkbIS9s2CXGf7eBk6s1Fzo8gkAU65o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UHwGE7ib; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jsydxsaA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UHwGE7ib";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jsydxsaA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671J03eb3181859
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 21:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dphclf1xDSYc2yeFYhYsyWjbzi4CkfV4D8k
	KTlZ9hHM=; b=UHwGE7ibrG7PBHDpforDIIDZ5M0Bij69rxgdYTFX32Q+V0Ne4v+
	BALbai49TwxC9sLk02x+QraX1ErChTh4fnpCBLUTUvtimS9mCdImUncn9iHXtXfj
	JCzJhVcGVKrF9nacaqVOPSh23K8z5eiM8PqOk2D3prDyR9JH3K/wv3FY6DxyS6wI
	mC6asTvhwqApUZiNHLK7UyAPa5lPY4EjSBG9ABq8bps1jF8b0zHqu4VXsIs2MhFZ
	dKfszm9Fmwk4x7nVYhWlFKbmD5rIEGkWqLZVvb+ozF6sSbA+NjM0DlnpsWYlco98
	ZrvGPk3rY9LFOwvbZJ0lWFxO4TfvInHFVyQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9yghg2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 21:02:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52769fc3f2eso23050241cf.0
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 14:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618176; x=1786222976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dphclf1xDSYc2yeFYhYsyWjbzi4CkfV4D8kKTlZ9hHM=;
        b=jsydxsaAfbm1vI3vQpcyoV5hurbr8oAyJtByOBC/dgXliw8vPIUGkS4jsGFysTnEEs
         algwwdt5bPaPHfCp/R6AWDtinAJ8YiZloyiaSCa+eO7QF6FYo2Yl1nzbZ4EiYL83JbT3
         zGDjUwWHeJDQvFivQhjyG4sQ3C7HPesvcwHeXi1Gel3gviiSqLxuX/BCFpPcYgT39CPw
         FwDqKU1r6Reje9iLqYtgF3nZqBSUnME5LnMH389HREc0fxL+YVuShzodFhl6Kz1f74Tp
         /3eUUI1xR9iDxi8bdBaFk48a9HSkog5JefsFgfS1YICroEH7mnmN2x0pKtFj9GcVwJ5X
         Ohlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618176; x=1786222976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dphclf1xDSYc2yeFYhYsyWjbzi4CkfV4D8kKTlZ9hHM=;
        b=DGYOJig8huiKY2pRldkCfyC8UktXnrJlMRFQasnatkkuqFx6fubceC5xRnryn5MSMx
         Y06JFD+XWpPYluntCZMDYx+ufEOsLUwA+MOG2a2IiDc2W14YnmXel+eI6VifJDItXNl3
         xQpDado4C6NdD4UI7pofb+voJYgE50YlH2CArY8QIFS/jhjgKtih7zjl2WtPdslcKPmQ
         WUCotOUKGkSfZCo4gDDLTER1vDr1jN2ohvcyQqwVRxpAjdRrhVDUPX1E5TEG1xnlsZ95
         CWnAP9woW658Q/F1jQ+JusZmXCR+MEYe+uvJS7+tokZ+og1sFpl+HBXUwzLSIY8g58YO
         bMZA==
X-Forwarded-Encrypted: i=1; AHgh+RorRX7OxG6BLzUXAUl53om4rVL1Aa3MzidlsiTS55agBPuFlufW65hEhtMSATldEDCxYd+icynd0l14@vger.kernel.org
X-Gm-Message-State: AOJu0YxEA4vxtgcXNvTHADouQUxTTgY5DzH7eSKYLUpwDkYhfLU0SJvG
	W74YcVFBHAIFBk2KNnPd+FkeNtMtgRYG1jv1AW+RH4EnBPE97yqFhNHfjly0A1gYw+Nu3MCGsLN
	JvcZMjsHG6QoLbKpHBpuDIyXkMRO0jI8DDjr2dbBhMll18HhmFEgsSuv9D5yxutop
X-Gm-Gg: AR+sD13Bs5xlndIBXCCdNGUM1aTOoh1FYakFwcFopIZodLaGjR7GtEKPDG2Hi0F0mEP
	0W5oPjrRM/QPSOcuHWz8PwgEdRj5aF3zVlDyjYwsDYBEj+rdnbrTnP1Hv4nm/02VkS/mJwbeA3L
	waRgJUW7HGKzi05o7i8CRqrto98mLO8A2hT3RGJejaIxfLzPkl0g8lRq+TY1FmhDBH4lC878Nin
	3VQKsHMvSzhdsOUOlUgQaYfo/qtKgNlH6siKCs/XngDcw3bHsGp2eLpmxCW6h6Tr9+gGQfOqbPk
	8bFMXkp8cciHzv7dZGLrDTzUlkq0dJVGEGtvrsjfFgOUVD3un844SezS+2FoTFrfKjiq8Ecl/et
	8T3sMHUv+r5N3x+xz
X-Received: by 2002:a05:622a:400d:b0:517:8470:2d2d with SMTP id d75a77b69052e-52b56794481mr98485161cf.29.1785618176512;
        Sat, 01 Aug 2026 14:02:56 -0700 (PDT)
X-Received: by 2002:a05:622a:400d:b0:517:8470:2d2d with SMTP id d75a77b69052e-52b56794481mr98484711cf.29.1785618176019;
        Sat, 01 Aug 2026 14:02:56 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807ba8032sm66078785e9.15.2026.08.01.14.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:02:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] ARM: dts: rockchip: Correct white-space style
Date: Sat,  1 Aug 2026 23:02:48 +0200
Message-ID: <20260801210247.383632-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4144; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=dGRnJ/ViI7FCUrJ6sPAZE8J3PYCdg5ixZ0vKvqVL7Wg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl745zxbEU7ZCsaVoNzwJ5HWAADW7/FHgihyx
 MEUUgB+6uCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5e+AAKCRDBN2bmhouD
 18UJD/99QnUFpVKAV3Dzk1lIJ2IVCV8pLbpkSEmlB9OW2HONgG/PcR4nIhc4JWzuOPnWM2YjINo
 iW6w1GdXufVV8bPP//fYfVOOsDMOPEd0tukD9RpD2NN7O47wrSifgl3eoTEhTo1D2xJY1MxH7gC
 SC1N/B3sGQiIyeoC87Tk9RDm4YiBpuy4KmygHsTX1S43aulwoEXYKahIjMOB3KYwMxqm22Jf+Z+
 9Qnm/NWpyOAVR+7y0ynMM6uHLtmGJUzMdwMpjt/LizMfuH8zjSkWzOfWgLAJlc0rcVALO+98w8k
 frDYSEcaSjoEUbDcIxFOLXSB4Zh1rAB77GprIcVlPNz2SnU1ns04xBMLmzVNUf/YQSnYYme/AFB
 VuMrLVse6BKRspl1gr1SkqBtC8srSwQICRB9pdQrB1nV0FCpQPpeR4lIIBih8oMo41hcBWmIBE8
 SOPmHeEmE902Pux0TtALjXNk0wOeUAJ6vjpR2O4+auP1ybD8oNA7I03506aO4TJ45v8t4subBXB
 2d3LVj+MzaYLhT3HlwEAYKVRKRW901BlALbYPIqx0hvK80veSOLhzI83VE55ZBLtsYfGEIXeXbE
 fyDQ0miI4Uk84R7oH3SWbouUgRpxhL6/0jjwqGZ+RB7kKz/VY7QJOwBRNwoD/2gED4r5Cp2eyGz uYBlh/YU5sWLPxQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX0WOBKyw0FZ60
 td5twmg3GRRY/Luf5FBhlx8CgF0Jpsh9+qftlzq1VhKurpwusBf4uEqWsquUA7AODP5TmUyuWK6
 VoiS2Bmj3dViAXGz+YPwEPvOmEzNA/I=
X-Proofpoint-GUID: 81TK0bsG_zaEN7DsIsppB197voGj73Vg
X-Authority-Analysis: v=2.4 cv=Gu5yPE1C c=1 sm=1 tr=0 ts=6a6e5f01 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Hx2NUBF34izpMPi2HQAA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 81TK0bsG_zaEN7DsIsppB197voGj73Vg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX/7YyQN01IFZ7
 loWFhau+u76owJL5sJYMdyLTbJpXjVCmsRH6X8t9Ro6nw7OhFfKB/0UAlReYX9mhlormAfMpRgB
 lj3jjuEHuvsFgy4FQyl6pPlW1Hdh7MFITuhx+PKmp5d2j4lk4zRsX9VQDYm15IEnGCcTQeqTeuO
 IW5ovIIE4WD1MqHY7KKT53WQbaqIGc3hEjrf1qJqDGgAz3XsEt0MxSBoYHJ1ZG3QNFZnLcbjlH7
 J/jIUguWbzL5YaqsSIxnfWSHlDLYE1l56EhF8LghBhRPZohwR9wKDXL1BkTj40ueqEHApaU26fN
 y8HI779Vgexc00HlqKb8+KTDd+A1wihjZW1iqcDwsJv6CKmBo8HyX39rXjjZTVOvnx+7ckJOQ7f
 sTKTI2KWr5WW1UsemVRo/OCILUJeP6hAkuCCbiUWmUe4PUHzA1uQWNx5GQPAzYVaSOQP2v5b03E
 1RbKH/G/P5A6XFUTEPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010169

Correct a few white-space issues, like missing space before bracket '{'
character or spurious space, which will be flagged by dt-check-style
("redundant-whitespace" warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/rockchip/rk3188-radxarock.dts            | 2 +-
 arch/arm/boot/dts/rockchip/rk3288-evb-act8846.dts          | 2 +-
 arch/arm/boot/dts/rockchip/rk3288-evb.dtsi                 | 2 +-
 arch/arm/boot/dts/rockchip/rk3288-firefly-reload-core.dtsi | 2 +-
 arch/arm/boot/dts/rockchip/rk3288-firefly.dtsi             | 2 +-
 arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts          | 2 +-
 arch/arm/boot/dts/rockchip/rv1126.dtsi                     | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3188-radxarock.dts b/arch/arm/boot/dts/rockchip/rk3188-radxarock.dts
index 1f31c0a6774f..7ebbf9b932e1 100644
--- a/arch/arm/boot/dts/rockchip/rk3188-radxarock.dts
+++ b/arch/arm/boot/dts/rockchip/rk3188-radxarock.dts
@@ -324,7 +324,7 @@ rtc_int: rtc-int {
 		};
 	};
 
-	lan8720a  {
+	lan8720a {
 		phy_int: phy-int {
 			rockchip,pins = <3 RK_PD2 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
diff --git a/arch/arm/boot/dts/rockchip/rk3288-evb-act8846.dts b/arch/arm/boot/dts/rockchip/rk3288-evb-act8846.dts
index e1821fadbe7a..fb581b505101 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-evb-act8846.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-evb-act8846.dts
@@ -175,7 +175,7 @@ &panel {
 
 &pinctrl {
 	lcd {
-		lcd_en: lcd-en  {
+		lcd_en: lcd-en {
 			rockchip,pins = <7 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
diff --git a/arch/arm/boot/dts/rockchip/rk3288-evb.dtsi b/arch/arm/boot/dts/rockchip/rk3288-evb.dtsi
index 11bb970c6112..ffa5a1257341 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-evb.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288-evb.dtsi
@@ -40,7 +40,7 @@ button-esc {
 			press-threshold-microvolt = <1000000>;
 		};
 
-		button-home  {
+		button-home {
 			label = "Home";
 			linux,code = <KEY_HOME>;
 			press-threshold-microvolt = <1300000>;
diff --git a/arch/arm/boot/dts/rockchip/rk3288-firefly-reload-core.dtsi b/arch/arm/boot/dts/rockchip/rk3288-firefly-reload-core.dtsi
index 59029483741b..e68bf31e816a 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-firefly-reload-core.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288-firefly-reload-core.dtsi
@@ -150,7 +150,7 @@ vdd10_lcd: REG6 {
 				regulator-always-on;
 			};
 
-			vcca_18: REG7  {
+			vcca_18: REG7 {
 				regulator-name = "vcca_18";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
diff --git a/arch/arm/boot/dts/rockchip/rk3288-firefly.dtsi b/arch/arm/boot/dts/rockchip/rk3288-firefly.dtsi
index 187d4f0a52eb..13060a9ecbb6 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-firefly.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288-firefly.dtsi
@@ -79,7 +79,7 @@ power_led: led-1 {
 		};
 	};
 
-	vbat_wl: vcc_sys:  regulator-vsys {
+	vbat_wl: vcc_sys: regulator-vsys {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_sys";
 		regulator-min-microvolt = <5000000>;
diff --git a/arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts b/arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts
index c6472f933aa5..b9ec812b4a86 100644
--- a/arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts
+++ b/arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts
@@ -26,7 +26,7 @@ chosen {
 	leds {
 		compatible = "gpio-leds";
 
-		led-0	{
+		led-0 {
 			color = <LED_COLOR_ID_BLUE>;
 			default-state = "on";
 			function = LED_FUNCTION_STATUS;
diff --git a/arch/arm/boot/dts/rockchip/rv1126.dtsi b/arch/arm/boot/dts/rockchip/rv1126.dtsi
index d0cdc5f74212..74f238e13533 100644
--- a/arch/arm/boot/dts/rockchip/rv1126.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1126.dtsi
@@ -717,7 +717,7 @@ sdio: mmc@ffc70000 {
 		status = "disabled";
 	};
 
-	sfc: spi@ffc90000  {
+	sfc: spi@ffc90000 {
 		compatible = "rockchip,sfc";
 		reg = <0xffc90000 0x4000>;
 		interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.53.0

