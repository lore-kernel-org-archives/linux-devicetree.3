Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF25C3B83FC
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 03:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787889067; cv=none; b=OvszXnH1WylObKz6jEY1yHIWukfkawXKWahv4leeP6TOeLFdq94c9AggL8FmaCQekHZC/pzlitZDxHzj0UwBGmNxJEA64mG1KxLg/YbqdpFaSqetq7qCnlm7EWAYHJfJJlbDK19oquARq4edHlX+I4oJr2Vln+ZzkOdDcFpT9JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787889067; c=relaxed/simple;
	bh=Z4z5fKFl6RgkdY4UK3MsK8CgkpI2A/IXfHSxNjbFO3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OJcachdQRek/rG0aRUmYZsp73M6Zcxk/tsWvoxQz2KErCKj6Oscmy8WULABFbzho/u1kokt7C4OVhHMT3SFhaYp0vBI40nRlKok20kdmicTeJmxJAG1doWhihq5GORcV9dyQftbBTQgEdKgRncTeGSmbixFXTLwPYQStorv6zIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=leV6/+1o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jaBgP/J6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="leV6/+1o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jaBgP/J6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S3K59S1238566
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 03:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bQp3zee51kf
	Us/Bzcd8eP2AnCxjvpw9huHgum+GY1q8=; b=leV6/+1oxpMpIWpntqk6DVxmWGU
	SgsVM16qXhGLMtHj8eBZhv4hJQU2IX4otOcejWhlAKKg94f+IBruJchWjgl9PDqG
	ZTzbKGI7eHUNxXrU5CswYu1lW9GsZ3x5cBMJBrt1nvoZ7hZrL7yCCJCtT0g417zV
	Uu0nd5ynUKKYJu+fevzHHJKS7rnuh6HDVzFo4edac46HYHFPLp06t4RxUYC+4Ulk
	V0RyffiRlAA7Kt1kCqt/m0BKTBpTZU3HKchw7lbqRnqnnKAhRFJyr7ZC/h2S6AtW
	RIixcmz2k5QOYPGC4DSMX/XYrOLOk+8TFE+DlaPm4Nl6ItPM5AimV/Ucp/A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gaphw35hp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 03:51:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d55d8cd938so7483965ad.1
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 20:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787889059; x=1788493859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQp3zee51kfUs/Bzcd8eP2AnCxjvpw9huHgum+GY1q8=;
        b=jaBgP/J6RYfCicwYSWEVDxsr06i+7/kOoROgqJaVi87JDqGUqa8n6w/oRDJ7jXup6H
         zN0iVuJGCqO993pW0ltvo680DfUOfETWwTykxbUW5kdEov2yfyYaIvgwQxjx/WJ9uTfH
         1smLSeCP6qeBLS1yISKU/eX4SwqKoAg8Iohk1H2SAnMV65Qet8Yu4tbWTrmAmYL/Ho/f
         HHn8Io92Lr/eTaabk2QiQ8q6pGCT6lPKzZA/k/Qvuf0oECZo5RZX2nD1YPQhJXCAtsrd
         ZsAgBnF0c/2WMyz40PPG/PwMMF6GgqmiGAb6aShmmtg6L7HPzL+g/4H4Z1p9gQaKj81V
         N//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787889059; x=1788493859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQp3zee51kfUs/Bzcd8eP2AnCxjvpw9huHgum+GY1q8=;
        b=PyfJtD4a9Alt96H/qFb7JOZjJxi7PE6CEo7Ga22mNxJCoIvA/+1IrkE/84jWS3YRdj
         YtAxLnkLO3mLx2H1o2KakvhNJBqpMEbrzSa/4kMBfVL+59O+y6IL31e2b7qmYMnCwFA6
         idpeyEWPld9I2IYRVXmJHT8PTysfNNT85UMi3omaKjDkPKtwwNL5lUt5et+4mV3w+Zry
         XSXOA2iW2QkHlYxN7rpN0s6IjZd3KqCOrempHoXCL2IFpPhp5vyXXJcluMQQaM3vCJYh
         D4cUXgT+Zu5Z38OnqHmGY74OK1iYhqoT2rl7Kqifb9LYWYvXjhx4xpLATh2DoXnNpbup
         Y3AQ==
