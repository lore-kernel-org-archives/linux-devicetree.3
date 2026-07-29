Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8945D26ED3E
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 01:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785286868; cv=none; b=qhfOHHirb8EuHX52UEHidIrMW+pFTUETRc9uxcKIxyoPjjuQLDMIyDCnmNmUVPvIitIE/N7PLkrjqFFmcZSCy/9tOEB2Aegqw5DIT6sL3ZMDPXVC9AqoajDxsWidaDbho5lrImulYL/RHoZzDuLMoNKFwCkr7UMrtgknQAjp8NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785286868; c=relaxed/simple;
	bh=uGSEZKT7Y6NasT5SOPTd6McBUVb63VIxP3j0MEEhQAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LTcaZ6O/qoFllxdHw4iUqWqQsPe5sC9EaOw7O+ZPQKTvmyTta1mkRUY2EXQL0FUqlEkgpb0yev4RxaMxtzjozZuxaGT4rmsMb7dCwHYP3ho0Scy0lXZpu0BDocSxFGRjylD5orZTZRC+0zBGOS+uONpr1RB+7H1HK/Ujx2BVGqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SaWx612f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ur07o/wp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SaWx612f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ur07o/wp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SL36LY3469145
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 01:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=D7RnimT9W69
	CRgzam7YBVMCG445pC1Ok7sMkhY57SXE=; b=SaWx612fO40lFqg0ruCT9dDESuT
	2rbv3+JYHelgu6hz8l4gg83qr/CWbTEYI9MG0KTCDTSLLnhqEr5EIsF9hNEoSI1/
	bcYTnBw3pzcLErPFj3hk5QSDhcE+nLd/r1dd5nbz6PHIhV0o4HuFIskpgWiXSzEO
	GchHa1yuX+S1qjhaXGiPEFIg4t4NP1jUx815VcNNbNF0Kd/WCmYU1KqJ1eCPlh4q
	BjCcppNhMbjpqpYHI3TOmPTIJKiJ8bT+jMPps5ydC0lhznW0r8yErH3t3zBpbvFj
	caECeM1iDpyHPmj0MNb6R8K8PTH6byJsV0WcdIMtfp0nhZv3zWvGqdlRnuA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq0q0hht2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 01:01:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c89704da8c7so480879a12.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 18:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785286865; x=1785891665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D7RnimT9W69CRgzam7YBVMCG445pC1Ok7sMkhY57SXE=;
        b=Ur07o/wpb66oMwe4QMm47S6js26kyXZMzTuDpCfgFGwuGevoAv/f6etaU0Gdevdb9S
         MIZrxeQMQRSGwl9XxF8Aqyp9FVU7/ymJkcbfsEsiLVMnvHRc35MLxES5O/yRstA7rsQp
         dJn4GjeJc/ESwoh0UFDlpWJU6MQ7YUeIv+Cczei5r/XdKoeI06YUXcnoX3sctFJdhXy+
         V1U7gPTuA02LRhGxkvor0NZ5HMjoqa8hgzWWwjYpAqnfuEUAg/E7wgopAyNVcb8abbCs
         H8UL0NWjQmhJDTMIfueY6V3oa2Ww9vA7lkca4jEubG+sJD95G+1EUQVNdfydX/H+90q3
         21ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785286865; x=1785891665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D7RnimT9W69CRgzam7YBVMCG445pC1Ok7sMkhY57SXE=;
        b=p+WyS57GSpwyPZ6+Wb5Ywt7pa37Fas16PQjcVW9RMT0l7IwGrAlRE78My0TTk/isMJ
         eeUYbb+PtIbzOJCROOiLvlv5+eBpNO1B5Bvik8Aj+gZaZ5uz35Xuog5jt5lULbCEQHwi
         8arQIQlSwT7CZ8/GbR+Am1bZxKiS+SRA3qc7bzQCx9ILeAHsP7UnVvjv9NC9jNg0eV9v
         CBCDTAIeOednt5zMr6MvdhN/LJ20r/MlI0XnKmpjJzeVJAppZ58UVwxWNVe5qNk6J976
         BswItjIsDDFmo3gHu+Qfz6RHT4HQOChzqPjK7FWPyAM37TF2GrWIGpi76M4G9TOoUE2K
         i6iQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr0D5US7OgZ+e8wFZ66T+gMgkusNB5GilIADkc/7zgrBnyHJxDAoZAN1Y8Bd0W7llRaLUq+lhFVwGY5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9n2lqnOK/NRd6DkjAH/GH8ESjD0zkA3yri8yUZ3XMv3P6q3PX
	cRedVlwkfESs7t/VhDciDrcpraBWrctMLdG71KBJAy/I5yhs3/37slpQpXvSQbutRIbTWsOLCsK
	vYeT+BORvhEIlHs9+gKLAqaqQBbQdsDxTq4ObN3BfsD5XInvBgmdo4H33HHg6fjp3
