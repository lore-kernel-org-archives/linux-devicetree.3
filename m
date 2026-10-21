Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592531;
	b=QoXBhXoIGf8oARpbRmJ+4ciR7Yq0I+W0iP2VLYNOqJnJyCPY4/WilSdP4IITzjDg1CFR
	 ynmJCFB3ZQMEhPbQzkfEw2RdnGzzESIUIHm5g1p2NxbgQxQEFgQLXJE4XgAHQbYboVfyI
	 fOOey4Ter41IZuS9TYLzKdGqltcduF1G7RFX0qyHjBcdySdYVtuX3/K684iJMXjKcnQ/+
	 hQ9ygGRhvNvsaXX121I4Ov6cbVLYuVqNoAVeaDREwERif/zt8MD6mIzoxrs2T7V4UWOTw
	 tPvCDet55O5PxkQADJVonGrlKi8f4hznxEdWulKeFUIlaKyMA94XiMFkf7Mry6m4Gcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592531;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7CSk10V/GbrMlagTMhQtfoa6CLwoZTMUc27+IP4BEsU=;
	b=pl0ld74HSIKvllelKYdBGBSsXyhOxJpot3DoW02IdMhQPUWyszzXqb9R0N+7U9owhj8d
	 yx/ARfTXqlwcmUa9uwFuPKRLLTE/meQxw7JVGhNVwzC9XKvZqDb+AtxE+aiy7EkddTIyo
	 s3eANojtw9MLJ3u9UBeAww55A968TGnBKm7QXBa+CVYqhcZ/Pd7cTsgExCePC/KHWw9y5
	 mKAbTeBsK/bHY5I2BU1EYat51Jbf1SugBy+eyhejR6pHikdhtq96OrKvfnrkRG7rdNPPK
	 km+mdfRt02/CNVGg2KAmdkrxi7dL32bgo2a/nfcAOhY6d5npMY1Dnt8z7lEfCSk+Z0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PzZVXZtl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="V//zCz1P";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DE1606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16DE1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PzZVXZtl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V//zCz1P
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFA3R657869
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7CSk10V/GbrMlagTMhQtfoa6CLwoZTMUc27+IP4BEsU=; b=PzZVXZtl04DVgplZ
	kUqg5vamYY66wvnO9Br3zhrGL8JBMeOq1xXkW5fapBtOdLlmN2jS0RYLJRMcLFAc
	gihwnwVsWAX8mRlr/GkmxMvfzgBcvZYK9Gxggt3a/oOIci0gDcx6nyHHXJZAVqGV
	lMy56M5f6cpza4eYLl2rsD7oqBzEe8tk+KyRmw02iqbv+4DdKhoCPLyIc4jPbNjg
	eJMtZAoh9v48OdA8X7abIrvAiZz7+Gz9YLfBsjLRAJlYSC4W18G7apHC4TG2nRaI
	x5DO9pYU7GLRBNbvv4MprNE7+VaN5P+RyLHwJIzGdQuUNGbSggkilIT1Mee75M3l
	9JE4GA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v4ce3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:22:09 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35dca90dea9so58924eec.3
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592528; x=1793197328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CSk10V/GbrMlagTMhQtfoa6CLwoZTMUc27+IP4BEsU=;
        b=V//zCz1PwVMo67ZDCPJFRiO8pN1/1edMhCrGseoPs+ZCA9Jrhk3+wx9bVKGi76Mekd
         9SSxgnhM0twtpPyfEoNkcU6y7icWpaqMdE9+ETVNlXQYGmpfsRACAUez8ligX5lUDtZB
         L/UoQmFOR3nq+LcfGjW7FHl0b2bno0uYIS5z3gVDus5UTq9nBRVdCmjaKrRqnDWPZE8a
         sne4qyYzUhzdnbUoTmosOwgr9zaRH/WK1Ons1IPRIal9LBhe2e19Vm2ilkXtCeppBqBK
         Ii5bU/6GLmi5NMgWT+vgPb7S5IOXfMJNeLxVwFbhRYkSv5SFGEy+pnjujT7/j9XI/Ica
         dYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592528; x=1793197328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CSk10V/GbrMlagTMhQtfoa6CLwoZTMUc27+IP4BEsU=;
        b=G/VEoq2Y2gJMeNr4V/Ppp7WFJff+NzRdURTAwPjAQqyfQdwgKFUkD2mgTa8Eubx/pd
         NbP7rNkGq25yqP3hflHDMJzZ9Um3fmxg/PA0R5V3wWuFFzbLpaQ0nbeFRfC/29fEAL6F
         HzUOOxjbCsPmrpYHiCHox5BkJfMusdyLsiJYM0pYQNEdxw8IhNOpIjhGy6LcznrSuv5m
         9TPIHuuM7mN1QowAkqxei4Y7q+e9fCuqBo7WJB/hzoKtz9H+KYxsAf37vIse1bavbH+w
         MdbSXlxRq6xyrbURJmryeNoMpcTf7C7UxUk+ujbZpOhUq4gG/8iMWJ1ilHLdagPqyF5M
         qpTg==
