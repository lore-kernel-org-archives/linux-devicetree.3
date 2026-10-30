Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353238;
	b=E0vBC6cxNnisfmtsnFA4WVUEJRpeej+mStapl9JhmJuAjWE13f6hbfg/Nr1ABBRt/NMR
	 AwMN7FRlTmeDnUl6gNSEZHq0LumFzXdWiHk1I6Dc4mn9ciazDt7IIGXEXz6tr7+W2FCI6
	 vWA8ww+/8+D7yO2nRD9+6U6vy4vC9T3GCA4szucOug7DZl2h9wku3RYrAWzIjmNb3a2Uv
	 yxAU8fzSCepViNE/Z1sNANHLY+iNLQEpRylnw1LF3oeD1/872Z72o5rRaJtkHwyoh83wp
	 N9bdL0L5cUAWcOskhI/DPpjC4IWcRCgNV0U+5JcwA0mdIzv0gWkTszgecQpRjohL4Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353238;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=;
	b=1Dl2cItO6ak2usMpS6BXv2mxqgLc3zuyaukP2DSTmBvXiKsb25vz0tvNaJjgrJcoDJCY
	 xAEoWdVrMPVbWYxqo4u9ENzQCuaQGSQKnJVrEm2l4rE6O3uvPSC5YBK5l/CVZKdMDrNY8
	 w3jExBM1JELqcRcCZDThlzGw+mnHY85ToLCilH7PDSlQPmTb8eKt8xfyKM40UsZQ4hEj2
	 9sylp3vgJA1MlBH1tnztsXYt2j2NkBNdy8ncywyVfsBnoKDXiUKnxBYxru7wdbKet0Qd1
	 scGcIJJyLFOotHpsneNv26doraKNc3NHXftas0lX6sZADvKEcvJYEUk9EQQS/aAHu5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JgCi4c+l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZMCl8I0m;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9ED5606A322
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9ED5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JgCi4c+l;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZMCl8I0m
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F6qH2683320
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=; b=JgCi4c+lCujG10/2
	/wblWEv7Hpb9yxZohCorfY68XaIr+Sj1bFbHb2tBFrY4LQSLN+DdSJO79aXubwTR
	GJGlCJvfTzhqLStBtGGUEZ2TXqzsKHV5LXqZDu8NSsoVY/Jai7w1v1IibTHPvrdD
	nYrQysBaPlyS5Ai26ggYqZzRn3nW44P2kMN40l7oS2VxuMJIGrRb7OmER09rVUzE
	uzLZFsNAIbFOlxvWqE2RvUYm/deAJ6/aWE/WrsfdI8WPiZ/DznwM+hP0QkUUpRHS
	w7UEcvkTOvWYVTaDcVX7dLwOt3wu22YBai4486FWa5LTGJOfHZR5HRpRKSWlpolo
	kWqAug==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj9f0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:40:37 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so1640326c88.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 02:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353237; x=1793958037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=;
        b=ZMCl8I0mp/JTrtZyAahbXt3jXjgHAodbpo3bBN1v51xERKgF2yx4xFLsY59caX2bvw
         yssLIuJOWHuIdaA4LcpgvDNZEdGKoWjYIy2GgmR7uZfh88gDh7UPixskxrPo4ZIUWbso
         lHNODDakEj/JR5T3H6w/VPNsFO17feLUrY0fNMdBvE2zbtsTrAwoAXVQ9yZKgHDLucBf
         nXg7OCH6SB+HldBLtvT6j1ShkwrQP/4cjVqw8YuOaFxZmMthCfrka4FDXPGfIRHELF7u
         qahWgnxLgWSYltKfDVJO/EjSTdnbdWL+Hy5Av/7pJArf33hnXGBxJoCClPwhIj4Q8rIr
         wquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353237; x=1793958037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=;
        b=PhY4sTtKYloJSxWb9gMsBKuQiULKLTpGDfSL5wWnwv5iwgcpz0vGLETy1khaKNGjux
         r6Z6nNs5q4vlNvIUQT8UGO5q6rCqO9XvzTYzbbj1jJGsymZSbD890nfa4dAha/MEVyh9
         bRb99dDCk042j24Jpc2pz2RgvEJBVr1O7SpL35iSeudEqPlkBH6gTqnKgB0LMtPZBnWI
         NlO21jh9mNese55WxKSEY1x3H1vY/UKei2roU6XYsD7qqvEYU6E1wYHJA36RjrB8iAAn
         v/VIT/yIc1uTwWVMq3IH2c6Qau9yqFayTJQsql3DynZfyW8yVOHxtVtv2l3sH1V0Iqob
         xqyA==
