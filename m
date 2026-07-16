Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742A542F708
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212023; cv=none; b=rYqf9++H6dZZd7VILos312sTw+x7Lt64SEusvruSLKJ5A4zogB5IcB8V74D7ovZedpEfTv3OPIPdc2Rqmh8Ns/UASCa5JFzj8RRpRcHzbYjwftCEtvamTmHj6DH0QuLuPdm99fes1/gtJq6Qfro/E4573Vw8k1x64pxT/TS8OGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212023; c=relaxed/simple;
	bh=9lCpy4yMuQiIVMbLILXh8MsESNAKQDZrfg9EpLCWzV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kueEbFnOHbxpwI4EwiTYw8UmSoyU/8X6SrU88lgE2jjScMc9SgUgL+dZ3UkSMF/jFWzJSkm7445SNU9iPL6UXREFr/sQID62uCIa9ITrsta1Oul/tBaRaVKgqICu6TQW6irTxSWRjEgiG34AXIPXKLXu7j8MXs2cE5aQXxCxmjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vj/FQHPD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SvdA70No; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vj/FQHPD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SvdA70No"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJwQF2972684
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KMAGdgkc01v
	lnEx5rd8EGP1TUmnd1PB3iZ5H1xmsYY8=; b=Vj/FQHPDHj3DJ+WuK+Ejy0ok6Qm
	jn5ywXUTwPs3ntDqlTWKxY/Du6DdHf+9E6VtvMQKmrHL9eJDb0SDqzzoYl5wQRq4
	/Cf5SzJoB1btpEHdzJiaBLNsWeta53X/splNUGcfSqwvXlYbCFRvFGYuBbkDQhVt
	DewSQcSRkBLJ2wsfK1tTAzuU6Cg71hOvVbNJB9w4uAmCnYHhrxtbM8nRAjaVNC8B
	jz1cl/viGSU6+xWx1TznAvbN4fUppZUb6ymAYVrUKGRoKLaf1LbIpNp7ka0FoDGG
	uojQswLvsrBAGMQLR7meHpDojkVbOyYaWMU6SXgnFEMYPSaFGv/jdFLbjPw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feu109s37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:27:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0ab07320so61396541cf.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 07:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784212020; x=1784816820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KMAGdgkc01vlnEx5rd8EGP1TUmnd1PB3iZ5H1xmsYY8=;
        b=SvdA70NovaDBqMJYhDWj73DXuspsFvuaE9sEKjS/ETCdZMXkIF6JzZBFQZhyMRczWd
         mLg2KFw2i8iR8AMvkF9AhFnfAGDp8Nik0ZMgI/XH+Hq6VneMlr/HsfTr3XdO6d4MHvdy
         4g/tW0eTSu1Dahtf0L7C9rLJaXNtPo/aKs20Vd3DE3GYlobfVFSSq0y68MSw8S9g4tui
         LBM+MbDAito5ZkFNJJvVfr7DEsl0SoaHAr3DGl5ChbGPwFj2vm0JpIaFGXpCuZhmACEV
         dAq/c6kullLCzRwD5SNmmzD4nmicgGOULvcFoducKH5Mbk5X09/QuJp8s4ez34jHEGod
         dRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212020; x=1784816820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KMAGdgkc01vlnEx5rd8EGP1TUmnd1PB3iZ5H1xmsYY8=;
        b=sq7rrEECLaAX6KiE6+DdN/l/evhmCPZr1bJKxLddlnrFKP7sgdsbmPItkN0GCHSfC4
         S6Bgxkn9QQ0OcSkJ/x6SgwhxvurFYh6kyOguP9ZteIhD7jnBUqx04k35Dm2QLghr3CBd
         mhhbfsAxF8PTtvIQ34qjAupNshsJr65Di730P/LXDQmRU0ODwqORzXF5+9gbT3ZG26VC
         tohazEDfx7NYM4dApoMceTAQAbBPX/E0hgBZooDRcTt+NU7GXKKHj/sEZFaRArsiTeV5
         ydtoQk4fQ+P+1AlT9rMgq/FbngQA/BBfWYlwDCEkJqKNhIjbl5OneBZ04Lq5QJRVGcm6
         +sLg==
