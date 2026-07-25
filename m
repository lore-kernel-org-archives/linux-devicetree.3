Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAD1313550
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 03:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784949563; cv=none; b=HhCQAo3MUAvZngZsXNsLTMpFdkTcCC90EA0/qAmFPdhly6RH7mtHyiDhpNWcxNbXgB4pOndQP3m3Ml+azMGlpNhfHRE0V6TAazdksej+9RgfFZBEBsPn+cp62VR8KxfZ52R9Jq751GRHk3UrceRZoS1UntW3ogEFWtKlH6mO1gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784949563; c=relaxed/simple;
	bh=Grthmsr7K7t1VnCPujULIM8MkKQHBQfZ26CPMfOLQdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fl0Suvn1AdOMFZKUzMa2LD5HnkfoNDALIdq6N1dYMePxHhlouhx6Y8TOHo68HMHRaB4zojcXzItTes4AZFR3xLFhMSXUJWJa/RDTjTYBTZsEiRNlhomFtNTvM7XIfQtn2uS++bSEHaoyMeNXWnOzA2wVyVylNEfMViUQJEMCYdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Olwabyp9; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Olwabyp9"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-ca7a25cd87dso1015986a12.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 20:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784949556; x=1785554356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4C2qDdMDmFuAaCYr0SQwKrHQit4QrHO7xfMnvBhehM=;
        b=Olwabyp9LIi1aIrZloIv8qknY2RB1iOLMkMa93a3pF0rC7Xf9PMmo3v+kkj0iIVjzP
         2AJEgS7CY3hBeeSfrlItHp/oE2oRLRq7yZIyLY+1CYFgLAuPKG5xEwf3UMb4kxrJzt+U
         7g4mhVkpRduGxlg2Ws0j3acNuoxChf2Fl0L5HelyeQbi71kviV0c12eL8D+vgpHsyCd6
         zYAjlIrocZY/xCL0d3VMuSDnxhKWWeeMwthmZz2zpy61p1lLaKa1yRyte+w99TNLKpmQ
         P/XRuixXnpQt5t6M5ppiZsL/DbUweo6e9ndVIw3VEXHLwEUjIp77t8fv2CLDuwW9JaqF
         jaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784949556; x=1785554356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e4C2qDdMDmFuAaCYr0SQwKrHQit4QrHO7xfMnvBhehM=;
        b=SUWBSNYw9/YCMSp2wFnXCLTEvJ8lvqlrAjq5eWFxvNVQ+tMh0co7m0sFh4U/j1T9xu
         YfLZ0PaGqNPMa/IlvdYaWcAmz6KL8pjWZHO1gWt+lqzf4n9ng9VvsONxZQhL2XTiXz20
         cb/rUSZJRiszTmu6Ex9rd3OEkmzrSw+OIyx3dXwvHtxwipSRXzSpej84TDurq0Crp+PJ
         WAfoFVj+jPbMajixH6RvyaABRas/LNM37nKwEXbWqwzSgOLMprUoyoWNP5QQ6KYkGTO8
         +gzbBZum0rNHjMjq/2fyo7drGbOGT54QvOGCT5d6jsRdyU4t81em5TE3mXU4DTts6Ev+
         ESUA==
X-Forwarded-Encrypted: i=1; AHgh+Rqa6Fjd4tmeIvlLVuh0iAbDZju8fl6kqRDUtEVkfiPgE+JvjtoMXpJV1tYuh6zRFHAp2F+JJ7D3f7v1@vger.kernel.org
X-Gm-Message-State: AOJu0YyE9a4eoE6BCtaBjR3pF7V1YM7TkNmSRQTfYpUOkHz1W5Ep11E7
	d2q1pjAFaJheiHDVSwNOf8/Jl5uGv0Uu4l4nSb4yHm1x3IPOIOMtHYgH
