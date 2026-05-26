Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1D23A874C
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779772428; cv=none; b=OorvfZC+gfoAuCsh9BKI+3xHVRmN8gedXLyBgQFjD0MEPJaHbarXuyDwaBQGJii+PXXsac/+IL0fpFXxt4Syx9Ntm41IBa/Q8ZujZZtf15erLQdvJV59brEvFm6a4p8uybdPqBZKfe+lAscEOPwDZoCI8KeTQfU1rsMoCioxVCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779772428; c=relaxed/simple;
	bh=cd7Lv3gHALiOnDd9kTk4goO5mwyskrhI0eEGS8i7o2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ujX3v33EFegrOBjzjUffeYEpgl2FzzGeQmdG4qpj8wIVcvsi/4XYuDxUL5XWEkReSBLJtKScCANrovJR6wo7RAU3JUExpUj2Bnc5kmcUw48RLiz+2VReC/ZxGSdk8dSZhepX9jR+z8pdx9FyxRSj43+liFCeFSLICAawjW1y2YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KBqR0bon; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eGM92cE8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KBqR0bon";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eGM92cE8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q4fRXm004519
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aAWUzZEf752
	JzQGgDomzJSno3XJVOKvj5fNxQP1q+Ko=; b=KBqR0bon1Kr8XgbqZ8OznflXQde
	kWBVKlaU8BDuXFbnFzSaPYN8N3/sRonEL1KjO87b5LzcjhPGxjGGxxOkixBBd1eW
	U74k7xMVn87ksC/+VSfjMWNP/I+I8M8nY2+GA++tpmnCc+uYaxQcftgp8TG4S+3v
	jNa4DMU6T7xEZpNlj0QBIKwpvN+5YIzOrOimJTYYrj+OPef4gzZ44FFmtgvl5SWt
	vUYIdnce5A2PlVyFgDSXAe+pnxyNH9PDGNiO4xDrGR03ir8mzYbnwKm0ALVTD5AR
	fcs8xYCy2E3xtp+W9Ts1/51dcMKPdn/ZgwcrRY3POLUJqrcLQZwSpOIelyw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecsm01rm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:13:46 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-13509e2e47bso12088995c88.1
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 22:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779772425; x=1780377225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aAWUzZEf752JzQGgDomzJSno3XJVOKvj5fNxQP1q+Ko=;
        b=eGM92cE8i0LNfCw220STGLsECWUz7AfWFH2csgyjbxHSkntNuA/NxjdpYiNKpphoxQ
         qv8puwbtwHz8KF4JvBIyry33PYRa0ZPS9dN7jNz/pmDOrl2+r9gnExL+1R8CYlPBQu+P
         onEztH2TelShvQn1wvvBQFB61BRSe21qd4sSJ1uzcCjJMfQzIR8irC2P77u52fWuIMpv
         +rrnMouaUFev4528+G+ItsfpeZ7Mi/yuqxpJmkaw8BEUaaHniSiN8ICCkronF1rRL2Da
         hWpmEsaFV94DUc09Mvg3Dwa7lF9zAQaaxp8QEbIeeKAMVzOi7xzVl4uY8n5GJII+KhaY
         Li3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779772425; x=1780377225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aAWUzZEf752JzQGgDomzJSno3XJVOKvj5fNxQP1q+Ko=;
        b=GKP5HQ6oA1pYMX3zDXPoc1t5eGb56m0bww1pj9v2FQe0V57cWQpAHc9P5T8MPzhr28
         EDh5K6MH/6wLjmWxNRqKbZR7+4/ArkwAaHVtIl4KPshtuKOmr5oP4oQueTDOLNoI3zjq
         g5qU66N0No8aHdixS4WpqK1IGv6Z1R9tgQ6cVtyQRnizxqHMdxYUHB/PL/j+qTt4m3Wj
         tXrfS/8FrHSUjS8CNWkWfVx2IRiG8IzRW8GNYR8bdBwdOSthF5dudD+BX2ER9mhxQSuu
         LUQp6zZrF2tDVfS9vXeUJwu8Aqy63MlFct2wSxRhH4dQAub964n9nibBOrFPpkRcmxVb
         9MIQ==
X-Forwarded-Encrypted: i=1; AFNElJ/jkh+b1yhYER5Ojx2+Hbyyswi3n51tDcBsjOXUv/13RWZ9qi1BJf6tdOqiElERwhRar2YJzrrl1oCF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3BxDFhslZJCmTOqdOtywROUivCgxadWU2Bnxi2llWCUi9NS/2
	Jw+ZPvqn6xagdfDlMyednKLnxEr1WgxRmuFz+/AEz+3V0Jq+xTCUxI8H6Z/fNrmGhSFdBHLOBv3
	t+llx/keTf6u8pp7lmJNs2ezqRGRdEVLDoiqlOpb4Bae4+2e3zCOmtHuh3vuuAKmHlLRxpiNr
X-Gm-Gg: Acq92OFHIhKfffppRUtzGdSf52s/aAWhXXqNbdaHu3zVZKO9nG5y5hExDE936X4PIu3
	UmOk7KSPo7idchG4LbcchdVhLkdR0jgMLvt/0+AEx7yT4oRzS+wcUj7C++2Ra+ry0hyN28ui80d
	mjoqf5ue2zOo+v0P2zr9yn02tr+IQhzQ3H1UIM1oM0PE8xq9Bt34zN3JPjQp2giyrFO7QpGrBQZ
	/jtKcPNTZU5hfSExEfw1dXPdoC9O7V/m3Q8FcVLyoSA+8oVPoXG7eSAg69Ffrs28Qofsn263T0u
	U9atRJgS8hnd9APpp9aCt21ObhDCk88yBkqr52LbQJCPWzuH2lGx/dDBJFNeVWI42RJzQg44WsK
	+1iQLtTAOxzM3PazMhuYqyDgzYgEF+sSk3dT53SyYUUNr1xevGJdnGFnXGY5DUlv5bKz4Kvn4do
	rAPXmGVg==
