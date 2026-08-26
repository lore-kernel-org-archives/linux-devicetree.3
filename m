Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B2E33E36A
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787717615; cv=none; b=oyKOo9Bfolam/049ZKgFrg6xro7C+OFzFHW8X0XOXyd6iyhpbaMV/vJGkMr9KhUfZy5ZlzhSFjmyP5BUgXu2VCIHzPwb1lstElsRFls1wAj1T36Fxbfz2dOJsGWMj/c9zg84mz1QhnuD8XBnpXHCy/wj5qybiL5b2pAwl2IthgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787717615; c=relaxed/simple;
	bh=Z4z5fKFl6RgkdY4UK3MsK8CgkpI2A/IXfHSxNjbFO3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GFmr7fLuCFkFmMEX8rMDGi8TUs8+pVHJXUsumi0iKVAJsn6SjFU4y+x75K/l0zb+CGTPE88Gs+ypvbX9fFhVXQfV8vLM2413j7PgEWfo4rkD74ZKw3b8hvTV4o4FO9+MLuvg/T9nOTK7XSdbKBEMpfnl6Wp1MTLsLPldaguDj94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SWvOIVLc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MhRfXoX9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SWvOIVLc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MhRfXoX9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q3HDTJ2795223
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:13:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bQp3zee51kf
	Us/Bzcd8eP2AnCxjvpw9huHgum+GY1q8=; b=SWvOIVLcJnccx63uSHusHnDjGOm
	8gfXVMN9wwFYNnuFgQMX1rATZlIPBip0cdo1zWhHXjj+5EDHtKWIgCpZEXf69quF
	Gut3bK4hx10dslV3i1ywkpmXg9X3fnaWX+CU/OF9zQHdzlRS2mEiBg0Bw4M+SKIl
	mGMtuq6bGvsjB0+MalS38bKK2TkT9jddwmcrVmJoQkF9cLxwup7lie5qDXGnFYMV
	kc6AHck7tI2n7zhcsgVRZPSMz7jrKj8LqsVWcsNZq+Apbm/s5pqAKQgFsewaRRgA
	iKGDbV8jVnVhlmPtOvWtuxxWXoU5DUxKXRHN8/E5Ww/lNTBnId4W1iJEKGg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgr9xtk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:13:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so487754a91.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 21:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787717612; x=1788322412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQp3zee51kfUs/Bzcd8eP2AnCxjvpw9huHgum+GY1q8=;
        b=MhRfXoX9LPsOddFpKbx9oDQGXPffZEwS2D/fdxNeH+d0c4XCGQYU8fvm5hdyumHb/O
         NyrP8+uYG/x6Y2zn9KVHgiXm7a1XrG78s2tH1uLvkszDPFy99jgji/kArLIJecGMTZgl
         2KJ7+qRXiWbAbSeJ0ll7081KczjJBFBHmoXhRB9uTptxjiTaWIpnfBNAodtBm6cB9Guo
         i3wczHGES8AK7UdVKimbaOmcO89i1SWsxiKbPk2bfGZkuwPGOmsjqcIXIm0DcJ5i6whv
         1B332xByhafCdFhQg6HlmewZdiN2oPsCu2u6aEwN2febkSplSCsGh3ZxbWqsnveawATe
         ni/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787717612; x=1788322412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQp3zee51kfUs/Bzcd8eP2AnCxjvpw9huHgum+GY1q8=;
        b=VshidNdT599cLn/QHLz4TQi9nh5geoDa0iO1puAgGyeOPsRtDUIATzkMk8VeCSJ9/X
         1izO1VrzhmF7xO63SyzqJB8/R1A1HfmXlviSKdn7VUZYwgBnlOKlIXTWQGo8pMISl8U9
         hCbieVfsibQN9LJ871WGYmHY/PxC55eyHUcrmjvUm0xYbTNWByAGv7tGpzOjCZEyXZgy
         4qLlPud53qJU/HzhM3d30MoMfQo2mtic/MUGOHWpo2SX8XUXVWzmbyTv5MO3ECp7gC2S
         n482swm82P6B0NxSlQCKViWFzgqzDmZqyCNNC4U84uAC43OlB3+JMcOsCJWEhhCoOKza
         GhRA==
