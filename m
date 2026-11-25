Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611309;
	b=FGVJnlF6tSbibi5jUo3fd6YVJBAGyAxbRcx8SCUf2d5GuxLCfAt+WmGVSrFewKP4jrea
	 u0PdXKKo2OJfguuBU1FWNzuT+VGypV15Un9cFav/b0KkvIBJzth4d5XIlfhS09ft21AqJ
	 SBen/7Yhz3wTmlvUo9oijEyVM2jSKohDBgxMB4x/entBsXAr09lULYhENGxJMRaJRh24v
	 Ht1wOVBNjwWOdUHn0dINGDIhiFq8kXiQOShWxgZiLjle78l/xGDF1wr0GzvyoyWtQmeKM
	 OSIKEyLQKZz/Uy2muqu8eiSOuptNK+HdIsuwFqonkTgqKh4WSmChzI87Mexw7c8/dMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611309;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bZFEZJh/kiz3Wuz0tlw5gxTMXmRS2CncrfuIY6KDmig=;
	b=U8QYAzLt05DqRHYfPsw1xD1uQo9gX0hAJpZY8SUAQU++05R1wUgiURKYT7VgQHck8E14
	 vdsqkXA+kZ5x2qXU07nQbJQqdYQQX+Cojk2RuNb57PBpenCGClvkSj3lbVV7l2Td9FPmD
	 M4J6tbaNqbRA0bR1ZkAmhMFnPMQ5b+QuCG+gE9MGVWDSEfD39UzkgUFyiOZo4F+or4S/q
	 8n2Ff+lIUP+0rWOiW6Uz5/urUSi3lZD4L01KX/fUTMTtiY8F4TQzcNnqtgCx3Lj9xqXAM
	 x6HHb+169NEhzt8JcXoYfUAXcHTRbyucrfy1xI5ZwpYaPmEL78f0A3+dAjRUoH9mqSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cvgIjAAI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Phm2rZ8L;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F8C606A689
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00F8C606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cvgIjAAI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Phm2rZ8L
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APC25ln415968
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bZFEZJh/kiz3Wuz0tlw5gxTMXmRS2CncrfuIY6KDmig=; b=cvgIjAAILbtsloFZ
	yrPlQ8iybmLMH7qFfd1sfPJkOjrxCS0CmvUTIvOQ92+goERSR0T7a9aM3zB1sxwW
	nZaIguRKoWVI95jjbHO8pSs1+lO6JdHB3qL0JlNk7+78CipCkhQ9bq8gtaLhnSAW
	j1sNQBP3FElTZDC9y4Rz6SlJlj5YYqyxPp5KRPvYZZ7zvTPoV4pFRI1UL54Nhpg3
	AWgbAbO889X+OvjRTGnasXbqlv/uoVx4jdLcsjbEyd6ayYOzA2I6Q9kFtHYEu1b6
	uxVW9LB/UJvjzZAvYqdJ5GGdnAo2z0mnb73S8J4dkjMJ7U1c/QRWxWQmkRwcO8cT
	mlCcpA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5yaxr6g5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:55:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f04046f427so7775285ad.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795611306; x=1796216106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZFEZJh/kiz3Wuz0tlw5gxTMXmRS2CncrfuIY6KDmig=;
        b=Phm2rZ8L2r1RYfTYF8W5HXsiQOly5wdUGt2seee83gjY2akCCqKoB/WWGtLZrk57Mn
         hkSfCg3F/EX6aVIJoHEt2GmWUG5XyzVqJ5fnd+fWyV6YyTXp3Kw+UQbzxQlhOXkSHynY
         Pz3aD21oi0efFKrYpLMEhO5U+XYeBQTNf70eMaJvlE7JMu+SgPVNFB+Bz3zJcOjFJ0rV
         7NRBNtI3fRxzxFS+RuZQ8m0M0ZWX1Yfwq6CEHOCisJLNVrdCu3HKcnibOhQhelfaoZoI
         9KwBPBtY7jdYmTy5OdaDdf1Gu7p1R4eg0E455HMQwTtT2vH8/ggwoNQzbBQRVFpBF9bQ
         PKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611306; x=1796216106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZFEZJh/kiz3Wuz0tlw5gxTMXmRS2CncrfuIY6KDmig=;
        b=MNsNNdjWh2dHurxGhW33PurFZ3S9PMQ1M6geZSuOx9Ps3iqkSkJ4FPQdkgOsX+tpQL
         ozi18Qvdhn1PEZjMoOcThTHdLS7oLRsgdHvR2XtXgB4muxmQERSqe10r5Ycfb+dKKES3
         QRV8y7I7+6/Q8xIJfAgoPYf9Fl5UU84YcCgf1GsCz+gLGSISIQwl7gS0ehEcp3rt9//y
         WnLPIOfB/ZD5ab1Rs49B5LbW1sTNWl6hj3xuBjnKL2u492HnEo0C/UdYoW4NelSj2h3+
         u9d3hOY2qiqoQbcvd91UbJ4GL7wFkADV+OHvVYE5D2FH+K2H6VslSO14n7+6vS7dpUYZ
         kd0A==
