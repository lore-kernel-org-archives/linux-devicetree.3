Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415E0436BF1
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 16:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442241; cv=none; b=edgrCLO77HXsidynJuYhSqEjzHvlC961aDSDWx5XJ3xFSoWg8yUGctvg4oParN7y6RmbUsiKc/oXGG4i+fjqMuvmEPnV3PeqBRetAz8yUXLBJTKzf4LUsT8VHa+bObKk/TJTYWeNQiXx5Ni/H+9OyPy1dOcwqHiMsWrYFJaivfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442241; c=relaxed/simple;
	bh=Nbtqzz+dZVUyf1v2UGy7V3O9+oz0T37ydqh5TecULoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FvxiTZCJyZQaZSDyUntERRKTR9QX6vVAQCJafXYGn5T0kK1yvXTjIhmEzXHmu9PZ0wr0sSjZBSHTchl35vmlWaxyZRSxaTkZBG8bYMMN1BMxKqoho8jAjmxwjBoVZDZHKMAoVc6bCqel+2yEBUSGNQDCwgQrNoZwE50Eh5uRkOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lZDzziXs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C7QYIscm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lZDzziXs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C7QYIscm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FT7x34045085
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 16:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bGb/NbfNTIp
	CUdOEEOTcmP0Hr63dnzZeDHFZIS6E++8=; b=lZDzziXs7w0EKzIfFmHaHQhC9eN
	QQR2zotJbEKNzEzcnDwTHekXN/AWgix1c+OQnPtmL3Hhego5LgqKXb7NXoRGGn3n
	ZPQmiQGJ2MAOSl7VFVhxlai/lqZOzBdhXo/EP0JmZ69rs7Ug/xOyU0NE8nEUZXan
	tf+EfyduWvJ/0I9NZykKufBkc2cps0Uc7kz1G6kC9M+dvVK9LhzBdD5NKvZoFOcX
	hfSwKu/31GWJlXVhyHTBRqPAXBbP0udXcoQcMS+ys3ZwL248TqKOkFEjAog2Gspg
	eVsMPcb72C6mI2eOUHeHxShfkneCa6yWHlSH93GGb7z3Sjv0eq1FKIkci0g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w2ua9aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 16:37:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c2af04aeeso11048851cf.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 09:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783442237; x=1784047037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGb/NbfNTIpCUdOEEOTcmP0Hr63dnzZeDHFZIS6E++8=;
        b=C7QYIscmFfTKJRcpobwos2XEExFDqiKgzPo3nxeLVx0wRG1xveHUWg9sT9Hb86267d
         cyj7aNNZCTNmmuTUNVY4wVw3lrj6xPhS2eZrU0+8i9d0ZWtoKwsdBcXTIUzoQTIhOSHr
         ZVWzybGC453rU1EujdvkTpbLhemTF14n1dsKWobxGkuCt4u1pL8qf7MigVzUAGhCHgUA
         WPeBxfsAVSOEIDed+gBINEV+gR8W1/v1JukEmCs0e3WWyf77fNyZb4XRBMdjd0x5nyzY
         zk9Mrsad93aJSrP7W8+yBvEwpvnae0WgFUfiHoCKbvctob3xrf9Af5fHp738wCu3ZL12
         UpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783442237; x=1784047037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bGb/NbfNTIpCUdOEEOTcmP0Hr63dnzZeDHFZIS6E++8=;
        b=KC24fjNLfOKog+fpJX49yCwTOehJmRxHmq5k+00gqVWcJ6YNUKxcO0jpzo7YvtcRWd
         w3nRFr1cokOM0udECrpgigeIcCPf06yi2j0uiygJqKPzcIIs4RmKcO5mKEv/5Nr0m+FF
         mZd6b1dcyMoEAdypCCgGsUDGiugR3d+veupb6CKLr5xFNZ3IS+LqSJdjBaSoiS8VHVs0
         iaizhpwOtMdy7KB0BUwWCpSYdBw84J5ZOpTiM8ksE/fwnRKQnMJ4sCQYs5OZnC2GaRKL
         t+S83ZiPn8u8Q2KUwlOYn0cdgpAOhpdhBMs9y7n+f15IRvu//nfXcvR1i4bd+44hS49k
         malQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpng9nsvw6FXCO8/ng74ZFZUFtjwCxg7EmyAif8E/AI1/Ic0imwCvQ5HQKlxhkPIBkxb8LILG8o0VAC@vger.kernel.org
