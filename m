Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BDB519E09
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073792; cv=none; b=fsHrz5jGlYhxOQoD2eAzaquRnfZKcH4HGtX/qvKQMrqJQw7DX0VMD9h60MtQNlJ/HyrNnhxk3rK9o9CulvjRoL2jzCF3X3vkt8UqeOHdNJhsrZidTcXArtw+9z36fjfoVmh1WqI5dM/1O0MPqxsCibqOFZj5cO7Kp1kbYlIWVcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073792; c=relaxed/simple;
	bh=iguCScBr7c+PEbcCLD4EZyGD7fEzM3bqpPRXLUqwuds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GRf6oqvPqhKhLRLWg3udyuihMyTyImEWZJLRGy3b7XhJDfFZAv1zW57s57VJNd7ibdykhd/QgUUnfpDsO9RQWCbzc9Tx4nx6z34NP03huZ9GRHBUpfKHWt9SBMy7+7Yz1Br7+Pl2o8KfOyxpb5WDLDFcb8YYDelPTTO/KIg5bLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fUuR/lCn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kIC/hexV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fUuR/lCn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kIC/hexV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M9fudo3382655
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kDc8/TbuwSX2LX2FxhsLOZCwj+p7CiHx7cpW8387+bY=; b=fUuR/lCnx+66nAS8
	HpKQ/AtwzaFd3/LZXYC9kQhG8QJ9ChcMipO6RIdNtghPduivsV7tQb6e04C8SJke
	tP/D907fxvCa239LCdQqOXFkh5G94TdGhULAxqOt1LOvN5QTVfE/+5NcXFnvOzk2
	ZjOL0XSti2CogHfVKnIM/fwT2iftImZ9Flzy+FKcYR88zBNenJu9kmCDfZCn5XMR
	k5EDl0AvOjD7HCdDV3+rt7IoKpnbpP/kJ2JljgKJxGhFdCEErQuSg/eTVmD7BS/E
	iFzpwOrMNtOXUWPP/nZb3ZF1SVvTOpv+FSZW0diAic9HCpTcAB30OZ0qrsfTvLgp
	VrzhhA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkj9fc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:43:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso3716047a91.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 03:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790073789; x=1790678589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kDc8/TbuwSX2LX2FxhsLOZCwj+p7CiHx7cpW8387+bY=;
        b=kIC/hexVs1hRYnJZl9HSEv9PVeTeKGoKZoh2Po0GAly9NLtEGHqN9gh+6LefC6uqeD
         AlrE4ok0wlFGgJforSSMHbjlxA+M6ojmssPOYcL+/1L4kxnZodKiQSYEM9iOvEVrNH49
         /OFecP/xY89nBc88hj7Gw3Ra1Rs/n5YP5QavlpZUMjE4FK6bbTGc2yDImnairOYpyBtX
         SD0t+uB7Gkca4r4NoVCrV5LFPjM+VWlJZC106StWIXLJ44RbbOPWX15PB+FIKZdSmiQn
         TBm5p2rHG/lvF49VG1MeH2xhPWPCNDROgbU506ZRMn+HkOjP9+vfG8T39lb9KIT0YqLj
         Uogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790073789; x=1790678589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kDc8/TbuwSX2LX2FxhsLOZCwj+p7CiHx7cpW8387+bY=;
        b=klsNX4NHINkkg4MaLkxxLywrOosCJJfXP6XfEsKFSeU8O4eJDE2F2GDssvKt4Y8YQg
         cI8vgGJMsolCoBVTBh3GaymWetHiQuAdiPy/Tx8xcJzjTDJhb6j+yDc0E2DrDhiw5/oq
         iu6oiNTX1Dh5dvq+kJC1dcU2W2PG3XBFUdZdAANGLdx7Y1P+VeJ31OtfpEKzmnyWJ8ie
         BOFEGnWAvSvASV9H3P85DO6JLgjYHxSk26fzr45kJ/MqNf5mYWGiXrK0mcqNObj6Ukum
         1UUC9Avpo5prYYma5aM5a3idHLzbsu+IJyXOy8URQkYkulXXQWW19g45bEOT1eXHtVvQ
         hsbA==
X-Forwarded-Encrypted: i=1; AKwUvBy5RXfWBufCN99y0GLe+ULmWv7FmU1Bg6LqZo6KBRSLXO5lJ7BSSLLs/Za2fb1Yr2uj7QWE1vL4xubu@vger.kernel.org
X-Gm-Message-State: AFuF++mzEF5v7HCfU+ScO5ESQ6JhCxgSoCGWssfKx3NhI+K2QWMB/2pe
	GPrtK68TSv+7Gqv4eOif1/mCSPCKUqxDf4K5Qe4XbfUvekOe0QOawBT6dDkEC+ITIKe1pEzp0af
	wAuWRVC0ZKJ6dyT7Ld7Om50zFy9TFq6y43cmwOtF5uPITPNO6+PRsPZ8ril2s4rv8