X-Gm-Gg: AR+sD13+AVHnNAgkVZ67kgDutK4ezAW1cGdx0DEjJALn0FtRzHAIGEq5IfWM7JiUPlA
	hidq7uwwPVvUpVltfsDZw0g1WhJw7M3eT0XWOUt2Ujxu3a9QXHzqzNimBwXQX8yruZGAQecQlYi
	Ug9NExhTgEaoKH1TPSefNwoV8EeS/g7wmR0FFnO3J05jc/fA5Vxrd9c36qyjHdY80acyvAnBH91
	qexUsE226MwI4SVE49Y80kl8X/hgiuvnk68dtTAmfGiHMnQL2jFcX52B/BIGmEXmhT0b/ecg+J7
	u6Cu+VB3uJ9X2Oh7rdyw+puUa0XP9IKbklG1cePjMTWm1eHwKqLrcDDo2kzeGtkIGft3v6FHnC9
	WvN0tR4/HJsumVqb7JIs73ls7pU0MxA6W6K87E7BuJ8GRo+Y9qaBg1wu68tmnNEljew==
X-Received: by 2002:a05:6a00:180c:b0:84e:2d5d:5e4d with SMTP id d2e1a72fcca58-84e595d6eccmr712341b3a.68.1784949555818;
        Fri, 24 Jul 2026 20:19:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:19:15 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:46 -0400
Subject: [PATCH 14/17] riscv: dts: spacemit: k3: add display nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-k3-display-v1-14-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1

Add the SoC-level display nodes: the two Saturn DPUs, the two DP/eDP
controllers with their PHY children.