X-Forwarded-Encrypted: i=1; AHgh+RpKP/EAZfGOAPZU+KIPHcxkeDRMeZy83WW1Jp43zv6LJ547D2xpdx3xDVSCv22YVaVhvADBEP+4puFc@vger.kernel.org
X-Gm-Message-State: AFuF++lMLmBcxDGTkw5QoKkTMhkVfS82pM4rEptNVkIC/0k2loszwYqm
	8vAkdFChvkOw2ttFo6gWxK7zQ9wqfXfHVC6ql0ivu6O2mhohqwIm7UcP9Q5Mz0fcI1SZf4UxFNX
	M2w56ry/KJOvZTTgKkEaZVNJp0aEQSzuMgJ/dN16CfBjZhqBNgvceTtE+PD0rz8hz
X-Gm-Gg: AR+sD12WqKCe9YK0NqgcJbMWGejY+dLgYg1DmaAzXLlYq98/lbhpQ9kqPwKTs3DHZTU
	WYwKPzNrg0mdTg1C/uWGWdDjB4vlgHNBC+jYDXWm10LB8i2tNgHz1GhCKrryW1DmzlllOATMXtf
	dOzxOq+YkHdehoozKKLoFy9Ad8mALh2gDVRVBfVcIb0wOUKSa1roMQLP6m9l49G26XKhY1/YBwW
	AmXg+BNKqXQxSuPLv5WM8xZ/QnaIc44aR3Buzfh8lzy1p3q2UFfuAVx5AdWihFglcUJdnIDeyif
	V67bUX8dpyYSoNUSkqspWDWTWxYv9A76aQga9TOaV/YiCL5MMq1/tH2G8c5KVaN5Dy2Q3hFbGN6
	2Gp/tLrupMyxlWrFRZRay2xw+ABneTlYIqEbNNvKnsXgIjEYWUtarD4gOSayJ
X-Received: by 2002:a17:903:1b68:b0:2d6:e074:9cad with SMTP id d9443c01a7336-2d74dc2e8f5mr79395755ad.6.1787889058984;
        Thu, 27 Aug 2026 20:50:58 -0700 (PDT)
X-Received: by 2002:a17:903:1b68:b0:2d6:e074:9cad with SMTP id d9443c01a7336-2d74dc2e8f5mr79394675ad.6.1787889058540;
        Thu, 27 Aug 2026 20:50:58 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f995e60sm1133357eec.22.2026.08.27.20.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 20:50:58 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v13 5/6] arm64: dts: qcom: Add device tree for Nord Ride board
Date: Fri, 28 Aug 2026 11:49:57 +0800
Message-ID: <20260828034958.3165-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828034958.3165-1-shengchao.guo@oss.qualcomm.com>
References: <20260828034958.3165-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 92E1uZCVtT5N-5neI69VR6G2Twd6YlrV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDAyOSBTYWx0ZWRfX9ZXiD1EMOTNM
 eCzTl47WeArBJpDwf5Z0Yqk7HsYwuriuQVJCj25alut5ANZjKDZxoI1MlMwp1bgsg4h7SniPcf0
 sTXCCJWv68xO6TqVtKXdKP+q8jC8u5Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDAyOSBTYWx0ZWRfX007hRsE+Anpc
 LJoZoAFMA1ViMw86gFtZVZQpKsMl1BAk9ix6XFyUvr78KoevwJxRxKYE45pvi1FPn7ihHgoyFyl
 fjs+X+wxohC49uUyaoZ0es4/dTD36WA3IJyoMW5+wj4GWuTezF6UzcjZXtUuMENDNMz5cnDUi8b
 7eKkiWvJ/OX08V0I2Yl3fwjoT40TTA/ganRGEq7ANW+16K3XFt19eJ/iWaD2R1D2QnwTY17ytGK
 qVWVJJXKyPZlGKoDlMH3nh7ePCtQWoPi7dqzf61YfwM2bC0V/AlIRG9RKSNtOWRbrxS5EgJ5rd4
 UPb1+kWIa/Z1ZXtMKeE8YyTU5af1Vh8vncr0vQhPJ3kwmXtIwqLM0n8dXXg3KY6KXHUrrWrXVXJ
 05Cb9lTHjtvoG5KweB9MpbDT4y3UloenBEqO/w6rJSxlD+UItPYcRiRXXWhfj0UNqeQ2mrebU0K
 LBmmcX6J8/KHg5lU2FQ==
