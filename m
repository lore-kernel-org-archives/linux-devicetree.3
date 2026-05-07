Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A089744CAD9
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 17:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778173746; cv=none; b=eTyPDPOuNm1nSOnaysc/coUaJ8Ud0/llANrTuRN9A5nKN9asKi4vWt5KZ4W4XBo4HU1FK2T0ivlLPtuUdVs1JiAswHRCKHSQ6m8gyoht+SKzqNKtIZZZnEoqC5EMT06JOddysFU/BjG4Jy48jxGU02Kh4cFMO1ThjtHMcHrrVVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778173746; c=relaxed/simple;
	bh=fGsX5jTijVhsczN9EAOXSAXuYzgEZRfNrDPIE9zpGUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IPIeEZZKrem8udCUW6XP6rENt9EeWNiT0XlT+oAljD2tC5gkjd6nDdnLzaYBnDN4TYd9reQjWHdU6vypd5gsPgKe+PQ2FT0ziWFVWmHxcftSE8mxTEMAQ8vDCYW9TBtr45MVnMngCHY+7RLxSg0zS0XAMMUrN+Nx5SAP0TCMPFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YDVBFLwU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=amU5tuD3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YDVBFLwU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="amU5tuD3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647GXSSc026597
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 17:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QxELV7B8rD4Ykd/BB9siA3zRacO6nLC0hbHJlnTx08M=; b=YDVBFLwUAzI6xDMA
	59bTBZ3ACuQQwphWvpZtXgG8K2US0EvCqQ7O8o74/jTIWvEsLylG7RWZVGpp2BWp
	8+sGdoAbeVJJKLTd8NuehhwfVAOZIjogUJs3fXNW6tQgUhGG6ZhENZVMo9NOglKG
	xp+BGCal93D8pQ9CeOnaoOOeKfsqsMv9chWS5c1Gg5LKCYk5o3d3MkKPKv7el1qy
	P1tyN7+TT9vO3rdbc5sZ6r/0k7kKZof17A0KF6VDLAbPdgzIwu7x+IqR4lq2Pcyb
	JtQ7oSOH5xFRwjS4YKiq3ZYOBN1NKerPU+eAWzzaMnb5pqCIXQrdS4oZ9fx/qzS1
	fecAKA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1t33b1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 17:09:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba115ab6bbso10411115ad.3
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 10:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778173743; x=1778778543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QxELV7B8rD4Ykd/BB9siA3zRacO6nLC0hbHJlnTx08M=;
        b=amU5tuD31cIHmrIixJuY2y/zJCATLlZw195XeVHm0io6Vheac2/AsgRgERLq9/DWPw
         ldm/AWNkSjPLYJOb8h82sSbwbmzXdmPow6ljSImXHZYGV3z7yBF+kOEedjo8N1u9gecP
         e+YeYPkqBosbdBCXs+IP4zxac3gifgeNRmjmNJLBc70nnHDLM03xkCCfvYcrzn8oS+bk
         SwLLDBDZrPaiwVisfLgPFnQC6XcVLiBL6NT9/jfQc2Afvi4mBif93uBMdWd/H6LRJZdW
         hwhxX4stElIr1h8RexJR/pDUnHuAYQv7Hl9UUnDHv8mjygPU1q7Vm1g578bvrqJGj3/0
         VzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778173743; x=1778778543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QxELV7B8rD4Ykd/BB9siA3zRacO6nLC0hbHJlnTx08M=;
        b=W5e3A6VXsysEowcczhttgDMsiqTUegaKpjAiw7i2O2HiS805p8dnEGFGn3QDMcQJDh
         QHQ6r3Y4qtex2THVdcdFifsAc/EaP9PRy0IvmEw9oFgJuFfWhWb8rgkg2ggebVOJNs9/
         5IDROTx0igtlm/ogS/d0OSCyIL0vkl8z7I605MXaObyN10jmJSbe/Curl2sP9Sw7Vfjq
         gcffXk0OQorfDU11gWU8piSvN9iwLE6Ae4IO10DSGQIqUx1/0AaKOYxtiAdPYsx5VxJP
         go1gEhHtMKU1+VFMOZkKx525BqHLDlLmUV9OBBzxXQekYxQvYPJcQIUAuc8kvVSGHa+H
         56fw==
