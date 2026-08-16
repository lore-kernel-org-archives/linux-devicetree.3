Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE962248B3
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 12:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786884933; cv=none; b=c6Otbt6PPmFmpje8vNIuzzTLptXBN47MWwggjBEHt1n8qdAbfpLnVau8fzraaeklZsB0GkEZTYty9gZw6Xc72cnk9QpV/Y/vCw3Lkv3Alx73HjQxensiyBjNfEh2ipp7V+cJ+kccZAkRrsW22jZUxcYQx70NqmXVGFH5GNWZ68U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786884933; c=relaxed/simple;
	bh=gsg21OR/hoxtdFYhtUBcUpC5bz3X5ywHu9xrO9slTe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ET7HFGMoI2BRYY8LCY9X+1VDsZp3Zt1aygrrbuA1B3IM49aQeGwdl+rQkIstDCcA7Y7hqh5XLyjpzMXkmHjOp/XXPvYg7gqa6r1WSdVEvCHrq3SKewCthc3rafkz6Fr5JOz4y13q2p2776G56oBsXR8WV/KyNxJOLgbP6CFUtNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SnKzQcho; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ea8Pvfje; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SnKzQcho";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ea8Pvfje"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GAgDHS3765257
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 12:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zBGRaEJAQRs
	nbMtd/JgkXPRhp91d80n5JouRnn0psjQ=; b=SnKzQchols8laPb9E4p/eElO9Dp
	q1FgnfDD+zLKoueEDXLxWcA4dQVFik8WGLd5+GU2wyBKkoMKdig46WbSTs2Ug3Mh
	kmC8yPHDVvGQ6KrLN0gUvdkb0+LwAMbNpS++sro6/hrgzioiDtuGNUbcDyDQLAgI
	BN2b8XQ6kM+j51vL8N3ccOMg/xdFECfvIrhhsTK7VUJonnsJVpqMGLCVnqyNODo1
	q7kqfldIO3PmBajm17bQvg/E2KDBTgzmemwry1WnAV1U2xZ8Q1ulgDChhyM6WZ9H
	bVWTpIAhqjAumVxdvKQVShHLcbkkG7/QwQHyZFxdwAzlGJGmhzTmjcRMl0Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghwkddb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 12:55:30 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca8aee88725so3803703a12.3
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 05:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786884930; x=1787489730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zBGRaEJAQRsnbMtd/JgkXPRhp91d80n5JouRnn0psjQ=;
        b=Ea8PvfjeVmHi/cYEj2qL3u3zWpE8aFQv07LBjfDUXXaCNvheSH8EB8wvejJc97r4cG
         k5LEvRK3drQqjv8rETwCaKxGwK6VfCnSYBZGaGfYHkxHD1aMKEi3YO2N/LJqe4mQEnLD
         60wi5BzZ645uHuVa/hUt0b7jwtO+CK4Bk6PHKFxBd+VZEyKi7ZPPeXtl2mLSgRV5f52X
         ts7SpHlIti/ajnsDOidNnL/c89Vy4qUmAOUgaD8U5nhwNRSZ4tE+HQlH84WUr9xgHfHG
         DdfH/ONa4OaQxy7Uf3rGlM31C/m0aXu/7+p3T1sjNHcSZ2busqrCWVMGHn+EZbnNziVp
         x+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786884930; x=1787489730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zBGRaEJAQRsnbMtd/JgkXPRhp91d80n5JouRnn0psjQ=;
        b=WYzeFVA97aKd5Rlwu9690Ky3924F5ki3vyE/XaBlVmA02+/Su+1fwSSLxpQfWk7xrc
         RQuqoX9bqWM1YcyfVAzD17JV57sRkEZtsCZNSMONgS1S70Tfddu/oBcyST5CdC0KRbZj
         MHTYE2kSzkPf7MCa40DnT6MDzyRtAXkktDwHhcu5XpMLgeQYRgV1eaVEktrmg16JVy5N
         hToO9elZhqcrhggAevnsXrkq0iAoR6Fp+3RqUY+sD6UnXWgsPfr83a6unTFDBaQr0bxy
         lLs6x0Fr1lrSrDTQH4fnfFJ5pVhFqN3/laZ9jkgROfovNoY+BRx+IkYt/Bx/itNGc3bc
         h7HA==
