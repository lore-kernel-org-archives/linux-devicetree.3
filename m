Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595883;
	b=w+yvNyqRGlDrMdHPFHU00msHIoHOeOpx1WD7X90m/D8f+J6KFNQ73NV8c9NgWbz+Tm3T
	 S6tjcTj/MIYlxOy51GGXvl8SgdEsVHiC3Bdu8UjFjjkt4PkJxEXKGHJpnZ9PuSS2nWFSH
	 Upb3stFJO74XVmz556wTTL9QbnQZKJoGP+SbO3QlB5Sv5ZqNNCaWGO9Vp048pe7l1lDvz
	 hAGuiDaAyZKpDfyrZrsF5eqTkODKhc42/sOeoPqk/ybJ/j5BXt75ZaLHqAt9X7z0/U7GX
	 YY4rZ13Nwpi1YYWKYmXg/w87/C42F2s9csaU1L3zQn9HSFvR3rgzh7k1RGOvfVCy72Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595883;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iN0RbpfLopjjwmy4y53t40HHiRST5oNV3u0vMBP1TbM=;
	b=jF0nbPB0iknAfy0Rv80bAJkm8rSCoJiIZqqAbKd712hF5zGuZ1Fp/wnQmyel0UwBt7vl
	 +uPqcFMYuE6DQ2JX7XLflYvlHWClE7+m814J9IxaO1Q/iE2RC/P5QziIXLR9rjyyYU2en
	 +P9QnpZTTOMrWc96eROXMuZ0rvBzv4mw+qmCy60S7w7XT6vCU2uk3EP4Mf5Ir48QeAZK0
	 xGhwdOq+SpEeAwIY4UIsC4sRiTDP1hXnP/yMD1NP9QTdtqH/7SWSGrW58ffeqQyYeNNuA
	 Cfu5taLVFKKkJnZb2u1oHWbYlwUsuF3WD6AV1IE41GqKc/1lXz+LX9YFWGsmk9jRgoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="O/M3bgE4";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=brMqUv7P;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F4D60A2610
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97F4D60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O/M3bgE4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=brMqUv7P
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFImm3993065
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iN0RbpfLopjjwmy4y53t40HHiRST5oNV3u0vMBP1TbM=; b=O/M3bgE47wpEgGvI
	b0k8gpmn4QLzEYy6YxCiUpGQz1ISMbSDy4sDGC9LWywIOHbvqSXqjw7N0XiobhTg
	P8zT1eb40VB6q0EJdjoVbRhQA0LC6WSlBzoNVb0b2pQienaNB+p9lNl++7I/i+9P
	62b5/vrS6SBGJybeyZ1P0+LGqxfzOrGsorpIP9lfZs0S1+z8+PIOcasEJVY6OT22
	F0WhUcMQEble0QQKA7u5pmvmVhn2vDzS/1Seg2C/+1gLe9DXGFV96a4NlKVQNxPr
	YxIqhddav16qZhXleYBjClaQ8S8zz+Ezgm4IZhBVKlUjCXzVClEa4j/g4l3HwlS5
	OJD/RQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q8j4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:18:01 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3580c07911eso2332716eec.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792595880; x=1793200680; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iN0RbpfLopjjwmy4y53t40HHiRST5oNV3u0vMBP1TbM=;
        b=brMqUv7PgDPxPXJBjZer8Z+7zOD+Q33drUh4c/9aWFTpGhb1DuGlQsois1ShIksJ5X
         ZIrPsI/Fo4Ng4YMAeLS6Icvro0S/iDs595ZDA9tOGkAbb7Y+24uo/xZT0WdP8RgLClFL
         KVeWgKHos1t1i4GQco3m40v/6tDBqW9fXyIU/lQevc3J2x4dhkPgA5RV5sxkjVUEebaD
         z3V1QNfFFumLwokP+rQwZBki0nzXqnjNLioO6ieAAr/zdfKQabnq0HurAJoIS/EiYqOc
         z0ylAy9h/VFkAttHZRkeInjURWpdVHyMGZsZwSuDHwt6poV5Ht0PwNgod1HqT4g3h8Y4
         8GpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595880; x=1793200680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iN0RbpfLopjjwmy4y53t40HHiRST5oNV3u0vMBP1TbM=;
        b=o77kW0Lw0sL+gWm69fxn4oKAx8FmEgtuN0qbOml4b4gdacPCDSMrhRF2NWDEq8kLSU
         /bxwvo9L4cwoNhGrLRnrXL+TJTzFnLxY7ZHsUddHgVDBmoMBli41jk8GmzJf1imHK+S8
         1AO1QqKL3KM4ZeSZZRYULLLhDuDAowGn4tR6dClov4Y4j1DKp2gKhgFTPkOnG29MtnI4
         u+zY4PdH2cnXG1tPFWrFkHUQUVHjGVVhMW/8qLniRsStC+I9V9qkXSwC1G44r3mmbTNk
         dXni1q+AD+bMiraYywClNvoaKMViNjOBJzlvCoLBJnBDHTZjZpK6tSiYHY77wtL+InGW
         BCVw==