X-Forwarded-Encrypted: i=1; AFNElJ9p9GebVloBskc7yqg0nvb3Eed2ZpPuRK/CGvjNk/i3FmiI3wp5DNJZghMeYWGMysFNZ/1v4xGWAzgo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9+Iq4g4bL447uLXqZ4nNQ7j9k6vC4c6GlkxcMGeymXJ5VFbcC
	Z2+Z90DQhdpLcYKkxCohjNLolQIeqJF8DgJlvCDS5pBDPjLYyCVMzy7AdURFxCnID2vM2rbogu7
	FsW9Pp/Jv/MEcrjYMIAUL9DELoCQJkEVRVLo1kwLjqrGZmy/zo+3Wx6bzEaB/wmLr
X-Gm-Gg: AeBDieu+nd8PKRl8DbLL9ltqHXKHh9gQXESMuBvxtutF5+42nhm7A+rgdkSGPIui+x9
	4ulsyX8fsZzMC088vg4A7PoemT1p+UgVUMxj1m0w8NMasUcXgFqeEM1lRNfSw1GDZLU9pTGymIv
	3/ZR24AbtGKRTLPkjTSjQuiJuG9XSQmthErsL/NvRdYPNZsqh4UbQE2LnF/lQZU+tkWGZqelubp
	UawYLZF62WmAyUbatz/TdJZBidpxl57CTHLtLtmAPzkfFKKUuOjRInGCVWwDHQkqn81ML5oywBJ
	YtWj9z4zgBwJ6luyuk3mV/vuWwajgevt/aqiLqQGPU2QyrRvBLnlkHnBub9gZKtoiY4tyiYjcsC
	lGWBAsgF8lfzYawIHI+YBXLgJPBk7pnuP3lbX7iPB1Y6RDnw6QG4fcZFOY/ycAIA2XwCOY1fdqJ
	lGw5olG074pNsb/q3oEc/hzoRLzDjkldftuNBJ8Lv4v4rExOVllt3rj6jY
X-Received: by 2002:a17:902:fc85:b0:2ba:c453:ed3a with SMTP id d9443c01a7336-2bac453ef9fmr36359395ad.16.1778173742455;
        Thu, 07 May 2026 10:09:02 -0700 (PDT)
X-Received: by 2002:a17:902:fc85:b0:2ba:c453:ed3a with SMTP id d9443c01a7336-2bac453ef9fmr36358945ad.16.1778173741932;
        Thu, 07 May 2026 10:09:01 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bae78751fesm2530455ad.73.2026.05.07.10.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 10:08:58 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 07 May 2026 22:38:30 +0530
Subject: [PATCH v3 4/4] arm64: dts: qcom: add IPQ9650 SoC and rdp488 board
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ipq9650_boot_to_shell-v3-4-62742b49c991@oss.qualcomm.com>
References: <20260507-ipq9650_boot_to_shell-v3-0-62742b49c991@oss.qualcomm.com>
In-Reply-To: <20260507-ipq9650_boot_to_shell-v3-0-62742b49c991@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778173710; l=11166;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=fGsX5jTijVhsczN9EAOXSAXuYzgEZRfNrDPIE9zpGUc=;
 b=IOafgl7q0CvdEJgMBBtdxuZx7X/Mibhz9G7LkRcijI9RVwz8WOqKwCk/COmEyJPWQbTsknv1C
 vWeV8Ou2itIBW+c7/SdB1kipT8BZTO1xG1iUNl6Ii1bMCuYSHkAEo6r
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=EoPiaycA c=1 sm=1 tr=0 ts=69fcc72f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=fBkTXTPqfNaV2XDYC8MA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: kfwzQZ_HHxMbAumPkP3_KDyqhBxBJTpl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE3MiBTYWx0ZWRfX86vp6lVB4JHW
 nKJHKW8GB5NEfIE+5gzO2OMPqYDOuzLAyDWyqrDyn9l9dVxHYFQC/Gle6ZUfvLhLyXN38WcM4/y
 /OfMJ3JwhDm65APsJnNB+YJoj9okgiy66VEKVUhpxcU1IHLONQ0cuGkEBQ84Ro3/KSPGucu3omn
 0PemkR6gOc1qtDT6MLDts4sRNsqBi83gya6/ADcCTNClCmY/bVJnI6PvGE6lo9czg/fK3uqkW/F
 cZV2V1a+WT4tFH6arASiWG1vwF3mnmEpKQTi6aEHsD8UNMVjayvE3w03fNUtL7gWLtSXy045keq
 Fj5YQIm8rnz8aoodnyzxZwuShWwnJTUiHyBoHY2Pr3umlaTU5FcdJ2iZt+6KdOmvwEgqO09NUlp
 7J76BMm2LYMyb2VYH6Z+NHKmSIi096UUbzLRPGlhHNdFBOndsK0Yj9slxrcHukboaDXedq0ZnO7
 LwzlzCryU5b7xMysR2Q==
