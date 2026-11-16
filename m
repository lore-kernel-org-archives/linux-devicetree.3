Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828914;
	b=VN3hA3Vf5Ne3PnCOV6ws62y1Hhs4uXmXdUIgDz4FO6inD+YOeDcpar824ATO+1jbjEym
	 RudueLYwuvI8YMCqCmUxz+NNnomm3B1FnWp0xrjmh7Wg4aFi37/H29IZhihoGHoGnd8/Q
	 Wyf1VszkNDXnsF6I0PPz2S3iuPQsOzFnIIjnBfCTAVWc4dRwvjWjBqA5oWU1XelpoL2nu
	 ifYmg3bRm4K3dXALzDqu6q4+Gh1g0eltfSojWkKCbdJEwZ54A1H2g5s7FYPyODkkvcUOb
	 uEP1SEdHWX1PaeclaXFkcbOdMAYmwa8T8JbNBUw6WZ0dKKb2hWiuepWSVgw0Gboivjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828914;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0thsqEQypwpZodKDEOlWAqW0XOK2Cxlrn9ugpmJDNRE=;
	b=KHg7wS5Vfr9SqZaG/DDPUzOOaEuJpGzyS4KY7+/sliyHVS2inVCPkYwHP+DWSiyK0b/P
	 dDrGh8TWBOwEK6kDRaL5BIxWVKpDml1FZKtns5TyKMbXjGSgJgWFgH6lJ+Z+FCliZjP+A
	 k00I6hrHoLhy7MGI2vHk6+4STneV77kXU1CnDNMf+s55So4dsTEBZB0sHmxEd32cnGeAA
	 mghvusr68dmJydBK6Lou8AmPSQ7l63mrLWRh2V6a3/FarWKYOB3XHML7KbSn4FfGT/5L1
	 lBQv4xI2Y8xz3h0Bgx06V0ciZXpfXyM3paeyOOnxcZGBvAF9cSHK1ondEHXFpL6/sKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RLoLN7+C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iw9mUbq0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0D4606A330
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E0D4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RLoLN7+C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iw9mUbq0
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGBM9PF1017816
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0thsqEQypwpZodKDEOlWAqW0XOK2Cxlrn9ugpmJDNRE=; b=RLoLN7+CSSjkTb41
	0nhiV2uP3XWJk/IO8dNGDi4BmyHc8MpMtOMusspKeSY6o6ylIR8aII95t6axLaL6
	MGpnul0nv3A5oSSq77N2aA028kw1BOfW2zyELZrzmnyiU5blXhQJEy+b3Vu6sJEF
	lwR3Wv3mEi/WS56VoacbpqGAymUfTnYM8x5JJS7cRemHFQ8ITBjOTD/fi0gzPz6G
	nT87zg7uDygjiYAU5S8IxD1ZMH0ysTdGWWO132HDRNPjXdLYNK7LEvPF2H0PsxH5
	qMgurVTWIr1s1dLw4Itgrk30aH+dYRPN905dz16uYXogao+28W6qXgokXeO5JZti
	rpP6ug==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0003g8b2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:35:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eaf3f829b3so28448145ad.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 03:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794828912; x=1795433712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0thsqEQypwpZodKDEOlWAqW0XOK2Cxlrn9ugpmJDNRE=;
        b=Iw9mUbq0zyYx/uBFeGRUpRU4EWvGgX6DKdhJ8ROfy4u2eV1qe4w1oEEffI/OunrjaU
         5/NTXgZPotaaqTbEme7OaXUjy6k50egtoXSKfnjZroPXv5kVnu84qssRa6UqNeLLKvfu
         omDCHeWr8HEV3FPtlxXHADfr2+ykUAGNFrRoA+kRcFF0D9qCfTriJzqcYDCRpLkYwDfk
         IAA8xJTW6w4eTZbfjRdRpM7hyZV4ITDd8eK4j1AdtRnFjuRrNMK7GrCFf3Zepcgi9p2q
         TfDUT80Yp4bPTsNvwYI918pICONMTWrx6ZLFL2x2H1+GXw5e6bpcYpRTk69kMg89JZtb
         by7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794828912; x=1795433712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0thsqEQypwpZodKDEOlWAqW0XOK2Cxlrn9ugpmJDNRE=;
        b=awSCjxs19EFQGrDALCqaeHocyFdKGgYpUIKB5YwvW+wqx0hCSZa9qSxsHg+p4CjqQY
         Ufezz49c24bLq6v66n7t+w1J3KALzhLNQtdnVr80O2z3bxe0Dyfx6PP3kdyL4dzKz2cr
         p9yB88S3IZQ0kZOu6l6hm8Q6OcNOYZlJp4uqjsHckrjSik18miKLhox08ThS1EQTQPWE
         BqBbeJDLmMe8nKIaKr8VKhDmTaLPH8lYBfhJqer/k5llOmp5imFNc80zJNRjVdPatzz4
         pplJuZU4oZ4gPDvjnkFLQnpNb64oG0iqPZVhcRNrLJN7FXqmqe8Vo6XS9giH7H7PkWjV
         bwlQ==