X-Gm-Gg: AR+sD10bG8nsAe1s7oKN9Tk0DUIYooDvFslnOuCz0eH03CSRqgGIZFkeN0Us+p3abwz
	m7lzY1vHMfQ7WYv6tZdC95a8QtA5cuN5ZrAA+RFRYw7n6Fo9LqQtp3c/bYuO7Jzs27msAZ2OgjH
	NLOHe3sza1KAeoIUqCJ9REd8ZpR9QmDe8raJKHjyv65lNgeqDAK2K7e7GdKc5NdAMJypd7cfZc7
	0NBZw3wWxLl37wel9cUUfIlD+XQphEvkRwbJPh/mEZQJtzWVon0t5KQ7opwB1J8JIQwsKEATppN
	TrDXnshoVwyHAvDMEbBsmT51+TmkOIUPrQbOPt0KMwic4G0NFFSIc+I7YVS5mgtrC/k+VdFEtwz
	2OWipD3g8Uo0qVfavl+VAOsrZiO77iKusu+QLSpYHCxuSiZVe7yYPtf8RHNv3
X-Received: by 2002:a05:6a20:c90a:b0:3bf:6f30:1ccd with SMTP id adf61e73a8af0-3c8ba546272mr5437516637.42.1785286865203;
        Tue, 28 Jul 2026 18:01:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:c90a:b0:3bf:6f30:1ccd with SMTP id adf61e73a8af0-3c8ba546272mr5437480637.42.1785286864709;
        Tue, 28 Jul 2026 18:01:04 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b88e12sm3456696eec.11.2026.07.28.18.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:01:04 -0700 (PDT)
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
Subject: [PATCH v8 5/6] arm64: dts: qcom: Add device tree for Nord Ride board
Date: Wed, 29 Jul 2026 09:00:21 +0800
Message-ID: <20260729010022.875799-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729010022.875799-1-shengchao.guo@oss.qualcomm.com>
References: <20260729010022.875799-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAwNSBTYWx0ZWRfX00BgoGp1cYcL
 km1LRwZRCJRzylBbtewaFrZmnvVvtFu+vt4sZAaLLQDcovmXXq26NOcVeqY1yXjSfONx6ig3T1C
 BL0Yzt5a3Uty36jFC4+YJ1h3FcrpbkcArU7uWH4KjGiTfHlp64AipEM8Y8R157GtT4XIWqOLxEe
 C9ySXyNOtr2xtxTrgSULizeel236Eb/rg0N6dYcJAiDKu2lzeDCgTidAT8kuwjUI/GKyvPRjW/w
 Pc4vJhYPOAxOr4VEU7Fz+Q1mPPE860ZHBqHqWhs3+73PBoyHW+NRITv8l2mN5FedDwtmmr/XtH9
 LyKLKaZe5Jqqe/1fTbytME7RyvX3zQ976Zt4VibvrQZh8cVqO9vtU2g+pZCuSoXrWnI1frOmOK6
 pXuEhETfG9GhzCX6nohL+c3ET0SRneINS/yvJvTLvc62RXz1Nj5RkAHUcaD3HChJvHD4ces+gbn
 FAMxuy/xKgiGf9s8eOQ==
X-Proofpoint-ORIG-GUID: WfRKLG1cKC8lu5lC0uGJqqGHDPxSlSzx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAwNSBTYWx0ZWRfX8fbC59yfwFzC
 O3xcrVsqFvpJLdB0kR8/7IKQg/w2yJBcfATLBiKVRbHoaLa+RZw0vr13BJv9svPYMT7F0iPLoqY
 +Pg8tnSCwy2OMheODg4mB/8NIoy5PYY=
X-Authority-Analysis: v=2.4 cv=VezH+lp9 c=1 sm=1 tr=0 ts=6a6950d1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=mTzsPlHQ6iguFW8dCWoA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: WfRKLG1cKC8lu5lC0uGJqqGHDPxSlSzx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_06,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290005

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Add initial device tree for the Qualcomm SA8797P Ride reference board,
which is built on Nord GearVM variant.

 - Configure UART15 as the primary console and UART4 as the secondary
   serial port
 - Define thermal zones for PMIC dies, UFS, and two SDRAM sensors,
   all sourced from SCMI sensor protocol on channel 23

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile      |   1 +
 arch/arm64/boot/dts/qcom/nord-ride.dts | 232 +++++++++++++++++++++++++
 2 files changed, 233 insertions(+)
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
index 000000000000..1e9efe59c976
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/nord-ride.dts
@@ -0,0 +1,232 @@
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
-- 
2.43.0

