Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4C93C415C
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784608846; cv=none; b=NJ1NIpxDw1BSIutFK4zr9/+DV+mALmshIOR/x76e9vdBGNHMKr0sBsLCX6XVoJnFmzky2EECMV7VvOVkfrDuJsHkmZ/uEMpKaaZgi4+GXA1P4g93u4UgAmZ9eePomsqGpRjuEUe4pt0wE+NcFOGUAEg1bvUxr/u32YHJsnVxkaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784608846; c=relaxed/simple;
	bh=L1m5nia9DXJ28o5OdFdYMNXCX4GSjdaprqoruP0tcU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fI0bEylhG1AWApzAPoYg8KinYHBuqZ52jnpkiymjjk2leYgqKSNb/ZdhMRsICep0D7fviZJu/feuMhhNRIclI72DkRHR51rZ2/xVQAm4jcOCsLK9F9Ni0k2AgQCxaqVgugyusNA8FCsMuIPTG1m9DGvt+QYu3wSBAp/GDFAPSBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TjohUfpT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AKg30LV3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TjohUfpT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AKg30LV3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCp7T3978337
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OLIAXWfCpmH
	FUwa8nw4Mj+/QbM8l/OZNREotv8y2c6g=; b=TjohUfpTTHsmdPAre25USQI2bwS
	85c7UoyjsqTYRWMuOK6R54nKXIGezFTiWgLczUXCKKK5NEWkBIzj1mqSzc7wIxF2
	BYfDR/xzrdKjEikvhBIUI477ohHycak679oyMal3OCZnm4E91aoB8LFzyj7u6ijE
	ATFAWItTx0HNNG+y2g2ckEQXYTu4N4niLAXa9rWD5m53uSz8hl9Fpt1EKEPIt2bB
	aZ6dldZn9vsNIhgHjbBCDw2gNKPyvOdwAAcRd+h9KZ9woE2T2V3n6MEr3upG25cH
	sdf07a7ITHnYg36qlKp6r7NrCi+fKaYPZeMgmEwAHhNb2yv63V+0G1xQi2A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv42c5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:40:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cce870a060so189512545ad.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 21:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784608842; x=1785213642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLIAXWfCpmHFUwa8nw4Mj+/QbM8l/OZNREotv8y2c6g=;
        b=AKg30LV3xCr4Px1nYmVw8JMBOGH+DSugEFIuJwUugrtnngrIz23Gg1BMhaDFI97RdM
         cfx6P5OwQmcOwYRvo75LOyOPkWWOmUU72tVJCdWV8pZ0b1wRBHlqTL8EfLVOk2GV0Nsi
         WbHq91r/M51+aXgH3YmR5WZlBASlKg6KRqw045cxy8V70rB71rq3j0KSXlJn+jjy05PU
         F6Xh5FQL9d2g6tItEEHIBFmixLvbg4PTar/j+GTNdS/szANmOJLhdzT6ibrq31HFbLf3
         gVBTkEOZDa79hyt/INpT0zO1VpsOQRqcZXI9IAQ86JLybU0wvxLFkaclI1rQ5MS1mh3N
         l5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784608842; x=1785213642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OLIAXWfCpmHFUwa8nw4Mj+/QbM8l/OZNREotv8y2c6g=;
        b=njcYJ1TABCPOW6RO16HzZ3tf8CxehFn2zKsf9u2PZaVJO0xGC6YI53NE0MiExEOQjz
         STXKYNZ/NQ231IahlO+fM3VcO6S8PX09g3rt34GgDgUuJyPiXzXPiEUSYqENx8cjb3PS
         vIyIIdAJIlWjUeFj29RJp8FotC4AbJjRWKW4ns7K0+KjXxi3blGPoL29xeirTllegkzL
         J9zmasWDWhKA6Z9cpoI7uJewqr76KxrdPl623BDNHiEDccUdV9nAy04NsxYLEeCs6Ep9
         s8p0RIEMocg5qcwJyFz5pAKxc4qHoHIoOt2X0ECaioFFH7zCmZlU4kvDGhdEc8tu2Dhk
         eyIA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7TImotqkZamJ2ssuzqq0l1TJ3Eoqk4T0hSVcSG/AsDqfHOzqBX+favMaW/5BraJLcYoGLnRNu0auA@vger.kernel.org
X-Gm-Message-State: AOJu0YyHQ5UH/PD+fTeglLYk+PM6KRQlOC43Mr+3pNw2WonTapOejnmP
	4iN9JdmV9GB1XBIjg4a9/g4G0PDlGkQ/mL+PSYKnFirQyqM78oIy79Hkpas5ftUvsUIscWF+IvE
	9+7Mvqma7b73MFTgLjB4Dk29v7wygzg9qoaKV4oLY3TllJZNp7oCaS44dQi2j2h5X
