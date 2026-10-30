Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353233;
	b=vdfvqJ4KSgE5GJqF6IHhhN+5PwuMmrlPCeOK+Wc/E/JHRKoLh1fo9sIR5gXUIPejW0/5
	 hTsJ0LFuNQSZZb6KgcocZDnTX3AvfafGSptKYHyrqmcS+oOyklCr8pc/5eC28iTjg5QbQ
	 OCEKdMZhIubHnCX/cnPtbVwzfalB/PUHvrVBtjfLDCN14vrdvfIRcTP060QDyt2HVyeKE
	 ugBUJRFtAyM7iKIoFQbpiYGJ88G1zj87txP/4kZH5tuFdgdJRCw12+ArSL6lSaF22KCWE
	 UnJx/uR163Mh2TqjwlLk2eYxLKZF57q8Kz2J+jWyhoNx4HNVstQU7qhEZslEoU1LnpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353233;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xdYJS0wWdZRR8xHRKu5AEryTd/6nXIFt/V4UCjAEBoU=;
	b=ooLRE1UjJmhL67+82jtuFqApxFOaP+uxGqSlc4jHjI0GJkE94CeiIf2x9HE5YHcCFSEF
	 AF9jOs9wKJgswtI8X++T5vEBaVDimiwUKgZ7Kq5bhiFsrX8CtLMeUZ/cfKJLejWiLWYb7
	 HggpJN8VnoX2Y/WhsCZfbpvKBF/1hOPZqKqnlO+NiPS3ke2vpD+Xu5LRvF3OumBReC1Ec
	 iw5ZZuO2+NxTC9G6EiAx703hK1F2MXv1kBTs8aqBa/vg9r6n6gPsRI8QkrXfbJbAFKFn6
	 33iujBL5eZcYB5WApPvjFIiPkxb0rEJLcv1XlqAokU+OFE8Zkuu/FZpTqpYD/bmopZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TPnwdUPT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PRxBWYQj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB6A606A331
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFB6A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TPnwdUPT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PRxBWYQj
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FQRo3709875
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xdYJS0wWdZRR8xHRKu5AEryTd/6nXIFt/V4UCjAEBoU=; b=TPnwdUPTvrSZyHe4
	9qe2B/zst3/agevRcobSHi9mbKstLgy/smELrXCEhA7l1GfegGfdZXFV17VtLM4X
	h0Lzv39Frgi/TbaeDSjl1Ne0uN8dteoox6BrXLMZR2UA6jRZjDrA4jTmxyjotZhh
	X0/Lv6XC0Y0Fkhp6KJ0pBWQgk7pulxHj6v7iepQbQOMC2bEC3wJUniYDlhQxNABN
	iihdzzdAqRsw4iq96STv4sTuFCIy1lYkFsIdbMxXdLlPERtjYc/ObOfRc2+ACy2U
	9rlXUYsr31Ffz07heODAcm6Gjtai7XxJsutxc6lYl633OgjJgUXjytX0sOgDIJC7
	ag27KQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6rjb88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:40:31 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-15c16792146so381419c88.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 02:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353231; x=1793958031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xdYJS0wWdZRR8xHRKu5AEryTd/6nXIFt/V4UCjAEBoU=;
        b=PRxBWYQjh6E5AGiNZhJBjFpVKdBxb9aCP4i+7gU83q2VGnU07+bW3H5HB1x5AtOYaJ
         Xy+kBO32gMulSzMFJdcWz5IzR46fXXcpusDgAsHsCEgeIPg7ARt/3IJEZsOz/VV8RGWp
         IIRbX/ZJEpKhqm13Fa68Z97if731osBEiOWOp+BUYRaM1I1dtRivl89bu8so3zFTqtri
         +jBDtMyCK9q/w67LvNWOV5IPNS3bjX/Es6LyOCi/rxX5h78EqDfEpepbJwjh3nuDzr4E
         JyMtttVkhvDCco1xDFLgpVN6O0LrCoJztzppnpCtkHcmX0JFeOM2ABJ4BoxQ0g0FRAFH
         165Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353231; x=1793958031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xdYJS0wWdZRR8xHRKu5AEryTd/6nXIFt/V4UCjAEBoU=;
        b=vnRyidnEs84ii6wbSFVeBWOX+3Y4OBDJvpjC5NEVSkF9rGV50CaXZinvByNePyeMEE
         2dNfswd1k4jTl0eR386W9N/h+Lo4UmB1AaYjfhgss99SJ2yt2flSBP/4dBSY3W28NO7t
         x9oAVmU4Tkjbnt4bGCh7B1Mz0KMUjC5XybMA4w3Dy/jAAehg6YwVWonny+Gfjws+xjBD
         M//D6G81qdoifV1tJJyy9NwDaEaJtZBZBbm765xgy8QI93ZkKiO1XHSZ75FLbnYrw3r4
         vjSIE0zlsegdGID6s7gG1jBVT7rnReXdwHASYce9lJXWYjdZ/QKVfAk/R2Wyv5xQWebh
         3abw==