X-Forwarded-Encrypted: i=1; AKwUvBwkw9yIXTy66RgY62UlO0ekVFOVpObPKQbV97HrUBoDAnjSst+IEXo7EWrwywgmTtcKluBy6nakA7l+@vger.kernel.org
X-Gm-Message-State: AFq9FYKh5vnL5Dbg6ToUs5ALxjPmSpJcK9qf2PTYMEQlSaatg8fkA8Ci
	Q2faS9KctQhhaHoOaVsWwkO8CdUScJt1uTYsrZ5qNVJn+MZjLQooP2Yo0ZgV6gXe1DQavrRpVlF
	pJXXVRwBlOrvTxJLBU6Nl04peRIhgO7LaSRUXxIZKeVYYHTSJ9D03OZcMtC7L0dHr
X-Gm-Gg: AYBFou1c3GNIrqII7INIe0q/DGe9xQBxcIBobJ64DHD3b4ZX0tfzwOVNoMbAwSssuxt
	KA6QknYt+7t9Xz8vU2npq2RhRUhueIptxAw9VdEg5RuMllfYuCB3g7+1TB7cyeC4QarxIjg0pJ0
	vtELI2m39jwFsvG++PZHK6WiS9VGptVOUaMUNRA0aT+dC6v+uBJIc62GOQW0CX+xD/vwDiAreuL
	dWbtJRdTDsSzQnqvWiyLV4xkhRpDNDEJ1lPIHEHHNuyebuQarx8dvVQf9Ppx8V47F9DZLBISZUe
	uugvTL4CSPV1/HBHQDKZeRQ+1PqgPwyZqcBwPsGA3zMmqW6NTcd/rW73dJaPz9OFY95gD0wyOj8
	4dowaoZC5DAUdoFhbAgsNkwLRwjmNQ/iEkx4TpZEyQ1rhJs1wGRFNQsGQwjNLZ55KWNIdWHbHuh
	gmKV4s
X-Received: by 2002:a05:7022:1181:b0:154:e9d2:d741 with SMTP id a92af1059eb24-1ac5bbb4870mr2248825c88.8.1793353236503;
        Fri, 30 Oct 2026 02:40:36 -0700 (PDT)
X-Received: by 2002:a05:7022:1181:b0:154:e9d2:d741 with SMTP id a92af1059eb24-1ac5bbb4870mr2248785c88.8.1793353235780;
        Fri, 30 Oct 2026 02:40:35 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm6723418c88.11.2026.10.30.02.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:40:35 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Date: Fri, 30 Oct 2026 15:10:08 +0530
Subject: [PATCH v2 4/6] arm64: dts: qcom: talos-lyra-evk: Add Waveshare
 8-inch DSI panel overlay
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
Message-Id: <20261030-lyra-display-upstream-post-v2-4-906302159392@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793353209; l=3607;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=ep0DWydVmKj6o+MB54eb4vl9AakC4YjRhLn758mEY0w=;
 b=wYTMEsgUVYO0whhO2gojRLKPeuIrfFxFXHSVh20w30m9pH52rzlRdjc7korVVTHAdaNMpAonk
 55mKCoygj7CDuxvIdmAw7kxTfwVShzIEMmwQG0AKVnURR9zzKoNQrWE
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-GUID: 45LkfCrdZ6soK65xTazWYNPVhw0ufzZh
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae46615 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=CsxVdn2IL-oTZ3OAgFMA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX7tnQSSNn9i/p
 0BK9P78QWbVZJO/0cRjomQo/Mv0xoOAQsKjPfp+MWhoRDsP4ZGpPzt5xjGzq4RDHCHtx2XdMHNs
 rNoFbFDTFqrCDC83o+yDB4gPJ8EBhsjlio7Clj/5oP50Yz9qsOmsIy417mBFzZR0fWPMlzERZsG
 6A4a+u1znIzFj7cnH+ss7qDyF+7VjoSDorR4kaZNu7QvEkU2SARh3ukgloVQauYczTaEkg8DS2I
 RrVrEGXHxmqV1s1KX5uhuoAAiUD9558CQUMjGgBD97KnIscpa/LVtVwrArEsaZlrOXo1bcZkO8d
 OnxiweJrpTqCi4EyHZ5FAZn1zEa8PFEKtxJMgdSlS0XbvIfS3Bg1drV/cWMA2Wr3MYJB0Gm4rJ1
 jODs1BAHwEcrHyJ6fQgra95CRDOvLYYnSt3Sts8IuZz9RWiE+coKr8LlSQlp2NTWL+Du9Z1BxF2
 Xd+IMVmy4xuM6ko9c5A==
X-Proofpoint-ORIG-GUID: 45LkfCrdZ6soK65xTazWYNPVhw0ufzZh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX9V+Safgu6qiJ
 zlGdXpJFXCC/e8peRsZBplyQfnQd2WXjqiP43EPNsd3X/VOqCMbvQvtGS/daFUuc8aBhm//LgnH
 2I97J+hMzFm1IiumC934WX7YQD0l80s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300038

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
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso   | 75 ++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 298054f47046..b6a61339914d 100644
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

