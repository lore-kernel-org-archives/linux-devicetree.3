Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54BB291C10
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603282; cv=none; b=NBh5rr8GR8/LwJiilvc/qIUYxOyA4NhYFRe9D/380t7z8oU2IZjok0ASdTKvTx71dTmwolJtsKj6/Q7/6BVTp6g3b4+faC105OCBNd1v+NP7qM4B9qQHZ7xxjAtGxEFjfSkiNOAab7SYbgSHOY+EdFKInOUh2N+9E3N+2c8RYWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603282; c=relaxed/simple;
	bh=lKGQpygmXkP2XzUA51svAvEuuS7E2znTol+OjxD7hk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VfvDRgqlCPTlo3/48pSdai+B5nX3ekqyxjm3QYPzhdXAFaBvKGslRNpPl0n5XY1NV971MWd4qRxDX8GK71lOmdWAdthYkAha+iu6upLEztuhKny1OwnM3F2ImYW3LO/AhdxwxrjbuEVwLwP+lrp9frOj2b5Aka8G7GpxpTdrdOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JIuzuFc8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cfo4rcVI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JIuzuFc8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cfo4rcVI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BN8ts1715938
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 13:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=91kfL6G7lYN
	hupV2+UZH7kfXoXNDRDGpHUfmE1YIVzE=; b=JIuzuFc8DqYkRtOQ7mPpzsQIlHX
	/NQE14Mo+hbvBDPlR1u4/zc1aDoHv5o/qsBjWrAtV1QU93jRklr2yXww0V9/euGn
	yXDTTLJwHq93mUANK+ClwqK+pC0kSlMdeHEkrqyj2390kuhK5xuQrFrB4FA0SLgv
	HDfeHrOCMjGXucIMnpAyTc1oGJcNG4BqO+WJxb3LSUiIEgxPaS4mHfS5jS8sUY6U
	YuW03jS8T/E8uSQhPBU7xzbP8UDM9KlopGWhViGRIMaJvE+GxQKTEmbLXhcejFwy
	/WTuwAfbWrU8MJ8n7VmRjxFbQnL9hkCNijQV5HLzon91fSdkTcSbjvU5rYg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4vv1ta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 13:21:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e38fbc5so112028485a.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783603279; x=1784208079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=91kfL6G7lYNhupV2+UZH7kfXoXNDRDGpHUfmE1YIVzE=;
        b=cfo4rcVIN4s6JckKaEnrB11OpTN9k7U0f+Ojlq2tIeF3ZSbYcmNG7SlzQARmqdDl90
         yIehiiHm4D+PYYdfZNSghs/CpRZHL9L0Tm7xvd3MdrZr3U+ljNsBf0y++9A58pG0U57Y
         lKuSef4qnTL7QhqLeVWbKpiNX+3CBRCxNmrhKWG0IK/KVaiSMipxIuh20ze9Lp/3wNE3
         FFz/alGl2PqMNOn0DfGya1sSRFJO8t/veXOhktiUFJEMEWcv8pDmZ5xAbkPja53/gglL
         mjnpLUel1CtfK+mvCdSafsZaChq+nafBlSAGM6AxqOos+miHpnVAHDJhZAIftJp376bJ
         /0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603279; x=1784208079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=91kfL6G7lYNhupV2+UZH7kfXoXNDRDGpHUfmE1YIVzE=;
        b=aD5EeJXy3xvMcM5K4DvTPiH+WoGHGpuLx0z33Xosoi7VuaoBcQ7OlhY5qsYhcRQklk
         zCRD1CY5xLMZdwgcBZ2+cfkFe97VN6XQ8XVHDKpBMxrJway7EDaYF21cB/PBzfl6o2ap
         QsVaWM+fFBpM5/jXRCAiuHFPucDM8E6yvwDjP5LLgwBblhYzDjBOy/ABk2M/5S98Qh4n
         zTwC9L3cqikz3gDX2MK4/h4Pps/TtpIazShiNqXLwZ4P3Fy/YaW+Qg47xFQwFho9I8Rd
         0T24i5cNO4uu/TPOE0cOnClXynnohFeVe/AsMZUSP6WSTb30u9eo4mwTRz8eZ+eBLLDO
         ciZg==
X-Forwarded-Encrypted: i=1; AHgh+RrWwlVGtgzzA9B/UIwVTzc7UcbTWw4pfAaVJSXv1YabIWtSCAq+EWe3g7OSX7yi3vHvMLAfti0xm8cR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6H2XpMEktMcDWSZayIoH++Of5Uf5ZMFwx9TtpeXIEtXBjytWV
	sE17ezhK2gTnxIInjmrP+/FUZ2T565bE5yT+gY4PF/Jwdr02TYsE7+3NNUskKzif6Gju0ozaPvG
	A8x6pubrtQ0pgfm+DAFqrPlJQooGml6QGjgSDk4SHUC/lwniZAOC10WF47POW1ywS
