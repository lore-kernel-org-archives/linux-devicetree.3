Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425653;
	b=DVKmy/0Osm5o10ExNjRwtv6gLIm09347YBmqWsRzUShJj9G580oc5UekDyJreT90Pog4
	 1nhoAoBJt1MUjN/GzX1fc/m5W7umsExcO87ACtqzcjpbEDWY2EiZKS3GG8LX9Gt+t+n6D
	 QGPFv2iXfHP96x996P8pbINzVDPHNtF+ko39NsL5s/9q65nZjI5VgRGsA7u3ifZKz71sq
	 /bRQtOnMw1a2F4rXzu9UVG+Iki/M1+sxzG25jyyXtPLiTg4EhYDwcIZxWOCAfdXExY2VY
	 Jk/dlBTjrx5Peq+nyz414SAzIeNrh0DZ+fXo5ukPU+zbirr6PQX86wAGXh+SxtNVHPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Ig8NpIwfuVm57PMXnS1/HkeHo8NBh9VYFSj4z2Q3cYI=;
	b=koyvKKvwPVFWCMk55vCfl66bLpcqYhlfrQO2osbP2IsKVpfQcFFp+1mviKgGnpAgmhav
	 71riTOm/i3xJYcWpA2HubV5Pnjlmg+PgPik/06bNFhisHyKoQ6PCDJKxhocM721oxGRMG
	 WdgnBRxR1jw5uGuCvNycevpBG/sIa/jNEpPz7cjMjWyR99PYzoeAIJJgfaRrmPr2659j7
	 L9nSrekrCyQIEuHXTjGpwtxoSx6r2dYNoInQ9pcEWJFpMADtE6iu2TMwe5IMjF8GQci1Q
	 DHqowJhHeAjKDI65kglDPzyBZ8OJ1Oc3Jlh8Q1VfAUcN2PruLT43+zSxol4779mLFCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XauEX3xg;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49EF606A32C
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:20:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A49EF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XauEX3xg
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so29082985e9.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 01:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795425651; x=1796030451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ig8NpIwfuVm57PMXnS1/HkeHo8NBh9VYFSj4z2Q3cYI=;
        b=XauEX3xgxlW+dEF3DNnSm27iF0+ozTlnPxRzOiMcl6S9/btAEDGTTCzsov+NVLufQq
         Je15fmg2xLDNCiUpYaqVvad69kFPJoM0HqinIrFHPQ/cfyKXAtbyCkmuy+6Z0Ic2N/3k
         gCjq83F+eE5lep5hR+Cw9ai40QRPX8uDpf0rbEau5DFj/P+QwWuNqyc3X5Ppc2eGqNjn
         vHsfmtzeVQNz7FUN4Kb68sZ48V/Rz2DOvA2qwfxQliRu0YlNJLqsTL1syx/H2JArAmck
         2N8wwa8aOcZnCAJX+E3sdpFk+om9ALJeiSmkCnuK8U9BMa+5KCmORdWspdkfV/uCeCZG
         eigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425651; x=1796030451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ig8NpIwfuVm57PMXnS1/HkeHo8NBh9VYFSj4z2Q3cYI=;
        b=M7shexYVR3//dhoY3waK2IndGW71iAlBllawPw0PjxdqMdxcZ965nyLgHkd/qiJ1f+
         zswx38DEduUPYyKbf0BIQSucAYf3FmzOYIlls80gIIXTPdNHuo0rpqCFHlNrD9uClmBt
         9mGHwHivkIksLPpJr/hYa0lOTOlxRsH4vPPwxqsOd9RoutOvUWZ7/kHJqmghWsmWS/Wj
         WFzaqRCWEO1CxWkxB20vVUEuxKAWw+vGP8STjjHfoqDKGBe4w42bnq9WVJMdZQR9rtl9
         6wC4QzuHzY1Fb7gHqoyJsAu0P0s9YMoNFLOLSFTW33MvhXelFF1VBJjid1gpjz2yDBZ/
         DnbA==
X-Forwarded-Encrypted: i=1; AL+hErEdxWaLV4faeWlBI5/cOLAC30ZuxxEqp8jYIlo1EBjdddQSLLzS0g3w5t27fAWFacLUlhoPxnvb+O86@vger.kernel.org
X-Gm-Message-State: APuU4Z9vO4ZEDm7Nyc6H3VbaeqJQN0VhwmlozVz3gevz70ly1ZQelztl
	ksWSYgwga2IiG+f0r8pypkFq1/zvAg8Ek6sKaoJGVJHC5RUYpfp1QG32S59g0mWoydY=
