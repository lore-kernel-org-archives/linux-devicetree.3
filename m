Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD1C1465B4
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 16:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786897112; cv=none; b=n7fyer0Y0IoGVvzh8AhOCBM5lqrd3PfKd/GCmqW3L/7kg3thrUURbu7oSSqF97HpjbOzF5I6psO5DE+q4IE+d/wltl0LVWMPa1HEALmabYaOjHgpWCrR2VQaLix/y3E1fJd2vLwtzT5yv7uRVysBntElHPjMqQGmWn3YGMdF0I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786897112; c=relaxed/simple;
	bh=XxUTCMIMu8C+TEdruMBILf3LY/HoOTLaYUL9ZcYI7W0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B74XW1bhE4mJk83SErzs2M7GgQsbUIqC1BvRTeE6njpgO2XNVzL9/cDUq2McWdzh5qatoBcmkMm2BpQmDUdlvZfKC2kqkfjKs6eQrQ6WtprL0iWjMzwmAQe/IRFI3wqQXqnK8NvEE8DTlpl8bH6DymyeNsn1shIscmvF1xZ25PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zkuln0XL; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zkuln0XL"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c96c92c0980so1441953a12.3
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 09:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786897110; x=1787501910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dKbE3PzfYY2Zk5aE09H/yciL/Mmh9UkyoRpEKfSniGo=;
        b=Zkuln0XLLkB1ooP3S19McDkd6aeGtUKu1tJ9JVkccLa7YePkeJqAFyyYe8vZrlFhuG
         Xx4yDAjU6C6z9llju5qlHEvFLME1W+aoTUWRNlPUd91sJatLPeMrClGTH+Yw6l9kQHCr
         NKhlvfS1zThN3IagAXAB2EdHTuZGhBbulu8e3GJAZprHWcewTfFBbIrhy/Q7h6TeQsYs
         +xJPcUKsaFFCNTHekcFw4yPUXZdnP0bsgvsGpTKrT0GWHdDzd8BS4TRWgfJQREwQYl32
         GJM2sT6KvOA1MzjxTatTfHq31fz1dDi2BdEb9gth7AMLfyPjdLAukwJjw6e+C4jnQ4hX
         MJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786897110; x=1787501910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dKbE3PzfYY2Zk5aE09H/yciL/Mmh9UkyoRpEKfSniGo=;
        b=gF7WHQ8ZX2mKM/sZCReWwphEg/oUpeQSes4xH/cD3nErVX4RAl9WQDhB8tP3kiefcj
         aNWWO6lsRsbPeTt3Xt2biROU14NbBhcIbjCVJsxMpQ4UPNbHBNKEeRW208E3bPt5V2/a
         g9Th+iASMzlUhvtOCjMHGc7DX2J63tdhzPmaOPyvhWKnCwOfOxrRGKEcXCGX8ssVVYtL
         i2TwTI1W7lljb9R+Kcbg5ooGXDaB8C+aHAyS0ZzTQTv2MnEF+KHdoy749F2LppMtrCpi
         di9B8aM3nWd3VqimRbk3avqiM/jYQFPi4ks3rqMmh+0eHbR3huDSMKxKXugl/joNFIin
         gkQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpd9iK1SW35SnPUqK4jjhxVQX2LteUxR2EkzAf+CAQfeYTdDp6x9eFG9ZXMFT+v7eM2KagUDK/GrOIl@vger.kernel.org
X-Gm-Message-State: AOJu0YxlIxU3REOCKSrxbaK7gJIWNfmqhsFp2js2V1JMSgLNW76uKqcP
	eFTywBlCj9ERpNTID7Ct2wmaQ9we1sWRn8svrn5ZOi6RIV5Ld3T7XxPt
