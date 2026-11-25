Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611294;
	b=KXgrhpKXcqjIGnG/TijkDqv970ZShPqWu2fjQOA4770nB6zVO14bI4exXpzxnxQzjJBU
	 zc4oGWDkuew4U2wLfVfS7dNYGgcWP4icmlfQuLoM/QjGNCaPoXm1j9LNsbzpJg4eyA/FP
	 WnQ7AglZvFLI2V/f3Bve/Ev7Pm2lWSZ+t64qu4fQJG9CGZ72KyyKe3b9ySr6AeBSQuF5l
	 HyfAYdo8mI3au+NDndctymwclf3xbuf+8Vawq02TN69zfeIQOIRGPB4bATLpDIfQ3dNDx
	 OtsmLqW/InPZr+QwvXcZMt67NFwAAM7CoJELFpQnTnKSNkWF4bQWrLM9CI9Fbjy1//A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611294;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tkiqVhXLscb2eWEG4IKitimjTufpxvT32Prf+F5vybs=;
	b=u3O4eT7K2v6BFTXIJ54FdjmWTNYrRWYnoiFSgJo9X80ykKcCz0+r+RegPhLtSva2u04J
	 +OnKkJ3q8dmchYTizsRZyyMgJK5SfCmwICtek1c0v4dg9N860lVXvxR5j40AmxBx/Ilwq
	 1EVnm0I5QwKZZIoOETYUhBZFji9GVuv9fOWescwmAHEZBHzyGkk9n2EMlaxZEdWvSHYJ6
	 euU6OrFxpNw6JyrV3zy1zNvkTLmQncITJhA4W50UJdRYOdlmLM2QfEfOvMuazvzCf5Fyf
	 WuY2wJC43A1U5dw6kONDCfAdov8clnJVtkrHm/EY6SbcwtqPlvNUX7uri9GQnunXGjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dCHECYQB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RLlIpuwZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B2F606A689
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31B2F606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dCHECYQB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RLlIpuwZ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mt0j2359510
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tkiqVhXLscb2eWEG4IKitimjTufpxvT32Prf+F5vybs=; b=dCHECYQB06RUWabM
	jKwN6HRHf/HY33l6IQYKwI/06ohw28hfrRMGfTv2KxihV3fVhK7QsagJ2KeRolEh
	a2GrTzjR1iHm+F6w1F5p5/bd7yomWCdTi4NKUpoSmPkG9j6wnikEO8Vrv6APVpAC
	PT828TrdaBxJZZlQXKxp7MV1sOt9FK0fG50rE2PemtBEThMT7U/Z7dtIvo0WAWQb
	CtxznSqVW8CNqSsTAqNTkFp26z/kCnS2DuAKmDilzSO+S68GJSqtshXlG/cgsPZd
	PRXaEt9NaoDQhSlkWqAMX9QBEedJvT33goPRhw36+vPJA7wLM0SQNB4NzBgkCbuM
	M/+EIQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu6akmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:54:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f02547a462so10023465ad.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795611290; x=1796216090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tkiqVhXLscb2eWEG4IKitimjTufpxvT32Prf+F5vybs=;
        b=RLlIpuwZ/tqeUvT8Xn6jrJ6yu6KkPuGphxFbX7MnIygWVQsMqIZ30EZwC4/I83jgnR
         w4Kprbwul6gjYY11nPu2i7YwFtNjpgpNvarcJDh4hOcCPb3kY/wLuqrkMfyUremguKW4
         1gYL4UDg6n/m5N0ZWJpWHJoxMumXD/Atb2LDWKovsSrTfw7tnNCt0lyxmC/28fPFdaqZ
         IQWUlPUtbEiTq+EQTixBJsRZHKdX0moOBUDi5ZoauPjsQaJzNq4evhb4mwzSbFu68L6h
         iWJjCrVDF0hz9iFEROaNkehNyqy4Mdm0/ZduMSM3zmA1i0hNe2zlwrWp/V66o8ThpO+i
         rZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611290; x=1796216090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tkiqVhXLscb2eWEG4IKitimjTufpxvT32Prf+F5vybs=;
        b=X+9cSUOjsR3MR/+yzJpCTsQK4eAma91qPFHscuYa2b9bKCawFLOxb8mKAcYpDRhSbj
         qrlVH6ELFRtvVZHxjOv1FUU3vW/2Hj9xA9KD2SNoKgzuSJqTIQLKuA3/RshxkxPIpxkw
         3AHM8zVR7Jdy3XYwhbONIrIHfgNPudw6/xMsBtYmfcfSApEplC/qiWjCTdE7kwu73NTv
         YVCDf/0KRRBeHP1Bx+mWVOkNX2bssAdI0VY88pONMbFjpgKM8kP/sn0drgsd+Irm4Nv9
         9VnLaou3g6p+rj4wEXIG4mbInP/Jp+e5XJqOcANFXRfODC8BKKlzrMZ3aOwG1GFiuWa8
         uWMQ==