X-Gm-Gg: AYBFou01Wq1ZS5t+n7nzjcJ5rYLm0tzRm9DEcK985QknxSuLrgPkhEdc4dQ0SBU5o6U
	EltxRR9+AljCWeToJpMQAa3PHL73oP7hV26EWzHTCwES+Eb2pqKiMJk3/9xeNpf+tgvw0ofM6bt
	OZW7Np+k0g6dS4ak7CdLf8n2fYkr+DpRBe6rS1W34Vv1sx6HfoNOZoZh4f0BODwem62lgZIT0Vm
	p2gVof+x5V+mvSZNZmi1Z7IiXKvKpYdyFXjHurFX/oj/1sn9hrOJkmS9ZGge2zpJvF5dVh2v/qL
	/IwS5eKIP6uR8i9TK6zk8gpw8wnM0EHXe0mXd0W4Rr8WDXRkginv6ZTAQkwqgow2SObx5WH6ONL
	TrKaWVY9+3w6R7glyLDmiVWsPD8w1dkQ=
X-Received: by 2002:a17:90b:2e8f:b0:39e:6c6a:4b6b with SMTP id 98e67ed59e1d1-3a07324b45fmr783788a91.53.1790073788904;
        Tue, 22 Sep 2026 03:43:08 -0700 (PDT)
X-Received: by 2002:a17:90b:2e8f:b0:39e:6c6a:4b6b with SMTP id 98e67ed59e1d1-3a07324b45fmr783752a91.53.1790073788382;
        Tue, 22 Sep 2026 03:43:08 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f29d8762sm4404015c88.5.2026.09.22.03.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:43:08 -0700 (PDT)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 16:12:52 +0530
Subject: [PATCH v3 2/2] arm64: dts: qcom: purwa-iot-evk: Add eDP display
 overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-edp_overlay_for-next-v3-2-2758d46ee174@oss.qualcomm.com>
References: <20260922-edp_overlay_for-next-v3-0-2758d46ee174@oss.qualcomm.com>
In-Reply-To: <20260922-edp_overlay_for-next-v3-0-2758d46ee174@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vishnu.saini@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790073776; l=7732;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=iguCScBr7c+PEbcCLD4EZyGD7fEzM3bqpPRXLUqwuds=;
 b=IIIccaIswBwkQ2N3BQfJDM3EDzOK6wun5TyUAnVAKdoRnEr4Ia2fkfITfDa7vh5jfod6EPdCa
 L/rzxxatuq8AhoqubfZr6sXrUlQYH18fAj4m8/9KEvLMWJxyo7qN28w
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-GUID: VuZ6_EpxQXG-11rU39BWcY1qsWqtl8sw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1NCBTYWx0ZWRfX5z1IbDMrXVTv
 +fHa/N6vWQNDITHyWiRjxc2KnxQCULFm0bkQezpGl0B8HbSPQIJ9LycR/mBbBAPP0bUsO5ZoHcs
 31+cnv4ZRoRCoSRhaM2Kg95l7lcZ9F80rt99vpZqVfsoo6i7G3sAk0yIOcL6JL0vTiI9Ajg8xkm
 U5Vs2RVRYhlHMCOcA9Ab3JApkXAdrIozka+mD+NeRVneI6Nc2jq5ozot4PA6WRJ7n8BESUzBWCl
 J+zRlIJSkmgKu5vl5mqPPFC/cZ90JfG+fYdvJFF+Hc8wXt96AZrdPmLpYi+EVwo00yi32+MrBWh
 WPDv9ZUA4xLO3adq6C38N0NQe1mwhlsC2brVmHW8x7UIC+uFhxHvXekwD7rW4FEQ0gGY6m0H+m3
 Lzs6HfQMmSLjqx1OUjIcPB9umcBzXAEovo1cyDn0mqji9+fVvUEEZFxGtYKHvDpUl55TSwaEOxv
 GTMIPr/CK+aE43eFnjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1NCBTYWx0ZWRfXxMtj/R9b6vw6
 QQ6EDkcd7vSL7FYyP5HjCv8zmcpuSfd1xFzGTyU7bjZjLU+L9PDkE88sbmH5TznNdCdFyv9xAza
 X0uKPFugB7L7Qk6m0NcGhpAL9qYjHK8=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab25bbd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=fX3ZoPcK7U9-Bz4LDg8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: VuZ6_EpxQXG-11rU39BWcY1qsWqtl8sw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220154

Purwa IoT EVK variants are available with and without an eDP panel.
When the panel is not connected, DP3 is unused, but the base
DTS still describes the eDP panel and display path.

This causes the eDP-panel driver to probe an unavailable panel, resulting
in AUX probe timeouts and missing display modes. Userspace then attempts
display commits through the eDP connector, causing repeated DPU vblank,
frame-done, and IRQ timeout errors.

Move the DP3 and eDP panel specific nodes into an overlay so the base
DTB describes the configuration without the panel, while the overlay
enables eDP panel for boards with the panel connected.

DT overlays cannot remove properties from a node defined in the base
DTB, so keeping the /delete-property/ of #sound-dai-cells in base DTS
where it takes effect.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile               |   3 +
 arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso | 124 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts      | 107 --------------------
 3 files changed, 127 insertions(+), 107 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 78518156bc28..00837e145732 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -174,6 +174,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= nord-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= nord-rrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk.dtb
 