The PHY PLLs are fed back into the APMU as pixel-clock mux parents, so
updated the &syscon_apmu node in the display dtsi.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-display.dtsi | 156 +++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-display.dtsi b/arch/riscv/boot/dts/spacemit/k3-display.dtsi
new file mode 100644
index 000000000000..4892ee6acda2
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-display.dtsi
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * SpacemiT K3 display subsystem (DPU0/eDP0 + DPU1/DP1) shared
+ * device-tree definitions for inclusion alongside k3.dtsi.
+ *
+ * Copyright (C) 2026 SpacemiT Co., Ltd.
+ */
+
+#include <dt-bindings/clock/spacemit,k3-clocks.h>
+#include <dt-bindings/reset/spacemit,k3-resets.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&soc {
+	dpu0_crtc0: dpu@c0340000 {
+		compatible = "spacemit,k3-saturn-dpu";
+		reg = <0x0 0xc0340000 0x0 0x54000>;
+		interrupts = <90 IRQ_TYPE_LEVEL_HIGH>,
+			     <89 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "online", "offline";
+		clocks = <&syscon_apmu CLK_APMU_LCD_PXCLK>,
+			 <&syscon_apmu CLK_APMU_LCD_MCLK>,
+			 <&syscon_apmu CLK_APMU_DPU_ACLK>,
+			 <&syscon_apmu CLK_APMU_DSI_ESC>,
+			 <&syscon_apmu CLK_APMU_LCD_DSC>;
+		clock-names = "pxclk", "mclk", "aclk", "escclk", "dscclk";
+		resets = <&syscon_apmu RESET_APMU_LCD_MCLK>,
+			 <&syscon_apmu RESET_APMU_LCD>,
+			 <&syscon_apmu RESET_APMU_DSI_ESC>,
+			 <&syscon_apmu RESET_APMU_DPU_ACLK>,
+			 <&syscon_apmu RESET_APMU_LCD_DSCCLK>;
+		reset-names = "mclk", "lcd", "esc",
+			      "aclk", "dsc";
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dpu0_out: endpoint {
+					remote-endpoint = <&edp0_in>;
+				};
+			};
+		};
+	};
+
+	edp0: edp@cac84000 {
+		compatible = "spacemit,k3-inno-dp";
+		reg = <0x0 0xcac84000 0x0 0x4000>;
+		interrupts = <132 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&syscon_apmu CLK_APMU_EDP0_PXCLK>, <&edp0_phy>;
+		clock-names = "pxclk", "pll";
+		resets = <&syscon_apmu RESET_APMU_EDP0>;
+		phys = <&edp0_phy>;
+		phy-names = "dp";
+		status = "disabled";
+
+		edp0_phy: phy {
+			compatible = "spacemit,k3-inno-dp-phy";
+			#phy-cells = <0>;
+			#clock-cells = <0>;
+			clock-output-names = "edp0_pll_pxclk";
+		};
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				edp0_in: endpoint {
+					remote-endpoint = <&dpu0_out>;
+				};
+			};
+			/* port@1 (panel output) is added by boards fitting an eDP panel */
+		};
+	};
+
+	dpu1_crtc0: dpu@c0440000 {
+		compatible = "spacemit,k3-saturn-dpu";
+		reg = <0x0 0xc0440000 0x0 0x54000>;
+		interrupts = <139 IRQ_TYPE_LEVEL_HIGH>,
+			     <138 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "online", "offline";
+		clocks = <&syscon_apmu CLK_APMU_DSI4LN2_LCD_PXCLK>,
+			 <&syscon_apmu CLK_APMU_DSI4LN2_LCD_MCLK>,
+			 <&syscon_apmu CLK_APMU_DSI4LN2_DPU_ACLK>,
+			 <&syscon_apmu CLK_APMU_DSI4LN2_DSI_ESC>,
+			 <&syscon_apmu CLK_APMU_DSI4LN2_LCD_DSC>;
+		clock-names = "pxclk", "mclk", "aclk", "escclk", "dscclk";
+		resets = <&syscon_apmu RESET_APMU_DSI4LN2_LCD_MCLK>,
+			 <&syscon_apmu RESET_APMU_DSI4LN2_LCD_SW>,
+			 <&syscon_apmu RESET_APMU_DSI4LN2_ESCCLK>,
+			 <&syscon_apmu RESET_APMU_DSI4LN2_DPU_ACLK>,
+			 <&syscon_apmu RESET_APMU_DSI4LN2_LCD_DSCCLK>;
+		reset-names = "mclk", "lcd", "esc",
+			      "aclk", "dsc";
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dpu1_out: endpoint {
+					remote-endpoint = <&dp1_in>;
+				};
+			};
+		};
+	};
+
+	dp1: dp@cac88000 {
+		compatible = "spacemit,k3-inno-dp";
+		reg = <0x0 0xcac88000 0x0 0x4000>;
+		interrupts = <140 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&syscon_apmu CLK_APMU_EDP1_PXCLK>, <&dp1_phy>;
+		clock-names = "pxclk", "pll";
+		resets = <&syscon_apmu RESET_APMU_EDP1>;
+		phys = <&dp1_phy>;
+		phy-names = "dp";
+		status = "disabled";
+
+		dp1_phy: phy {
+			compatible = "spacemit,k3-inno-dp-phy";
+			#phy-cells = <0>;
+			#clock-cells = <0>;
+			clock-output-names = "edp1_pll_pxclk";
+		};
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dp1_in: endpoint {
+					remote-endpoint = <&dpu1_out>;
+				};
+			};
+			/* no port@1: the DP TX drives the external connector directly */
+		};
+	};
+};
+
+/*
+ * Feed the PHY PLL pixel clocks back in as the APMU mux parents. This lives
+ * here, not in k3.dtsi: the PHYs only exist where this file is included.
+ */
+&syscon_apmu {
+	clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>, <&vctcxo_24m>,
+		 <&edp0_phy>, <&dp1_phy>;
+	clock-names = "osc", "vctcxo_1m", "vctcxo_3m", "vctcxo_24m",
+		      "edp0_pll_pxclk", "edp1_pll_pxclk";
+};

-- 
2.43.0

