Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4BE340DA6
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789355699; cv=none; b=ErvGMMOnpiPBEJHiL2d8UcyIfSOlTuRZtPVFZ4yVvUJlRD15ZeaIqQH9b6usyRfhNexpsuwMuWyQTvhlZkOFCtKqQXInerimwyx1K9NclvkFcTodFWLgYSmRFiUknKrXaYOKoIzoIZkIUQfJZXGDqP9FsjOz/V7ihyvuSxrCwMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789355699; c=relaxed/simple;
	bh=WRGcjaRZYS9OoWgf49R5ngkI4jnm1va5arqFOgxQXSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ghFMuIy73yoKhUgp8HYuQya0xWdNBdTDKAg/D2qWvI9Zaa9EeSH4TkmjPRywW6Jn3k9sx8WbUGFYZ/GcXrrIYzXL46PcATYXZsd1fukMBAJO+cDGtDPFBTjKKe4F2hLPHkVQ7kNe+Cw5/aDxeRb/Nhf8WaWx56rTxROF5Mw4A9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QB0Xg4Vg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FVgS2LMf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QB0Xg4Vg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FVgS2LMf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E2eJUB151546
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:14:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gD0SZqaHIpj
	MyWHLSquSM/8YirH+boG8QSwXHsg/hIc=; b=QB0Xg4VgR7g7dOVSKbY/gCGZ8Nj
	B4ugs/eC/tax+5rZUbV0jMMBJhuLK1zwNBC8lkVTKCmezv/cQulNYdbV7Ti/5j4p
	kXvHfy4UkpWKKlHny6dIlE5fK+/mnfS68YAKc3CINNdfo13IODpkYc3vXLbWSSNJ
	+aM+plqLWBjN92e5sFtEHNpJE788ovQvn0A+7/vD1BhaNMuR/pHjxFgXuNOTU0rp
	fM2Ov6CBE0bZ/l6gjXjXBSJqxIagqAw14TJ4VGIku3KEB5wqLba4b8UY03Crd71X
	guXkWydVrGzHpdUm0QlVlP9NiCjgJ0gtT2o32Lwr6sgakAiTXJRg9CRnVmA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k08nkc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:14:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85798977dcso4657808a12.0
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 20:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789355688; x=1789960488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gD0SZqaHIpjMyWHLSquSM/8YirH+boG8QSwXHsg/hIc=;
        b=FVgS2LMfUqOEcrOSOG0+aBs6V0ypX19t0txh4PKB+eDd9KQx6sbPpG6IHutEPdjsUV
         QGm6d0iB5MFzwTCDhGNG9giIW5dzFBGx8uzEM3j6HYaZDxxO4p1z/vboHsHWQ5Hv+L6+
         s17i+6wptUhTKGCZCHDS1MQEZqIA6L/34v5Na3Y+NxDvnTysHCKAB2KJLGynfLSEIZqa
         nngDVYALdrJ/q6l82+WS42cOe1u5ssNt4x5DIwwRlHsy6xkfkmcKIbW8fcM3vewKQUT/
         Njbo8MoHWWEyLciu/UT1StX3nICMF+AJLxSb/34kSuQ7GlwqMVfesjpceaeP6ZBimT+O
         bdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789355688; x=1789960488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gD0SZqaHIpjMyWHLSquSM/8YirH+boG8QSwXHsg/hIc=;
        b=tRr4dULUP4CdjaGFRjQKIx1OAXjy2mTpWTLKshUd53+BHN2/j2fttgNYcZEGDnGAca
         rnG8Cavra+rUeswLX4c/mDeux5zN/lUgHtCRVQZ5YUVyxWEqpsZim1fpaUwjwR7aJY18
         uoh1QdCbVRaPMj9Wb/eYdIWOTCqxkDDxfs4Bgw/r/KMi4DoSBOkANIjhOI3CCosqMIEc
         nOUHUbl17Mxdx5KwNut6yYaO6cCg2wRskdntgO3gaHVMZyVwNneaAC21QWJ8SxdL3z10
         Jf17nOg+qu71sq+TMhmtdHdPGzdu8o11ZewrwS2BUr5wmFrfJqeftq1KjSN8ORSPB6fe
         NrVw==
