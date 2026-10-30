Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353223;
	b=UwdJR5oqfdSFTV+i+V2iPiObov3LszeoS38YoZl4ZdJTCEN0KJNxDzGw5kj1593QEKAn
	 XS4RujD7OQ+GHf4xxRz/f3aLBkdLQO141dXMLlk/SBORvm/vtjpiOkzPFvYBbiSu55b2M
	 rBEUQMx3+bJ5cQ3m+PR5vTVxb9xSXG5rjY+aSQGCT1djtIadzLGnNpGs7ZYZ00ZvrIWN0
	 xKacOfg9HZsHpClCEpgwuFxc2BwVsuV8WvcS2vAKVCerFnKUbXmw9BFy3KxqEflr+mrI6
	 3JaAL4zrJJ/xoQSxbA1EcGSSH0HuWs+SquSRTxtm8Pu/T+Vy7R1SsP27xehpztJMClA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353223;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GcXqbPEHJFGrGJfbAknS9hjSRjQJhsi3SXUnT5jLmBA=;
	b=uOw2EP7pWDSqm8AXXJ+cQYXOvnP1kBtlwppyuSTNI+qyrxiWQKG5mfu6JY25Uq3F+jLj
	 m0TtfqSejgRcal7gya08oly7B8EGFgTer+1CIkmpBIau4hWO2JNBkt8lbHztgMMCdD2bq
	 pAV+imvjeI3oxYcS6ZCbqIRrUX97D4Q+3uknvkI/g/HAlFprfzKCQEdo8LP0nlTETSB7l
	 NAMWy5gAHFQ/XVhT2lBcLpk7wh2k7bgtBjPxtGz1xI71uKc3IYwPJ6Rd+IFgYy9M+F/Du
	 y94Kqgorp6FcYX3eFOr0SV5rXd2s+UfynFUqqSFhAETCnhDpP9XbZZayZH34Jx7RS0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=moD8h8Tp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NSV8YMPD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB0260A260D
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AB0260A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=moD8h8Tp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NSV8YMPD
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FFFf3709532
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GcXqbPEHJFGrGJfbAknS9hjSRjQJhsi3SXUnT5jLmBA=; b=moD8h8TpD3TQxju8
	t0/NdMyCXjS269zF8q7cAPEVOTitV7YmjuqFbm/i6w8lGxOSf0mg5nyGTz+o5Lir
	lW7zcY43NirFfRjFOOJIwi5cKas2IXdvRaDA9Ko/EZ0fNr3qgYXGsq2pNqFCGPfU
	fixSIdIqlgo/qekekjfGynaX2BOV39/h8nV2HLZhwtfMJFL/hgx8QlAPgm8uxn83
	mVy/4BYS8h/Fd/sz9Li3QW7R6UgI9J1N6cT7DUKcIZeCXiaV87YfzljR37oA6NSB
	ZG9Mp64b2Fq+HvpvP4MhA3rUNqEwxTQPzFLH/UmsEv86w14+Vvs8c+LDt4rUTKDl
	emgfug==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6rjb7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:40:21 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so1639691c88.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 02:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353221; x=1793958021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GcXqbPEHJFGrGJfbAknS9hjSRjQJhsi3SXUnT5jLmBA=;
        b=NSV8YMPD8r+9ZF9CrOZOmnqik9khtV5XcPm3ihNxJqQJdI+idaT5SXfZXySDMwcCnD
         4x+hGV85bm86HvAIAS060xeyO8imUQZzpPPhx6x1YFidcsFPl/nH7c/bM5rWXeqpW6og
         dCVkQINI7PERNTaypU2OxJGsHMVBZb/eO/PWGy8aSjTGMFioqTUIUtOoDj/YZGGqPp0F
         rZk6bIWInOfAq716eOp+hRHAFp2CvRxZ1SUEa4OpORo0dEDXaFEtV5rJG6HaKado3uYU
         xWXFGnds+OXtk7nxSE6bPav8U5w/VMKGLAkPRDOeNZOlQvPOoNpLvy1r/uvp1OcinDja
         a62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353221; x=1793958021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GcXqbPEHJFGrGJfbAknS9hjSRjQJhsi3SXUnT5jLmBA=;
        b=AiMbOKvYPSjjmERSBypebTXbLiLAqu91lNLOgSu63TwdPU4fa0yUIFXZmP/w1FPSWO
         D7+ZOldINgEcxNUST6SfoxHA3LKn5lbKLB5Cj0A/Th/DO5UlZnxVX4ybRsMH7yMV9zQ5
         mTNY+eNBIH9Z49fR0l76oVpwYERwAcTk1DHYwy5ftg524OnwceHhc4+cmsJFJmhbyx3u
         UbDkVT0DnHIEyL/PddIWpNr3xSX42fNsVGK0ANWxhlADnFsrfakYx3l4r1qOc4I2SLeo
         RKeh7KX4l7sRbezTN51P+fN9pg2GeCT0PLn8f5OB3elanQMmPN25JWxew8OV7hGfqlLV
         /fHQ==