X-Forwarded-Encrypted: i=1; AL+hErF3aWxpycZqC1Iwk5a6vCnDKu45vxgZ1c2y8GXyd/0deGnDnrnYlpRi8PeHT6yrYtS6a5Y9uRBtopSp@vger.kernel.org
X-Gm-Message-State: APuU4Z/Vjk4mpOQR8McDMkrDAUkNXM/5rCdjdhi52feZS6By79ss94XR
	IiUp7tUf3JPoKlPH360qiOzmsA9zR/vp3lHGdf49qZr20SoZE87QCm7pUbwqMZ6U21f7c7nn9AM
	Mu0sQTWroIjGoD++Xill4NGI5VwoV3SFhC6GxnEX29j0dKI08Obo0ZKFy/8HTMkvU
X-Gm-Gg: AZFdTZdQTfozKrI0FeRvyen7W2olhpUi1plZm92htotMfYVRvcQtnSEbn4zvr0ZUCyR
	tkw6dmNDZknwFC6v69tLfo4xjGqiepKDyT8F7F207QO6bUM5HvebEc+7J8ai5w/RAXjvpmnBEv0
	IuLYoZjqmeR62P/RQwR5v848tf+oe2LSHfvWC4j446PNu0vtAxsv6Q+uTm7WRAJ7dVwHOXzC6aB
	gR7XRiFOm5A9p3HWyKHt57HNklgbHRgRJuAi4Q7Lcp8O9G1izRkOrwGbqhKt4C0PRFXVPhS9wwW
	MTMr7X+tGTEiWPLGd5xlmK7bsStAC+jRHV8CZe3ZCBASY7Tq4y4L60lzqFDIeT0f7ZLi1ozWZoW
	d5/dxjJ4HgW+gCtOPwB7Ou0dinPGcSuCdFQF7TISM9QBxUMjl4DBucSQzpMFHpwLjngRUq5WyRQ
	WQls0N221x3V7D+5bRWM1ZfWtHLDBd4sshuKF+YG9VXM8fT7Mk8mW2VMttvTvu/gMXeJukYlEoS
	VregSbYkZNy+4c4lh8kh4C7yeid
X-Received: by 2002:a17:902:e38b:b0:2f0:7707:227c with SMTP id d9443c01a7336-2f0770728c8mr126208845ad.4.1795611305555;
        Wed, 25 Nov 2026 04:55:05 -0800 (PST)
X-Received: by 2002:a17:902:e38b:b0:2f0:7707:227c with SMTP id d9443c01a7336-2f0770728c8mr126208405ad.4.1795611305033;
        Wed, 25 Nov 2026 04:55:05 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b58fce71sm31940575ad.45.2026.11.25.04.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:55:04 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 18:24:29 +0530
Subject: [PATCH 5/5] arm64: dts: qcom: monaco-draco-evk: Add LVDS AUO
 G133HAN01 panel overlay
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
Message-Id: <20261125-monaco_display_intf-v1-5-8a27d60b0d94@oss.qualcomm.com>
References: <20261125-monaco_display_intf-v1-0-8a27d60b0d94@oss.qualcomm.com>
In-Reply-To: <20261125-monaco_display_intf-v1-0-8a27d60b0d94@oss.qualcomm.com>
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
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795611273; l=5520;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=6nbVHX+/Cq/YF01FFFGiP3B+WoYwWq3CUOhOIkIUo/E=;
 b=VBqXVsSUO37LRiyeV8Nc+EfLgdq+yzvhxbgppDKFeQQAUQ8vDtv5C+stmHjpOz0unnsMe1EUL
 6qVjA87F/JLCvq5DOiExvPtc/trAMp5rPrpF0FePyckWjWmtmGT157C
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: 8N6LQfnkIuVAObfu8luZKKgkXbbLSmpy
X-Proofpoint-ORIG-GUID: 8N6LQfnkIuVAObfu8luZKKgkXbbLSmpy
X-Authority-Analysis: v=2.4 cv=ULpIjyfy c=1 sm=1 tr=0 ts=6b06daaa cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=y427l31XdlkixRcQg0gA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfX42WA3QIk5F9z
 UUM1yn82nZbzDeI5rtg9BDrGrhgAqd8Nq7AHajfuyzF+opo/JKTE24m+0p5fmRBMluzTV3qDe5b
 VYyC6SdyQLhQljsxSSDEufvNdQzUYDJT+sfKoubU9JcLthlFt/Qw2jCVH99qF+5auoK0Is8p8N/
 D4VhKIgiZnYckIMMzKTdJJ7S5i7w6/oGtppiJ93FlW4GQgz4zTTD7AXjSRpqYGDILZYLZYq+yMd
 4t5kqYXttlP54Z89SVRz5Mo98YsyUhQ2ByfVthSBXJut3eBmht1OnLqm1tOVGZExJGk9gkgckSj
 1xUJMmVYKzO/zl5KF8WIeWLzFnb+m3m4KOLdhu8+gN/9ieN98h3haC7vKkS7dUm2qoSKkoaCBsw
 nuFeDwrLHjIquvhPinsqnucGXoc6XPPzCGpvD3txpjgbGWl+a45PCFHoaNm+4XZ5z/m/12F1IAu
 L/xydkELG3F09MxhCFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfX3W6EqeoUMwYU
 SwuSRzqyMdj9he+7giw69dpu+mtMUSlut72R4JuM+fUKZ+7du5DX3KCopt1KuHsOuFY6qXF1ikp
 AhZe5/e0zh1f1GPXQUKscD20vxJtXtY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250051