X-Gm-Message-State: AOJu0YzBfNyy4kMZfwjRzba8Kg4q3R8ZdXozRbjVejL2JoTOz9+aB6Zz
	fUQqT7AZTaB0TyE0QMmEdA6XXCbmJN1IR5y59/BLqSbDz1cKjiaUYeD20jyLgnWJSKhl5DCDFbM
	Dr/iA5Kk0sKpJZD2mODTxO3MRb7XMRvCKNBNXuU6v1wt61HlmWj1gLnJhhHfsIT+/
X-Gm-Gg: AfdE7cn4llsWC/lURKySQsY6OWWZ8co8uwlFHOynLAJhI7S8N52tpVreBkDQDTVErVs
	tDM7IiFaj1DdgKeYAdADOs+rPcRrP5RBFaMlW9iQWt1OgBCXELc/t0iBh35wPTq2QxEEblEfn9k
	yAMvE81lrU1CwrPTvfpJ0GJYbESlcyvjcnWJCPCHbSXrty/osyfhGhgBxV6WoG82bAu7++q29KD
	Dmns+EaCzgIs76JpboQLVxtiMpXDSThwrdA7xy0Uer7fn/AlqgMFaIyjj42lP3CSxAKXUEIQ8n3
	brcSV6JvhMTBAHFDA5wZGdIZNclVTDw4mpojQkjgQanD9QbJ4iryafHzUX0AbV5Iua3IqDsqYpq
	hqhF5wpDA+kjbt8aJb/ehz6F3
X-Received: by 2002:a05:622a:2296:b0:516:82e2:7788 with SMTP id d75a77b69052e-51c7a46db9bmr35265241cf.1.1783442237385;
        Tue, 07 Jul 2026 09:37:17 -0700 (PDT)
X-Received: by 2002:a05:622a:2296:b0:516:82e2:7788 with SMTP id d75a77b69052e-51c7a46db9bmr35264701cf.1.1783442236823;
        Tue, 07 Jul 2026 09:37:16 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f2186bsm34627699f8f.36.2026.07.07.09.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:37:16 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/3] arm64: dts: qcom: monaco-arduino-monza: Add overlay for Waveshare WM8960 Audio HAT
Date: Tue,  7 Jul 2026 17:37:03 +0100
Message-ID: <20260707163703.233405-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE2MiBTYWx0ZWRfX23eC/t8/j2ix
 yqCo9DxiIFdHzB4HFJ4cdTLZWhJ0fMoHCdCkS2pPywULZdOtrfoL6eWvenqNhPPlmCa/A59A1qy
 4K1zO7T+OHQLsaa9FaW/V/CGW0pnr78=
X-Proofpoint-GUID: HFUnl8z0Xf4uI-OJSLIuwXDyRBDdwq-g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE2MiBTYWx0ZWRfX/gchIWuOJxYv
 +el3E5UCKAtz1ohXUgdkXi8TzXbIGLrdh757AqlEOVmGnwACiZU8xXrfX+DVJY6N59yfeeEqAhb
 s7mIxcuhlQwXYlFU5xTprkHel0jLmPKOj6ndRQoMsEH9wdxLZEJ3yR7kZnWnNXmgcDpt1enAbDX
 KZ2oo2QmWwGOs8al6zAD9SEgIg6lZ1reu44byp+QxfzPMSvHzRwn+/Z7CHbzcQE9JfoL6ReaEoG
 XvTZdYI85doJ/OxRBoQtcl4St2rtXnMnThSbRyp/tFOGMEwbyKa76+OZJU2/w3BVVuthM3AONPC
 TC+N8U5KR9QczaYMUflJfvfmcY+2EzyqMpel+YzzvMrQxVICjvLJW6p5m03aWJQ1J+2a3xKJXNL
 LPH4La86T4Egm2zuP9/X0DUVTdQEoivNOBzusdeMiu2SLMLeNDS0+8j62bMC0rT7gZuGbcd+v5x
 QReID01WpqQixivXM8A==
