Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61A43A1683
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 10:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782554536; cv=none; b=ccg386ueUIYvzCEtljRDXKm1b4HIj8U/cPs7Axn+VftfV7YqBdjRzwU+ZVhChHDn73eV11iiPg/l1FFfiTGTvQmtccNpPR62FurOX6UfhNkvGq4q3thgqduwOEEM5x9Ab1ArpZrXRl9KDJQS81Lyrx+SY3uHkTQCXZOa9PjfKKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782554536; c=relaxed/simple;
	bh=Xs7/bXTsqIFp9AFWFL1TG6MMp0Qbod3zdENvP42or/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W+8yzKCvQe4J+1V+2Ms9dSpH2sgCPUNCgO7XJTSnMR4hMJsm3ZN8OAr5jUv29uBiqSHSACQwbS705a0hn8j31kZIvtY2cSjSJecYczv+ZNlvPAfL9IlOP174d2M8MOF3RyH4KLfiUtWc2LeygC2raX5iuCYn1EF/m3xsGInc8BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KIk2bPFV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GH/kqqO9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KIk2bPFV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GH/kqqO9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65R9ZjGR732156
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 10:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bxovym1ll2PDsH9394AsS4KfV8o3y5jCIyIeSCGZdnc=; b=KIk2bPFVRbaMdX4Y
	060K0ZF0JrK6WDr22I2Ay/wtQYeAjCNJINM+DCjYXnv6kfbTeJaxcHrRc2gskeMt
	agmqpMkoSuJu+1cpH83nPomxFdCBbFHWJQ/N8VSbHypxfDwN27aMY04HpxhJm4i8
	xoAJUO0vx+nQ9HqoV6MNKsE4FnTERDcmVgCNsmRiEK6X5umV8TqVPPNojja9mBkL
	W5ElxHmoG0j1nOVitZOTAsbCNM2HMp9OVPy1Iirbp4BZNPnxG4DIFZ2/RMXupnzP
	o+X5KZosbarQFWPw3X20XGeDd6UCP5Y2Df7scln1TD+Js/ka4gtshyF0A34wXVPX
	zMZ2/Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26u70kqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 10:02:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c42d96713so1356041eec.1
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 03:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782554533; x=1783159333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bxovym1ll2PDsH9394AsS4KfV8o3y5jCIyIeSCGZdnc=;
        b=GH/kqqO9BsBOjrJjnVnGatvzNw15TxVpGIp3O7g7Fc1OkEBE+uuITIMy4GbFHktrcf
         zCuLp7H59v8gkQhkHDQWYhF8AOUSVbkeoMGAES8A9215+LTjq13n9Rc9qMJR1jNWQzsH
         2/XZlMrQ4r0eMLKu1uJNipc1y5WKtQQ70zmCDzrbP1tcc5OyUTTIoO4w1M1/XaFEBcpW
         bNSuVNT4KdSV7CwtETRJCuBTFgqH8GXaVN7mIkkIgi8FdbmOhLNODFZDkx+m4dnUNs6V
         pINhtFJWv8tUxJi8u0h+Rn46n7QWz3K0Iz60yse3Q4jvjNsVbKYI6+Is7ctgawxZMnv/
         jtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782554533; x=1783159333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bxovym1ll2PDsH9394AsS4KfV8o3y5jCIyIeSCGZdnc=;
        b=EkySNmMwlN8cnQfUrAi7FkQtiUy/gFBO2N4q8I+KhgJUynrEka+xRSwLb66fKHcdIn
         UcFp96G+suTS+nQRM77TVF8FQablGM2vuG6ujG8wGncBwF//ij6tbk3Yo4ssAJ9XWMhU
         Z0UqjZXONNQVCIwDEh9eSUoAWSIO5GBni+0zi3/WoaP1X0HOoA6RKphFLXguNdDbadFa
         PK2CDRYSibxKQCCzeF8dT1Wn1l+mAMb8upC/apS7lEp4GJtZTzcXgmzbNe85qanY5pzx
         Trwdtr5THxOKzI8rKSndNKjOdFarQD6P5Inayc6PcTe9DDC/GV6LAEr81gQOzNrnX7KC
         h+cA==
X-Forwarded-Encrypted: i=1; AHgh+RqtDE7uurkvwHvZWKyCFy9Kjz8ffU9Hb/rjVeRDA1oiWwKWaRvbGqv4ZEI3pp9xPA9Zj1omxYcOb1OO@vger.kernel.org
X-Gm-Message-State: AOJu0Yzne8tiMSsTwW+WuFdWI28yYg0lPvm6k0lOrdZQs/ZdwIWVnuZN
	bDFykayxM3tEhNjPTEN3J3Y1SL7ALrG6QxWYdhbIvdhEvvikIYWTrzl4dySf4BPaGpRhug2ezU3
	2w00pAgBLKf1OOgRHSxMvmrmDeEnzd+SoQ9A0tvY2R573k19QOz9GwUb40pnI/NUD
