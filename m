Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF1A3EDACB
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 08:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786004235; cv=none; b=bnJgjCbg9DsxObxT9XYyqFuz2vlHkPl+orHFEGS+vdv/ANhl/BfaX5GTwTd1JI9MP7vG3q0gD9P8pBH8SknG5+XEhXxdL6IGNALWBiWHnH+XfBqQcEmoMMunalpMqFsCRKu0QXtlALn1d+17r3E4amf5fa0c5uy+Qk/yx0aEw9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786004235; c=relaxed/simple;
	bh=gsg21OR/hoxtdFYhtUBcUpC5bz3X5ywHu9xrO9slTe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sPYChr5ZUCrggcyzx9LwEjywelA5j9rMVw3T1kfwo0KXsDTA2nFPa08VG6tEFqzY3ZMu34F5gqypIlxNPq1OOHHi12JEiOTssldvVWA0INpfFLPvahJF932moQ8X11QlMNiNOzLbs+6S1RFmV9HiRjHggs0e0BoJrO7Ewif0c6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qg8CXokl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HTFQUkDc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qg8CXokl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HTFQUkDc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6763x6PL483363
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 08:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zBGRaEJAQRs
	nbMtd/JgkXPRhp91d80n5JouRnn0psjQ=; b=Qg8CXokl5CrTNnyJdYISEmuTzKu
	MT/WEVdPflK9mxJuWBALdQllII/6jmxQRopGb8WgGJK1SsPs9liJY1msLomJ3xsG
	C/0co0FPFcHi71b3Bd4VlfDAdu2bMYBAeRJLH9rmlRIW1VXK/e8EMZxTOJJZ4bdB
	vP8dJ69uKRm7t2zgxqWypq78+k7q7qPkB/U0MhKcgB5Y6RA7kQmoc8IBjLqNslbA
	BjGxyuHo2+6wAWLxc9YNgsnCgq8l2Q+bhMO5HCC3zP1lOGostJO97LmRcfVi87SX
	PmW66VVV3PS0R1NzfLG0aM0093JqpARjiKAEMVsE4NGu9vlxFSrskbeTNqw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjuegyew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 08:17:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848474825ffso1099085b3a.0
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 01:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786004232; x=1786609032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zBGRaEJAQRsnbMtd/JgkXPRhp91d80n5JouRnn0psjQ=;
        b=HTFQUkDcrQZtyNPHQnNjhmEV/ROZNxRV6eI5rrYRmqDO/PmT8jrHfGYUWXXrpchG/0
         6IY7rLlyp6neibaxq/dBrd/fTWQIzigSLlbtSaSZGTaZ3zd3i6/DGBqJ+XVLMxB/s0gY
         fDvlEuM/Qje59Nc8KlZpZFxtWwyaDYYBTq0iueyzphtK3Ce2FYgqpKUpyg1UPWOTuCi9
         kmwUcHcuGI2NRs31lVZwFA3KY+YAHSkrxfbU0MbhpnuItKmzsmPr4klYAMA7qnXXt/ZJ
         qzQVCBXmqkbYd6ixAIncRmDRgsFZdDKw4zTZw3iR/j3u44WXm+R3QcVtohInMfyrU13i
         Jqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786004232; x=1786609032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zBGRaEJAQRsnbMtd/JgkXPRhp91d80n5JouRnn0psjQ=;
        b=QPHWS4O5U5HSr81ff2dPrw+7CHYdV1pcdP+8Ktckyty+ZRcz6UsYSNEQK3FbaMqBD3
         yFFtbRkrsgqBqUJCao34MXcQ+NS2byFRq20nRpQBefh+bg1VhWkIIKl0/Y1SWY65Wlcy
         Q9nktobDQJeWPFCHUrACH0NaAk8iM1PWTxhf2OkgvC8Lpe1y8MhFza7LSsyqVTXkOFmh
         ZxWCoODXzluJ3HSK7HnEmw/lfwCdAwK+nQ01CJrnxP6nOM2fOIuCkqHL61ks9+YSFDPl
         NSt1g9a0sNYxrXn3Sd88Yv7WG+Zua1lINf/vnH9e4MnipwC0KSPrg0YvipU9XFvxcvjT
         aHzw==