X-Forwarded-Encrypted: i=1; AL+hErFyKYR5ePwIrJC01tYCYZa8Byku5a9/r8XXNllyELbgJPZwDpsxAkd0Qs/efn6vr/MMEOaVE6fbvMlu@vger.kernel.org
X-Gm-Message-State: APuU4Z+4jLBlPGCYbYhpBbBT07c/yfqetS/wW7lON6Ruun0BxFwuX8f9
	jhqm7Yme5itkUS4KbQzHAubOoHVrzXFqk3eX0OI95/eR43RibWfqlr1d7Auj/ZeG8y0rWDvrMU7
	gINjVDtRgij30URC0NOjXOi3uvXz+p3rVIC3KXJQLXj1C5MTjnVzF1/lfcm6IhMqI
X-Gm-Gg: AZFdTZejyzHsxg1yTsRic6RYL3bKFKL6WciOkkLZ7HPka21/UUgJkMnLwqHyy0yKKUi
	3be+NnnNN/qEmLAriMM2gk/XRrAAegX2iOe5OUwKbJScEmdXvNQIInajn9ts5CnL/+qB3OHx6yi
	MuG2VwMQlPQyVs8ejPGH1wzrPk/uJIMStjkpVd3a9yU/77HTg7rwyGqfrAgZvUCGgQ+D5bpZWRt
	9J6JVMaQaB5w2T3Dtp7+LRNuTejPYdI5BEzCT8E9FXlgY5EbaJGLOhtkl/ggjyvZ6MhZeBKUwnt
	6TFlzd9zCGxyinrDqCQ3Q9ra7xLn2ZrGXek44mK3jJYxxgVvcK/AeeQpUUyz2rnVORo4/Eb6igU
	r2u9ubMmaiAjAp+Z2QSUjQ4E/eMmkqyzToY73growi/+qTxCgnod3LofNRR5kweFGZfvja4bieG
	QM
X-Received: by 2002:a17:90b:55cf:b0:3a4:9dd7:296f with SMTP id 98e67ed59e1d1-3b1b0a46728mr8948198a91.40.1794828911924;
        Mon, 16 Nov 2026 03:35:11 -0800 (PST)
X-Received: by 2002:a17:90b:55cf:b0:3a4:9dd7:296f with SMTP id 98e67ed59e1d1-3b1b0a46728mr8948162a91.40.1794828911429;
        Mon, 16 Nov 2026 03:35:11 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d27d26sm21000719a91.13.2026.11.16.03.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:35:11 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 17:04:07 +0530
Subject: [PATCH v2 4/4] arm64: dts: qcom: glymur-crd: Enable HDMI output
 via PS195
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
Message-Id: <20261116-mahua-hdmi-v2-4-0b5af6bf9e70@oss.qualcomm.com>
References: <20261116-mahua-hdmi-v2-0-0b5af6bf9e70@oss.qualcomm.com>
In-Reply-To: <20261116-mahua-hdmi-v2-0-0b5af6bf9e70@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794828874; l=5443;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=RcljMfYUbyalzdgq7MXeMZXwNq3xR/p30j1AzKNOXPc=;
 b=L4NiMBIz036/oqx54VL20OBls7Kj56F/K1Z1F5PhlaTNkQkWy4HMQKNTwTYE1kjzegmU4/zOG
 jBYPkaL1DKCDcTbHyWxKgUfISrJmFvXyb/WK2/pqW/J6LYT3gQhV0sG
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: XlQ24ie62V2r5DdljSzdqzFCZce-SwhY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NSBTYWx0ZWRfX/DFpsZoobE06
 Mi60UHL4RAWYXJGAUjpJcyBR9htxcpSKfrmuXifXBUB63XnazZ1ZeYgm6UGwu4zxN/DZCoPOhas
 zcznzIBLdTNSzxZHaZvhJWF9BtZTB5c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NSBTYWx0ZWRfX+tfoIZKLN84V
 Dd4n2doajRlnxW9BRZhxIqJXGdFWz2Km9bsqcPysbDyoOEck2X6Ye1E1z48RDyDP76WjxqidAXQ
 eyrgRoBrJBNOL6okdDbwsTYjC3C+x9cyWRy2XFebrmbiZaWaqP+kZ++QrZXnFlW31itkE1zVK7E
 7suawjVxJL3QGLLW52h35QKE8MQQbgMej+ph4zcUvqdIQGF6RVK/jDAgLoMoPx8Zg0kM63iwZPH
 mXR1IexX9XCfb56epdseyBB3fPXWh9hiodwYzURvTobuQO51YTyFZ+QKuKC5tbKGL1yzFjiSFqa
 UH4/YTQlhtDTZlqRuG3WR/I9DR3PRGaVzKhcHzlkAoRtNihD/YrDBJJemBW69zNkt7nUMW3L3En
 oCdH8XK+WrNiMMIDmVZxYbKmamrp7quWvjvywOvmGM6NeU+JvVhAPqQHgI8Ta88zNW8ql3n0jSk
 /YNsrYpgNNa+HPGYXbQ==