X-Forwarded-Encrypted: i=1; AHgh+Ro4wPLBQObdPEGmVRL5+g7YFu2Xf02pfd48/AxE/mDra2NfS07tthEgS3CZ4svvS9LYOPWAmNPDar9l@vger.kernel.org
X-Gm-Message-State: AOJu0YwnTfKiE41LGGNepITK9kN1ym09x0k77uo6/82usbDdUd8Z9djk
	/vIjVlukiw5VRnzz0cyvmVFw1/apKBUX9azeMcXWsqybtQirkgKm10HZjeyZ3QoQbO+s9Z96cJ+
	RH8pKpIbJy7hOOjh5f/j3TjpHkS6I32gCGFenWrxIubr+eN3ebNOXH9Gbge5RE77E
X-Gm-Gg: AfdE7cnaR/TkblByZwQCdiC+ksg6A8K8i3DaGqaCTNjg8Q2/w2fJUpcIkHu2HKoh9/k
	aND/E9PYOhLWUxauIW0/e2BHX/+eTicMRqzPUtDFyuOLXoVjv5pV/YA+WuDiTgny4sMfawQGJU6
	YTfz2fo/1y8lR4vCcvPu4+vUByjssRIxP9FQVotwMoSbcX4eC6azceBFEXCbcOdHGXCMznzQfH6
	7UrR1Ub9uET+ybXTD3EPbXiS0tt4T49L/97xY+uK0ISYHph0jVD9GN8jD9D5kd3TtiJrK6yl9TN
	Z5l3UWdMs0xFXw0/HLNRCGdX1nermRrOFwXr8bPSiTtOxOYR+WSUTk80lt10FjE2eQXYTe3Gb1p
	MsSLaw6F8UnC3THpkBe5Ty39LjPT3t6jwBBh7TxbYyh37EwbDf5Oe3CcbsY8k
X-Received: by 2002:a05:622a:207:b0:51a:7d43:9392 with SMTP id d75a77b69052e-51cbf16f512mr229100181cf.8.1784212019627;
        Thu, 16 Jul 2026 07:26:59 -0700 (PDT)
X-Received: by 2002:a05:622a:207:b0:51a:7d43:9392 with SMTP id d75a77b69052e-51cbf16f512mr229099721cf.8.1784212019011;
        Thu, 16 Jul 2026 07:26:59 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caab6ed34sm152869121cf.4.2026.07.16.07.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:26:58 -0700 (PDT)
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
Subject: [PATCH v6 5/6] arm64: dts: qcom: Add device tree for Nord Ride board
Date: Thu, 16 Jul 2026 22:26:00 +0800
Message-ID: <20260716142605.2398433-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
References: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8CBfy596sj3ICUQqvH4c0gS-TqByllVo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0OCBTYWx0ZWRfX6S7T3Nrcty8F
 0XvoFGFtXhGAInp2WWR7GxnPvcUD3DL5CsN/nbfX/6hHR2DJzSVZtAW/6VsPUOogZ97HkL0fcXb
 pvIAS+GdjPQQFRq5holU1XoGplZpy4ZaOYQAYJJaQmZ2EyOoCO8IQ/ANQf3lSRSshuDEG/S+4E3
 wxhQKY390L+hkzLJY4elUmcR4fIUO2FM1mmfv+KNLoFo9fYw6a6rcGT/X1/qYYy04fsh07LMq7F
 Ggrb5TZFmOGYyy0EeeGebwSYGEYhSUpzQctFzC7e0kzlZuVYuF0Cs4PDfS8KksaVqgmCnLAkNGx
 zlMA1RW8XMfp16IXtThzEYi+p9Bjckxupo/0Rx2gx54xmjcIdGOxp/0lSB/+2ZlZlJEkOIqI+O1
 3EaMchbqiiMDANqgQLLuvAE+ulNh7zv4h2903PTfqV1PP71YAxZYJkb9vDtowy6/jOvFcphf/eP
 cTvacQjm3jtMlwwXohQ==
X-Proofpoint-GUID: 8CBfy596sj3ICUQqvH4c0gS-TqByllVo
X-Authority-Analysis: v=2.4 cv=BPODalQG c=1 sm=1 tr=0 ts=6a58ea34 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=mTzsPlHQ6iguFW8dCWoA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0OCBTYWx0ZWRfX5ubHJOB3sjgQ
 pRCrgYpy+VJpHd2oA6J70ljqeL+22CIpVQvocIhLrcht86Oq1TVzOcecK32l2IZ3VLF0LzkoFum
 OfTGiQ33ecOSc+sHvpVxk1K7MNwwXk0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160148

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
 arch/arm64/boot/dts/qcom/nord-ride.dts | 240 +++++++++++++++++++++++++
 2 files changed, 241 insertions(+)
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
index 000000000000..4ced77e3482e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/nord-ride.dts
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