X-Forwarded-Encrypted: i=1; AKwUvBxMmX+54T1UcrNGKfgBWfevx4MGOjoD2osACF0HfmjHbxGnyhL+a1J7UcsT7kRucWotadAu0DjgIR2K@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5vx3t6rlurVAVGXMLjj9F7wbmIQa22QM05UzmPvdyPTW7/s7Z
	diAY25k4HNvhS+ZjtbwUMWL6QFV7OKAQnC8WcNVwPnMA5WUcj1kGL8G6yioNxFox2agJ0I0c61q
	6ax/V74QOKLDvx3r6rgeErv8zqEA4Nx6Nfme7ybT5ao6ePCptF0yyeLwYv4Y9BZRw
X-Gm-Gg: AYBFou3FT4/u2c3gedsLtDdQTft9+5lklR92yySEVhKJcv9YZezWr+s8CG4gBvnk/jy
	al2HwzU1/HxB8V+ZcFDfnXM8js+7pB0yZ6x6ZHjPgvnYovXP6WAcnSx+DEU2BNIdVPxnIHOyhNP
	lj73xpkYvuKpojjBRfb089bJmwk+fQyzNnpU0elZc6ZabiZkYGV4x/U0xPwRLMhA4bmH9NGYy4I
	TfkfhCoLFDjMs6v1bS9CDkBvr0QsYw4YuGrC7hWdHgMrLEij4loXUyczXKw3YqXZTaZhFUWwva8
	j4nJfxgFe2eeivebcGpI7R/FwPpxT3Hftx/1RXoTbQO+CyIthmYw0SoeHGpUtGZHXo1Tq6NDD/L
	3FIXta6k3GPJoJfhEK3Wo0zo6GMUBO/HY
X-Received: by 2002:a05:7300:2552:b0:35f:6d9d:af68 with SMTP id 5a478bee46e88-3674f215a14mr3926431eec.23.1792595879186;
        Wed, 21 Oct 2026 08:17:59 -0700 (PDT)
X-Received: by 2002:a05:7300:2552:b0:35f:6d9d:af68 with SMTP id 5a478bee46e88-3674f215a14mr3926392eec.23.1792595878378;
        Wed, 21 Oct 2026 08:17:58 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm9142117eec.12.2026.10.21.08.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:17:58 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Date: Wed, 21 Oct 2026 20:47:28 +0530
Subject: [PATCH 4/6] arm64: dts: qcom: talos-lyra-evk: Add Waveshare 8-inch
 DSI panel overlay
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
Message-Id: <20261021-lyra-display-upstream-post-v1-4-585caa39cd7c@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
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
        venkata.valluru@oss.qualcomm.com,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792595849; l=3546;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=Uyeo1BIG7EK9froOsnvpJ61uq9tkb4cEvrpBTfRl3vg=;
 b=ltnv/UqKW7UUOPAU4GsTjxkHxne/i9paXx5gRdSfiIe92c3PzYA3HytEtQwgiY/dUBC8it1SN
 I+mzUGh+3+tCDraiCHf1epXL2mLfZOMmi4kbMHFL2cXGgWEdf9b67qy
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfXwQe2cRO7EiRt
 P+SfGDt2QjaIGjny3My3V9Sv03zzaGkpgQ3kSyF//098vqqhzSipAWR9KhIFwf3fie5C4/gZMoJ
 sVuCBjqfiaqh82+GWbgiKzV2RR4g6YU=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad8d7a9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=CsxVdn2IL-oTZ3OAgFMA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: QXFl01NecUFqhPoPMZY4z_Qcux-iqoq2
