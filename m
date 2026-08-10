Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23C63BED5F
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786360119; cv=none; b=rvECQ2whRaLU4TUwooAD/oebGVaBabtXa/QdXB8tIuKn40biuglWEl3Rde/eYOGu6NhMXtzdPzVq2s9oQ6ohTCABnM1UWgsqyisIxvv1H0Q2oWuxRtgN6FT6+keyPMPGFN9OUAxnRDAHPDnbhfuEOSpMZr5D/CRv9mhc8sGg+n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786360119; c=relaxed/simple;
	bh=gsg21OR/hoxtdFYhtUBcUpC5bz3X5ywHu9xrO9slTe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ATI+dWIqERnikVSRafy4LZAAFuGBUDukcHJOdJPWlMZF1VwIqc2FVqpSu/SGe43eroJ8z+liBNLsPYC0r9/qgBrTHQ7W8HVi6x8ZTRkbZgwChreoaFiBe/XcAeyzH7WYcp1JeuxkZps2X95b4G/B8OcIfy2bePi+dS76aetAw2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nlf9T/fa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hW1g3kkh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nlf9T/fa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hW1g3kkh"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9S17m1189337
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zBGRaEJAQRs
	nbMtd/JgkXPRhp91d80n5JouRnn0psjQ=; b=Nlf9T/fayuykpORJyjoYqJAg1/r
	EiGNCyiX1JmFGO3YLQ02YDVdRWHJEx4csomXSf8v2IgTl7I3vSRdKYBIYHMc2Pq7
	8Lw/Kq2VnMxMTSiRSKuR+25D7e7xvD0tG4SDVlruse6ophkGHP4xCncdvHS/g1HY
	pzfjp79OuZXTMb07t2ayDFUpKL0qA7ZnTBjfncmkACFm9GNJWz+JilYXHD2Otly4
	/7da3r1hsdBBoPW2mq1Zv4tlSQ2Flux2Fm4NTw15SC5BS8tpelkwQInc3SBcHxxe
	IFy+c4SRtjQDDIT/8FzOmU18VEx+hQPo1YW2Z1vOCreox241ua4LhzzhNhA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v29756-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:08:36 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c89704da8c7so2921368a12.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 04:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786360115; x=1786964915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zBGRaEJAQRsnbMtd/JgkXPRhp91d80n5JouRnn0psjQ=;
        b=hW1g3kkhsSAatW5gkjeRWbWCDMcLkOMcU4bu5snJN3Q112XB89NnoVoUH/FpUup1kR
         Z3Ln9LKmZmJUTAFClymYJomRnOyYLn6PbWbrVFQs+C9OJ3xIK7P8PsAtK0xYaFBo4nu2
         nb/j3WNe9WrW3CjcYx3V89VVx8ZoTPG0H1KJBxAUoJ63jz0fWGb+7w7f0GHcDVqpiwSV
         ZUZsAT4mWyYTC92MKB49edGmijzq4pWF5r2w1EPdlE3qnPgYnGTSTNZRFTV0GwS3BxwV
         bhHZ2DGgsc7vQekeqEJ3s66NEyZFEcEVhaMhIdQo/HDkpxFrwsKa/BjNG3Bt+tZGN+qd
         CtvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786360115; x=1786964915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zBGRaEJAQRsnbMtd/JgkXPRhp91d80n5JouRnn0psjQ=;
        b=sWBE5VkXHoI0jN+m/CumZyaZYbQkqq+87H6ld51rxR6zdZfarEsVQLqo+ZR3SOXha8
         kDr1QD8/6PegeUoCGjmBMQNfipKE13YImSIHxCE9WpxN4G58jOIJwNruHJjMArnFcOTy
         fLKijv1qsUkup/4TBB/buTT48SGNPWN9FncLBgh7jg7y9v7Efp4UpjTccrUuoqT3sm0f
         sa9fhtTLcgo5Jtmf6p7qMcWx16qGfRUAZkBlLGHnbWdGZPUvLJoQJ97PHZpTa4Ihc1Ow
         SROki4O2NFlfwLSLfBZoWgL1MJ7GQ0ofZsIIpr32pHvufEUMeWpEA7iPSTdE8uAMkJPZ
         GNaw==
