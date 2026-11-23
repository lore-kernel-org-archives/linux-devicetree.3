Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795411411;
	b=dMLMoabIPgCCIAYaL9GfNHWdKNCRAHH1YpsLhtO0vHLi+h9FCtebFr1x2gbZqEz5u96z
	 N6SM6/wuuYEv6t1PVdkC+97KD7gD7kVbyWMJLugEQoqj53W9YpMPcTRzCb0u7FPGf8Y/U
	 heq9/kBGUAL05+CbQIH8vtq3080UO3lqKVrJJu+uwU7FcMKuw8l300quDl4hbglGWW8xm
	 LfmjL5Kr+o3J97Ep7e4pACHBBVHeLEgffClaKZg9ZdsjLcdJ+iww+ZHzsbFdsKilLObqR
	 j06dwfGAv2ntZhznfWV7vA/Ur57fYd7k5Nlzd99+V5RzMxIcmTZBjp8hWMS7n5JC2Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795411411;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9w0kS6xH+7QM2gGLDTZwoAlJkPaDu+LTByXnQi6L+R0=;
	b=g+HoGVT7QNTrevvJiDuBhR9NN2LOnB+W5QvFtMJeon7Ez2ebJVADoDJHSE6bEeVA24s9
	 EbsusQNApxEMKrUcmFw507ksTTePBAzXBlL8XB7450CZpPiFLGG3CybmGLoi4dvGDyMzE
	 UgUEI1jDqVHjqLnblsVAtcHBr5OsOXVi0V0lwXiMpT0u3snZLbRYTiG16V+FRlQcf3k39
	 bFJzVnQQxl2UT7THjlzwIp4Jh02qFC6I+txPCKa4Akge7CyzQXvKzSLon9y6PxgBocauL
	 zqniIJVwIMWtK8JUvGCyZiS3siaKdSC4VD+q7bVTgyPlRdc972ZT3KmYYM2Nr3U0TGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YS40pk6U;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jtTDn0Y+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53374606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53374606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YS40pk6U;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jtTDn0Y+
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN51L0Z1265322
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9w0kS6xH+7QM2gGLDTZwoA
	lJkPaDu+LTByXnQi6L+R0=; b=YS40pk6Uh73JBHIBwFcjH05ybkb/IZVv2AuuIo
	KvrkqGb7CO+zqW16k68S6KZMg4nQ0RbUQ04+funhF/FyvYTzfP3zo3lssfe/sppO
	BWGqzf32ZiIBebcx45G8Gacdoht9JkLeQLFmZ9Z/wnBTunJOI+y2QiSM8V5m3SgX
	hQpwze3uhJlHfF0ivxdao/qiIzu38cD+UlaND25+c8jeDXK1SQdapH+LjpW2zHHO
	kuTXSe8HUjApk52t9RpO3SVh8Kr/raSwzDqx9UosK2dBXIhS/yYl9p3TgeKMtqxu
	zUlM4QWlPsVVHKUGk7npJiGJqEAlY2Tm/PaINybGb63YOpPA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33h358qh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:23:30 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so2849779a12.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 21:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795411410; x=1796016210; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9w0kS6xH+7QM2gGLDTZwoAlJkPaDu+LTByXnQi6L+R0=;
        b=jtTDn0Y+CgUh+L2u8lSIpKGYpHOxI2yWHg+wjyfqJRdX0CLMZvl3u3HMBD4fHyMUG2
         JY1UfznrROZOp/n8C45xeNAimRmQQhi1hJA/heAguNHwIa7UsTtFJoWxxGalumAVgskm
         9Iw3/xgkGI2VVHPQP3AZHtJXHoplkaaiWMjWZB4PFBTJRrJ/QcineuLQDaQKs5YRCdp/
         oXHKDFTpxah92Hxxke+DoMcF5SBy/2+8ge5EPSgbXkPScJJ11rBkkGTZeT05a/wUaQ9T
         fHcWSmCn8kCXxeYVsufPSWK+hZIkwWT+fMzwKNM+Hg3hiy6QGFP83HqAV1rhzZDIgTeI
         A+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411410; x=1796016210;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9w0kS6xH+7QM2gGLDTZwoAlJkPaDu+LTByXnQi6L+R0=;
        b=OIG+eqtyuNuxagC7f1//ciz5mAMnZQLrF+4D+vBz5YvyzDtlFt7ta9J32x7ZRf16TZ
         yqbeHp9jQw6Pqu6ykd2euWnXCMt0imSQUACtIbQQ/y14lhQe0mQm3rVXb25WpUPdQXrR
         71SeyT4i3bsFH15cAAJcnz0sO5VMxntvw3lzyaSmKBgm7fWWR7GEwI2jhnLNLwcz1SWB
         Lb/uv9f0PjEIW3svp39gQykLiI4PkkkeObspzTdz2CcJBtHIdDi8+2y38aZf5Kkriz81
         rGCfF8lB4afTEsbper/2EBvAt3BqpVV9evh19OiT7GBPr5rhaLGC/a7nC8wBlcozNtOI
         MJ1A==
