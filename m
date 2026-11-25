Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611298;
	b=c6hsOD1ooY8UkNnUjb1OIJtMMuxzSxTeMfuuR7sQufpPOAJc5IzKPi5gYJiWbGrSjb1f
	 bdf59W+Li3nSbtudQ0BkGNkWfTpAvMtq6NDwePKzyXlOZdg4OWqtW0ueyYlI0IndroxYY
	 yypeVMuFG3J5CSdRrgGMVdL2UxCph8Er4LPn4V+qyvaFuzyBzcu3WIgjnDP5/K3Zu2gzt
	 XUChsbqUrTAOIApbfVTl5PLOT6rfxB6XEWrEkGguIYLaxiyFcJUdjx2ewe5J0KvtUqIsI
	 NB4PmroLoyxxRcv3UTCI4aqKzxc8HMOEtWy9PMRb3YuQaBDOBf5inMWDXajfr6Ibljg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611298;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OIT3LY/NnA77L/6DRiyEURyM+xFwCg00LGKNqW3Vx/k=;
	b=e7Q31j6t5mpRgcckppltoOuqZ+i9nUFLjDIvtfzVgTAVLKG09Qif1h3TBto6HwB43g7G
	 8OnIpK5I0jDZdElkrlIsxq2KqwHs6INqxtbNKSnPq7AA42vSTNkli6aGZB31AfpXa08jN
	 u4jc55c9xTXUcauEnqPVZSeC64FVWH9zuhtpUGt4kfzItmtwEM1j2ijQ0C+Bxksln5CMH
	 aTOd3UuRIjjZrYxRcoDmKAXTbhO/SvADiNGX5C5h355ToiD1VlL20e/Bt12IrCPr9JlVu
	 PlF6jKcpsj1TmOhXBFxFxoB5D186EOAiKpB821oqXQGKdOP4gQuhru0BLAO5sLPDXVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jHEwGN+i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ijf6gUMK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55026606A696
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55026606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jHEwGN+i;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ijf6gUMK
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mTD64034153
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OIT3LY/NnA77L/6DRiyEURyM+xFwCg00LGKNqW3Vx/k=; b=jHEwGN+imaVLuIM7
	RTyc7knKXnMGosalgXSIcs6sABQ6f+v8JqLqjxsWe2VaPujdmV6F2IQuTPfDvQma
	zhALd1ZCDuRCUJ4bTxbDBini0EDYPTSt47UuLYAzMubFBpd/89Jayy7X7E0Og+xz
	DQnqIRplI2jhfReki0E9fSn9UkBFze20gv2phZLfwFgX33bedtbHkrtn1M//GBI4
	FnB9sAnb0oTWo75mZry6+qgB743qbDMrZNUqVrzDsnkCr7o/WJ7fOC3O6eNrEb3R
	EfO8ZfxgLES89sIw1UGMgJdR8b94BGYtx6CxbaufhJGHb4oInTQY1oFTttnkhw6e
	OzVlrQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbjug7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:54:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f0d0fe0851so2148505ad.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795611295; x=1796216095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OIT3LY/NnA77L/6DRiyEURyM+xFwCg00LGKNqW3Vx/k=;
        b=ijf6gUMKWDUZxQt79XUV2U2Nshn18jJvu09lm1hnBUFBAzT/c0O0FBYQ+h81TlUq8A
         3jCx9IMjykmg/ju7P9+isDPc/FAFz6DGj9T9WcOguhNd2jMEiYuEgMJmAvDA22Lfe8eE
         azt8UJkBsq8X7isDcssh9/EzAD0+bzOy7dV1Q9MOqk6+L2z4GUmRkc5qChHMrsLWfieo
         caolKpufIIK1LHKslywjBOH8jOHop66lwB2+Rn5hSwTuVZJ1jpjqPioiCP+AeNLyB/P0
         Be6Zlnx3IgbbCLZwCKg+jZJ7KxBJJqxHeFv0HrnhV57n1QJLcYHA352gdTb6VI3+T7Ng
         Vxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611295; x=1796216095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OIT3LY/NnA77L/6DRiyEURyM+xFwCg00LGKNqW3Vx/k=;
        b=MieZ3McHdOO+LBD55OTY6LA8rhyBxjp1aaUIkJBMvZVfO8aoPWGGk73yhh4HBnFtJV
         rVEcMpEP7ERFOSHaf/9iUAKu6YWGtjNZfzLnyy5nhXhX5n6Zyw4gCZj5cnjJTCQ8sFy/
         GBGXE6jVb4y8NWdqt8qE/RrK34/CbJf08X4zKYJML5MMXHDrC1vG2t9e4kU3Jradb0Gm
         iZHpia1djkLJv+pICvL5SRsJ+NKuOPeho98NlAE24WpntC3KO/2MkJu5ZsEic1bxahcT
         kcR/AlgyITL4cdIG4eYqh2VJWyFFGayj+/nGDA9fLtC9ehJrea77jQ8/pKtvniH8NdSC
         8muA==
