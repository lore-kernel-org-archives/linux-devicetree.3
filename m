Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5346136DA04
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 16:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786033921; cv=none; b=EV/eUhTlwJ/P6LPxXLDYYZN4ceiT27T194tvYCSq67VLFf0sbQVWYt1y9Lv0AWYSGTk7buL2RYz65fS0RaxFusEc06lHB2aDZuHVDpxZUKxeGOcSpDmsTcK8yxIM4x1ClC9dTgeMyFVIRDP3XM5P0Mogkwi+dXatiFqOyjYHcJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786033921; c=relaxed/simple;
	bh=OcTxa209WmqisPcT9WOVW0JgUue33/rrUgIYOeclzHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XARUZd0NW8XnJqXvUS8pAYKNpS+PyMkr0u1twajkSB23NDJp+kd24X1n+7giBA9Xv0EKsdSdaPqbrL30laWKrg+g/2AwfPqvLDEwA7QAYQzUPmjP2H0d5hq9X8bfC1tfdpxVJ1LBxfIHP3dQxVG3B0F6oa/DaaRSNefWF36kd3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bS64sV9u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HO9zz4mT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bS64sV9u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HO9zz4mT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676G62oB2144879
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 16:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bqBVEne5gYBg+IiMlFMvWCBibtovAZu3y7jPAeJG+L8=; b=bS64sV9u/Qd6gtaA
	bpHReE3Nd4ciuE6YLYtZJTB3xDFhstj42Cv4i2/UakEr/NlR0O7+pFr12aLI/zIp
	V4XB/msZt96iO2UEBbIK3gItB4BJNjI6MKBCCm6lNCOVhdVywhWqW4uPM137MKH6
	Nq+pF8Ae8ssRtQ63FKPWlAhtsO9d/Qf4+UrRtdGKsJdeflKeot3XMUSP7Tv3HwUC
	5AX5DfeXdYgvnXWEn0hXggyBnrAr6iMlljr0qUiLVpOTSUcGnY/puSGJxJqWo0CK
	Sx2RwQ3FXh800cx3FA+H/OhSlAAKe/L+yQaHtpqSZN4jEq3IOeTgbtM9EKCewdsk
	xqcCmw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvwg98582-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 16:31:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso2989545a91.3
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 09:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786033917; x=1786638717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bqBVEne5gYBg+IiMlFMvWCBibtovAZu3y7jPAeJG+L8=;
        b=HO9zz4mT98B/YeqTp0ZMdUan9a2TiPqGRSA7GeoVwi6q3QExYne1FXTK7u+UhyRtYk
         rrKKHmGFToxSeJUWZ1o9L38/RO5DIGF7KvAwXggZfD5h2LT5BwREjY+tEdgr7Wq4gBNQ
         ZT9KU6XVH40DRiN95N/tdRYx/g3KmZEKzqlZk0lkBbLwbBX1WbN4uNUXQzGNnDpLRNcg
         nooxj4ZvatFF0OZlG6z4+C5mhD/d27VSwYgPeWLFFId8K9dx4eoGMEWWLEh6Q664kQkT
         rWM6Zoq5gLCleqUnGdngPKZhaHoIRa+i5hHWZlkgdrlQdZIxCuFf71fEhTiB6p1RToR2
         cqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786033917; x=1786638717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bqBVEne5gYBg+IiMlFMvWCBibtovAZu3y7jPAeJG+L8=;
        b=oGCu0l1f8N3T80eDVeGMfrVjjlhNh9jNNWTbHFk+912yptx/dtzVAlVJrOqsEQFGyY
         CsHuWDB8dSurV2nmJ9rUTeVXNKzDKehIdi7QfJKPvp3K6kk3CAwD9iTLNiE6oKCtEEsr
         4FU58Ek7degWe5kmFEgsREU/ECEJ0OhPC+KxINhN3caVXJmfvkkqy0lGlEd8Qvn49yDe
         gqGGpJc5Nm4Rju5aucQiFrlAvY0FefDfeSvaY9zU3oyhugBctcMZ3SYbF/42W2uZ+n09
         kQQJhxvMYSSbaR9lhkU0FsVR8vsjiUmxj2i86QnOrZ/Q6wefmtG4Ergbsv/ZGrhTwBCo
         NBEw==
X-Forwarded-Encrypted: i=1; AHgh+RqxsByFqEy1KMn7zfV5cU2s41FSaqVI+ZV59zheGSZhvKM7fbxZzVowqUrL3FJWgfSHh/M2qq63OEKM@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc4x+0pEvFs1MkQwnmvb27DOBjcvjJM/OPU6/74eQTY6WImCFS
	y2aQQRLcJ+7qnLwWB1nf/eqdG9bxJy/5WOoIuM3smS+JNQubZ8oNw5tx9vppf/U+c4BP1n5hQV3
	IIAkdKieE3OWl0gUuhL3KRJhvi7UauBRQm5ZGx8C+LRkE0tDwvW9C1zMOKrmP2fyb
