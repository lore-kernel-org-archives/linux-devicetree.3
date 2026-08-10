Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A723C3BEF
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362259; cv=none; b=qYPcvoDU/eJ+vrrL775/dbuNIr5eirA9ZDD6iTm905SCyTJjk5CePfXQZmaKKpVHjrNikba9F/OcGX9F//vLB2mPw8DvsCZwgmUlyacbp808A10ypD1vljEaV9F+lOgHQ9l6nAhvYc40nG9rlj5LNAe/KDr7NA0KQVapBSpJcec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362259; c=relaxed/simple;
	bh=gsg21OR/hoxtdFYhtUBcUpC5bz3X5ywHu9xrO9slTe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GAh3/IvBt/wzbbLUv6SYu0nOIWGDuffTROoHpgTJprR7KtWZtudxPt2RhlnqJDcQiir9VM+CJVH11xZmxmsHKG/FEFvwegbHpJLsF1oxGlAelwmkgzxG73P8zlFx9TfIwLvZeskchraH5q9RGmimHHHMaRNIx3IFgI+BbM3b/d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OJFjsZtR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gjswp7aa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OJFjsZtR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gjswp7aa"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9S7XJ890382
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zBGRaEJAQRs
	nbMtd/JgkXPRhp91d80n5JouRnn0psjQ=; b=OJFjsZtRpG8s5rBJeSvdLc3sDZo
	J0ilhqpLmHFL0BCq/6jiopxhzWsrjwhI6BJkofDbqoo0j2q4YJaSo/3CrAxRNVpx
	pi4BCoAepozW0VFE7+O2+jagwfa67quDMMtmQU5obHiPOJuaTcT5wZEC5r0LcTiA
	L+IY2SdK9ZP0NTkCS5xGntjPBWP8D/IHMattjCN2HUijxDs0iYpSu2CrWfWr5kXC
	tCUy2jmWjX1yZS/QFsinmZI9qnP0jkXci9ZVJg+UdYGSFVqBBRVFhS8v642vIncz
	k5y0HWsx6Gsozm4auXv97HaQE2o52pfPafZvZGNeWm1pDD6kYK7URN6tb3A==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v49arb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:44:16 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4959c49e054so668323b6e.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 04:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786362256; x=1786967056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zBGRaEJAQRsnbMtd/JgkXPRhp91d80n5JouRnn0psjQ=;
        b=gjswp7aalH3T7E68ab19ZIHyI3NXB4OABGscaYFtOwfepNMrYfPzDWwox7Ef727Ptb
         abcsCMOFk8sczCWXfEG98zm1x6Ocr1q3h8roWCe3PuUayUd6UlUZoP9JDkLFtLc+b5+a
         X71jK5rSmbXnGf4OF17LpYxWeFYocUCCxbz7VkQft2Xqzr7PdAIHXSg6zE8rIf8E/quS
         ge01F68AiQjT21BLXew7wZE1dfFlUSuK8vrCA56Zua5jxiepiRx1UhN/Cc0Imb1hde64
         q+O3bh2HiFVWTSxo5VtIldR6CLr1HgnIDAkLxxrmoqjhBpxfedlAUzHJSe7sWmNshXMD
         p1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786362256; x=1786967056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zBGRaEJAQRsnbMtd/JgkXPRhp91d80n5JouRnn0psjQ=;
        b=RwHV3doMLUFijYKx/46xDwIIImTIjwn1Z2ML67+WFxGpj5LriHb5boPpclXMBi3ci3
         fIkQ4I/wEtFoc0/qiUOr/+vlFNMMU+Vi29pm60/V4YtD0DcEgIV9VkBGZURLkWY/XxlR
         5nJLSvJFcxU3EhGG4jTmM3CbFAE7d6c7kKE3c6sWXaDowgmvCjF3txpRkCZ+Ln4FKlVs
         i3O1JB41jXEdtmORwYvScTeZnVBQWxlQmxOx9Kd0p359iy+oyw+33UL5u/jjld8LrFER
         C+AOeVi77itufq3iCs5+nDo7/9cIDXEbN7vfiV+FVFz3Ao0ptzmWwB8ZAUIEcZXhWM9P
         Q/uQ==