X-Proofpoint-ORIG-GUID: 92E1uZCVtT5N-5neI69VR6G2Twd6YlrV
X-Authority-Analysis: v=2.4 cv=E8b9Y6dl c=1 sm=1 tr=0 ts=6a9105a4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=2Hjw6vQzkyH4OD-tzjAA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280029

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Add initial device tree for the Qualcomm SA8797P Ride reference board,
which is built on Nord GearVM variant.

 - Configure UART15 as the primary console and UART4 as the secondary
   serial port
 - Enable UFS storage support
 - Define thermal zones for PMIC dies, UFS, and two SDRAM sensors,
   all sourced from SCMI sensor protocol on channel 23

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Tested-by: Yadu M G <yadu.mg@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile      |   1 +
 arch/arm64/boot/dts/qcom/nord-ride.dts | 254 +++++++++++++++++++++++++
 2 files changed, 255 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ride.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55..d05920a0d5eb 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -160,6 +160,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-lilac.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-maple.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-poplar.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-xiaomi-sagit.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= nord-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk.dtb
 
 purwa-iot-evk-el2-dtbs	:= purwa-iot-evk.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/nord-ride.dts b/arch/arm64/boot/dts/qcom/nord-ride.dts
new file mode 100644
index 000000000000..1af4117d24d7
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/nord-ride.dts
@@ -0,0 +1,254 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "nord-gearvm.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. SA8797P Ride";
+	compatible = "qcom,sa8797p-ride", "qcom,nord";
+
+	aliases {
+		i2c18 = &i2c18;
+		serial0 = &uart15;
+		serial1 = &uart4;
+		spi16 = &spi16;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	clocks {
+		xo_board_clk: xo-board-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			#clock-cells = <0>;
+		};
+	};
+};
+
+&i2c18 {
+	status = "okay";
+};
+
+&scmi3 {
+	status = "okay";
+};
+
+&scmi9 {
+	status = "okay";
+};
+
+&scmi10 {
+	status = "okay";
+};
+
+&scmi11 {
+	status = "okay";
+};
+
+&scmi23 {
+	status = "okay";
+};
+
+&spi16 {
+	status = "okay";
+};
+
+&thermal_zones {
+	pmic_kobra_thermal: pmic-a-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 3>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_0_thermal: pmic-e-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 4>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_1_thermal: pmic-f-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 5>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_2_thermal: pmic-g-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 6>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_3_thermal: pmic-h-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 7>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_4_thermal: pmic-i-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 8>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_5_thermal: pmic-j-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 9>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_6_thermal: pmic-k-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 10>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_7_thermal: pmic-l-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 11>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_ufs_thermal: ufs-thermal {
+		polling-delay-passive = <0>;
+		thermal-sensors = <&scmi23_sensor 0>;
+
+		trips {
+			trip0 {
+				temperature = <105000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "critical";
+			};
+		};
+	};
+
+	pmic_kai_sdram0_thermal: sdram0-thermal {
+		polling-delay-passive = <0>;
+		thermal-sensors = <&scmi23_sensor 1>;
+
+		trips {
+			trip0 {
+				temperature = <105000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "critical";
+			};
+		};
+	};
+
+	pmic_kai_sdram1_thermal: sdram1-thermal {
+		polling-delay-passive = <0>;
+		thermal-sensors = <&scmi23_sensor 2>;
+
+		trips {
+			trip0 {
+				temperature = <105000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "critical";
+			};
+		};
+	};
+};
+
+&uart4 {
+	status = "okay";
+};
+
+&uart15 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	status = "okay";
+};
-- 
2.43.0