X-Proofpoint-ORIG-GUID: HFUnl8z0Xf4uI-OJSLIuwXDyRBDdwq-g
X-Authority-Analysis: v=2.4 cv=bPQm5v+Z c=1 sm=1 tr=0 ts=6a4d2b3e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=PXIoQbnlezZRnfWnQ40A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070162

Add a DT overlay for the Waveshare WM8960 Audio HAT connected to the
40-pin JHAT connector. The overlay adds the WM8960 fixed MCLK clock,
the WM8960 codec on I2C0, and the corresponding I2S1 playback and
capture DAI links to the sound card.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 ...uino-monza-waveshare-wm8960-audio-hat.dtso | 100 ++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-wm8960-audio-hat.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5a1c56cf98f6..27cce61893ad 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -59,6 +59,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza.dtb
+
+monaco-arduino-monza-waveshare-wm8960-audio-hat-dtbs	:= monaco-arduino-monza.dtb monaco-arduino-monza-waveshare-wm8960-audio-hat.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza-waveshare-wm8960-audio-hat.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
 
 monaco-evk-camera-imx577-dtbs	:= monaco-evk.dtb monaco-evk-camera-imx577.dtbo
diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-wm8960-audio-hat.dtso b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-wm8960-audio-hat.dtso
new file mode 100644
index 000000000000..cf7b6a220bab
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-wm8960-audio-hat.dtso
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Device tree overlay for the Waveshare WM8960 Audio HAT connected to the
+ * Arduino Monza 40-pin JHAT connector.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
+&{/} {
+	/* on board fixed crystal */
+	wm8960_mclk: wm8960-mclk {
+		compatible = "fixed-clock";
+		clock-frequency = <12288000>;
+		#clock-cells = <0>;
+	};
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wm8960: audio-codec@1a {
+		compatible = "wlf,wm8960";
+		reg = <0x1a>;
+		clocks = <&wm8960_mclk>;
+		clock-names = "mclk";
+		AVDD-supply = <&vdc_3v3>;
+		SPKVDD1-supply = <&vdc_5v>;
+		SPKVDD2-supply = <&vdc_5v>;
+		#sound-dai-cells = <0>;
+	};
+};
+
+&lpass_tlmm {
+	lpi_i2s1_active: lpi-i2s1-active-state {
+		clk-pins {
+			pins = "gpio6";
+			function = "i2s1_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		ws-pins {
+			pins = "gpio7";
+			function = "i2s1_ws";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		data-pins {
+			pins = "gpio8", "gpio9";
+			function = "i2s1_data";
+			drive-strength = <8>;
+			bias-disable;
+		};
+	};
+};
+
+&sound {
+	pinctrl-0 = <&quad_mi2s_active>, <&quad_mclk_active>, <&lpi_i2s4_active>,
+		    <&lpi_i2s1_active>;
+
+	i2s1-playback-dai-link {
+		link-name = "JHAT Analog Playback";
+
+		codec {
+			sound-dai = <&wm8960>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai LPI_MI2S_RX_1>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+
+	i2s1-capture-dai-link {
+		link-name = "JHAT Analog Capture";
+
+		codec {
+			sound-dai = <&wm8960>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai LPI_MI2S_TX_1>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+};
-- 
2.53.0