X-Forwarded-Encrypted: i=1; AKwUvBym2ihdES3cqwHWJjvqbaQ0pz2lJpgnXT/IbaUlm33amWIKYnoTIg1jzmC3O2fnPwnZxAu8f/wIZHl2@vger.kernel.org
X-Gm-Message-State: AFuF++ma9Gxws3dJavVp+o6I0Fzt9O6eMiHo9MgRgnkWgO67kHZADHLN
	CoogWybttrKAWBaWwgBWTUhkJyFTDSsvu55iK8cnOH8xQR3eineclvBwCS94I0pZfMbIZ5VGpyc
	G/gwp6vGvCiw919bM4xpiNzNsSpyhS1WBBaDmpT/pizdcfIq5yzalSE7OHdvUGGEj
X-Gm-Gg: AYBFou3xW3rEVpaQARg3lVrj7nKMNyZLBoSOIhKDm5MUwjDAW/M1pNTGd/IRfUlNWak
	Rt3CR/ROPbN+ga7GCya8nUP6V6nu7+qjgI9VKsyocHsEcQ7XvLIs5Pgkks6LKv3ipRQDiMsSHAX
	HBMBZBLtOjBRRlmYwarjzGx5NaIqivG7wx24o/JaU5hO5NNqjm5Q6w4tS/YRqUuT7sde9g+E/C2
	jeelkGs2dCu6OJkWy24xVzqGAWrp2Xm5W5PIqmGRvG/Wpj652tadsMBz+3TiDIi1JHPP1lipFOK
	R1L3GT0GD3I8BsRSXR5K1QEkP9VE1VTs3DuHySlhHARIt6TIg4Gg9XW3kFkQvk7J5KxffxdG93p
	E5SXieD3KgUmzNYwbxxt+WeMYWUNfBbGy4VTxPb/21SyxunBnH2z49hr1rLpS
X-Received: by 2002:a05:6a20:2450:b0:3d1:2f88:913f with SMTP id adf61e73a8af0-3db40529a0dmr1180533637.14.1789355688369;
        Sun, 13 Sep 2026 20:14:48 -0700 (PDT)
X-Received: by 2002:a05:6a20:2450:b0:3d1:2f88:913f with SMTP id adf61e73a8af0-3db40529a0dmr1180483637.14.1789355687943;
        Sun, 13 Sep 2026 20:14:47 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4b1f409sm26714231eec.0.2026.09.13.20.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:14:47 -0700 (PDT)
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v15 5/6] arm64: dts: qcom: Add device tree for Nord Ride board
Date: Mon, 14 Sep 2026 11:14:10 +0800
Message-ID: <20260914031412.140856-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914031412.140856-1-shengchao.guo@oss.qualcomm.com>
References: <20260914031412.140856-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA0MyBTYWx0ZWRfX3UPTQAwG3PkX
 RxN1yd4D8cuvodvkIGgBoOvmgVt3UOYnuALPNPkJhqJ3acWhxRayrIegvdPYz5FjDkK7bcCuzfX
 vlBFmQE2rCowreObLw77zsjWxOSXSww=
X-Proofpoint-GUID: SXn2JDrGphEt_b07-99bIrheJxaUgpri
X-Proofpoint-ORIG-GUID: SXn2JDrGphEt_b07-99bIrheJxaUgpri
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa766a9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=F1QlHIOeo1lq4PqRBw0A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA0MyBTYWx0ZWRfX754XRciMespf
 o58i8I8U5PbHcuyC3+xuWS/0FFGtMikMACLQZ9SLnAoNFqbTqocd+7Ownbmm4BS9VQ45Rosxpfb
 Se7kTGkOTpeKG8HGOL4mhQxbQiWZx38or8HIG3gE4m7G7oDqH60uIE0wpjrfqqTrWTuazv6dtju
 tvU1SEbLg3mNKLEpvQe/V00SsS+YbAf02aqpSfVMRT1Qa8Tm2ArNuCcUOYYKBq/FgUImcZLMJYu
 rcb/jZ3Q5jx+nphXQ9Azxh8maqDgapm4ar6j4AO5ZSmxdNMDTzVOm5GlrstzbNzUWq46CojDdQd
 f6Md0nX3pQa2AoB5Ppkz7z2wVPSf3DTUUPpF6pqarrmpHiU9/NWbp9kSGkndLwIoQ6rVElUyEH7
 3vXZbFTnJPA9Poin7vcrck7lUcoHDWhLUJqZJW7h/4QCvVmmBsGihnwW56KieMldvAymxocDqI4
 2RpQHzRkWLzzovYoQGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_01,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140043

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
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile      |   1 +
 arch/arm64/boot/dts/qcom/nord-ride.dts | 254 +++++++++++++++++++++++++
 2 files changed, 255 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ride.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index d6547fb18edf..a6b4f02bec6d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -166,6 +166,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-lilac.dtb
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