X-Gm-Gg: AfdE7ck17PLZyj68elalhd4KYGMjSvZk1TUm0FOtRbFBFDnGELpB+2YLG81Lmoe8WIv
	ovPkk/IdQfTuzC+/kRE4jxypuVOH4TZwrcHkesnhvBYiD/xSXmhwQVVvbWCgqLmAN50nMW3o9Of
	k0Y/YgXsuMWMlKeUr81EMwdFzJ+tajCImtuD1Ol1J/GMSfwzjL6owhA1UKbn55XQHMFPQB1Rj14
	WsdFYLhtiJe0otlZdwMKpc2fLQM5aATor5A1YhGv55c61A60sk1p1C696qyLn+bLMEt11+vMNpA
	GXG5a2F+sLgDdX9Sj6fhCpAgQrrFKzicnpq1gReENsEEo5ajuO1MM6wA0D70Uz2mP+qEZXoOviU
	jEo+Q//fV+43tJSmK+WfbEaBPmaywzC/fWOPSOQ0OpckPWxf0i+K6ELVst54lkmsWWv3qDHw=
X-Received: by 2002:a05:620a:2913:b0:92e:a48d:251e with SMTP id af79cd13be357-92ecf550f41mr758831485a.24.1783603278767;
        Thu, 09 Jul 2026 06:21:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2913:b0:92e:a48d:251e with SMTP id af79cd13be357-92ecf550f41mr758824385a.24.1783603278057;
        Thu, 09 Jul 2026 06:21:18 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90ce5126sm1654976385a.41.2026.07.09.06.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:21:17 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 4/7] arm64: dts: qcom: Add device tree for SA8797P Ride board
Date: Thu,  9 Jul 2026 21:20:10 +0800
Message-ID: <20260709132013.4096850-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
References: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1y5l9JTS8_jhXbA38x3uoQvO_KoYPL82
X-Proofpoint-ORIG-GUID: 1y5l9JTS8_jhXbA38x3uoQvO_KoYPL82
X-Authority-Analysis: v=2.4 cv=GIg41ONK c=1 sm=1 tr=0 ts=6a4fa050 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=mTzsPlHQ6iguFW8dCWoA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfX8M2lUFIDCWyN
 7KJFO19nMhkOet9qGHJt3o+cAAzwHsD/wfGTYZB0j5Llejts3ZNgqo7SHWOt23L3EvwteWiqGpS
 fyBey+mCAILWYLCR6hcS+Y/whZy1IcJQJF3Jh1ZElbIP7NIezXWhMRiRooFQZyTF7ugT8TAJhsW
 zLtwI0oIESMAlgdX2HHTxCna6wnN2PybCkQc9YWgXuZS8cQdxotMyC7N/0T73tDDpSyP/HCDOy1
 Y4x+n1Cs8Yj3XO6KDWjUHiRbFr0EquL+PYbyCSCeM8QwqqMAw0Ya3g2nUyKbtzzxj6qdLIfugk1
 7jaH6bIRfDyja/YadnBROIgAX6HootPO8Qvqguqz9TQe1WZ3Rvlcvt+o1sHrzlw/W0jYH3H+eqw
 1FVoTCdCR823hibSLNFipV9Rg+p/nw5gNSCbJp6caxwyJLdbVah3E7uVOSriBllyfi53Zr92SjW
 e3EC1o+LbcvfDEIwVcQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfX8tak3OSlF1Mr
 JK99n3SLk3Skg0JOEeadbcxQdfmij2US7CKjWw62k5CsPBginXxjQg0V6wRDeB+ieOB5JR0SZKb
 RzlXrY+ccinnSFrRjggrysYiuF8vC1w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090130

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Add initial device tree for the Qualcomm SA8797P Ride reference board,
which is built on Nord GearVM variant.

 - Configure UART15 as the primary console and UART4 as the secondary
   serial port
 - Enable UFS storage support
 - Define thermal zones for PMIC dies, UFS, and two SDRAM sensors,
   all sourced from SCMI sensor protocol on channel 23

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile         |   1 +
 arch/arm64/boot/dts/qcom/sa8797p-ride.dts | 240 ++++++++++++++++++++++
 2 files changed, 241 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8797p-ride.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index fb1a99a3e01c..8e6ef4116146 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -217,6 +217,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qru1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sa8797p-ride.dtb
 sc7180-acer-aspire1-el2-dtbs	:= sc7180-acer-aspire1.dtb sc7180-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-acer-aspire1.dtb sc7180-acer-aspire1-el2.dtb
 sc7180-ecs-liva-qc710-el2-dtbs	:= sc7180-ecs-liva-qc710.dtb sc7180-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/sa8797p-ride.dts b/arch/arm64/boot/dts/qcom/sa8797p-ride.dts
new file mode 100644
index 000000000000..4ced77e3482e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sa8797p-ride.dts
@@ -0,0 +1,240 @@
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