X-Received: by 2002:a05:7022:671f:b0:130:c9cc:3395 with SMTP id a92af1059eb24-1365fb408bfmr5305722c88.29.1779772425287;
        Mon, 25 May 2026 22:13:45 -0700 (PDT)
X-Received: by 2002:a05:7022:671f:b0:130:c9cc:3395 with SMTP id a92af1059eb24-1365fb408bfmr5305715c88.29.1779772424712;
        Mon, 25 May 2026 22:13:44 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-136b3706ad6sm5423053c88.13.2026.05.25.22.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 22:13:44 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 RESEND 5/5] arm64: dts: qcom: Add device tree for SA8797P Ride board
Date: Tue, 26 May 2026 13:13:00 +0800
Message-ID: <20260526051300.1669201-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CLEamxrD c=1 sm=1 tr=0 ts=6a152c0a cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=TKQXpbtUPQeuIP00yFIA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: fPjIwF2Q1gM_rcUAeIv52P5LUXMGW2Kn
X-Proofpoint-ORIG-GUID: fPjIwF2Q1gM_rcUAeIv52P5LUXMGW2Kn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA0MiBTYWx0ZWRfX9hIU02ioHlfC
 dLbJTV+ph+qz3PofCe1lXx/OFByxxwCX9Ci+lFvl1gZiCww6hI1BZdnT+V2eXlilMbNBLhUzOkB
 hK1raDpWIGKn5x/O7qUQ7ObArRfYqRFrPGI1kxhY0VXKG7V6Z0V7lhmQge9bMzdKXgTg8+RPuj9
 Z0gt+fICjSJH66gQp5spp9j/2EOP2Q3qJPztYsGIugjSeNsJVWJ4CY3KrE/k11IoW6wZ2SS1ovZ
 dL+z4Sqii2ipCs5R9/V9ahDQyJbLx/VEwQVBwuY+XfgB3IbzYEOOWVdOmEp5zgR9Jm9qYujzu5+
 nMqYsES4+Zs4lSsyUfFsVynsEWTbEPZKJ88valPTqSqcvCUDJgB0JbAuInV3WVx/wbiagKgqmrz
 TYbaQ4yM52YB10T24jW/IyYg8N1axuDSkQUjyWmQ0FAlqcSxZK6Y5Gy4kKRTzes8s3U1bNOg9L7
 6kSar/w55SJabCgcBDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260042

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Add initial device tree for the Qualcomm SA8797P Ride reference board.

 - Configure UART15 as the primary console and UART4 as the secondary
   serial port
 - Enable UFS storage support
 - Define thermal zones for PMIC dies, UFS, and two SDRAM sensors,
   all sourced from SCMI sensor protocol on channel 23

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile         |   1 +
 arch/arm64/boot/dts/qcom/sa8797p-ride.dts | 306 ++++++++++++++++++++++
 2 files changed, 307 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8797p-ride.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f33c4e2f09c..2746fc29c45d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -218,6 +218,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride-r3.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sa8797p-ride.dtb
 sc7180-acer-aspire1-el2-dtbs	:= sc7180-acer-aspire1.dtb sc7180-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-acer-aspire1.dtb sc7180-acer-aspire1-el2.dtb
 sc7180-ecs-liva-qc710-el2-dtbs	:= sc7180-ecs-liva-qc710.dtb sc7180-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/sa8797p-ride.dts b/arch/arm64/boot/dts/qcom/sa8797p-ride.dts
new file mode 100644
index 000000000000..d429de313f24
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sa8797p-ride.dts
@@ -0,0 +1,306 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "nord-sa8797p.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. SA8797P Ride";
+	compatible = "qcom,sa8797p-ride", "qcom,sa8797p", "qcom,nord";
+
+	aliases {
+		serial0 = &uart15;
+		serial1 = &uart4;
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
+&scmi3 {
+	status = "okay";
+};
+
+&scmi11 {
+	status = "okay";
+};
+
+&scmi15 {
+	status = "okay";
+};
+
+&scmi23 {
+	status = "okay";
+};
+
+&thermal_zones {
+	pm_kobra_thermal: pm-a-die-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 3>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_0_thermal: pm-e-die-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 4>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_1_thermal: pm-f-die-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 5>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_2_thermal: pm-g-die-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 6>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_3_thermal: pm-h-die-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 7>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_4_thermal: pm-i-die-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 8>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_5_thermal: pm-j-die-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 9>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_6_thermal: pm-k-die-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 10>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_7_thermal: pm-l-die-thermal {
+		polling-delay-passive = <100>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 11>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <135000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_ufs_thermal: ufs-thermal {
+		polling-delay-passive = <0>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 0>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <125000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_sdram0_thermal: sdram0-thermal {
+		polling-delay-passive = <0>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 1>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <125000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pm_kai_sdram1_thermal: sdram1-thermal {
+		polling-delay-passive = <0>;
+		polling-delay = <0>;
+		thermal-sensors = <&scmi23_sensor 2>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <125000>;
+				hysteresis = <5000>;
+				type = "passive";
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

