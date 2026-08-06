Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E9A371877
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 16:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786033928; cv=none; b=h+X7aTMw1hrhWXvLqlVeIo2HUs6jNDIbsWcjulR2AKKorP/5/y95U3OvWuxgO5GDR2ELFcLJjR11tTF3OpYi8MBPuYTlVQob163vXxUbwBU7HAsAaICIuAp6nlf4LcWGpQL+sPXHdDoUOabE+w3advJSP7uXBa09Cb8oc2Lb+NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786033928; c=relaxed/simple;
	bh=KoKgDL1uWIdiHjw9Mk2+j0kjWHBkfOqHFyVViOWZbU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ikomzMYcQH8g4HnOWiyY5+vu+e4DKwQjYPOtModnZWweWaF/HK/zdyBULNNeDCUB7P/dzHjXWl7j92UHcS2dFSdVsXfiF99dGn8kfcix2X6btTr23CkoikWD2lySgR0K1vAai4AMRMGFiUrOaQXu5x8ekDZE8VIUC3ra1nEg+MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E8YvwV0V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CZTeUa2w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E8YvwV0V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CZTeUa2w"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676Emf0C1928099
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 16:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2WmlI4F57lwRnXOLo/xmw4pqD4xvVd/TDpNz3dSJTm0=; b=E8YvwV0Vx1dNq4K3
	EFeAYbCG2TiVM1tIyIOsNCmVZI/nw5lBl/bxM5vMvcEAoz0w6OvPP6+h35DZb3Rp
	mp4T/o9hmJkhnkd2SJjIMZTCX3wrQCKKfzDsr7uDOw43oHFK0jl1I/hLnZF/NWgu
	yOp3KQLqesIMABaYzM4cogRHV2TEltm0UteOtnWOVaj2O0eTBb6p70hF4l+tx5Fl
	zybp4mlXNZnC4COQxzVWMJY4AXQXwhZ7NB3Puf+XqQA9JnSQUA1Qps3UzQd9whCf
	QMvvLWz3KezVbsu/mONeND8yhNI7XNssqMei/gVflYcvjId1fkvoNUKicnobsJux
	Q2/XgA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvqduj78j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 16:32:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbf293831so4768694a91.3
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 09:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786033921; x=1786638721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2WmlI4F57lwRnXOLo/xmw4pqD4xvVd/TDpNz3dSJTm0=;
        b=CZTeUa2wGRu1ZDZ/rVRfOwJe/jtTKFQ9FM5xiWpGYMHY/et5/9wJl/PHgebsqqnGxp
         nRsdnFctguaIJxZ8iWvbUdDrOUw1maWun8wSnNSQeNow45eiOrMgSseaSE9z5oMgDBqq
         rpDSG1qhnwCbdXzzDGx9x8KqVt9gbgn91CABBeIoBqAUQ7K4yy6TgvZF8RV8QcUrr2QL
         1C5gMuEv8OXNK2jpNmyuG2BGUbO0EHl1EqOoQjjLnntdhKRKxvwm7kSLr+61P85SglXP
         ZQp40IKi+oW+IOcsrMKg1tKvORJLZo2xMECvJkgCiowQF1cYfYdiLvD3sVnymaZ5Jxkr
         B4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786033921; x=1786638721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2WmlI4F57lwRnXOLo/xmw4pqD4xvVd/TDpNz3dSJTm0=;
        b=DFUdrIGafCmG8Vp8Kf4UirskX2+ggL/H7kAFBIGy8YNr8NuDgo3ymQ3knO2fvoYPmx
         gsCDi2uN9aQ50+RZtvagSyeoTVPorWtkyk30eSNloesWv4jOlKsJFm9I2g+MwVLewLg2
         Wdcu3naPm66HOaI8loUOCBLsNDeO23BA0aoDmuvt4viXO6kvl156WwjwosI00E5gwmpv
         SfEBFiYcIisk9ts3RgnBbpARegFwxsUrZn5A77SqNOcv6IheFe5Hvbdi+NTlxkFgfnx0
         Blo6HCUP8ATG2Rx+l0Z18+yVgSeoBi9jw7RVa5CUBm9PYXxujkDzSPFgg+dfbOy7tBc6
         CQXA==
X-Forwarded-Encrypted: i=1; AHgh+RrIiUKBDDrCX9qCblQyAWToUdxKun/3Wu6JYzTUZxWYoH9w63XKIO8OmbgDlC8DjXTQjsz9fLat0gMO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6a8tTaiHsFCfTowh4JQWzTMmJWbxRs6x0ZGVIF8AV4CBUxa5y
	liSeuZct31Kc0OpKQr2/wgGOR/PVQQ/Rq+fFBzBg44n6NrKiIG+20vCWcuYabag/dt9sLXJRWel
	3qVwkM7SrAoaWtY2lPYQJVgQKFDZANFQbsuLRFWyjgIIp/Tlis69ZC4MYnHSeJx+e