+purwa-iot-evk-edp-dtbs	:= purwa-iot-evk.dtb purwa-iot-evk-edp.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk-edp.dtb
+
 purwa-iot-evk-el2-dtbs	:= purwa-iot-evk.dtb x1-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso b/arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso
new file mode 100644
index 000000000000..0929fc0358eb
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso
@@ -0,0 +1,124 @@
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
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pmk8550_pwm 0 5000000>;
+		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
+		power-supply = <&vreg_edp_bl>;
+
+		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
+		pinctrl-names = "default";
+	};
+
+	vreg_edp_3p3: regulator-edp-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_EDP_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_edp_bl: regulator-edp-bl {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VBL9";
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_bl_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+};
+
+&mdss_dp3 {
+	pinctrl-0 = <&edp0_hpd_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "edp-panel";
+
+			backlight = <&backlight>;
+			power-supply = <&vreg_edp_3p3>;
+
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss_dp3_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dp3_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+	remote-endpoint = <&edp_panel_in>;
+};
+
+&mdss_dp3_phy {
+	vdda-phy-supply = <&vreg_l3j_0p8>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
+
+	status = "okay";
+};
+
+&pmc8380_3_gpios {
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio4";
+		function = "normal";
+		power-source = <1>;
+		input-disable;
+		output-enable;
+	};
+
+	edp_bl_reg_en: edp-bl-reg-en-state {
+		pins = "gpio10";
+		function = "normal";
+	};
+};
+
+&pmk8550_gpios {
+	edp_bl_pwm: edp-bl-pwm-state {
+		pins = "gpio5";
+		function = "func3";
+	};
+};
+
+&pmk8550_pwm {
+	status = "okay";
+};
+
+&tlmm {
+	edp_reg_en: edp-reg-en-state {
+		pins = "gpio70";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index 6fc6fe7c0899..92aaec4ddd3e 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -19,16 +19,6 @@ aliases {
 		serial1 = &uart14;
 	};
 
-	backlight: backlight {
-		compatible = "pwm-backlight";
-		pwms = <&pmk8550_pwm 0 5000000>;
-		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
-		power-supply = <&vreg_edp_bl>;
-
-		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
-		pinctrl-names = "default";
-	};
-
 	wcd938x: audio-codec {
 		compatible = "qcom,wcd9385-codec";
 
@@ -205,38 +195,6 @@ pmic_glink_ss2_con_sbu_in: endpoint {
 		};
 	};
 
-	vreg_edp_3p3: regulator-edp-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_EDP_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&edp_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_edp_bl: regulator-edp-bl {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VBL9";
-		regulator-min-microvolt = <3600000>;
-		regulator-max-microvolt = <3600000>;
-
-		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&edp_bl_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -917,40 +875,6 @@ &mdss_dp2_out {
 
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
-
-	pinctrl-0 = <&edp0_hpd_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-
-	aux-bus {
-		panel {
-			compatible = "edp-panel";
-
-			backlight = <&backlight>;
-			power-supply = <&vreg_edp_3p3>;
-
-			port {
-				edp_panel_in: endpoint {
-					remote-endpoint = <&mdss_dp3_out>;
-				};
-			};
-		};
-	};
-};
-
-&mdss_dp3_out {
-	data-lanes = <0 1 2 3>;
-	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
-
-	remote-endpoint = <&edp_panel_in>;
-};
-
-&mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l3j_0p8>;
-	vdda-pll-supply = <&vreg_l2j_1p2>;
-
-	status = "okay";
 };
 
 &pcie3_port0 {
@@ -1070,19 +994,6 @@ led@2 {
 };
 
 &pmc8380_3_gpios {
-	edp_bl_en: edp-bl-en-state {
-		pins = "gpio4";
-		function = "normal";
-		power-source = <1>;
-		input-disable;
-		output-enable;
-	};
-
-	edp_bl_reg_en: edp-bl-reg-en-state {
-		pins = "gpio10";
-		function = "normal";
-	};
-
 	pm_sde7_aux_3p3_en: pcie-aux-3p3-default-state {
 		pins = "gpio8";
 		function = "normal";
@@ -1111,17 +1022,6 @@ usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
 	};
 };
 
-&pmk8550_gpios {
-	edp_bl_pwm: edp-bl-pwm-state {
-		pins = "gpio5";
-		function = "func3";
-	};
-};
-
-&pmk8550_pwm {
-	status = "okay";
-};
-
 &sdhc_2 {
 	cd-gpios = <&tlmm 71 GPIO_ACTIVE_LOW>;
 
@@ -1268,13 +1168,6 @@ right_tweeter: speaker@0,1 {
 };
 
 &tlmm {
-	edp_reg_en: edp-reg-en-state {
-		pins = "gpio70";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
-
 	eusb3_reset_n: eusb3-reset-n-state {
 		pins = "gpio6";
 		function = "gpio";

-- 
2.55.0