X-Forwarded-Encrypted: i=1; AHgh+RpRMzqHvU7y9XONR8m7W5fhxcDNSQsTZd2FM8K88LMGukhd352uMpf3TNQ0iVY8CxPheAA/ncoE/YJP@vger.kernel.org
X-Gm-Message-State: AOJu0YyuiJDXfjU/i3TtyOSg//DN/pDGD3wgYMBqsust40kxVmrnV7Pi
	KFxY9M3q5vCV1mJEcdWbKAgePXHT/S4OhgguwFv23gT4gMFpE+fX+sPz7i5eStjM4uqWKQH2tD6
	O5WZnpwVdevLyQnJlKx/WSMz9DqL4raMnQo/h5V/Ow06ikq+b3mft+MhQ5qao4k+a
X-Gm-Gg: AR+sD12sYsJAKfPs1EpXWtSGmM5prEqKeWX1sx/Q9IqmMuxepA3R3F9P8SEGcFi4uvB
	FvldPAdK8kvpAl69+bVCYIWiPiKwIgviB9LmbZgMZv79h95pn5i3az6aNghxM5I7vE8lUjUES85
	z0g5W47vj8M4BiZAY+HEHybL0keQ2dUhz6KBL9kpjpSloAxbg/O6UuMc92gGGx2DUe3uptRPEwV
	7/3g0co631JTvwNKkxItFuzKtNb7x29WnIQukbDOUF/2WH69ELtOg1pvec+64l6vc/G4sdeC13J
	8w7qYTpGg4K5MwomUQMB3qNMkrCrBxW787R7H0cEf2dItq9yrltwPOVgKIw6HFENPA6HX4w6stS
	dVRPC59HPWcRDvZrj0No/QsR01VFC5WE6ILZPfiDo9fNlZ6OKl5YtKrrcdhMT
X-Received: by 2002:a05:6a21:3295:b0:3cc:6d6e:288b with SMTP id adf61e73a8af0-3cc71d1e826mr18754164637.23.1786884929831;
        Sun, 16 Aug 2026 05:55:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:3295:b0:3cc:6d6e:288b with SMTP id adf61e73a8af0-3cc71d1e826mr18754137637.23.1786884929349;
        Sun, 16 Aug 2026 05:55:29 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141388bd5a7sm40072703c88.15.2026.08.16.05.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 05:55:29 -0700 (PDT)
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
Subject: [PATCH v11 5/6] arm64: dts: qcom: Add device tree for Nord Ride board
Date: Sun, 16 Aug 2026 20:54:12 +0800
Message-ID: <20260816125413.1635150-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816125413.1635150-1-shengchao.guo@oss.qualcomm.com>
References: <20260816125413.1635150-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: daozwz760yz4ers3sPcA17QMPnAfJSXs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDEwMSBTYWx0ZWRfX0zyw+sf+jk5Q
 gf0B/5VtWdq2vbkUOgIvdfg1T3cqJV57227i9ehjdH/8nIY5Zrb6GjcwH9g1567MYH8caK5l2F7
 YQ+6t4p6+xTQJ6GHZRNP8o2OaiUmsIqE+ZCfQeouweCo57zf8s6wot6tz/zZbSuns4EuvEprVZH
 jDXTBik5kBXTrCkpsxEQs2z4xoQ4QBGLag9QCAEKKZT8KE5A2aD3wfZuyEPi+O8kQo1rEQncVA6
 DI4ISLanImVZV5dNVI2k/WyDWsHDKGWfp7vglitz6EpdCfv4yzklopHSDUstJQHeA4+qbfwcgYl
 RginsFfVmOuw7Vta/qzV6oKwbHYHpk64WzAR3idTdrMEiAQI1orPCkaKvu9nQLWo9Ry99OOCHqo
 7lRJxHjLIamhtEIEX04qiv5rUGY+9hWNc0uS7l0uZ0lvuZdbhYtkkz7aeJZeBLWz314MpnBapXN
 jE6Dby/pYHNgct9zUAw==
X-Proofpoint-GUID: daozwz760yz4ers3sPcA17QMPnAfJSXs
X-Authority-Analysis: v=2.4 cv=DdknbPtW c=1 sm=1 tr=0 ts=6a81b342 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=2Hjw6vQzkyH4OD-tzjAA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDEwMSBTYWx0ZWRfXzefTgcM2GbIn
 43XSN0Zrh18wYeWwRd/eEU+hMEtwKZ8T4eUCXav5GOyt2ffwhEVqTl6+nbGMZK5j1qwg7hVNjZ4
 4x+j1uRvamyVAX8vXRdljrr4Fs2PJkc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608160101

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