X-Gm-Gg: AR+sD11CMrM8B6t5RkJ2LZ+BkCwahWeW3ds8J4j5mGeoEkiV/G7REjxqeTXb8Su2EyC
	g/CWqdFLnoofTWntXi99LmVzgb2YN1TW1Iw+fCrlS3/EgAg1AQ7XKFPyoErvzNZBOLPr973xXfL
	TnVGaSXaaec7Y29OEGJZSF+VPKz1cTUuVcGGkUXd0dm3FhYXtqqj91BYO+A5zfQTeAZlaQ4yk6Q
	23lKHYpbcov7GVHGwYN6xM+ITuCi/qja0lS2hT3YjKA8JYtFyzdjJ2cKb3ylDAhacvKljGv4yTP
	+K42LrPmavhTjnB5YMI6t8BN0MOFoy2LWEjE8tNehby3mwuVgSZvVm2MoH8TVomDo+1OMwqfbX5
	hNRr18sDx4tiwp5cObden05msI1subWBL
X-Received: by 2002:a17:90a:ec8b:b0:38f:aab1:5148 with SMTP id 98e67ed59e1d1-3903c5d313bmr17225131a91.13.1786033916905;
        Thu, 06 Aug 2026 09:31:56 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8b:b0:38f:aab1:5148 with SMTP id 98e67ed59e1d1-3903c5d313bmr17225052a91.13.1786033916351;
        Thu, 06 Aug 2026 09:31:56 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085f2b2fdsm1853168a91.12.2026.08.06.09.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 09:31:55 -0700 (PDT)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 22:01:20 +0530
Subject: [PATCH 1/2] arm64: dts: qcom: hamoa-iot-evk: Add eDP display
 overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-edp_overlay_for-next-v1-1-c3aebbc81f38@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786033907; l=7324;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=OcTxa209WmqisPcT9WOVW0JgUue33/rrUgIYOeclzHI=;
 b=v/cQDxJPmzp4Wj80K/vV3hw6PhaotH1WIekUheJTSae1tc4o4cne9V4vbFFTWYNn5T+diOaQh
 lGLHaO+capLAJGVxpDT85s81ODa2nVnBO88XBYdqrqQZBcf9X7kjXSL
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDEyOSBTYWx0ZWRfX//ACWQ9/4GIa
 8Im3esxp1ohfoPIfzsrSzu1U6MnUe9v9ckmiqSNtVmTYZEx/zPOhOBwZQuFjYpfMGmmIMHoXgZ0
 7BaT5OSGakZpxAtwlV+Ql5JY+My5+2s=
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a74b6fe cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=-w1LApHckQVCOKzI_mEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: p2WFJre_RhYRhSTagjyqsO_XBHGeXE0R
X-Proofpoint-GUID: p2WFJre_RhYRhSTagjyqsO_XBHGeXE0R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDEyOSBTYWx0ZWRfXwSqTf8Ef5PuH
 rvVhmjzZvGjXb9uMeizEt5szufnt1clH0LCgAsawvrLPyGhnypOO2qiO3JrLBDDRBs8szQOe1ue
 vgmfH+uqn+5WXKRubG6OeoQRQApW62FQ5sAmCNPVP8V8KzUoHo0bvgdvc+Xrp+HP78S3Ng+L/Kh
 7qfF5oEYGg4bnIP/NFWuUsn3c2mCicE+w6CEcKGJgmaVN6WXeZKQSt6wpX6TCWh0yw+9xpOUUzV
 K+wW3pxv0EB8XHwTpeyUBCu/XRrCgtTmyALA4o4oL7Av5AG6gWDDurYy26D+pRe5X1bdjr8KLRS
 sW35lTCE5enDCme+X47wd72de3DmJ70xMQgLfRW4cLNEcpjuRgvfqXYKsUZl2Fd7GNb7sIQAlNG
 6BSowe5ExmD7bBvSnTdLJKdC9efiiBDQ83BpmNS/r/Fcj+vKqF/v0enb009CgdLP6rhshwrGUQE
 pZP0uQ/XaAjyJ4sYiaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_01,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060129

Move the eDP panel configuration and related power, backlight, and pinctrl
nodes into a separate overlay. Keep the base DTB suitable for headless
variants and provide a composite DTB for headed variants.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile               |   3 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso | 126 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts      | 107 --------------------
 3 files changed, 129 insertions(+), 107 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55..bb0da34983c8 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -20,6 +20,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
 
+hamoa-iot-evk-edp-dtbs	:= hamoa-iot-evk.dtb hamoa-iot-evk-edp.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-edp.dtb
+
 hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso
new file mode 100644
index 000000000000..759d05342627
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso
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
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 9fa86bb6438e..78cefd5391b1 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
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
 	clocks {
 		mcp2518fd_osc: clock-40000000 {
 			compatible = "fixed-clock";
@@ -213,38 +203,6 @@ pmic_glink_ss2_con_sbu_in: endpoint {
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
 
@@ -974,44 +932,6 @@ &mdss_dp2_out {
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
@@ -1140,19 +1060,6 @@ led@2 {
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
@@ -1181,13 +1088,6 @@ usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
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
@@ -1357,13 +1257,6 @@ ec_int_n_default: ec-int-n-state {
 		bias-disable;
 	};
 
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