X-Forwarded-Encrypted: i=1; AL+hErEjLviQRN7aM6PwWDgbX4zbahC+AXUB/IDCgQW50T6wY3HufevuW7/8kRmwXsCI0VZWKcwZ4He+srLH@vger.kernel.org
X-Gm-Message-State: APuU4Z+/z+gPgvb6I+IfevvZ38pZPQrn4lAb2C6i0Uo5LjmMsyCxxa7x
	5/XLL4BDaC3CotiLzcgum71lp2XIws2wT1Iohsp3WKwjjzEow1quKafvzy7ZI61/iQqEK9MphWc
	v4e+mvG/GwscrT8VJ8XhE0C4K6tDu2EtuqhAh2K83JvWwXreFZ3n/Wnz3cEmF+hUL
X-Gm-Gg: AZFdTZcq5T+LIbxD2rC0xFMT6ifISBmvkntnCZmAVI3hWaMC5tgVWgIKdhgOYB9G+v+
	HBgk1oCNo9RLx3JWHZb9uwXUDhMl3iy/XPxHuMCMezs4XAmdWfDvj+AcVgNzipgRvXyseAQxK7S
	gI/P27Q5D53ez67OX+NB8BwmwygIzWDwYnl5kew7VGlOUrK2Gi6lOpluc9Il7ezp8JzvyfH4kzn
	dcIs5XBg1mHbL722j7JEfW3VhHWBK+Ls4rqjdv5hqT3FG49TgZF77Cr93ZctwqsACGboNPjRgMZ
	NXF/1iirHkmJDGdA6R2M4odMQT61gmQL6/iGwyvuu9PgMKRyQzqsI76zQyOTodCetMFxc9ojadx
	++Z7m6Rzxx3znuUbUe0paO2xzmx0jxzF2Pn69FK3EMGUnrq1DXgN3bRnrFdH1H3cg6SZWPS+wwE
	X8dDjfAUTyC0AiWAuT8CE1m1Z/+GA61Df+V7KUwnaV85ynHgu+6ZdW3taYeGlg16PgC4I+d7U5s
	rKxXRaaZq5MSP8jt93cQHJl6S/r
X-Received: by 2002:a17:903:b4f:b0:2dd:b95a:e1db with SMTP id d9443c01a7336-2f03f1c9cd7mr295131035ad.3.1795611294970;
        Wed, 25 Nov 2026 04:54:54 -0800 (PST)
X-Received: by 2002:a17:903:b4f:b0:2dd:b95a:e1db with SMTP id d9443c01a7336-2f03f1c9cd7mr295130595ad.3.1795611294448;
        Wed, 25 Nov 2026 04:54:54 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b58fce71sm31940575ad.45.2026.11.25.04.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:54:54 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 18:24:27 +0530