X-Gm-Gg: AR+sD10gY9saOIfzx4oyRrhbBzafHxShfU4gWp3RQw7ZpY7qzcTGswcs3UDONhLMpXV
	ZNEvZza7pPTpN36Q7a0+L7pNFgTYVZl9FYh4NkpC034wud/y9MGRMNsAxFJbUzPCJyfpe5xOeXF
	wSq9rQtRKXXUEtlxAWZlSTk3VsqaqZMlbaxX9sqlTdFkJotYZNj3GRCQnJJ2pZ67Z+xEAdRBtdI
	2M5O/IksvJgDwVis0o+5dfYjlunRO15Wi+cBIY3znf/RlpLDSY4vBHIQ9cg1kGp4rkyvPihwEhm
	SXGiuiNI75PpqUQBx6LnYnwlGUUmnBLg8ovTf7pVXuzP4EjOrV6fm4yrOZEC8Hq/Ku2sHtHZNcd
	Xb+eyJXmnZm+0isjSmK1heENOkTT6rYwyCcAdva+wuPZZkC8liP0oJm6/3xyjfmr+maWKJG+bPf
	1XGKOj5fC4PTTsAr+S/fKBJurwTCZNCLU1pLRHlCJRQmbUwO4RRzt7aeONASleSVZ9tY8LqB/+Y
	h4v1AuQ4EwIrudkhjek1Bs=
X-Received: by 2002:a05:6a21:8cc1:b0:3bf:63af:85d with SMTP id adf61e73a8af0-3cc71ca38a5mr23637069637.18.1786897110430;
        Sun, 16 Aug 2026 09:18:30 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bd9679sm28969988eec.3.2026.08.16.09.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 09:18:29 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org
