Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640063BFAEE
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 06:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783317902; cv=none; b=HasdbYQGmzw0QIc5J3Kk2ddotOhoODi1TVrfV+U2pPDYlWtFYSLp9b19eTXyNjPrGQwUZqG1wzk+1QxJ12IIYq4iDXInYY66+Ldtu3oSEbS9SRi3Bd2GquU5Y17/MUDuGwxwLtxwlbNOJQQotkAB65lYh78SG/duQ89C0S6GS2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783317902; c=relaxed/simple;
	bh=HJ8jS3Av1jCwPYHPP2CB+zjLVJJ29OvK1VKXvPWoytw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UGjS19M/JBJjTskBAeZsGats//t5bP33Wq3eMlXxBt38WpiSfJd4359cy9OHIy+GK2wy4U0hp54HCs3ZD04KvVY75HsKIq5GJDhrk2Xt7YEhRkh/ueHpLTZUF2Qs8CNUygMJu9ul1W7VVnNCqjM8MKVog1Pw1BISeIbRR8wBaUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U6SIsJZN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G7ztIlpo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U6SIsJZN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G7ztIlpo"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641Z6s3585564
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 06:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qEqGOHWFuYNqzdrsUSU23fmEEO6FXsZklVxqAYDUKAY=; b=U6SIsJZNd5giFMhK
	kZ00bSdtwFay4OhYjtkjMbFMoCDcQ4q9IrG6Imn4pxMCpC6ZrRTBBtdUHnpIUzX4
	4jm/tMQe5ed8QemiqXUnGnsxkA8z+gNj5t8WzJA7uaS7jaCpy3IewdUxOhgEa20g
	Ww6Q11U+xHEhh8TdRBn0Lh8IDVeTaTXSEgLAg3LPfB3I9Vbga20dScidIuHyrILU
	DXriFcYeuVN5UO3rUiQ49+hiGusV4lzLCBTVfG4D2e4snIiifdUXHa6Z8+O4V+cJ
	SO1qHz8ij4hbt/FvUn17roVaiTxW2zPFn1FgfZ4KBMsT0X8lSsZ1y2PwpJHvA+ja
	l+fGog==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6t8ummq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:04:58 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so4347851a12.2
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 23:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783317898; x=1783922698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qEqGOHWFuYNqzdrsUSU23fmEEO6FXsZklVxqAYDUKAY=;
        b=G7ztIlpoIBXMdG5nLasAuKzexIO8FyL4mUjmxu+oSrV+5F6y6ubjEsU9h8aCyfG3bx
         u34XyUeC5RWz4V3iWiFo3Ouf0IsQvYdvalroRuYV8zt50BhYsYAXsXUkSZx0n1A141p4
         +yxCAK3Kg8K0z1xJnXeQaLybeSTrKsj1TfkLMDAuNzXtaqtRkPqKybFgX88q51LG2IF2
         1cPUn6o2MHUgy7hldAvDOOJWgd52hx/ZHbd5B5LQfRtUGXNXqAUQ9mw1XpZi5OcQ9cli
         V6Kbxhu/98xFp6sfZyP15zjau8i/HW46FHk6o4NW2ua7Db3aWLG9T6WLSwMi2NnwMF3l
         AaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783317898; x=1783922698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qEqGOHWFuYNqzdrsUSU23fmEEO6FXsZklVxqAYDUKAY=;
        b=FsFW912ksDS8gLJQ1rHASezaORpQlQ5QAF6J8GfeaVoIHTS8SPcNSYXPYuPQMQhDbv
         UIVhlkyVI4Mhstymx+cOJeRUk8KzfL79TNr3dZoUu840kZrsUEJFC4kPPZly5QHJMErh
         sIBElOlsUTgtGrt5LhJFQlUVBA2zRzUNE22wMpRuT1EdXF4olOVfMQ2mZcGx/4G4oUGA
         kM5rkDX1Q912cnBlQ5dBo4pZDS/Hv5moHKMapNmixnRaJ5Xx8+AgMQnc0oyHmlvzki8m
         hSgqADQFXDhGLccJa5EHrPmQBN0HbEt8popOtePAMVLwFfGBeorZVgnKWVK8eQ33HUrr
         IIhg==
X-Forwarded-Encrypted: i=1; AHgh+RrXFoDUtR5LSJzVNW4Ocki1/82XCEsPGhImUoVAwPu6D+4TuEski0tV0RchkkjOjTRncSu/yVBXlCGt@vger.kernel.org
X-Gm-Message-State: AOJu0YxIOcmfafKBNowW1915GmIz83yyuZou9tfgQIkJKML9XVV19R0R
	2vjMZpDth44wTCQx7RZs40Ig/wfevAFtYmDu7lolot8trugVsObL9HeHoT/6zaYLOaRWspbZ4t1
	q6K+NVKvWLr8POGn99d0OzIVy7djI/lnFGJa5SMUhI0So/imeU1XOaB6pu4NigLGH
X-Gm-Gg: AfdE7ckOa3NTWTdvyqVRh3rOsvQNR/XCVS6Xf3UIZIYaJL1Yq4+h3fSR997Bz8dTyLH
	LGcxrIwdvgCtHaBH8iNsPsjMIQT+kNyfWrXuXBDrPD1++UcBjM6hmLDKrXbbuNx/qeFNKvKw5yr
	ixr6R+t+VFaxAoOhOO0EXEqmc8OyQX9/CscEgvS27knQrZNlDmVWwq4eMM3aDP7HST6pS3kcxet
	GzoCFeyrMmF4nOAIHldroSrMEE8fo5ivLq9i0jrtfRe3GHS0+qOBGACXOe9ckPFzQ9OvtsBdi5M
	2Q2FsRH4MnQOSTFIWvV+fCZtF8qvX+C9OUspZXonqzzIJvMjU+2UVL5peSKzjor8u+DZYt4pr+g
	cPbjX8BZ/VOosqAZY4+A4kd+l0gp9Gx84Zi+Qhg==