X-Forwarded-Encrypted: i=1; AL+hErGGbLQ+8bM5EsAi8dT68Ns2n0IrNwsS5G4j6EToZWY68eL9nBX7Tj9gke/CsQS3sKH5ldBeYmmivgOx@vger.kernel.org
X-Gm-Message-State: APuU4Z9481kn87BcLf5adptmZEwSJn0eB/2elZzTU3al+Ztx3AtxZ/Bh
	XhcL/2dC6ZqVUvOsUd6a2A8XISxoMk7zkynPf1QcJx1wIXg+9DXJWdZSX8xpJA+bLT6zg/3Q2Pr
	jigXcN9IklSQEA/m0g8Kub1WsX70y4gLIJ1ZaiMDXPbpkrSKNqv7U1ygF4H+RYhQM
X-Gm-Gg: AZFdTZf7EOE6U2Ni7zGibfk2dYU6ULWIi9eMmlCeHwzyo8x3HqP8DfqH9fAN0G1haYo
	GsstMDJIAUtioPvGiU1/zK0Ra7HVjQWC7b9GWUNaOGPiiIxhNvn3btJQGHvvdH+2ibJjggO7A2u
	O9WJlUADF4oOAiLxmI1P2qpN7jkV5PObahL+Akq1GnaGAaSq79yHGrjImhf23qUD+wAVfze5qth
	V+5tDUS+iwRqTgNlM0/87TdFoAOzilNqMk1y+OI+TkL0Yl/aZTWCP5Cis3OYwH9fp2BygRjcm1v
	NT2NECyd871OpN/7x3SJzVx1j/nehY6mt2Xz8suBDj8RvBSIIqdj72OP5kSRCZ3sF57e46wKwsf
	knwAkWnzCzOyypkzdKel1XgbQnIWmwzkDaS1YHanfZ6vWsPUMjWdgD4TzYElQkHRoEC26tZqsOY
	MZnks1HYhzTCsZO5xampcBplmDknm2G3kHp80KAxnmfi7SVBprpOzqD/h3ueOm4tU4bPLeQxhZe
	xty5EGB1gwrufdgGhLJndSpp+OX
X-Received: by 2002:a17:903:298c:b0:2ef:ee1a:1383 with SMTP id d9443c01a7336-2f03f1b9c1fmr286896665ad.3.1795611289661;
        Wed, 25 Nov 2026 04:54:49 -0800 (PST)
X-Received: by 2002:a17:903:298c:b0:2ef:ee1a:1383 with SMTP id d9443c01a7336-2f03f1b9c1fmr286896245ad.3.1795611289135;
        Wed, 25 Nov 2026 04:54:49 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b58fce71sm31940575ad.45.2026.11.25.04.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:54:48 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 18:24:26 +0530
Subject: [PATCH 2/5] arm64: dts: qcom: monaco-draco-evk: Add DLC0697 DSI
 panel overlay
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
Message-Id: <20261125-monaco_display_intf-v1-2-8a27d60b0d94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795611273; l=3306;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=t1iu/UukmUP1rPeoRLohY7HCiIH/GOHJHLLPgekQYRM=;
 b=tkflfCrwrIGgFE7FumuwrZqRHChbs5A/41RNQEztvAWQMK8JxpOnX6R7u07yKTDc0t8hC1acH
 TIjGCG7ayAODEDbaUZ/lyZQR1XB2aO5MmBAf1EOu/sCMTk4xCq/8A8G
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-ORIG-GUID: wwvOER7hmX2_4YsPQ-Jw4JGacDyY_-tV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfX6O6RADCo4Fe4
 g0t0BwOuk8avTMmLPYsJj8201ehLDlIRrOsoAIvCRHr9sYvs7HOL2KbCL8S9Y3b9bBa8utlcS3X
 b0XYSvFWqmw0qF/xDopVhQn2B2Q0ik4=