X-Forwarded-Encrypted: i=1; AHgh+RqME8qfz75ALGaTtEh2t7Di2qMW/OF1FnRHP9yS/5zXb7no0TBXB2rcHEEtor2u9Ac+jkalgfQLygNO@vger.kernel.org
X-Gm-Message-State: AOJu0YygRpgjkvLESH5XTaUybS8M/nd0xfHI2YlOA5yAcaN+RAWpw1Ds
	1CkxX4bbrWXVhB/K7GxadyenEqv+DejTwoOQrAUNgYJgzuU869233UrqiAUhKSWdVaiFqssJ9kt
	VtTjPgIA2BaLQPMz78HHEU+W64lMQSNKgVMDkvwjA34Jh6OqflDWX4VRkXpQU0S4N
X-Gm-Gg: AR+sD13ZVh25zmi6RjWbbPzbxlq0KLvmg5O+2zk2hj1F2UIhy3SrdxzfTQVJoW2qHV0
	aJ05ivRP/XJhk66ouhLutZUu7c1XIsulVk6OTbE61cNmSH/+cvrc7cnYI4N/Sw134vudiVWJXwG
	fp+5idRIzEdygrc5VTA1E8XW3eg2PtCARTP1Hu/Ar3BiSgbbpQs/uRATkI1Os6mprEScbhLYS8L
	7pkasvWJOgJQ3E44GPBWNyL0tAv9dKhrLRbzYdXdHWVGTE1dz+uH3TeElfvHO92ApAKy5ovDOV3
	ybOgRu3O+DqGrOnMWgMZ5S3Lb1+YznaHbws3VtRDbVpbKxwShNhEe40RKVG7y8x0CdCheKWKyTM
	hcK1ZZLH1EsjxhToDuyqVNwibRnnckXSUpjeONP7xpPfthjlH/mTtaaP4hxSw
X-Received: by 2002:a05:6a00:3692:b0:845:cad1:d691 with SMTP id d2e1a72fcca58-84f41cc1448mr5864794b3a.5.1786004231905;
        Thu, 06 Aug 2026 01:17:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:3692:b0:845:cad1:d691 with SMTP id d2e1a72fcca58-84f41cc1448mr5864740b3a.5.1786004231475;
        Thu, 06 Aug 2026 01:17:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f4538bc9bsm921225b3a.11.2026.08.06.01.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:17:11 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v9 5/6] arm64: dts: qcom: Add device tree for Nord Ride board
Date: Thu,  6 Aug 2026 16:15:53 +0800
Message-ID: <20260806081554.448531-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806081554.448531-1-shengchao.guo@oss.qualcomm.com>
References: <20260806081554.448531-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aNzAb79m c=1 sm=1 tr=0 ts=6a744308 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=2Hjw6vQzkyH4OD-tzjAA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: A3-gzEqMvEpJ1F7LwH8UfTwrkO1AlmL8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA2MyBTYWx0ZWRfX+F3lVj5Kpz2g
 Nw/Ps9UztZxoOH8DtagAzA4hMzYNzUieOmB0SxNfMfi19yswxCNaJkahypudSDc40cL3iAA0tEI
 rbyQgYHgf9J5ii4NYrYE4UnSKRJNHJc9Z7GBAkE66qt6vPymyIN4tUarYomVeBBUWPUjUECnQfN
 0y8GsLYm53/iUBDHxYmxAZMcTqPK2kXQ6l9QGNQ8n92XBz1wVWUvanzHzuKPIh99kDW6CN42nE3
 hSJGN/WlzB8xj0HVllNOhf+JYMRQKYJPFKsjwIfbuzP1nfzs3a7vFAW5wxQM5/PHnjRUxVr0nGY
 DmznOQV5eeprueJraGvfog5sxc1ysWZtWJaEGLe8kEJa4URoem8PX4Nyopgrcz2XWlEtvN/MOEr
 mqmGPwIa3lDi7IgFz0blmFOSWG+/hrs7crSrcAHxTy8f5B+f/TjccI6LydQYfU7ca/GEfzURKkG
 qpWsWTJK3qwwOdQGeXA==
X-Proofpoint-ORIG-GUID: A3-gzEqMvEpJ1F7LwH8UfTwrkO1AlmL8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA2MyBTYWx0ZWRfX371BwJENsqhP
 I0RizkpWGmQ0/r1uIniVCrMjxz3Uu/0fNBfAB86dM8neBx+1u4wSbnyh9i+88Bwgr5YyyPSf7va
 yqOM6p6TR3Pn/EItgsqHDg/Sbe6tq5k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060063

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