X-Gm-Gg: AZFdTZcWRGPi3P3ppwALgTcPM6e/9lzOprEMSTOjYYTfLBkZHScA5wLjcRK7jwjjAvS
	gjAc/TPgmx9CV4b4I8Xr/zOGet8sTPPk+M+hAw9baiU0K3xaZOyJVc+mZ5Vwyv6QKpo1MENJAxW
	tTSjtzsRHyNKoTa2F4AKFH9cQLgdstqAFJaffn35j7yo+08RaBRYbo7Ay7Tr2qzKiS1KT0gvmTL
	AcNgLjCgqDVgZ5AeYC8R2huV5ssZ5yCPqPbCQ6R4ogdfZGBLpXY2EB/SjQJGSyqQ6z7GpoM981G
	FkjbRvXi0kY2rmWoE3+uJaeFy6PlNMOgRKlg532tkgeYcJwJNri7NRNpPo9y65muaZ7DImGuPLt
	nAsxkp5ls8VwBBu/GQa2smJAeM5PeAIH1bsLJ2U5ZCAYlvCKv6ZT7rUBhcsEYEQogunsmvMSBEk
	Wa5HZEG81jVBZYR5k/j7CbiVqMXasqi0/0NzmNILW/7qaBekaQ++DnazHovg1bikcPUJzE82m8x
	WjJLH3QcHaQGCZ0GKwJJ7hM3pNSJPwLUENOiMx3JRs7kIVlP5b+7rt4lN23mEbxlrgxc+xJW7wj
	Z7Z0UeFv9UvPw2YMgcjvMbhgjpIruqGlvOU/jl09khDavi5K8BQfJu9UKPk6kJVNuWUzmU7Bd0D
	AZN7M3Kp77xEGPjakuLOd0PB6691WJrC2zqZU+rg+7yd7oA==
X-Received: by 2002:a05:600c:1548:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4bb88800020mr245433325e9.7.1795425651076;
        Mon, 23 Nov 2026 01:20:51 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm296458505e9.12.2026.11.23.01.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:20:50 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 23 Nov 2026 10:20:45 +0100
Subject: [PATCH 1/3] arm64: dts: amlogic: s7: add the SCMI firmware node
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
Message-Id: <20261123-upstream-s7-clk-dt-v1-1-95f46d67d8b4@baylibre.com>
References: <20261123-upstream-s7-clk-dt-v1-0-95f46d67d8b4@baylibre.com>
In-Reply-To: <20261123-upstream-s7-clk-dt-v1-0-95f46d67d8b4@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

The firmware of the Amlogic S7 SoC family exposes the clocks it owns
over SCMI. Add the SCMI node, its shared memory and a header with the
SCMI clock IDs.

Acked-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7-scmi-clk.h | 27 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi       | 29 +++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7-scmi-clk.h b/arch/arm64/boot/dts/amlogic/amlogic-s7-scmi-clk.h
new file mode 100644
index 000000000000..71630bc94531
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7-scmi-clk.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 BayLibre, SAS.
+ */
+
+#ifndef __DTS_AMLOGIC_S7_SCMI_CLK_H
+#define __DTS_AMLOGIC_S7_SCMI_CLK_H
+
+#define CLKID_DDR_PHY_OSC			0
+#define CLKID_USB1_PLL_OSC			1
+#define CLKID_TOP_PLL_OSC			2
+#define CLKID_HDMI_PLL_OSC			3
+#define CLKID_USB0_PHY_PLL_OSC			4
+#define CLKID_USB1_PHY_PLL_OSC			5
+#define CLKID_USB0_PLL_OSC			6
+#define CLKID_ETH_PLL_OSC			7
+#define CLKID_ADC_PLL_OSC			8
+#define CLKID_CPU_CLK				9
+#define CLKID_DSU_CLK				10
+#define CLKID_GP1_PLL				11
+#define CLKID_ACLKM				12
+#define CLKID_PWM_G				13
+#define CLKID_PWM_H				14
+#define CLKID_PWM_I				15
+#define CLKID_PWM_J				16
+
+#endif /* __DTS_AMLOGIC_S7_SCMI_CLK_H */
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index 64440df4f542..69dec312e7d6 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 #include <dt-bindings/power/amlogic,s7-pwrc.h>
+#include "amlogic-s7-scmi-clk.h"
 
 / {
 	cpus {
@@ -109,6 +110,34 @@ xtal: xtal-clk {
 		#clock-cells = <0>;
 	};
 
+	sram@50f6000 {
+		compatible = "mmio-sram";
+		reg = <0x0 0x050f6000 0x0 0x100>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x0 0x050f6000 0x100>;
+
+		scmi_shmem: sram@0 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0x100>;
+		};
+	};
+
+	firmware {
+		scmi: scmi {
+			compatible = "arm,scmi-smc";
+			arm,smc-id = <0x820000c1>;
+			shmem = <&scmi_shmem>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			scmi_clk: protocol@14 {
+				reg = <0x14>;
+				#clock-cells = <1>;
+			};
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;

-- 
2.56.1