Cc: lpieralisi@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v2 1/5] arm64: dts: qcom: Add SM7250 base dts file
Date: Sun, 16 Aug 2026 16:18:04 +0000
Message-ID: <20260816161808.12419-2-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816161808.12419-1-sreeshankar0910@gmail.com>
References: <20260816161808.12419-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree file for SM7250 SoC and SM7250 MTP platform.
This file adds the basic nodes like cpu, psci and other required
configuration for booting up to the serial console.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile       |   1 +
 arch/arm64/boot/dts/qcom/sm7250-mtp.dts |  30 ++
 arch/arm64/boot/dts/qcom/sm7250.dtsi    | 499 ++++++++++++++++++++++++
 3 files changed, 530 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7250-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm7250.dtsi

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f33c4e2f..4b68ed17f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -347,6 +347,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm6375-sony-xperia-murray-pdx225.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm7125-xiaomi-curtana.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm7125-xiaomi-joyeuse.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm7225-fairphone-fp4.dtb
+dtb-$(CONFIG_ARCH_QCOM) += sm7250-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm7325-motorola-dubai.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm7325-nothing-spacewar.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-hdk.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm7250-mtp.dts b/arch/arm64/boot/dts/qcom/sm7250-mtp.dts
new file mode 100644
index 000000000..062b5958e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm7250-mtp.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2026, Sreeshankar K <sreeshankar0910@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "sm7250.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. SM7250 MTP";
+	compatible = "qcom,sm7250-mtp", "qcom,sm7250";
+
+	aliases {
+		serial0 = &uart2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sm7250.dtsi b/arch/arm64/boot/dts/qcom/sm7250.dtsi
new file mode 100644
index 000000000..f942eb230
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm7250.dtsi
@@ -0,0 +1,499 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2026, Sreeshankar K <sreeshankar0910@gmail.com>
+ */
+
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,gcc-sm7250.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/soc/qcom,rpmh-rsc.h>
+
+/ {
+	interrupt-parent = <&intc>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <38400000>;
+			clock-output-names = "xo_board";
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32000>;
+		};
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "qcom,kryo475";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+			next-level-cache = <&l2_0>;
+			l2_0: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x20000>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+				l3_0: l3-cache {
+					compatible = "cache";
+					cache-level = <3>;
+					cache-size = <0x200000>;
+					cache-unified;
+				};
+			};
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "qcom,kryo475";
+			reg = <0x0 0x100>;
+			enable-method = "psci";
+			next-level-cache = <&l2_100>;
+			l2_100: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x20000>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "qcom,kryo475";
+			reg = <0x0 0x200>;
+			enable-method = "psci";
+			next-level-cache = <&l2_200>;
+			l2_200: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x20000>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+				};
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "qcom,kryo475";
+			reg = <0x0 0x300>;
+			enable-method = "psci";
+			next-level-cache = <&l2_300>;
+			l2_300: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x20000>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu4: cpu@400 {
+			device_type = "cpu";
+			compatible = "qcom,kryo475";
+			reg = <0x0 0x400>;
+			enable-method = "psci";
+			next-level-cache = <&l2_400>;
+			l2_400: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x20000>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu5: cpu@500 {
+			device_type = "cpu";
+			compatible = "qcom,kryo475";
+			reg = <0x0 0x500>;
+			enable-method = "psci";
+			next-level-cache = <&l2_500>;
+			l2_500: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x20000>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu6: cpu@600 {
+			device_type = "cpu";
+			compatible = "qcom,kryo475";
+			reg = <0x0 0x600>;
+			enable-method = "psci";
+			next-level-cache = <&l2_600>;
+			l2_600: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x40000>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu7: cpu@700 {
+			device_type = "cpu";
+			compatible = "qcom,kryo475";
+			reg = <0x0 0x700>;
+			enable-method = "psci";
+			next-level-cache = <&l2_700>;
+			l2_700: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x80000>;
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
+
+				core5 {
+					cpu = <&cpu5>;
+				};
+			};
+
+			cluster1 {
+				core6 {
+					cpu = <&cpu6>;
+				};
+			};
+
+			cluster2 {
+				core7 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+	};
+
+	firmware {
+		scm: scm {
+			compatible = "qcom,scm-sm7250", "qcom,scm";
+			#reset-cells = <1>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the size */
+		reg = <0x0 0x80000000 0x0 0x0>;
+	};
+
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		hyp_mem: memory@80000000 {
+			reg = <0x0 0x80000000 0x0 0x600000>;
+			no-map;
+		};
+
+		xbl_aop_mem: memory@80700000 {
+			reg = <0x0 0x80700000 0x0 0x160000>;
+			no-map;
+		};
+
+		cmd_db: memory@80860000 {
+			compatible = "qcom,cmd-db";
+			reg = <0x0 0x80860000 0x0 0x20000>;
+			no-map;
+		};
+
+		smem_mem: memory@80900000 {
+			reg = <0x0 0x80900000 0x0 0x200000>;
+			no-map;
+		};
+
+		removed_mem: memory@80b00000 {
+			reg = <0x0 0x80b00000 0x0 0x1300000>;
+			no-map;
+		};
+
+		camera_mem: memory@86000000 {
+			reg = <0x0 0x86000000 0x0 0x500000>;
+			no-map;
+		};
+
+		gpu_mem: memory@8bc15400 {
+			reg = <0x0 0x8bc15400 0x0 0x2000>;
+			no-map;
+		};
+
+		npu_mem: memory@86500000 {
+			reg = <0x0 0x86500000 0x0 0x500000>;
+			no-map;
+		};
+
+		video_mem: memory@86a00000 {
+			reg = <0x0 0x86a00000 0x0 0x500000>;
+			no-map;
+		};
+
+		wlan_mem: memory@8ba00000 {
+			reg = <0x0 0x8ba00000 0x0 0x200000>;
+			no-map;
+		};
+
+		ipa_fw_mem: memory@8bc00000 {
+			reg = <0x0 0x8bc00000 0x0 0x10000>;
+			no-map;
+		};
+
+		ipa_gsi_mem: memory@8bc10000 {
+			reg = <0x0 0x8bc10000 0x0 0x5400>;
+			no-map;
+		};
+
+		cdsp_mem: memory@87400000 {
+			reg = <0x0 0x87400000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		adsp_mem: memory@89200000 {
+			reg = <0x0 0x89200000 0x0 0x2800000>;
+			no-map;
+		};
+
+		modem_mem: memory@8c000000 {
+			reg = <0x0 0x8c000000 0x0 0xf800000>;
+			no-map;
+		};
+
+		cdsp_sec_mem: memory@9f400000 {
+			reg = <0x0 0x9f400000 0x0 0xc00000>;
+			no-map;
+		};
+	};
+
+	smem: qcom,smem {
+		compatible = "qcom,smem";
+		memory-region = <&smem_mem>;
+		hwlocks = <&tcsr_mutex 3>;
+	};
+
+	soc: soc@0 {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0 0 0 0 0x10 0>;
+		dma-ranges = <0 0 0 0 0x10 0>;
+		compatible = "simple-bus";
+
+		gcc: clock-controller@100000 {
+			compatible = "qcom,gcc-sm7250";
+			reg = <0x0 0x00100000 0x0 0x1f0000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			clock-names = "bi_tcxo",
+				      "bi_tcxo_ao",
+				      "sleep_clk";
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+		};
+
+		qupv3_id_1: geniqup@9c0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x009c0000 0x0 0x6000>;
+			clock-names = "m-ahb", "s-ahb";
+			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "disabled";
+
+			uart2: serial@988000 {
+			compatible = "qcom,geni-debug-uart";
+				reg = <0 0x00988000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+		};
+
+		intc: interrupt-controller@17a00000 {
+			compatible = "arm,gic-v3";
+			reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */
+			      <0x0 0x17a60000 0x0 0x100000>;    /* GICR * 8 */
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 8 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,sm7250-pdc", "qcom,pdc";
+			reg = <0 0xb220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
+			qcom,pdc-ranges = <0 480 42>, <42 612 28>,
+					  <70 63 1>, <71 640 15>, <86 522 52>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
+		spmi_bus: spmi@c440000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0 0x0c440000 0x0 0x0001100>,
+			      <0x0 0x0c600000 0x0 0x2000000>,
+			      <0x0 0x0e600000 0x0 0x0100000>,
+			      <0x0 0x0e700000 0x0 0x00a0000>,
+			      <0x0 0x0c40a000 0x0 0x0026000>;
+			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
+			interrupt-names = "periph_irq";
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+		};
+
+		apps_rsc: rsc@18200000 {
+			label = "apps_rsc";
+			compatible = "qcom,rpmh-rsc";
+			reg = <0x0 0x18200000 0x0 0x10000>,
+			      <0x0 0x18210000 0x0 0x10000>,
+			      <0x0 0x18220000 0x0 0x10000>;
+			reg-names = "drv-0", "drv-1", "drv-2";
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,tcs-offset = <0xd00>;
+			qcom,drv-id = <2>;
+			qcom,tcs-config = <ACTIVE_TCS  2>, <SLEEP_TCS   3>,
+					  <WAKE_TCS    3>, <CONTROL_TCS 1>;
+
+			rpmhcc: clock-controller {
+				compatible = "qcom,sm7250-rpmh-clk";
+				#clock-cells = <1>;
+				clock-names = "xo";
+				clocks = <&xo_board>;
+			};
+		};
+
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x0 0x01f40000 0x0 0x40000>;
+			#hwlock-cells = <1>;
+		};
+
+		timer@17c20000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			compatible = "arm,armv7-timer-mem";
+			reg = <0x0 0x17c20000 0x0 0x1000>;
+			clock-frequency = <19200000>;
+
+			frame@17c21000 {
+				frame-number = <0>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c21000 0x1000>,
+				      <0x17c22000 0x1000>;
+			};
+
+			frame@17c23000 {
+				frame-number = <1>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c23000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c25000 {
+				frame-number = <2>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c25000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c27000 {
+				frame-number = <3>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c27000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c29000 {
+				frame-number = <4>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c29000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c2b000 {
+				frame-number = <5>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c2b000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c2d000 {
+				frame-number = <6>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x17c2d000 0x1000>;
+				status = "disabled";
+			};
+		};
+
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 1
+				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 2
+				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 3
+				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 0
+				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+};
-- 
2.43.0