X-Forwarded-Encrypted: i=1; AHgh+RpF9dHP0/5EzRamRmS4NnbZGNQkeUOTh62cU5rKFdUleI368nmlyFBJcEcdZmKSPFyslK5NHUBR3QI3@vger.kernel.org
X-Gm-Message-State: AOJu0YzWXzEokEajzdXDQbpr/4HqiCvakQAstEb1qTd80vbxrpxWHctY
	/NS+e/r/KHKA4GcooVR5dJzJ1leJsI+sUuHMqQ63ono4pKwRNEZoxNs53dOtMvt0uFUOPCNXuAW
	lQ288xiiBKeGonAErTsNP4WYpSw3NnjGbWa1j5VbHsUzOn2dPmeI4u/TEq+gdDy/q
X-Gm-Gg: AR+sD11fqp5f9AEHlC681ue7mI1hp8lIAwQYiPdWkT7MgTLGMa02cA3CFmbb7svRe4H
	v4GNkbxbOmSJC32/O/7nw5thfA9g0HqSpdPO9Ud40sU70c7Q9MWlzBUvZ7BCLPjeSBxVlz8xEg4
	5DvL5e3kAs71PfeGabXLxz/8rwvb1Tn+qQ+fqwxA/gEOnwi1oSkRY7CD9NSnBNri436yk6XY+U7
	0ZxeddC1RRL1Gcf91H4dJnDs3pGMAmWCjg0cn59fZERIzuqr0/G86jcHBxnHo7IWWCGUamKS0F4
	I7fV4swhftM0FENqYbM/bl09PgZjzy/GOrKYA3km6UHUQIVs+fEW3lToMZBekmoFLmt2wM/Jg3P
	IpZzzsDM7sVuc/ZRhFqsZqjGCDqGfvTblPUUodO3+hDm5CpRDMOQwjzMxqArH
X-Received: by 2002:a05:6808:23c4:b0:4a4:856a:c622 with SMTP id 5614622812f47-4b1e79d92f5mr477542b6e.20.1786362255608;
        Mon, 10 Aug 2026 04:44:15 -0700 (PDT)
X-Received: by 2002:a05:6808:23c4:b0:4a4:856a:c622 with SMTP id 5614622812f47-4b1e79d92f5mr477515b6e.20.1786362255128;
        Mon, 10 Aug 2026 04:44:15 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b1af06bfc6sm6035281b6e.2.2026.08.10.04.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:44:14 -0700 (PDT)
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
Subject: [PATCH v10 RESEND 5/6] arm64: dts: qcom: Add device tree for Nord Ride board
Date: Mon, 10 Aug 2026 19:43:12 +0800
Message-ID: <20260810114313.776563-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810114313.776563-1-shengchao.guo@oss.qualcomm.com>
References: <20260810114313.776563-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gWe2RsvOGhj7kq_kO2pdwcq3vuF5ZPyx
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfXwSc1qLJztSff
 2Wc0aZ8HFUFSQ76RS1yiiUoQgtkjrG5uS3oYC2Jp3EQahuRkSEkeXNHeO6WkztrQ0jrOm9+4lbt
 m/NooYZH4cJNEp2Bk8SEFmx+bU1rWOM=
X-Authority-Analysis: v=2.4 cv=W5EIkxWk c=1 sm=1 tr=0 ts=6a79b990 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=2Hjw6vQzkyH4OD-tzjAA:9 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfXxgfRsCwVbS74
 k0DIMiA1g6KNJXI9l2motWbF8J344s30/hxMKW9ObtRG/MPUxAwbMVdctMw/fiJycY/5IEnhYtz
 UnhuUO39J04xh8vEirL/ukY8ScaP30oAFNm9KGyJSiwHSjINAuqb7oKlBwQ9M3ZiF8YS0QvwSVh
 +KkrW79jLkms1Ak1/hsb32z6o+/G1hJbz0uQdoZUCjR26M7zc7Pogwc4ctsUxd2cXmpLwiyTx08
 aQ0VWUIVH2fnwELhE31uqEFBL+YGnCnUXfQS8Sh0m7nsHHRrp6D/IYyprdXAaE1bW1uQjCscYVi
 BwJTyB98qwYjCJSDr8sxI4z1ox1NOlv7feclwL7R63Bo/V7GEVJo1gs7XYAePkeAnzUltwT1uGP
 c+kCkaqvxdEqSh3vxC7zuu8mgVRd/8FrzIwJNhx097QO+BAFIgH1HPfXHYCQQSzvxC0/sn1vXi0
 1Hq2oWE6JUy3YcEkbVQ==
X-Proofpoint-GUID: gWe2RsvOGhj7kq_kO2pdwcq3vuF5ZPyx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100102

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