X-Proofpoint-GUID: wwvOER7hmX2_4YsPQ-Jw4JGacDyY_-tV
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b06da9a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=yVliWmkVY6MumjAL1JAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfXynoSY1qyJFyT
 A5U9djVNklBCENhH9BKhpdvqQ1Le1pumfoYatIy6Ki6HNWXhKqXaRz21untrs6+MMyi6ksFcW+3
 oNFz2LP/3eKvizPIMPRZzDWwvWVBc6Rh1qa8KiobIIpOKflB9Flck7qCfUzE6ednWooWB8nXKoi
 HgAArDPcsQ3ZgeJ61FbUBFSI7DQboUyIJgTfwezorTsUwZaMCOE1ZfD01tcofAa/B5kOqe+5Pkp
 VVqH0nyGa6OWyxUl0PIMVCBVKN/Jx5kn2iE8xBpxNotgxkkm+aSm0ZB855chvwCcJ9taSQ4/dUH
 fa2BzpH7bjxSYjauJVHSZ2+hb0fdHboUJx6fAfVkd926zi/eR+riWxBrhemrTElQCAYcEqbTtSS
 Q8QucV0RiNDHVtBb6uqnCumvgRqAMMWYwNhQlqsxihuJXsBI/8EsSiEvx3dGegIY9C2TIZ8AvL8
 STZhakqFPxZ/u4v4MtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250051

Add a DT overlay to enable the DLC0697 DSI panel, based on the ILI7807S
controller, connected to DSI0 on the Monaco Draco EVK. The panel uses
four DSI lanes, its reset is on GPIO66 and the backlight is a
GPIO-controlled backlight on the I/O expander.

DSI0 is shared with the LT9611UXD HDMI bridge on the base board, so
disable the default HDMI bridge and connector in favour of the DLC0697
panel.

DIPSW2.4 needs to be ON on the board for this configuration.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  4 ++
 .../dts/qcom/monaco-draco-evk-dlc0697-dsi.dtso     | 79 ++++++++++++++++++++++
 2 files changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 079e041af2d6..348ab62ddece 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -93,6 +93,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-ac-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk.dtb
 
+monaco-draco-evk-dlc0697-dsi-dtbs := monaco-draco-evk.dtb monaco-draco-evk-dlc0697-dsi.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-dlc0697-dsi.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-dlc0697-dsi.dtbo
+
 monaco-draco-evk-el2-dtbs := monaco-draco-evk.dtb monaco-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-el2.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/monaco-draco-evk-dlc0697-dsi.dtso b/arch/arm64/boot/dts/qcom/monaco-draco-evk-dlc0697-dsi.dtso
new file mode 100644
index 000000000000..5e1aaf5376dc
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-draco-evk-dlc0697-dsi.dtso
@@ -0,0 +1,79 @@
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
+	dlc_backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&expander2 2 GPIO_ACTIVE_HIGH>;
+		default-on;
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
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "dlc,dlc0697", "ilitek,ili7807s";
+		reg = <0>;
+
+		avdd-supply = <&vreg_bridge_3p3>;
+		avee-supply = <&vreg_bridge_3p3>;
+		backlight = <&dlc_backlight>;
+		reset-gpios = <&tlmm 66 GPIO_ACTIVE_LOW>;
+		vddi-supply = <&vreg_s4a>;
+
+		pinctrl-0 = <&panel_rst_n &panel_te_pin>;
+		pinctrl-1 = <&panel_rst_n_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			dlc_panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&dlc_panel_in>;
+};
+
+&tlmm {
+	panel_te_pin: panel-te-pin-state {
+		pins = "gpio52";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_rst_n: panel-rst-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	panel_rst_n_suspend: panel-rst-n-suspend-state {
+		pins = "gpio66";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};

-- 
2.34.1