X-Forwarded-Encrypted: i=1; AHgh+RrivSFxEmRbK8QQ9v9riso2qllPHNMfXUWHRtFVa0MHeF6/USR4FTpB6iR8PcP5Lr70xQv/ZGaTmvDp@vger.kernel.org
X-Gm-Message-State: AFuF++ktE0lAYaeQmqDaKzFUoKJAueDOMCGklIjadz4beJEIk7ytQUc8
	oU3HN5/I1MIH05uIp55e3pZg4BZAwVIa88s9G7wwNtQgR8JHmcW0SW2Dgh+NYOx9AfLiIYTrRNq
	UrHrsmqprCpADVKo5wobSNuq2+a7Ka9RhFR9UrAufPXS+l5TNUsVsVN6QAogamE/A
X-Gm-Gg: AR+sD11vsPyOvis20CGVJijPzGMYmDSqvjJ7g6NBcoQMLYsXqK3UnCWGNOqdQ5iRyBb
	cOqfUk21fjUv1DQCj5HvZbigaY7VrB1aAqAh80I9NjOS7Am81lk5u9pq2dtY8P66jr4peyBC1pq
	Yyb0xoTHHE0MTKWxUPwqfWfOfzb0mDNiLlTAGCMS0S8dAAwEeOf7hr2Q+38laqywadtms/Zul3O
	VxvLrTDCDOsqZazi6nGLDVpDyxyK+XwXvfIphD8OMSKbzwVZRUucLGNRASiEYVzKhx52v6+FPnX
	qNa89WzWmyRrXA1vZDzN5gH5HrmfRbjracUE9bf+ySzeprFBGQrVHl5kBP2gp0FqU+xhk+r0BmU
	GgmzdjmXPyUYCoHOz4/X1y1+Ybs93YDaFR2cixxcmykE7Monh2j+1/P4aipLL
X-Received: by 2002:a17:90b:51d2:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-3966d21833dmr8513609a91.6.1787717611673;
        Tue, 25 Aug 2026 21:13:31 -0700 (PDT)
X-Received: by 2002:a17:90b:51d2:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-3966d21833dmr8513524a91.6.1787717611199;
        Tue, 25 Aug 2026 21:13:31 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905cf38sm5979471c88.12.2026.08.25.21.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 21:13:30 -0700 (PDT)
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
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v12 5/6] arm64: dts: qcom: Add device tree for Nord Ride board
Date: Wed, 26 Aug 2026 12:11:59 +0800
Message-ID: <20260826041200.528588-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826041200.528588-1-shengchao.guo@oss.qualcomm.com>
References: <20260826041200.528588-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wcRiLOdgnrVMW0wtLZuqut1OHhou5NM9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDAzMiBTYWx0ZWRfXzo0/OG7tjtK0
 JS1YPvnW1Au1hSBjH53B7UP/XsLK/Y46R+H8KYqj6jisZAqnKhInT9ORNNUC+/fxoP/zyloetao
 gdOZ+Zy+b2H2Un9oE39lm9CfMOT1yC8nCHKCSaAD0VLcjHl3nHb9Ev0uq2PvrDYZ1O6ahIC6JqY
 gkqji8VH3s4lH+9+fltlJ1sXheVwIT528YDh1ZcDE9mWVF/hD1RwUvc+zwLKM3L3HWA40pGtcMh
 kbrDLeI2E0eqNb+jZjdZzQr06oUMouDniL/6LuuckF40X9W/JGmPlKI9WWfozneKvhuRDQMX8oa
 2uOX3q17pOUAQVI9m2H89ws6s1u1+JFUaZss+2JJ1zQCBUv7jzczjrMw2i8eXmG0vkI/3vqGWJJ
 LZmS2FR0/F0qrqHsTIMgVbSQeW9i77qQQ5q1qA7Oc0b/JZXo+z+MmtGZfKobr2sMMLpLxBIWK2I
 nZYx7bpUwJMVwib0j5g==
X-Authority-Analysis: v=2.4 cv=d8LFDxjE c=1 sm=1 tr=0 ts=6a8e67ec cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=2Hjw6vQzkyH4OD-tzjAA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: wcRiLOdgnrVMW0wtLZuqut1OHhou5NM9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDAzMiBTYWx0ZWRfXy6dXjAj/d22k
 iasZvcCZYFhTOKtnuwbxeHYNwUIdWIP9fzbERr6k0TBpLEkwyWnoTnfWpPn0DYSSJMGgXqeJTCE
 UegWNPHUIj5vlvlwFLgWPvas5T0sikg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260032

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