X-Received: by 2002:a05:6a00:44c6:b0:847:8048:be94 with SMTP id d2e1a72fcca58-847f6ef6acamr7644312b3a.33.1783317897611;
        Sun, 05 Jul 2026 23:04:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:44c6:b0:847:8048:be94 with SMTP id d2e1a72fcca58-847f6ef6acamr7644276b3a.33.1783317897026;
        Sun, 05 Jul 2026 23:04:57 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d498dcsm3113266b3a.30.2026.07.05.23.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 23:04:56 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 11:34:42 +0530
Subject: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
In-Reply-To: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783317885; l=3791;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=mtGhNr9AoRvr1ClOqJKcXjX7QbhtzKUvDzRiaKs2dXA=;
 b=nam1vDs7CY9Anzq5xMBRrx9m3YwsSqBDn8oF2Zqar7S24qKkGloCKkwwOLpYM9HzUw53UlV0a
 pt6NZ2PFV1ZBkVMPwvOLbYOi/sDKU93fNEZuSKVksPzcvH9OEWyuaSk
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: Pjx4IlmOED7ezgpV0qsFtG5CePyXBF8l
X-Proofpoint-GUID: Pjx4IlmOED7ezgpV0qsFtG5CePyXBF8l
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA1OCBTYWx0ZWRfXyNmiJzpkv9Up
 vWkNLdAsLgEZtbp1IRqGuy+gaZACaxZaiWRv9FqkKXQGmZiWM6NXLMIAwSGX/Lb8TvJNRpBc5gK
 QeaU58Lh5Kzl72zQmMQUwe77PfDs464=
X-Authority-Analysis: v=2.4 cv=MZxcfZ/f c=1 sm=1 tr=0 ts=6a4b458a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=gJpjwWOAGh2g_eRG5xwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA1OCBTYWx0ZWRfX2nyd1wHPXptw
 iWx/rRXdy7CMf53JtQEsDiHNdZTQ+VIr0N6cN8vYBzqsYhkiD2fNuRN93sOhZo3jVk2pP9iDPtM
 lJ2EG1VQZwtC1KvIpAWpR62yzRZUma6lhpaIHdCfMKMh5+TEb+Bp8OOW4Fj0y72asJ3r4BVk76A
 d/2rkvK/bDVkWnSW6iwxJANTL+LiLm5BPbrOrJSlvlX2kNXXhuYl4udg1vlwGg1Mzp7uPDcVd5v
 4Cu0/k9b/XCIYFGdQhe/KzUo7rHPDZ4Dv0XHSCq6uYhczdVBGxDsv5mG1EDGd9QV/tSf3KIRtTD
 FPDLWh/O/Rb//mGrzIIlvh4DN48qbgSnEGleDtKUmh5GzJG02RjbZyxxFesxxcjw45HfCYFSmlC
 MVlK/qJK3Ze1uUpvzqPV/VlBeKOD6G45GO2Wh26y8gQigsiidWaahbeRAosIDGRMzvmnILvi0Hc
 HmIbl5t1SVcibI2BB9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060058

From: Arpit Saini <arpit.saini@oss.qualcomm.com>

Enable the Qualcomm Shikra MDSS display subsystem on the Shikra CQM EVK
board and add the DLC0697 MIPI DSI display panel node. Pin pm4125_l5
to 1.232V with regulator-allow-set-load for DSI PHY PLL stability.

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 126 ++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 683b5245923b..953b5608928b 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,39 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	lcd_bias: regulator-lcd-bias {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_bias";
+		vin-supply = <&vph_pwr>;
+		gpio = <&tlmm 151 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&lcd_bias_en>;
+		pinctrl-names = "default";
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_disp_n: regulator-vreg-disp-n {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_n";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		vin-supply = <&lcd_bias>;
+	};
+
+	vreg_disp_p: regulator-vreg-disp-p {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_p";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		vin-supply = <&lcd_bias>;
+	};
+
 	wcn3988-pmu {
 		compatible = "qcom,wcn3988-pmu";
 
@@ -60,6 +93,53 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm4125_l5>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "dlc,dlc0697", "ilitek,ili7807s";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+
+		vddi-supply = <&pm4125_l15>;
+		avdd-supply = <&vreg_disp_p>;
+		avee-supply = <&vreg_disp_n>;
+
+		pinctrl-0 = <&panel_rst_n &panel_te_pin &panel_bl_en>;
+		pinctrl-1 = <&panel_rst_n_suspend &panel_bl_en_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
+&pm4125_l5 {
+	/* DSI VDDA - must be at NOM voltage for PHY PLL lock */
+	regulator-min-microvolt = <1232000>;
+	regulator-max-microvolt = <1232000>;
+	regulator-allow-set-load;
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -95,6 +175,52 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	panel_rst_n: panel-rst-n-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	panel_rst_n_suspend: panel-rst-n-suspend-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_te_pin: panel-te-pin-state {
+		pins = "gpio86";
+		function = "mdp_vsync_p";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_bl_en: panel-bl-en-state {
+		pins = "gpio91";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
+	panel_bl_en_suspend: panel-bl-en-suspend-state {
+		pins = "gpio91";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+		output-low;
+	};
+
+	lcd_bias_en: lcd-bias-en-state {
+		pins = "gpio151";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
 &uart8 {
 	status = "okay";
 

-- 
2.34.1