X-Gm-Gg: AR+sD10bsk7YjtYRPeBGQFFCvev96biguMb9ktAJI/6DUPCfJx48BA6YB64bU2ZqFd9
	ufkXF+o6aJy79fsfaRRSw959aQEmWM5meEIgTjkJ5KoiOay9/XvX9haU4tj/BJc+QxUrfaCDPT0
	GJKTLHWc+OSWSCm1IKAS+n6lNdZlsZqybH3eDLUcOPmqjMzD2C+VQnWr2KswPdtxMq5Osfj+C69
	fRSae6F2O1+BcjuElhb7Y26stvsgXuVt1ZVYvRzEr9/PXF1id8DqY9Jsgh2W2Oydg8NlJPaC9wH
	edtrTKGZ0TUHFkrlE4LymsrnZrH45eFdkjTgOQGIcMuj9Kzystw53sYCOXk4ACvBwyDRxdd3y/M
	c7UmLjCSVSD3i/pKrkfKkhSAE1hUVS+Ip
X-Received: by 2002:a17:90b:264b:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-3903c58a6femr17496040a91.12.1786033921312;
        Thu, 06 Aug 2026 09:32:01 -0700 (PDT)
X-Received: by 2002:a17:90b:264b:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-3903c58a6femr17495977a91.12.1786033920816;
        Thu, 06 Aug 2026 09:32:00 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085f2b2fdsm1853168a91.12.2026.08.06.09.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 09:32:00 -0700 (PDT)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 22:01:21 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: purwa-iot-evk: Add eDP display
 overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-edp_overlay_for-next-v1-2-c3aebbc81f38@oss.qualcomm.com>
References: <20260806-edp_overlay_for-next-v1-0-c3aebbc81f38@oss.qualcomm.com>
In-Reply-To: <20260806-edp_overlay_for-next-v1-0-c3aebbc81f38@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com, vishnu.saini@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786033907; l=7310;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=KoKgDL1uWIdiHjw9Mk2+j0kjWHBkfOqHFyVViOWZbU0=;
 b=H/wyn8Pld1A+FIkEkkQ13tjhyYBP6hJWOQ3hrLd1CW/PZtDulMqh+bCi9pstIolbkAy+6UlxJ
 L4s3YN/MPkjBI+8Xed+xf/O5eph5G6lR38C41donszltZNevONYLnRM
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-GUID: 6D2orsjl_hSpt9xhg89EbjVdd1VSNKfB
X-Proofpoint-ORIG-GUID: 6D2orsjl_hSpt9xhg89EbjVdd1VSNKfB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDEyOSBTYWx0ZWRfX73rWDIdbVcOe
 zp7e1Cj/a1VB7r8EgEtv+Lz7zNzbR3+b/i9n/3vtr1FeXx4U4kwcFlCYYtDSNY5G3Zg67dXBk/4
 pRg3k6xevIpw3lKIpBOIgkpKG6UGyCchk1CDD8MkfthHTlX/vw5ZfSQyeSrhBSRHbor0/OW2T3Q
 RgxV70ZHiLHKJaK3CUhWMZTAx6Z1PH3LVQ6kFdnsm7rhQpfBWNYhgborKLQYVHjpnAYIstf5gGa
 cv+COYfpxkj5L5p90CVp0SqGkTRgGgVEwJB2dypddjKKs5o7iD7j0PAkLNmffrHl2BuoL9fwN+E
 ApVYiMOvAp8ii07tJHZO1/oaVBL2ZwJ3H0LfOZgZ78gReLVDetORFZYkeykz9eYS9TRCB0r1pV1
 ljwtl3IotJYhfKg3+HEFFxJ6NqzpIYRwhTK2QXnmZXkBm3xsPj0TmT2FOeo0cnR7CiTVUmc9Xlx
 Cn+JUKARpudee2yATtA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDEyOSBTYWx0ZWRfX7+IOVd3p5bpf
 pPjbb60vMwVkyniSoJHrS7DZL9qWgYGM565XcX2EJ7MsRMI2aXDGFLSD6FaTWl9v1AT6vHnt0xD
 bCeJUobm/d1Z9Yvy0spbLAXC0kRwd/Q=
X-Authority-Analysis: v=2.4 cv=bdtbluPB c=1 sm=1 tr=0 ts=6a74b706 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=CCRylzDZG6jPrKb_DEwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_01,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060129

Move the eDP panel configuration and related power, backlight, and pinctrl
nodes into a separate overlay. Keep the base DTB suitable for headless
variants and provide a composite DTB for headed variants.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile               |   3 +
 arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso | 126 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts      | 107 --------------------
 3 files changed, 129 insertions(+), 107 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index bb0da34983c8..fc954da58402 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -165,6 +165,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-poplar.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-xiaomi-sagit.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk.dtb
 