X-Forwarded-Encrypted: i=1; AKwUvByvVkAfILDJQhZ/s1jdk25yGi71soC+XGWFlNp6QvUXNbTiJeINHGnerMS460/vUxWWmwC+uFE6Lu4W@vger.kernel.org
X-Gm-Message-State: AFq9FYJYIH4BI0LPcSuhSlw4jj2MHIJZA4/qQM/KNKlt2d1GWNWOY7VR
	+kCll3uQi7OkRVfDwNmDJw+qjuXhHO7JHZvftft6rEx2PSg2iII2+G0NgggKJUidrfOftE45AQc
	VdD1oPc4Wh6i5vh0K/eWkbfpEqR7Rr5t5/45r6CpHifaisFUAj8VgloPx5O0VM8rc
X-Gm-Gg: AYBFou1NfKZMmyCxuTHwejmo0uIRsl+CR7L5mv1mpL5Bqgorh4K9wag4z4ksUGZNVnz
	uSG+ZEG+nunuzGEk6ynJl/fX5VmQs+AYGJ5/IASUlszhwdwIBJT/oDycPxhDQVRPQsCCD2xlzHH
	hFan5umrCuVEKkkG63yHJGS3rs0kna2silA3zUWMkjsQ2gsNIZi8Wv1U5TkgM442uRSZhB00O4o
	9B+BpgsbwMpzcEijIcDkAiNHbYm3Dc21+NFSzi/P5ikS7aV7z3CSXuTYBAkTY3Tefl6O22EYLIP
	AZl73LouDtlmAVoWIGNrEfKMZe3V8K/l3vFK5MJ4F7JJWpk+2e8KL/pQOIgGsoA0BThP3lQNEOw
	1V6Al6hiDg6JxfIR3FgxSFx9nFdjCPU/mfabLPOamQf0wBsh5FzK/fZYO+RdOnTjotPNGjUysSt
	7Va4ab
X-Received: by 2002:a05:701b:4244:10b0:188:ed6d:ebc9 with SMTP id a92af1059eb24-1ac5e6f5225mr2448098c88.38.1793353220795;
        Fri, 30 Oct 2026 02:40:20 -0700 (PDT)
X-Received: by 2002:a05:701b:4244:10b0:188:ed6d:ebc9 with SMTP id a92af1059eb24-1ac5e6f5225mr2448041c88.38.1793353220039;
        Fri, 30 Oct 2026 02:40:20 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm6723418c88.11.2026.10.30.02.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:40:19 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Date: Fri, 30 Oct 2026 15:10:05 +0530
Subject: [PATCH v2 1/6] arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD
 HDMI bridge support
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-lyra-display-upstream-post-v2-1-906302159392@oss.qualcomm.com>
References: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
In-Reply-To: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793353209; l=3487;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=smMOiJGRXLe6vyzF3EXDVDCQHvPs18b0QYgi9/GYlL0=;
 b=NsXFVb5awnoQh4919cBqRkuvUzwXyUh7/DiD9hpttwt/QucRhVzzxzqb9/MFQvxT3gNhYtSIR
 r9B4uaQT7ClDVFBTwK3N5P1RMDGc+HDqM33y6HT7eIWZ31xs5l98VIZ
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-ORIG-GUID: L52yIMxdBmfPqAQQe1gAoggIO9Ph6ud5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfXwU1Afp6ltP/b
 97yq35ohDkNAlkZWLzWIunmVVPSXSJUGT6UP4PA3RB9Wwb6z0vuezW6Bsabi6U4BHvFHHJg8IHn
 1En+V+cap5lUiZvCjMhFsBcJF3Z3CCk=