X-Forwarded-Encrypted: i=1; AKwUvByyW/dLmFWNuq66Zh0slvvCMpN2tFsft8NdFe5KttOgl9uZP09awDlFeLglG3ivyvqjXQperejfbxPB@vger.kernel.org
X-Gm-Message-State: AFq9FYKLkzcfpTbjsgBDcGDAO7wOiR9drFnVjaQN5ljhl8/Aj/ZJflH7
	9v4VYLdDimiB5foFpa/ozVYhL5Mbe4Uy6bvUG4xrDtoqTjhh5drp4DVHfZ5IhzWeP9uBXm38GHb
	Ix5bFbuiZ4rgwXYAPfKJgOXGYqEwa/DEmAw8unfqb0VUdc1HjlQD8bD+ZDR+TWsKy
X-Gm-Gg: AYBFou3IezvNboyQ6vfjE7/NGJkWGDWcHQ94UcpY4YygSn7dewyaC0iFV3h7valKXSg
	y5k+DQNNzXopNj8dIwyipnM7c9nTAoGWp3ASvynflp1Apj3iN6BcF57zzweaVOEzZMoL+jh/pfe
	RwjA5q8w2dh7GoQRJxqhhKI746tEaDCGoziDzVLb/eBH7w3/NqqPycqvLIhP5vizs+DHeG7zC/T
	8NXanl839UYTnie0zuWApm30iUZEd8wkcxOykwo6cEpHUjVBGh8S05+Id5eZSFq4ue3TG97Rnfn
	TrJ/T78Xas3dWupJxeVI46v8lAJDOI5O1aHU+K77v/J4zlgJGOv4hY4T5ayLYG06PC05oEFKBlS
	bi7k4pjKwHi8bPDC5FNFj06I9AlCM3TdQBLwi8WNWbnfULCCV6zXsE3djxQh+oGK2EEpk11qmzT
	k3HBmsNpA2vUR0dlTMG2GFUAAOHdwnVImQvv1203eY8kYd+LZByKM=
X-Received: by 2002:a05:7301:1a18:b0:351:7883:bf47 with SMTP id 5a478bee46e88-367473c9a92mr4748633eec.0.1792592528042;
        Wed, 21 Oct 2026 07:22:08 -0700 (PDT)
X-Received: by 2002:a05:7301:1a18:b0:351:7883:bf47 with SMTP id 5a478bee46e88-367473c9a92mr4748548eec.0.1792592526795;
        Wed, 21 Oct 2026 07:22:06 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm8074818eec.10.2026.10.21.07.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:22:06 -0700 (PDT)