+purwa-iot-evk-edp-dtbs	:= purwa-iot-evk.dtb purwa-iot-evk-edp.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk-edp.dtb
+
 purwa-iot-evk-el2-dtbs	:= purwa-iot-evk.dtb x1-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso b/arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso
new file mode 100644
index 000000000000..759d05342627
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pmk8550_pwm 0 5000000>;
+		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
+		power-supply = <&vreg_edp_bl>;
+
+		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
+		pinctrl-names = "default";
+	};
+
+	vreg_edp_3p3: regulator-edp-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_EDP_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_edp_bl: regulator-edp-bl {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VBL9";
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_bl_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+};
+
+&mdss_dp3 {
+	/delete-property/ #sound-dai-cells;
+
+	pinctrl-0 = <&edp0_hpd_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "edp-panel";
+
+			backlight = <&backlight>;
+			power-supply = <&vreg_edp_3p3>;
+
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss_dp3_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dp3_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+	remote-endpoint = <&edp_panel_in>;
+};
+
+&mdss_dp3_phy {
+	vdda-phy-supply = <&vreg_l3j_0p8>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
+
+	status = "okay";
+};
+
+&pmc8380_3_gpios {
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio4";
+		function = "normal";
+		power-source = <1>;
+		input-disable;
+		output-enable;
+	};
+
+	edp_bl_reg_en: edp-bl-reg-en-state {
+		pins = "gpio10";
+		function = "normal";
+	};
+};
+
+&pmk8550_gpios {
+	edp_bl_pwm: edp-bl-pwm-state {
+		pins = "gpio5";
+		function = "func3";
+	};
+};
+
+&pmk8550_pwm {
+	status = "okay";
+};
+
+&tlmm {
+	edp_reg_en: edp-reg-en-state {
+		pins = "gpio70";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index ad503beec1d3..6dde925025dd 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -19,16 +19,6 @@ aliases {
 		serial1 = &uart14;
 	};
 
-	backlight: backlight {
-		compatible = "pwm-backlight";
-		pwms = <&pmk8550_pwm 0 5000000>;
-		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
-		power-supply = <&vreg_edp_bl>;
-
-		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
-		pinctrl-names = "default";
-	};
-
 	wcd938x: audio-codec {
 		compatible = "qcom,wcd9385-codec";
 
@@ -205,38 +195,6 @@ pmic_glink_ss2_con_sbu_in: endpoint {
 		};
 	};
 
-	vreg_edp_3p3: regulator-edp-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_EDP_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&edp_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_edp_bl: regulator-edp-bl {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VBL9";
-		regulator-min-microvolt = <3600000>;
-		regulator-max-microvolt = <3600000>;
-
-		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&edp_bl_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -962,44 +920,6 @@ &mdss_dp2_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
-&mdss_dp3 {
-	/delete-property/ #sound-dai-cells;
-
-	pinctrl-0 = <&edp0_hpd_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-
-	aux-bus {
-		panel {
-			compatible = "edp-panel";
-
-			backlight = <&backlight>;
-			power-supply = <&vreg_edp_3p3>;
-
-			port {
-				edp_panel_in: endpoint {
-					remote-endpoint = <&mdss_dp3_out>;
-				};
-			};
-		};
-	};
-};
-
-&mdss_dp3_out {
-	data-lanes = <0 1 2 3>;
-	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
-
-	remote-endpoint = <&edp_panel_in>;
-};
-
-&mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l3j_0p8>;
-	vdda-pll-supply = <&vreg_l2j_1p2>;
-
-	status = "okay";
-};
-
 &pcie3_port0 {
 	vpcie12v-supply = <&vreg_pcie_12v>;
 	vpcie3v3-supply = <&vreg_pcie_3v3>;
@@ -1128,19 +1048,6 @@ led@2 {
 };
 
 &pmc8380_3_gpios {
-	edp_bl_en: edp-bl-en-state {
-		pins = "gpio4";
-		function = "normal";
-		power-source = <1>;
-		input-disable;
-		output-enable;
-	};
-
-	edp_bl_reg_en: edp-bl-reg-en-state {
-		pins = "gpio10";
-		function = "normal";
-	};
-
 	pm_sde7_aux_3p3_en: pcie-aux-3p3-default-state {
 		pins = "gpio8";
 		function = "normal";
@@ -1169,13 +1076,6 @@ usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
 	};
 };
 
-&pmk8550_gpios {
-	edp_bl_pwm: edp-bl-pwm-state {
-		pins = "gpio5";
-		function = "func3";
-	};
-};
-
 &pmk8550_pwm {
 	status = "okay";
 };
@@ -1326,13 +1226,6 @@ right_tweeter: speaker@0,1 {
 };
 
 &tlmm {
-	edp_reg_en: edp-reg-en-state {
-		pins = "gpio70";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
-
 	eusb3_reset_n: eusb3-reset-n-state {
 		pins = "gpio6";
 		function = "gpio";

-- 
2.54.0