X-Forwarded-Encrypted: i=1; AL+hErGkmazlvL2Jivlxz+ganT6N/byA6yuhjuYoQvE4ArsAyTTx4BnAUhFAZrARemxM+/JUcBGmhMYWhJee@vger.kernel.org
X-Gm-Message-State: APuU4Z+lMYz0A72+XKCiGZoI0zaFg60REfm0ISfZm18x5sPpqurpe75q
	lpVWMGvWA8sA4qQm5NBmpU8yQ6uSNnnO/PY1h/RtU7OZzP6dKfLO1gakCMIFYBGhlXI7WDdKPli
	DH8lK87bjGeoBeStAvR7JWiVUoEDR67qSCp+My4vDoXzxeBtSaNygDw/RHI7nGchr
X-Gm-Gg: AZFdTZe3yoWXGbW7hKHMUG/jdnR7eWk7dW5kfype6yRkQprPn5CO1S9WwqZ4kfgoZLH
	buqK7SBUbX3b6az8xqj9hi66iAWhqNiQOmFcY/hE7ON+/TOozFjNsAG6qTcog8s1F/qx0mSmNr/
	jmuL3HcJpARS8ulmt3WOtU4QWJ7VJvQppjc/ciMfVDIZGlGvgaCGFHcKN3/UKRSxhtHhcCqZ8UG
	0nnfkeMDnMhZJXsRPPZXZFRLd3qt5albpJ8+1/0TjfeazuYICHoetDNtFDPAVhYv3sAGScQr6HL
	uC/McpHl1NRxITlfOkNnvnqlbDVKogadMiZIOdMJksGnXuTadx7jxnl/JEHfncn7lM0gOICzVDp
	5CSE5YQ1+d6O3R/toBMKqJlNuwVQT5fKo7R9QS8tc0B5VG6T76m6Ea2tRin9k34jENpbc6q0XeM
	ZN6ZNs1t2Tx7c=
X-Received: by 2002:a05:6372:a810:b0:3e0:c5c9:d55e with SMTP id adf61e73a8af0-4014e45acd4mr8410421637.63.1795411409628;
        Sun, 22 Nov 2026 21:23:29 -0800 (PST)
X-Received: by 2002:a05:6372:a810:b0:3e0:c5c9:d55e with SMTP id adf61e73a8af0-4014e45acd4mr8410411637.63.1795411409157;
        Sun, 22 Nov 2026 21:23:29 -0800 (PST)
Received: from hu-praspras-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0285c3sm4529722a12.20.2026.11.22.21.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:23:28 -0800 (PST)
From: Prashanth Reddy Baddam <prashanth.baddam@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 10:53:09 +0530
Subject: [PATCH v3] arm64: dts: qcom: monza: add Precision AD HAT overlay
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
Message-Id: <20261123-ventuno-q-precision-hat-v3-1-fb96fd6b7887@qti.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAL3NA2sC/yWMSw6EIBAFr2J6bSciOn6uYmYB2KPtAhXQTGK8u
 6jLyntVB3hyTB7a5ABHO3uebQSZJmBGZQdC7iNDnuUfIUSNO9mw2RlXXByZ54+jCqgqoXVZFo2
 UBUQ7rj/+P+Xu+7Lf9EQm3Dk4zwsTf0ilewAAAA==