Subject: [PATCH 3/5] arm64: dts: qcom: monaco-draco-evk: Add Raspberry Pi
 7" DSI panel overlay
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
Message-Id: <20261125-monaco_display_intf-v1-3-8a27d60b0d94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795611273; l=4084;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=NS+G7kuPoI5kpwYy8h9e04dPJOgLcttGfinqWG0uVlQ=;
 b=hvKx2XYbFNQClyDVj0S1dgMpa5wdjrHTv43YL+DMilg+Rt+JGeMS/0BCPkfwMNv6MSEG3N4EW
 hxRJ+hKYqCrBnGjnr3keTyCJQvU3rvFo78zsEIYIalOB5SeyUIJ/I1P
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfX2902WLlo4fBJ
 mnqTRMBmROYMSvPWJgk9M+UrQyf7m5doBOXk840gjFT+01LXR4TQslfq3zhyH7TGvXZ9bpVEENN
 X9FcARnZGWwPJfoMasyISbzVNHaIV2g=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06da9f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=fr-BqTdB3QoRZjYE0SAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfXzI0eyzBtqZVF
 5OZSDYR7n0YKfeDmlDjKRoZ9Frl/weNAwMbeBafFGS1nOvzwCrMDtUagplzspRTe577xziJ6UdK
 50UzUQrsdw8rHvnab3kpdG4K0WnEyHXwN24wFrRCz6LJcSxCV1j22VPoqXN+s7bsUhe3oB6qcVT
 OytcF+EKbViTFFN1vpjSY0jEYg+zeP8cB0ej3aoxk4rJcsqdlK2K9ovcF1rAcIH10Hn0Vswgu2M
 FkuX4Ncnc+L3pQxMVttZEH98lE7G6Yxrtoc3btWhZg/rvw/7ZnLtHfwDjZhzyz24fsTf8A5llTF
 TvuiIcevinbIK/bjJYYK16zd5JCgXtr3tGJIGTn6Cphu4JQqjq2SIJs4vh+lKIsUxg0FT/scgee
 b9UoCd/W1NHgtvqKJ1B2T5yvmWe9D6BGnlANAXRWexAuzPRG4CTQamuGxF9g0x9g3t6LpZzcnt3
 fYf2hzClere3dtYIE8w==
X-Proofpoint-ORIG-GUID: GdWuGe2RgtXwsdGv4E7GBqjBLwSbQjeW
X-Proofpoint-GUID: GdWuGe2RgtXwsdGv4E7GBqjBLwSbQjeW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250051

Add a DT overlay to enable the Raspberry Pi 7" DSI panel connected to
DSI0 on the Monaco Draco EVK, with two DSI lanes. The panel is behind
the Raspberry Pi touchscreen regulator on channel 0 of the I2C mux,
which provides the panel reset GPIO and the PWM backlight. Also add the
Goodix GT911 touch controller on the same channel, with its supply
gated by a GPIO of the touchscreen regulator.

DSI0 is shared with the LT9611UXD HDMI bridge on the base board, so
disable the default HDMI bridge and connector in favour of the
Raspberry Pi 7" panel.

DIPSW2.4 needs to be OFF on the board for this configuration.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 +
 .../monaco-draco-evk-raspberrypi-dsi-7inch.dtso    | 97 ++++++++++++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 348ab62ddece..d677d1677f24 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -96,6 +96,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk.dtb
 monaco-draco-evk-dlc0697-dsi-dtbs := monaco-draco-evk.dtb monaco-draco-evk-dlc0697-dsi.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-dlc0697-dsi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-dlc0697-dsi.dtbo
+monaco-draco-evk-raspberrypi-dsi-7inch-dtbs := monaco-draco-evk.dtb monaco-draco-evk-raspberrypi-dsi-7inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-raspberrypi-dsi-7inch.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-raspberrypi-dsi-7inch.dtbo
 
 monaco-draco-evk-el2-dtbs := monaco-draco-evk.dtb monaco-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-draco-evk-raspberrypi-dsi-7inch.dtso b/arch/arm64/boot/dts/qcom/monaco-draco-evk-raspberrypi-dsi-7inch.dtso
new file mode 100644
index 000000000000..bb646714fe28
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-draco-evk-raspberrypi-dsi-7inch.dtso
@@ -0,0 +1,97 @@
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
+	display_bl: backlight {
+		compatible = "pwm-backlight";
+		power-supply = <&reg_dsi_panel>;
+		pwms = <&reg_backlight 0 255 0>;
+	};
+
+	reg_dsi_panel: regulator-dsi-panel {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-dsi-panel";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_dsi_touch: regulator-dsi-touch {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-touch";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&reg_backlight 1 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <50000>;
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
+&i2c_mux {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	i2c@0 {
+		reg = <0>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reg_backlight: regulator@45 {
+			compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+			reg = <0x45>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#pwm-cells = <3>;
+		};
+
+		touchscreen@5d {
+			compatible = "goodix,gt911";
+			reg = <0x5d>;
+			AVDD28-supply = <&reg_dsi_touch>;
+			touchscreen-size-x = <720>;
+			touchscreen-size-y = <1280>;
+		};
+	};
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "raspberrypi,dsi-7inch", "ilitek,ili9881c";
+		reg = <0>;
+
+		backlight = <&display_bl>;
+		power-supply = <&reg_dsi_panel>;
+		reset-gpios = <&reg_backlight 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1>;
+	remote-endpoint = <&panel0_in>;
+};

-- 
2.34.1