X-Authority-Analysis: v=2.4 cv=Z4N5j3RA c=1 sm=1 tr=0 ts=6afaea71 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=4OHBDxuNJHQT2aTpCosA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: XlQ24ie62V2r5DdljSzdqzFCZce-SwhY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160045

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Enable HDMI output on Glymur CoB/SiP, Mahua and Kalambo CRDs through
their shared glymur-crd.dtsi.

Describe the PS195 on i2c13 (qup1_se5, GPIO52=SDA GPIO53=SCL). The
PS195 GPIO11 is pulled high on this board, selecting I2C slave address
0x48. Add the three HDMI power supplies with their regulator-enable
GPIOs and pinctrl states.

Connect the four-lane DP2 path through the USB2 QMP combo PHY to the
PS195 DisplayPort input, and wire the PS195 HDMI output to the HDMI
connector. Add the GPIO126 HPD pinctrl state to glymur.dtsi.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 147 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi     |   6 ++
 2 files changed, 153 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 2ec62423ad79..d875ed69460e 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -63,6 +63,17 @@ switch-lid {
 		};
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&hdmi_bridge_out>;
+			};
+		};
+	};
+
 	pmic-glink {
 		compatible = "qcom,glymur-pmic-glink",
 			     "qcom,pmic-glink";
@@ -142,6 +153,53 @@ vreg_edp_3p3: regulator-edp-3p3 {
 		regulator-boot-on;
 	};
 
+	vreg_hdmi_0p95: regulator-hdmi-0p95 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_HDMI_0P95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+
+		gpio = <&tlmm 55 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <1000>;
+
+		pinctrl-0 = <&hdmi_0p95_reg_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_hdmi_1p2: regulator-hdmi-1p2 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_HDMI_1P2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+
+		vin-supply = <&vreg_l18b0>;
+
+		gpio = <&tlmm 54 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <2000>;
+
+		pinctrl-0 = <&hdmi_1p2_reg_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_hdmi_3p3: regulator-hdmi-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_HDMI_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 170 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <2000>;
+
+		pinctrl-0 = <&hdmi_3p3_reg_en>;
+		pinctrl-names = "default";
+	};
+
 	vreg_misc_3p3: regulator-misc-3p3 {
 		compatible = "regulator-fixed";
 
@@ -519,6 +577,40 @@ touchscreen@38 {
 	};
 };
 
+&i2c13 {
+	status = "okay";
+
+	hdmi-bridge@48 {
+		compatible = "parade,ps195";
+		reg = <0x48>;
+
+		vdd09-supply = <&vreg_hdmi_0p95>;
+		vdd12-supply = <&vreg_hdmi_1p2>;
+		vdd33-supply = <&vreg_hdmi_3p3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hdmi_bridge_in: endpoint {
+					remote-endpoint = <&usb_2_qmpphy_out_dp>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				hdmi_bridge_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";
@@ -545,6 +637,17 @@ &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
+&mdss_dp2 {
+	pinctrl-0 = <&usb2_dp_hot_plug_detect>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss_dp2_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
@@ -826,6 +929,27 @@ ec_int_n_default: ec-int-n-state {
 		bias-disable;
 	};
 
+	hdmi_0p95_reg_en: hdmi-0p95-reg-en-state {
+		pins = "gpio55";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	hdmi_1p2_reg_en: hdmi-1p2-reg-en-state {
+		pins = "gpio54";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	hdmi_3p3_reg_en: hdmi-3p3-reg-en-state {
+		pins = "gpio170";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	kybd_default: kybd-default-state {
 		pins = "gpio67";
 		function = "gpio";
@@ -1035,6 +1159,29 @@ &usb_1_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in1>;
 };
 
+&usb_2_qmpphy {
+	/delete-property/ mode-switch;
+	/delete-property/ orientation-switch;
+
+	status = "okay";
+
+	ports {
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/delete-node/ endpoint;
+
+			usb_2_qmpphy_out_dp: endpoint@0 {
+				reg = <0>;
+
+				data-lanes = <3 2 1 0>;
+				remote-endpoint = <&hdmi_bridge_in>;
+			};
+		};
+	};
+};
+
 &usb_hs {
 	dr_mode = "host";
 
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a992..2d3f8fe2cf5d 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -6793,6 +6793,12 @@ data-pins {
 					bias-pull-up;
 				};
 			};
+
+			usb2_dp_hot_plug_detect: usb2-dp-hot-plug-detect-state {
+				pins = "gpio126";
+				function = "usb2_dp";
+				bias-disable;
+			};
 		};
 
 		ctcu@10001000 {

-- 
2.34.1