X-Gm-Gg: AfdE7cljPtl3QE346xuy4mAKyEh6q9mwg5lrZI2Wb+mrwvgFKtkDIg0OPx7J+IwAaN2
	Frj84CndJ6UcfcfT4cP691LrDwwXo2FumWJX7C2ztj3P2AblGvsIqogcuu20DftNTiA9nas2ssB
	2r27U4ojVXf1fHEmZcycAitUnCWt+Zig27gaebBy2QjPCwrNtt8NKHrbLwEzrDddg8dv3iYZQo2
	ye3TZRRYbq7yKNlcP+EP65hnSTvcORP1/G2XNNiyuX5DujDLnroYiSJeUAZQ8AX8LSg676p92M2
	bbtMGeLmR/i90AL+02aWe1zNIWn90D5NpmKXfooamYbV3sQO2ip9DZidtK5vgw1zAlWvKOOaFLL
	STqSAyVY3FGKOEQyOSg8JqEvrdOPjBy0IT5LAuQ==
X-Received: by 2002:a05:7300:5341:b0:307:d4e7:b177 with SMTP id 5a478bee46e88-30c84f3cb8emr11223157eec.16.1782554528799;
        Sat, 27 Jun 2026 03:02:08 -0700 (PDT)
X-Received: by 2002:a05:7300:5341:b0:307:d4e7:b177 with SMTP id 5a478bee46e88-30c84f3cb8emr11223123eec.16.1782554528287;
        Sat, 27 Jun 2026 03:02:08 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d90e95c6sm38446568c88.11.2026.06.27.03.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 03:02:07 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Sat, 27 Jun 2026 15:31:36 +0530
Subject: [PATCH 2/5] arm64: dts: qcom: shikra-cqm-evk: Enable display and
 add ili7807s panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-shikra-dt-changes-v1-2-449a402673d0@oss.qualcomm.com>
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
In-Reply-To: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arpit.saini@oss.qualcomm.com,
        mohit.dsor@oss.qualcomm.com,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782554515; l=3142;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=QS9vkZA2e/SmU/TDdRgL29DC7Wbjw1RsgyTSuX9Yoy0=;
 b=ZnN7m2YVKfivMnJ7iBGuybX2HzBysI/RHJ6a45kuG0HS0ET1vcvdQxuBdc1NG40DVem6BVeo2
 IF5C2bhbULQBeDC4baLVyEbouZIPR0IIJnKA74LN7n4TxoUxPiluOyI
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI3MDA4NiBTYWx0ZWRfX08R1uLmFoAQV
 z5V5rOfDOLd85vZALjNeEDa/szbtnrY4pER8+o8Lx6lTqI1xC2YJxRbJkZx0PACOVhte1Z8+T8R
 5+ymKUehHbGrb5LOTJOCrlnnL4OwxXM=
X-Authority-Analysis: v=2.4 cv=ftnsol4f c=1 sm=1 tr=0 ts=6a3f9fa5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ur-NXv3_5bdptA1sOiEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: KUoHJDzBcMZJFKrv4BFg46ns-_mzl1xr
X-Proofpoint-ORIG-GUID: KUoHJDzBcMZJFKrv4BFg46ns-_mzl1xr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI3MDA4NiBTYWx0ZWRfX8PtjFkDOrqe2
 RkXjrirCPk6oxffTCuBcEOrfD/S6L9ugK+iG3qfSgEh1n2LQsJW/JK0loPl7fWiiACHAGw/Ustt
 rNJDixrU2+Lf8GpRrZkvvkUEZPYNsIJRt/49AN51K/cmEoZ+1yfS5Tx1Hm0J0xzIHFCLFwGlFwn
 f3R4aH53PIrK825/ZfmrjJB541kb1YxnJ5wSi6ycwAl/TQgddKPkR3tU9i2ODE/JLwdxC1mHmb3
 ffyJaGmkY9qoINCmovGdiOwtzFoSKiqzXakGaXARsHSVoEpf4VptY6jyn59szEs+070OkKB9lsJ
 yE50rqNnt3khk8K5SykTfvCdoKMnCmkEwbKfT9qCJgyqCr+TuX6kTnsRiDjbakxVSvjfdUjCvfB
 DI4owct67niK5UH37TVstmUu2t7pj+/7A1N80s9HnmT/GKqmAwbrnw4hpRGQKkdU/M5pFTXQpS8
 k+PHjXD/AfJ8wvxv2PA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-27_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606270086

From: Arpit Saini <arpit.saini@oss.qualcomm.com>

Enable the Shikra MDSS display subsystem on the Shikra CQM EVK
board and add the DLC0697 MIPI DSI display panel node.
Pin pm4125_l5 to 1.232V with regulator-allow-set-load
for DSI PHY PLL stability.

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 104 ++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 683b5245923b..c9ea093cd8ca 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,18 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	lcd_bias: regulator-lcd-bias {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_bias";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&pm4125_l17>;
+		gpio = <&tlmm 151 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&lcd_bias_en>;
+		pinctrl-names = "default";
+	};
+
 	wcn3988-pmu {
 		compatible = "qcom,wcn3988-pmu";
 
@@ -60,6 +72,52 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm4125_l5>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "dlc,dlc0697", "ilitek,ili7807s";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+
+		vddi-supply = <&pm4125_l15>;
+		avdd-supply = <&lcd_bias>;
+		avee-supply = <&lcd_bias>;
+
+		pinctrl-0 = <&panel_bl_en &panel_rst_n &panel_te_pin>;
+		pinctrl-1 = <&panel_bl_en_suspend &panel_rst_n_suspend>;
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
 
@@ -116,3 +174,49 @@ &wifi {
 
 	status = "okay";
 };
+
+&tlmm {
+	lcd_bias_en: lcd-bias-en-state {
+		pins = "gpio151";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
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
+};

-- 
2.34.1

