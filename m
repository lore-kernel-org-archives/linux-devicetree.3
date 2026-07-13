Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3503EB10C
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938388; cv=none; b=G70DbKTIhP28CNgCJj7gL58fQRAKdzxl386MuHo1ea0J5mzsC52Wb6Cp8RwZFmCXKeWFn/IdG8vaBgtoVhDIjvZ/gL0dIOjfBOVqY3i9EzL/oUESuxUPswhCYLlJCMMgHdvUTLXp4c5/F3S3HDinnuqhW4BLS/DF9OzPV+4CKoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938388; c=relaxed/simple;
	bh=SZFDJokNdX4kC5Lbnvss6XlIgiOnp3WhX7fQ87bL0eA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QL+9GjGLiPM7IpT0NxavEgHcZlDZuT13xf05J/PaIz+yiPgCTpRYsXaLzb9dZKjzaJTBVGiXhSVfKpGJQyNsyMCBn18yITKAmf4veb8PdN13Y7i4icucOZtgaN0yTPvPtZ+K/R4PLSQx1FCyKGSof571LqxWByEO77M+rx1etI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c0F9oPzx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ol4dxnbs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c0F9oPzx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ol4dxnbs"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D98pOx793104
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0pxVTSV9NqQSxt2NKcMsD/tFtm1cvcFlvB7qlYNgl44=; b=c0F9oPzxxWedIJOK
	PlhyvTKweeAO3871iAHHWfvNYlhkTZxZlB1lWyTZxMAaxmCKYk5AoLNj4VnYH7Z4
	6F51sPvL5kDKpw0xL4pU/pNSYLpZc38VfeFWC+y7/MRON4anYfxh6AZg+dmsSUzc
	gWPNVfEdWjxFus2RBZeHldWUtPHS0UccqHMOJPehCBaxIAvHQ65hrPXPVF03ilkp
	c69T+CSPMHPCE0mgd9ceJIWkXzjuTkEFEOMlZolxbsYFDr5kNBzKUxvP1nKaW4je
	eogU2zn9s156w9G6TZs2kG2Yq7yzFz30+BgaMI1RWFb/u7vSa3khLZsZ7P1p+85H
	hgmRag==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4qr8s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:23 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88e0d11a3fso2797469a12.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 03:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938383; x=1784543183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0pxVTSV9NqQSxt2NKcMsD/tFtm1cvcFlvB7qlYNgl44=;
        b=Ol4dxnbsir/QE7iGZh1qOkYsxvfhLaNq8mkNlblJm7bHuW/A7jS++J9CEKUr8f3Nzd
         sFwTQkhmRaV/r+ZsNeXhM7TikbrM+dZneF1BCA69RqHsO4sxUFTR53n2v8vMUmbOp8xM
         KpU7XV/lTlt2CZyOVjXDlFVuN52kXWwH1E5qKWdIdlNb0eA9tr8bjyrXOiR6kkIITdx/
         ibr702pX3R/NznKW4paay6JSLjZ+BxeaummPmTfUCM3YSm132PFUw035iyE8nmTZ5K+b
         oKXtdHy4d62szH4nGUBnK3L6Hozh5LABuAmJZhmWKdPqBvVPMuyGaiDPUGuF6iMObgTx
         Fayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938383; x=1784543183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0pxVTSV9NqQSxt2NKcMsD/tFtm1cvcFlvB7qlYNgl44=;
        b=DR9VhDfo6cVK2NlBgbef68ydb/ec5WYXZRFQOchSMwqvQb/nS1bXwoegZqQYCw/4j9
         davRFKevs/Xk8A1WFAR8zHWKKE9ET7WaStZG2XU45WEk9cC8U3jKznPyTZhAPARUcKjh
         3sLBX1eq7U+aHxThMOZx+0dYCXLhPVFZL6VBTo3x7F3pKhSwzqEww+MWSJMPFUYGnCqi
         qlNzRn1Gmr0Xfnf7ozrkRuRgCXLKVdACrMENZ09+qI8fOwauzYgz44ZXhNRXH09qSTfg
         hCfges2IwjsC3JwGTgaZlRlxgyQuAJ6kxXHt7gHTpuNCu771oqAOyPxrGFCTeNMaClly
         Q3Dg==
X-Forwarded-Encrypted: i=1; AHgh+RoNTd681qlYX3/Xcs4yMtL9o7zVAmr4j/XmiFylwUA7LchccYsybj8ZW84hC1uCqW1QMGhniPDf7HU0@vger.kernel.org
X-Gm-Message-State: AOJu0YwIlckC1sZz2CXmUSxIbBf8xXJFf6Crw7qXtHR0tI5FzKlcWoLW
	jENMZz+nDn8cQj6suxz1HaXXg1uVWuvt1smd8C7BznzPPRXrUGTVKkRqQ0KIKCZnvzQieEC4LYq
	aInEvWX4/iGoxfeWTG3gwX4w8JWcxuIcqZIlfZGLU9Z4BX4L8rYlGOdBUasJNbubf