X-Gm-Gg: AfdE7cniv6/cQM3Vyot3ZMizvuPaySPXE7Roj8F13+ChnmgoRVGychCwniCAgi1wi89
	fgqROX522Vm/4qJ24Z+o4Ivxel7MibCUsTIx1iQF5buNBXb5Qd4CMWsfA6Ql+L0iuLJWudPmkC5
	6NSfebSBMRvXVdGAFe5N2NGa9Tg6nVFkDmLWHJ1djBFlIt0dWOU8zCw8xpaboRjDF2bCSH91bMr
	cjxhQiYHsQRqQ+qU1LRU7bo6hHSWNCvvcrcerKqf/to9xUqbcJSwMTgzx+rDb+Gw/KRKjWWdfnv
	fFIdheA29Flo3tFrrMm+jsBdGVhvFKiBqqgD6C1niZDf+a4aOQIkBwJPxQgnkDYG4NLkCSFwQ4B
	0bP2XEPUjIOP+seelUHAnQuiq0DjoaJiiDroumTug8sB0WUE1sWAzr3465ezN
X-Received: by 2002:a05:6a21:6e8f:b0:3c3:7019:64ad with SMTP id adf61e73a8af0-3c3ad99751fmr18411661637.66.1784608842448;
        Mon, 20 Jul 2026 21:40:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e8f:b0:3c3:7019:64ad with SMTP id adf61e73a8af0-3c3ad99751fmr18411630637.66.1784608842003;
        Mon, 20 Jul 2026 21:40:42 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29ffb13sm36532895c88.6.2026.07.20.21.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 21:40:41 -0700 (PDT)
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
Subject: [PATCH v7 5/6] arm64: dts: qcom: Add device tree for Nord Ride board
Date: Tue, 21 Jul 2026 12:40:04 +0800
Message-ID: <20260721044005.2882803-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721044005.2882803-1-shengchao.guo@oss.qualcomm.com>
References: <20260721044005.2882803-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: n1ivIBCtQq0CwA1DnBirGUk-wOKHV424
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0NSBTYWx0ZWRfX1ehbXB3eN0Yf
 DC/JWfWaEgKTXs0zwfOWnoHVvQ1uxJufCNy3Iz3TH+5a0urE3j5edFjLJyuQvRTvoe3rL8fb2VF
 rGdJtgJktcqLch4iEcCo/ne3MUZWVO1G6tX4FLhXmYITtZzR0Aqt9lL1YNjOs1YhzJyMGrZnHNl
 uxffyEn2Dk3pl6FVHT1nKUdDzsxC8ZxSQzPGB8EDbXffrRCb2xs/cgE3oj6bKgykNYXMEJTjXWy
 rZuFXTPfDQpDSmetCuqNXyg0f8cHWO9tH4EQTyhiZuAXx32RvObzax9BWFcg/9N2HcfZE0WN4po
 JOQ+ghXWzSOzcEEAO6evJIwhRF2F7QXIUzJZzabpaktSU4H4QgM7ABqTvE9AJ53Qbm2/XBu1PSj
 J/j36yMnLJncJoG4XwwPz37J3RZeEP2ejObSQmhMxKpsF5saWIWC/xgvjb5qVKnMawhy9eu6x75
 52ZCPO6995kXZuCNXEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0NSBTYWx0ZWRfX8d8UasaAjRMj
 7JNyEx0xRuMIDHdkBttaDEfwB5qIfjPURPvFIwBG86uNpY0ilPcoUqIeXz05tmFXZrp/buxts0F
 KeFRWlldxs9+UP5EAeUXdAOEF5NDrUI=
X-Authority-Analysis: v=2.4 cv=daawG3Xe c=1 sm=1 tr=0 ts=6a5ef84b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=mTzsPlHQ6iguFW8dCWoA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: n1ivIBCtQq0CwA1DnBirGUk-wOKHV424
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210045

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
 arch/arm64/boot/dts/qcom/Makefile      |   1 +
 arch/arm64/boot/dts/qcom/nord-ride.dts | 236 +++++++++++++++++++++++++
 2 files changed, 237 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ride.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e05414290d8e..28bd17c1e2f2 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -159,6 +159,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-lilac.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-maple.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-poplar.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-xiaomi-sagit.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= nord-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk.dtb
 
 purwa-iot-evk-el2-dtbs	:= purwa-iot-evk.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/nord-ride.dts b/arch/arm64/boot/dts/qcom/nord-ride.dts
new file mode 100644
index 000000000000..4a762e4ce62a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/nord-ride.dts
@@ -0,0 +1,236 @@
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