X-Forwarded-Encrypted: i=1; AHgh+Rr8Dt/iTqwAChBRh6XRxyGAg+l8B/5y+zHpTCRMrDKEnMlXkG1DRrHC7pp8GHWL+rRE21+zyb5S4Mr6@vger.kernel.org
X-Gm-Message-State: AOJu0YyMsU61fFO14pQMnDsumbx3ZFPhThwRLxdTEJWWjrlwB5D72Eqb
	xQTZ9E75QU9wv+tem3OEmcNW1QQbnYzKHh2nmGz3ZxKFSy7ekhptt5TUsU3XuxmvmEQe3+AMYTK
	K9o6A4AaHfoZMkdpWou/626wIvZ5682NsR5nlWUeSrObHvcKsrg2V9y2JG23oNR3d
X-Gm-Gg: AR+sD10pt+m7dEanDzqalmOkGZoOfoEKC/W7nVV9c2G5HcvjECtY7SQv631JNAqb44m
	/05Skafsj5MrNPM2az4seefYVBo8paUV1VwoAq8WIxYS7Q9gIa5qYj0EqY+xZTpwV4KoakTWUst
	8Tr7PNVt4nYg1KPDqRvB+Z1rz3Mzvo0S8avil+PBBEjx4xDMn2srVwJjLmO0gSFPfZGAPwB0jWS
	H1eFIG1ccYHM7gFkiEc8o3/VIz925rLMLADnQFo8mHVpW9BAYrHoKbMZRXmIDGlIUwp2MNZkdLe
	z3XNxr2SPz8/+DBMQOIKQ3YFkqJOOdbxaWNK4hWJge/Q4iG3I3mIEE9kMDTBZouLJTt4Sl0PM6M
	wyVjo96ijv2p5uzkkeHJi44AWoUW1oQW30oEQ83HPM6eGwQsPDKFU1OrqVHzf
X-Received: by 2002:a05:6a20:6f8d:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3cc1a435dd8mr1175890637.35.1786360115397;
        Mon, 10 Aug 2026 04:08:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:6f8d:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3cc1a435dd8mr1175819637.35.1786360114902;
        Mon, 10 Aug 2026 04:08:34 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebde353sm46520198eec.23.2026.08.10.04.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:08:34 -0700 (PDT)
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
Subject: [PATCH v10 5/6] arm64: dts: qcom: Add device tree for Nord Ride board
Date: Mon, 10 Aug 2026 19:07:25 +0800
Message-ID: <20260810110726.775084-7-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810110726.775084-1-shengchao.guo@oss.qualcomm.com>
References: <20260810110726.775084-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S9PpBosP c=1 sm=1 tr=0 ts=6a79b134 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=2Hjw6vQzkyH4OD-tzjAA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: -9b7jSL2jI18C_X1ubWRhUSrXLJHkfKy
X-Proofpoint-GUID: -9b7jSL2jI18C_X1ubWRhUSrXLJHkfKy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA5NyBTYWx0ZWRfXzfgvPaEb0s/R
 gqui6fy0JU7mR/z3ykUqi6zbF9g/LowbcO52kQnDnodnOEGYEWNMGWNxh3XaW0PNZ7tRGv2XIDF
 tNg/pyQX7hWBeLb9EUvDpOZgz3QsbI91FpJu4T/D76Iymf8BDvYgKkH8uMWVRsggSGp/vCcpsTy
 tP+gAieJbB/hIPFuZjZh7kxsZpjtxvSImDOWBGFdTiCHiqv4q1K3Jg3wSlUBrSll7Xsa+Y0QChD
 3GBRjH0K1oL6iBEPhVaErWW3jmucxrExUhfvFGwbAeUgp2/zJc5rR9O9kj8hZN9qaBgRcOOkxNm
 SVzCeBAG2062BIJRXXZJzoSuNoMNU/1DG+Ii9vgPZW4+NqnZkQJFGgJBMro3lVUMAhalo86vzth
 HvV5Zd8ex7RSK9Hzd6YCRXXdL4T+8QzLJRXsSp7OClxbFwl/GZwJUxutAjv/WqQKw/GPQsxmb2Y
 wOVGQ1C+iqQyAdfqCrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA5NyBTYWx0ZWRfX47ADgvUfK22o
 5V3y6YSaWxVamPfwt4LR3H69WbX7ckAT5Cw68cJIvd1RGCMairOw3W88gyeEoSQEXP3lzppNzQi
 i1zvZFSISWu/Z8TmaZBGioTi2xUKgWs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100097

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
 arch/arm64/boot/dts/qcom/nord-ride.dts | 236 +++++++++++++++++++++++++
 2 files changed, 237 insertions(+)
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