X-Change-ID: 20261118-ventuno-q-precision-hat-a71bb5549334
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prashanth Reddy Baddam <prashanth.baddam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795411405; l=2436;
 i=praspras@qti.qualcomm.com; h=from:subject:message-id;
 bh=kX5jXM8Wi8BGEcrpSf3GrKxJAMLU+T6byv8vV8CjzZc=;
 b=HS+Tx6C7ukcclAE8ELmUGgMa0uHqtIZgYfaO9sXEUELAoercDpCfQuQbIAvshAt8YCgMaQWjY
 /ogFhjO0gwLBhjW/FapfW3EhO/u6E/dcC2TcbJqF6EcF0SebuLllIFK
X-Developer-Key: i=praspras@qti.qualcomm.com; a=ed25519;
 pk=/ijBZ6n56uOR5csC/Wwn44VzFw78aZoHlepuCmrOY2g=
X-Authority-Analysis: v=2.4 cv=EsxHPicA c=1 sm=1 tr=0 ts=6b03cdd2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=txfNvoKIHXZbme2c1SsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 9URESObgdSq40qLthGpGwtlaEmY6ROoe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMSBTYWx0ZWRfXwbSCCxEplyE7
 pD5DjdXpER8s4/bVF2TEjSMt2F/cGgdFUKHDTuzL/Z/3mkhbpTdQLg7ZW3BHhig0TH8AwjlYsUA
 VKdZkCpxSDCUc1PgyYhKwCPUPkHZ7p+DflcGvv48U7O/C6lqpLgN+UXgeA9eYZaesAojj2YeRGL
 4+NgNj3+9pch6UsK7z6pDewSP7jGZrjiP5EgTTlCl1YFwSvWdTEf1ZHue3O6FHwnwRfnlv321Y1
 sFC+lNNi94x0tAjxpjpQuyMjDtXGfP64QT/0LH7MjT7TMha7/6B2zCNC1lMzBiui/f9jcY/a3GK
 E69sRP1VU6iIZHZiWqvrjNCp3E60PJkjlPFFjCIOr6ApWy23/RKX8EVczRDAJy/rbE65fSjWjN0
 0UHbtc6uNRjHUar7DIlDhF8L7kev0NbJCnp3OjGUXFuNHzyTMY2/m4oQMf2d+5KUd8foCrcJGJW
 78+3BhHC4bV5YNX9cow==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMSBTYWx0ZWRfXzIwy8k8kugH7
 cHWwaWclGlYGq9N5CHTcCguyuSTHv2OpVxIwhCD95Q6R2ldoJgM00va1uxphsJbcnUeGVvo/AcK
 Oj9yDiQlOg1OvuQEvyiVETC0rxRBpTw=
X-Proofpoint-GUID: 9URESObgdSq40qLthGpGwtlaEmY6ROoe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230021

Add a device tree overlay for the Waveshare High-Precision AD HAT,
based on the ADS1263, connected to the Monza 40-pin JHAT connector.

Configure SPI3 chip select 0 with TLMM GPIO90 as an active-low chip
select. Set the maximum SPI clock frequency to 8 MHz and select SPI
mode 1 for communication with the HAT through spidev.

Signed-off-by: Prashanth Reddy Baddam <prashanth.baddam@oss.qualcomm.com>
---
- Added overlay build entry and base DTB bundle in arch/arm64/boot/dts/qcom/Makefile.
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 +++
 .../qcom/monaco-arduino-monza-precision-hat.dtso   | 24 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 19310879349d..bdc455cfb388 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -93,6 +93,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-ac-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
 
+monaco-arduino-monza-precision-hat-dtbs := monaco-arduino-monza.dtb monaco-arduino-monza-precision-hat.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += monaco-arduino-monza-precision-hat.dtb
+
 monaco-evk-camera-imx577-dtbs	:= monaco-evk.dtb monaco-evk-camera-imx577.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-camera-imx577.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza-precision-hat.dtso b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-precision-hat.dtso
new file mode 100644
index 000000000000..e50b0c956057
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-precision-hat.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Device tree overlay for the Waveshare High-Precision AD HAT (ADS1263)
+ * connected to the Monza 40-pin JHAT connector.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&spi3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	cs-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
+
+	spidev@0 {
+		compatible = "rohm,dh2228fv";
+		reg = <0>;
+		spi-max-frequency = <8000000>;
+		spi-cpha;
+	};
+};

---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261118-ventuno-q-precision-hat-a71bb5549334

Best regards,
--  
Prashanth Reddy Baddam <praspras@qti.qualcomm.com>