X-Gm-Gg: AfdE7clzAQ29KSBr8kIQ37d/31HAJ9XpMyHAFtnqIraqX4Wt55R2eNsf3rr8E+GFc1b
	nBMB5f5E4XOgvaHbAdoys/Hhgcgsx9bCM0KaX2hLkGSvCdqv98JYsBbhIjeegDQ5GK2642A4l3P
	TU5XrRq07vdlBbtQ6wYx/Im62iPTd4rP5cKpXaYkNOhoV8e8/BBDW3sKY6CFGJQODyYqO9tb+S3
	3AQ+n6zUI3WYLpcmZ/CvHmaJbzbmNzydlYfioMf7bXLQQ2OOTG9+8o3XNbutO1+wDx1pW67hgQ/
	VqhHDVCAgSc37mDru87PTSvExKlyo6fYeGXdd5ExHFyk0xb3xWJAIOy39XlR/9CshjXJAAuSdrM
	Xmek+DX6XkXpDdty4RQ+hRksdJEW2ax8RnMbjoQ==
X-Received: by 2002:a17:90b:2d4e:b0:387:e0db:bc29 with SMTP id 98e67ed59e1d1-38dc77d79e0mr8147463a91.41.1783938383026;
        Mon, 13 Jul 2026 03:26:23 -0700 (PDT)
X-Received: by 2002:a17:90b:2d4e:b0:387:e0db:bc29 with SMTP id 98e67ed59e1d1-38dc77d79e0mr8147430a91.41.1783938382587;
        Mon, 13 Jul 2026 03:26:22 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311950eb930sm48465704eec.8.2026.07.13.03.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:26:22 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:56:07 +0530
Subject: [PATCH v3 2/4] arm64: dts: qcom: shikra-cqs-evk: Enable display
 and add ili7807s panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra-dt-changes-v3-2-15102fca9570@oss.qualcomm.com>
References: <20260713-shikra-dt-changes-v3-0-15102fca9570@oss.qualcomm.com>
In-Reply-To: <20260713-shikra-dt-changes-v3-0-15102fca9570@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783938370; l=3523;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=yz+vhdZtFiLKHn0F27VYcm96BraHz9XPOvOgkzNUaeU=;
 b=mbnJc1Dzi8lAdpemjrEulZ2afDFqdqzAi9TFXVzlfqGsvjxleo5utowXJ4g+gb0ywyldxzi/N
 h7gqRHsBY/nAstOEFtJO0mIKRsJ7A6wslC+LAiA/UmMp+JozA+/AplW
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX138nf4Ie5d9l
 1EHhnm20t1vvaNg8lCJqmY3ChUf+hBaBkPNOcu/XOybs4kDFNmss5wuqABVQrdHIIeFpj7uLY/O
 amI0urEi4uPlt2AVi/BWUTM5ciwyChvQdPGu901dPGVtDgYjHnTAHwNOVFQF0d2EfLYD3NmNtaA
 n6J86iOZ5l+LjM7DxAW/9fpCpXeIoVMIMB3n6XYhMivNCkGpKeoZgq402nBT+vJ+uRnz2g2Ppas
 bfxnIxKMH4vMoM4PRx3LOlrnl32Se/suLQhLB0roA7dXKeXS92bus4ZbnnJOiKJOla2t9REAt3T
 /GbODJ0z9bd5vfC4xX1oXkIPHQm2fSsh1tgAumH8O/KMYDVvDGAtNij+OXfQc7TZvzN9lsEvXTl
 EkUq+w9FuTbmM2M3Rg3uezwkSK0S421zKxTDQ5eutH3KnYXRnlqTNDQ7CnsJ3rn9Vgeb7RzrKxb
 HX8LmGWxugrhDsxjXlw==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a54bd4f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=gJpjwWOAGh2g_eRG5xwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: q-9762EDoJgkBj-taZ8f13mLGQqL8Fnz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX2u2eeiLnKQur
 z4f5esKLgGZAZm1flVSw0k+nyyFx7OZhzLqbXJv5p0gPmtkP+ZFBY3C+gHr5Ah/9fHU6lqdBTJO
 S73hhRBwVFPgthLfqbE1gJNVqIXwNmI=
X-Proofpoint-ORIG-GUID: q-9762EDoJgkBj-taZ8f13mLGQqL8Fnz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130108

From: Arpit Saini <arpit.saini@oss.qualcomm.com>

Enable the Shikra MDSS display subsystem on the Qualcomm Shikra CQS EVK
board and add the DLC0697 MIPI DSI display panel node.

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 118 ++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 26ff8007a819..e2b4f3ac7feb 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,31 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	lcd_bias: regulator-lcd-bias {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_bias";
+		gpio = <&tlmm 151 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&lcd_bias_en>;
+		pinctrl-names = "default";
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
 
@@ -60,6 +85,53 @@ vreg_pmu_ch1: ldo4 {
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
 
@@ -95,6 +167,52 @@ &sdhc_1 {
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