From: vishnu.saini@oss.qualcomm.com
Date: Wed, 21 Oct 2026 19:51:44 +0530
Subject: [PATCH 1/7] arm64: dts: qcom: shikra-cqm-evk, shikra-cqs-evk: Add
 HDMI overlay
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
Message-Id: <20261021-shikra_display_overlays-v1-1-adaea735999f@oss.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
In-Reply-To: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
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
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792592515; l=3537;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=/cz9M5Mfy75zJF1P+GNbj7Mi9SYwOuHONvPOWhiMRBE=;
 b=kwifF9WcjORAuMnoI9aoon6ipo8Iz1mgElJsn6gltsHFBKq1IQQpnKarDVFKjV7aqjIPiK01m
 T3LfXaU9EAeD/HbXA3oBnHSJGOae+cZ6wnqpUWFpsVgYmLR7l3qKguj
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX3RBKJ8RObPqV
 IV36qG1VOa1XuvGIoD7p1EnSXAF7OHZtZpUN4KVyk+DvG5yJIrcRu8DAKWO4L/vTbfrayMK4Gbr
 /QUqZ4owkZPRj5RBvMGlVL9vMtvZcos=
X-Proofpoint-ORIG-GUID: PdXVxSekucQpTFuJM6Q3iDp6MSQhY3eQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX5/tJaurfOh3g
 1oRRyyFswcSHhwAwG1KiQesvyg0wXs/Ry8Bx5We++klZjyTw1d9FR3f8C7cwi7ElkHbGayP+rVu
 Iqe3QFXPNBdiGONES1lxh8lzo9Eop2G4e5Qgv4Z81wAK22uWmv2EdLW7AzB12AyeU/YAWtwp3oz
 NRPNHr4oOsSFr+QAokjt61GEUOnNfXq8xuuTda7XsMPYvVYLXjyS5OU/dAtAUlgcg+CTe5KnFdK
 ymFBynbrPmfln53YOan2V/lQzSuK4WK5qoTtyKcTtkErjjckEp70JDO+orqwQ9Ng7Aj3Z6EHvcm
 JrxGLV8QjOLlFgpGCaN3ULx+EWRalO/HIaVycnpFivOsF0lBI+YNMIPYpXLzgcPBYIvs7bDO7MR
 tzA54dR7AWPTpDMiGxtEzhOsuR9s8NWmLGdLhYLM71qvV+Ey35G3wY4DhMyHa+f8QCPvmeYpLMq
 0jWmKRqIUhmhvj3peKQ==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad8ca91 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=U5hq_iVO10ORy946Z-kA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: PdXVxSekucQpTFuJM6Q3iDp6MSQhY3eQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057

From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>

Add a DT overlay for CQM and CQS, to enable HDMI output when LT9611UXD
DSI-to-HDMI daughter card connected to PDISP1 DSI0 on carrier card.
LT9611UXD is connected through I2C4, with reset and interrupt connected
to tlmm GPIO76 and GPIO85.

Disable the default DSI0 panel dt nodes and enable LT9611UXD
bridge for HDMI output.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  6 ++
 .../boot/dts/qcom/shikra-cqm-cqs-evk-hdmi.dtso     | 90 ++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4e714251d5e6..c8907e77c893 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -377,6 +377,12 @@ shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-ca
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
+
+shikra-cqm-evk-hdmi-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
+shikra-cqs-evk-hdmi-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-hdmi.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-hdmi.dtso b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-hdmi.dtso
new file mode 100644
index 000000000000..a7b77114061a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-hdmi.dtso
@@ -0,0 +1,90 @@
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
+	model = "Qualcomm Technologies, Inc. Shikra CQM/S EVK HDMI";
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_out: endpoint {
+				remote-endpoint = <&hdmi_bridge_out>;
+			};
+		};
+	};
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	hdmi-bridge@41 {
+		compatible = "lontium,lt9611uxd";
+		reg = <0x41>;
+		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 76 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&lcd_bias>;
+		vdd-supply = <&pm4125_l15>;
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
+};
+
+&mdss_dsi0 {
+	panel@0 {
+		status = "disabled";
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&hdmi_bridge_in>;
+};
+
+&tlmm {
+	bridge_rst_pin: bridge-rst-state {
+		pins = "gpio76";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	bridge_irq_pin: bridge-irq-state {
+		pins = "gpio85";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};

-- 
2.34.1