X-Forwarded-Encrypted: i=1; AKwUvBxaEqv32J9vItrWul2roTMFBnpUz0fGvSG6V/q3hQn0YfM9pZLygFtQ1ZuBc+iddrud522+TO3DoVbg@vger.kernel.org
X-Gm-Message-State: AFq9FYKi2C2oSv8EUT36ElYDh2qg09V/xR5WxIF+7LtjQKkad4xxn6/d
	4ecjZDCz23FhFg+x9w8W0X7sNEZxas5ql4Ed3cieG/qOpWQ/2m4fxFUL02pfWBR0coXypNkn8A+
	INhs487ta8SI6DeDdT6l3HvA9HIpxVlT5OJdVZf9y6lyZchClTV9DQG0ePrnpTcC9
X-Gm-Gg: AYBFou3jQ+UjJvn5ZIsamDZdxzxMZGGZyT30FMOrpC/joHkdwYRKn8Mfu47wiAANI6X
	jks/U5molZYvgw6YWGL0Be0q3LT0blZeJFcjL+ekVlfuEGx2D5EieZ4CPKOo5Ntb9dPZCvdkrgA
	Pz7nJwHzlKlD5X85XSIeF2SKBNmlr7CW/asc8wkLoBL0hvqq6aHsdR0fYgvfg/f9rRJV25jDPve
	3xwZT9Yb9CkYaRT+6RpD1xgvXpWOvbrtZMqEHk5Z8Sk2JLCRlyocrs5VjolmcNqGyfqHH92oS+m
	AYgFzLD5ecYaZTSzbpsshSaTgh01lFUcqOT5lMOdT+J/HVTAC4+lW1Ql52Ft67BFt7vRtKyhMKW
	KqaOVxUAdfyq1/nABtIQq6XHJOMq10SGD38dxG/o7HF+cCymbyGgRu08YJSJOxv7j0btyHHAdyd
	0fYyzv
X-Received: by 2002:a05:7022:258f:b0:165:dd90:1f54 with SMTP id a92af1059eb24-1ac5eea0384mr2993455c88.47.1793353231128;
        Fri, 30 Oct 2026 02:40:31 -0700 (PDT)
X-Received: by 2002:a05:7022:258f:b0:165:dd90:1f54 with SMTP id a92af1059eb24-1ac5eea0384mr2993413c88.47.1793353230555;
        Fri, 30 Oct 2026 02:40:30 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm6723418c88.11.2026.10.30.02.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:40:30 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Date: Fri, 30 Oct 2026 15:10:07 +0530
Subject: [PATCH v2 3/6] arm64: dts: qcom: talos-lyra-evk: Add RPi 7-inch
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
Message-Id: <20261030-lyra-display-upstream-post-v2-3-906302159392@oss.qualcomm.com>
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
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793353209; l=3988;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=khjAi2jQy1zq3snDT67UsqjsppVgIl1f7iUfWMD5fRY=;
 b=oPaCnw0FIwZwEoCmzsTOlsyiG+jqTmyH7lvMOWP7uVaFkpjeLV+4JWfJKIViZaugdrPrOdn+G
 Xxh6RS0ooMmBJj95c7hfY61ibdfjBlbReSgMcwYX3RS0FOifWgJ+OSe
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-ORIG-GUID: no7Fzcm__3ULufcXvUpplaGyp5bhV12J
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX/HETlhzyv4Ja
 +BS4TO6nGNLmXmq9ED85GrR9QNm/ZuIssVpeAumd8ijfTybzJhHnRAxBwSqKoRtJTJM1GfLZRx1
 uqRe2xkOa5rUyO+kcqXr4wcbTNCTFZs=