Add a DT overlay to enable the AUO G133HAN01 dual-channel LVDS panel on
the Monaco Draco EVK. DSI0 is routed to the panel through the TI
SN65DSI84 DSI-to-LVDS bridge on channel 1 of the I2C mux, with enable
on GPIO3 and interrupt on GPIO76. The panel backlight is driven by the
PCA9685 PWM controller on i2c13.

DSI0 is shared with the LT9611UXD HDMI bridge on the base board, so
disable the default HDMI bridge and connector in favour of the LVDS
panel.

Also add an alias for i2c13 to keep the I2C bus numbering stable.

DIPSW2.4 needs to be ON on the board for this configuration.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   3 +
 .../qcom/monaco-draco-evk-lvds-auo,g133han01.dtso  | 147 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-draco-evk.dts      |   1 +
 3 files changed, 151 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 99c733c480ce..83dd2bb6e04e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -102,6 +102,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-raspberrypi-dsi-7inch.dtbo
 monaco-draco-evk-waveshare-dsi-8inch-dtbs := monaco-draco-evk.dtb monaco-draco-evk-waveshare-dsi-8inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-waveshare-dsi-8inch.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-waveshare-dsi-8inch.dtbo
+monaco-draco-evk-lvds-auo,g133han01-dtbs := monaco-draco-evk.dtb monaco-draco-evk-lvds-auo,g133han01.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-lvds-auo,g133han01.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-lvds-auo,g133han01.dtbo
 
 monaco-draco-evk-el2-dtbs := monaco-draco-evk.dtb monaco-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-draco-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/monaco-draco-evk-lvds-auo,g133han01.dtso
new file mode 100644
index 000000000000..17f1ef00829a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-draco-evk-lvds-auo,g133han01.dtso
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	backlight_lvds: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pca9685 2 1000000>;
+		power-supply = <&vreg_disp0_bl_en>;
+	};
+
+	panel-lvds {
+		compatible = "auo,g133han01";
+		power-supply = <&vreg_lvds_3p3>;
+		backlight = <&backlight_lvds>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* LVDS Channel A - odd pixels */
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				lvds_panel_out_a: endpoint {
+					remote-endpoint = <&sn65dsi84_out_a>;
+				};
+			};
+
+			/* LVDS Channel B - even pixels */
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+
+				lvds_panel_out_b: endpoint {
+					remote-endpoint = <&sn65dsi84_out_b>;
+				};
+			};
+		};
+	};
+
+	vreg_disp0_bl_en: regulator-disp0-bl-en {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp0_bl_en";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&expander2 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_lvds_3p3: regulator-lvds-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_lvds_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&hdmi_connector {
+	status = "disabled";
+};
+
+&i2c13 {
+	clock-frequency = <100000>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	pca9685: pwm@42 {
+		compatible = "nxp,pca9685-pwm";
+		reg = <0x42>;
+		#pwm-cells = <2>;
+	};
+};
+
+&i2c_mux {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	i2c@1 {
+		reg = <1>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sn65dsi84: bridge@2c {
+			compatible = "ti,sn65dsi84";
+			reg = <0x2c>;
+
+			enable-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+			interrupts-extended = <&tlmm 76 IRQ_TYPE_EDGE_FALLING>;
+			vcc-supply = <&vreg_bridge_3p3>;
+			pinctrl-0 = <&bridge_rst_pin &bridge_irq_pin>;
+			pinctrl-names = "default";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					sn65dsi84_in: endpoint {
+						data-lanes = <1 2 3 4>;
+						remote-endpoint = <&mdss_dsi0_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					sn65dsi84_out_a: endpoint {
+						data-lanes = <1 2 3 4>;
+						remote-endpoint = <&lvds_panel_out_a>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					sn65dsi84_out_b: endpoint {
+						data-lanes = <1 2 3 4>;
+						remote-endpoint = <&lvds_panel_out_b>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&sn65dsi84_in>;
+};
diff --git a/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts
index 3e1b18de8920..a576159933b1 100644
--- a/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts
@@ -20,6 +20,7 @@ / {
 	aliases {
 		ethernet0 = &ethernet0;
 		i2c8 = &i2c8;
+		i2c13 = &i2c13;
 		i2c14 = &i2c14;
 		serial1 = &uart2;
 	};

-- 
2.34.1