X-Authority-Analysis: v=2.4 cv=PIqaavqC c=1 sm=1 tr=0 ts=6ae46605 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=OCdZN1uXOpAY9Qk72D0A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX7uu79zYnBTIl
 FKNk+iP79xaeO4RcTNHcMPUlsEbgZy+cqTiY8keLoulYZfhI1LmbQBl7+ve4OcAv58wyWdXt31b
 sRVY4wVJWu1/1cc3D430wWC3CUzB0pPGma8fWOIRcgpfiqSZUNWVRp7QtgBMRfGIU29M2pxAXxY
 dMocIBKJq0G9ur5gkDjo7aKmNMhIKPr3BoM759pmN9REAVWP9yAXS2mMCkt4w8B/Iki3mIHJiWb
 1mtj5uUMcJS4xolBo2wvBF5+fFp3kADt/IIKgMik9pFGuWQOQA+/divxavrZzx70LsxBPjsHLgT
 1mWvyKW3L8Egw0wUtFe/sIOGL/5LHUfYeja/Tikwzip65Et8dcJFRH0Aht6gx2ofaaWboZATo3M
 C/mSksgmjARt5PavPs9ZEXBUkGHTul2tivsjgEYDsVvYyYq+DS2BL/EKOos4E4kDd15lyRwrInX
 wBKiiRCrh2LKWfj8eXg==
X-Proofpoint-GUID: L52yIMxdBmfPqAQQe1gAoggIO9Ph6ud5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300038

From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>

Add support for the Lontium LT9611UXD DSI-to-HDMI bridge, enabled by
default on the Talos Lyra EVK base board DT, to provide HDMI output
on the DSI0_B2B connector on the carrier card.

LT9611UXD is connected through I2C2, with reset and interrupt
connected to TLMM GPIO61 and GPIO60 respectively.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 105 ++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
index d4468e609911..eeb8e903b03b 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -4,6 +4,8 @@
  */
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include "talos-lyra-evk-som.dtsi"
 
 / {
@@ -11,6 +13,10 @@ / {
 	compatible = "qcom,talos-lyra-evk", "qcom,qcs615", "qcom,sm6150";
 	chassis-type = "embedded";
 
+	aliases {
+		i2c2 = &i2c2;
+	};
+
 	dp0-connector {
 		compatible = "dp-connector";
 		label = "DP0";
@@ -22,6 +28,65 @@ dp0_connector_in: endpoint {
 			};
 		};
 	};
+
+	hdmi_connector: hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_out: endpoint {
+				remote-endpoint = <&hdmi_bridge_out>;
+			};
+		};
+	};
+
+	vreg_disp_3p3: regulator-disp-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&lcd_bias_en>;
+		pinctrl-names = "default";
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	hdmi_bridge: hdmi-bridge@41 {
+		compatible = "lontium,lt9611uxd";
+		reg = <0x41>;
+		interrupts-extended = <&tlmm 60 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&vreg_disp_3p3>;
+		vdd-supply = <&vreg_s4a>;
+
+		pinctrl-0 = <&bridge_irq_pin &bridge_rst_pin>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hdmi_bridge_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				hdmi_bridge_out: endpoint {
+					remote-endpoint = <&hdmi_connector_out>;
+				};
+			};
+		};
+	};
 };
 
 &i2c5 {
@@ -74,6 +139,23 @@ &mdss_dp0_out {
 	remote-endpoint = <&dp0_connector_in>;
 };
 
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&hdmi_bridge_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l11a>;
+
+	status = "okay";
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
@@ -113,3 +195,26 @@ &usb_2 {
 
 	status = "okay";
 };
+
+&tlmm {
+	lcd_bias_en: lcd-bias-en-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	bridge_irq_pin: bridge-irq-state {
+		pins = "gpio60";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	bridge_rst_pin: bridge-rst-state {
+		pins = "gpio61";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+};

-- 
2.55.0