X-Authority-Analysis: v=2.4 cv=PIqaavqC c=1 sm=1 tr=0 ts=6ae4660f cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=jdnGpsxoh38fhdhdbFoA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX9mvK2A7SJPGC
 L4AXNXuL+tmvKhZuj+UyflUyYarx5TcCC+iM1tgExfTDK4neULu1iNYglOjJClijWIDVJVxAp+b
 zTq35Fq5fRk3JUnQtrolZ0KtF484iUxFBhtZc+QPBLqP9G9C//YxNGa78KNlhHEjD7xlayBqLio
 SkYs4wadmbBfAuaNa4lFAWip9y7wIoK1Z6ZQSqkQ2ooIDVJ6a1ljLd/OkXxHVkRQX67185xO7pe
 jBWswX4wbLoJQqMmX908X0J3HBm0xpnkJ0j+sZ66d0pTMdS9iWb/2Cho5Xej2Qv2wSxFjJ2n79M
 XGks9Zv5lIQXBA3OaNuOn7o1gi6XtECOj6DOITx5ZPcCmpoAOyHVKuMJliPfFiuawf+yTY0YvVs
 Pe5gL8LNBZAmDV4Eha8S0zPwC9SBDNHWKDXm8joMQA5sLoE488Z05qOKDa6ZqZl5cvr1hLgk7wX
 ZZLIpooRVlbOa4v9tiA==
X-Proofpoint-GUID: no7Fzcm__3ULufcXvUpplaGyp5bhV12J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300038

From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

Add a DT overlay to enable Raspberry Pi 7-inch DSI panel connected
to DSI 22pin on the carrier card.

DSI0 from SOC is routed through MUX which can be selected by DIP
switch S1016.5 ON for enabling this 22pin connector.

Add the regulator and backlight controller at I2C2 address 0x45,
Goodix GT911 touch controller, panel power and reset control, and
a 2-lane DSI connection.

Disable the default HDMI bridge and connector in favour of the RPi
DSI panel.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso | 88 ++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 709a96ece14e..298054f47046 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -480,6 +480,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk-el2.dtb
 talos-lyra-evk-dlc0697-dtbs := talos-lyra-evk.dtb talos-lyra-evk-dlc0697.dtbo
 dtb-$(CONFIG_ARCH_QCOM)     += talos-lyra-evk-dlc0697.dtb
 dtb-$(CONFIG_ARCH_QCOM)     += talos-lyra-evk-dlc0697.dtbo
+
+talos-lyra-evk-raspberrypi-dsi-7inch-dtbs := \
+        talos-lyra-evk.dtb talos-lyra-evk-raspberrypi-dsi-7inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-raspberrypi-dsi-7inch.dtb
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-raspberrypi-dsi-7inch.dtbo
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso b/arch/arm64/boot/dts/qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso
new file mode 100644
index 000000000000..6dafdbb87d3d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso
@@ -0,0 +1,88 @@
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
+	display_bl: backlight {
+		compatible = "pwm-backlight";
+		power-supply = <&reg_display>;
+		pwms = <&mcu 0 255 0>;
+	};
+
+	reg_display: regulator-display {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-display";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_dsi_touch: regulator-dsi-touch {
+		compatible = "regulator-fixed";
+		gpio = <&mcu 1 GPIO_ACTIVE_HIGH>;
+		regulator-name = "rpi-touch";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
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
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	mcu: gpio@45 {
+		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#pwm-cells = <3>;
+	};
+
+	touchscreen@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+		AVDD28-supply = <&reg_dsi_touch>;
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1280>;
+	};
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "raspberrypi,dsi-7inch", "ilitek,ili9881c";
+		reg = <0>;
+
+		reset-gpios = <&mcu 0 GPIO_ACTIVE_LOW>;
+		power-supply = <&reg_display>;
+		iovcc-supply = <&vreg_s4a>;
+		backlight = <&display_bl>;
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
+	data-lanes = <0 1>;
+};

-- 
2.55.0