X-Proofpoint-GUID: kfwzQZ_HHxMbAumPkP3_KDyqhBxBJTpl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070172

Add initial device tree support for the Qualcomm IPQ9650 SoC and
rdp488 board.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile           |   1 +
 arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts |  79 ++++++
 arch/arm64/boot/dts/qcom/ipq9650.dtsi       | 377 ++++++++++++++++++++++++++++
 3 files changed, 457 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4ba8e7306419..dba16311ca2b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -39,6 +39,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb ipq9574-rdp433-emmc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts b/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts
new file mode 100644
index 000000000000..6871f3dc4eaf
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "ipq9650.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ9650 RDP488";
+	compatible = "qcom,ipq9650-rdp488", "qcom,ipq9650";
+
+	aliases {
+		serial0 = &uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+};
+
+&sdhc {
+	max-frequency = <192000000>;
+	bus-width = <4>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	pinctrl-0 = <&sdhc_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32000>;
+};
+
+&tlmm {
+	qup_uart1_default_state: qup-uart1-default-state {
+		pins = "gpio43", "gpio44";
+		function = "qup_se6";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+
+	sdhc_default_state: sdhc-default-state {
+		clk-pins {
+			pins = "gpio5";
+			function = "sdc_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cmd-pins {
+			pins = "gpio4";
+			function = "sdc_cmd";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		data-pins {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			function = "sdc_data";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+};
+
+&uart1 {
+	pinctrl-0 = <&qup_uart1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&xo_board {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq9650.dtsi b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
new file mode 100644
index 000000000000..a1bea8e648cd
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
@@ -0,0 +1,377 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,ipq9650-gcc.h>
+#include <dt-bindings/reset/qcom,ipq9650-gcc.h>
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	interrupt-parent = <&intc>;
+
+	clocks {
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+
+		xo_board: xo-board-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0>;
+			enable-method = "psci";
+			next-level-cache = <&l2_0>;
+
+			l2_0: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+
+				l3_0: l3-cache {
+					compatible = "cache";
+					cache-level = <3>;
+					cache-unified;
+				};
+			};
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x100>;
+			enable-method = "psci";
+			next-level-cache = <&l2_100>;
+
+			l2_100: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x200>;
+			enable-method = "psci";
+
+			l2_200: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x300>;
+			enable-method = "psci";
+
+			l2_300: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu4: cpu@400 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x400>;
+			enable-method = "psci";
+			next-level-cache = <&l2_400>;
+
+			l2_400: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+
+				core3 {
+					cpu = <&cpu3>;
+				};
+
+				core4 {
+					cpu = <&cpu4>;
+				};
+			};
+		};
+	};
+
+	firmware {
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+
+		scm {
+			compatible = "qcom,scm-ipq9650", "qcom,scm";
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the size */
+		reg = <0x0 0x80000000 0x0 0x0>;
+	};
+
+	pmu-a55 {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &ppi_cluster0>;
+	};
+
+	pmu-a78 {
+		compatible = "arm,cortex-a78-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &ppi_cluster1>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		bootloader@8a100000 {
+			reg = <0x0 0x8a100000 0x0 0x400000>;
+			no-map;
+		};
+
+		smem@8a500000 {
+			compatible = "qcom,smem";
+			reg = <0x0 0x8a500000 0x0 0x40000>;
+			no-map;
+
+			hwlocks = <&tcsr_mutex 3>;
+		};
+
+		tfa@8a600000 {
+			reg = <0x0 0x8a600000 0x0 0x80000>;
+			no-map;
+		};
+
+		optee@8a680000 {
+			reg = <0x0 0x8a680000 0x0 0x280000>;
+			no-map;
+		};
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		dma-ranges = <0 0 0 0 0x10 0>;
+		ranges = <0 0 0 0 0x10 0>;
+
+		tlmm: pinctrl@1000000 {
+			compatible = "qcom,ipq9650-tlmm";
+			reg = <0x0 0x01000000 0x0 0x300000>;
+			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH 0>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&tlmm 0 0 54>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gcc: clock-controller@1800000 {
+			compatible = "qcom,ipq9650-gcc";
+			reg = <0x0 0x01800000 0x0 0x40000>;
+			clocks = <&xo_board>,
+				 <&sleep_clk>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		tcsr_mutex: hwlock@1917000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x0 0x01917000 0x0 0x57000>;
+			#hwlock-cells = <1>;
+		};
+
+		qupv3: geniqup@1ac0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x01ac0000 0x0 0x2000>;
+			clocks = <&gcc GCC_QUPV3_AHB_MST_CLK>,
+				 <&gcc GCC_QUPV3_AHB_SLV_CLK>;
+			clock-names = "m-ahb", "s-ahb";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			uart1: serial@1a98000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0x0 0x01a98000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE6_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				status = "disabled";
+			};
+		};
+
+		sdhc: mmc@7804000 {
+			compatible = "qcom,ipq9650-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x0 0x07804000 0x0 0x1000>,
+			      <0x0 0x07805000 0x0 0x1000>;
+			reg-names = "hc",
+				    "cqhci";
+
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_SDCC1_APPS_CLK>,
+				 <&xo_board>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+			non-removable;
+
+			status = "disabled";
+		};
+
+		intc: interrupt-controller@f200000 {
+			compatible = "arm,gic-v3";
+			reg = <0x0 0x0f200000 0x0 0x10000>,
+			      <0x0 0x0f240000 0x0 0xa0000>;
+			#interrupt-cells = <0x4>;
+			interrupt-controller;
+			#redistributor-regions = <1>;
+			redistributor-stride = <0x0 0x20000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
+			mbi-ranges = <800 160>;
+			msi-controller;
+
+			ppi-partitions {
+				ppi_cluster0: interrupt-partition-0 {
+					affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
+				};
+
+				ppi_cluster1: interrupt-partition-1 {
+					affinity = <&cpu4>;
+				};
+			};
+		};
+
+		timer@f420000 {
+			compatible = "arm,armv7-timer-mem";
+			reg = <0x0 0x0f420000 0x0 0x1000>;
+			ranges = <0 0 0 0x10000000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			frame@f421000 {
+				reg = <0x0f421000 0x1000>,
+				      <0x0f422000 0x1000>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH 0>;
+				frame-number = <0>;
+			};
+
+			frame@f423000 {
+				reg = <0x0f423000 0x1000>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
+				frame-number = <1>;
+
+				status = "disabled";
+			};
+
+			frame@f425000 {
+				reg = <0x0f425000 0x1000>,
+				      <0x0f426000 0x1000>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
+				frame-number = <2>;
+
+				status = "disabled";
+			};
+
+			frame@f427000 {
+				reg = <0x0f427000 0x1000>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH 0>;
+				frame-number = <3>;
+
+				status = "disabled";
+			};
+
+			frame@f429000 {
+				reg = <0x0f429000 0x1000>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH 0>;
+				frame-number = <4>;
+
+				status = "disabled";
+			};
+
+			frame@f42b000 {
+				reg = <0x0f42b000 0x1000>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH 0>;
+				frame-number = <5>;
+
+				status = "disabled";
+			};
+
+			frame@f42d000 {
+				reg = <0x0f42d000 0x1000>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH 0>;
+				frame-number = <6>;
+
+				status = "disabled";
+			};
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW 0>;
+	};
+};

-- 
2.34.1