X-Proofpoint-ORIG-GUID: QXFl01NecUFqhPoPMZY4z_Qcux-iqoq2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX9CVfOGT7+aU4
 Cxeol5/wyHeXiigtvTDc+vY6BjVroMluDHKPT/Mev72qpZfhznJkMuGcz99x8csQzUqNdpqqIIV
 h9IIWa6GQ/5gCt3j8eft4B/7jRNsQ9dXo6WjJyjQuizx1VnkHjVs7aYUqe0Wru41ILqFf1qIYQW
 cVPr3Q6Zh0roe7a27ZsJyJXZ/xHnfBtmxg6otAGz7MprbkUQDhUba+rKEMhp+LXdW9l7JHM5Ryo
 MvCKf991BDNfTGwHh8s3nYJKsXFsa/oMWY/Fk8BEcvDlLzYnVUMmuuXOJC2SWg5nBSME1IbFnMj
 BO1R5DU8xjkjEqxLhl2uae2eiQQY+HDZVQKBpWUsbZTrxVdUbAoGjItXaPeXdwJBoM7oS4ApahL
 NI+utR/pfNKDkMir95abaJwj/mnG3+4jljl8W7ElKaXFrqXod1CnzypjfH11W2G0BBxOx3AI+pg
 OlivDPowQUWfSMP34CA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210060

From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

Add a DT overlay to enable Waveshare 8-inch DSI panel connected to
DSI 22pin on the carrier card.

DSI0 from SOC is routed through MUX which can be selected by DIP
switch S1016.5 ON, for enabling this 22pin connector.

Add the JD9365DA-H3 panel, GPIO expander at I2C2 address 0x45 for
panel power, reset and backlight, and the Goodix GT9271 touch
controller.

Disable the default HDMI bridge and connector in favour of the
Waveshare DSI panel.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso   | 75 ++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index a2a2ffbbce3a..614152913cbb 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -485,6 +485,11 @@ talos-lyra-evk-raspberrypi-dsi-7inch-dtbs := \
         talos-lyra-evk.dtb talos-lyra-evk-raspberrypi-dsi-7inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-raspberrypi-dsi-7inch.dtb
 dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-raspberrypi-dsi-7inch.dtbo
+
+talos-lyra-evk-waveshare-dsi-8inch-dtbs := \
+        talos-lyra-evk.dtb talos-lyra-evk-waveshare-dsi-8inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-waveshare-dsi-8inch.dtb
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-waveshare-dsi-8inch.dtbo
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso b/arch/arm64/boot/dts/qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso
new file mode 100644
index 000000000000..e9a8fdf0c179
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	panel_avdd: regulator-panel-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-avdd";
+		gpios = <&wsgpio 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	panel_iovcc: regulator-panel-iovcc {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-iovcc";
+		gpios = <&wsgpio 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
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
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wsgpio: gpio@45 {
+		compatible = "waveshare,dsi-touch-gpio";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	touchscreen@5d {
+		compatible = "goodix,gt9271";
+		reg = <0x5d>;
+		reset-gpios = <&wsgpio 9 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "waveshare,8.0-dsi-touch-a", "jadard,jd9365da-h3";
+		reg = <0>;
+
+		reset-gpios = <&wsgpio 1 GPIO_ACTIVE_LOW>;
+		vccio-supply = <&panel_iovcc>;
+		vdd-supply = <&panel_avdd>;
+		backlight = <&wsgpio>;
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
+};

-- 
2.55.0

