Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604747;
	b=0put2xIH+4v0r6TtE8L8kVMj0PniUMLHloJjk+Ld/GAe0n8U9jjP1QldCZqfjdEjbXwh
	 HDqJwgGEtjzK+/F2E/ImqjSbdy2vfcntNRfiF//ZqLBLTAAuGHg1xBfBO7twWmF7nqF8n
	 OSbuIsLhZisiwfSB1GxEUxgjpsc6qcmO/nBqT4JH+BDbGER3Z0I9JA2OeMc/TEKRfjbJv
	 aUY09MJIjU5h4USt72+iQuBnqStNkYfKtF1bRsXVRI91/zsaih+jl4IaOxqfrhvuv8fg0
	 /KWhFYe8gddrw64CsjQc9FimOiVNORkGvrOADnPpbApywBp2V/PxdFaVfJd1kNjRETw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=MKTzZ8Qs53R2tYrjoAm1b5ienwEDjoMwbXFS4FlUEVA=;
	b=ZVQ0qWsVRu3oxDwuN7ArSK3u/AxljSlZfPz9dj8m2N+7xqmvc5KoaYu+ginyC5GOWk3l
	 Bob03llb6MF9sze9kCL234XXJ3/K18vsdpa08S+9k/R6JRosx8x4/S7hx9Z2K3Qz3Bb0U
	 pF4Vs8zi+ziTPQqCKFMU3VCSutLQMaSJSdBVmXvHyYFlAh6F1MYUFmX4UaI7PXB3VQ7EZ
	 oyvH0LFH9fOTkTZB+O47P0qKFNibta6WMLs2nB2faKbNqJ+UB6h56bwFBenNe7hgs72jT
	 Y59+jupMPXc+9dQqRv0nGL0h8tiLLYQ16LKi9sn6W5zwOtPvNarftTGB/QleqGls6qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="e5/h85mT";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9981606A334
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9981606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e5/h85mT
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso44356425e9.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604745; x=1796209545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKTzZ8Qs53R2tYrjoAm1b5ienwEDjoMwbXFS4FlUEVA=;
        b=e5/h85mTL0ektcUDneo/flB02U+2vifMfzWGA3s8st7g50Mm8rN/O4AEnxJJG/g9If
         BedCJkeMWLRoUQNfq1ge17lofRWXCivUPwdqYerH0aEFJhuniCNoSYETQ8Zxz8WL988V
         j7NvzajNfHlp1w1mvmSLpjHFUHyDqQP0+f9eCO33ixNuqHvDQt3Q2k7GyL+IdPk+tQRv
         hOEeJ+XUOFz+clmcdP5SXEVuyxPMkWtCrnH9LdnBScaid0aKk0NfUbVwlZ47mPbLCaJg
         GnSC1qevtfm+Hc2D1tjPNUiwZpOc5v03LbWA2FnsUc8b0y1HrjD6xjD2lhmkmsOZOUhp
         E0RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604745; x=1796209545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKTzZ8Qs53R2tYrjoAm1b5ienwEDjoMwbXFS4FlUEVA=;
        b=VdtJrEtRmB9jlk4l4/kit8ThyU0Vmk5QjAwK4zcXDS8pqnDrTft8r9o4spSDtK9eoT
         astfI1xqe4DwodRlvYav9XQy8jVUHeF4ViTgDZAvS2IOAs2+GEvmg7iqzcxdJ0ICVvax
         8RSoWuqqI9roBtR3eAWtt92tboySB1t5FV22hpO9BYlu30XtqiDxdJ69JE4jbydYwq6u
         U/V1o5tUBdv6sGZS60b8WMgC0iTWs+Cj+4DDy4phLhIwL3SxGYfujn0LMSdPoXBsKpZG
         D76mQyMSP2JNR+qBenDxc/XzkBfcqxp7ru64HQWE9dY9nf/oRl9XkRVqpTZspSOO7l3x
         NyRw==
X-Forwarded-Encrypted: i=1; AL+hErEEqDsU9ubt8wEd1yNynEU27r3DRIhvmx9JPLY0qGTPkKWbwV5tQ6RxcArHxlw+MGvf8+0no2wEGwGr@vger.kernel.org
X-Gm-Message-State: APuU4Z9Tq+Wwxiqfw+7MtGsdDq7bleRlMSxJ59SogY3SrOIqcHOlKX7Z
	BlobpUlQiDrwD0JvPbNxxMyEISfTj7W0CUJ6BiI0f0yZ5MeszJNDeoGU
X-Gm-Gg: AZFdTZdYwqeAPwbmSgRtNBYE9OjfrWkt6AxLm6O0ykqDqOeRT/pYdCe8rzO2TD/GaUM
	KMXj0n40Dnkxqh4k7Bl+gRGgZHwP7nK59qosnodvmjFQQ8ymKYr1g/ntqXExj+cw7xq2q+FKAA9
	oPIVp69bi0WNRSHvNWypj7sbNUBa5amYF/sNkqbLLi1CT06ro2N7W2sIXriZ1wzPQRze30X/13B
	NWXZNoARS+Ee0x0wdtbv/KY8FvvaI4VyPqw5K+qEUaKdmjASeQDaA/zK8PDSY0wF9j8D24hoz85
	P7KDIHAU0Ex7xdTe03OK/kZIs9Nx6Pz03INhB5kcZhkbkyAA+9/7Q6mWHHCApv4f1OOGNKezkOY
	glBbps1E7uxESOx+Gi/yMYUHnmnAf8L2Q/VeM/lZSQTrjn1vB6oFF6jYOhvOnyXu/dHF8bCiqp0
	M8vly49QpQzdokq33hFxQgzeQYyCi7lteEFsionTnwPbUjz+YngsuCpm2Dar40CSfn3SF1q5CQU
	3cQ7b/AS+ir7Nuhd/56R8qaEwi/Jd99dNK/+TrPPbFGBVt+YhJfB8TRrztwa7bge8F5AOQCi8O1
	VKH/FgeIQzPrjYm68TPOIlNtnLoWxbKHlfy8bLPkPceWZkVYaM+AxnX1FrfvUCL4
X-Received: by 2002:a05:600c:4584:b0:4bb:6c71:b269 with SMTP id 5b1f17b1804b1-4bb8881fbd2mr346466765e9.28.1795604745228;
        Wed, 25 Nov 2026 03:05:45 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:2e3:78df:210d:93ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm201583575e9.0.2026.11.25.03.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:05:44 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 25 Nov 2026 11:05:42 +0000
Subject: [PATCH v9 1/4] arm64: dts: renesas: r9a08g046: Enable TSU
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
Message-Id: <20261125-usb_rzg3l-v9-1-ea14d3ab8a53@bp.renesas.com>
References: <20261125-usb_rzg3l-v9-0-ea14d3ab8a53@bp.renesas.com>
In-Reply-To: <20261125-usb_rzg3l-v9-0-ea14d3ab8a53@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795604743; l=3676;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=cvdbZw2plXx057Ta6XF1i01Ee8kz7WWfrS7n0IZYwyE=;
 b=+6i3FEMJrrnD8FfFXno5km4oX8fjz4IoOlZHDrYI1TZ/pKxBCdu0IC92GrUWkwH/L73msh6at
 2/2tkcwl3+bCn9Wop/hQ1NHyAE7jgOkApqytIM6Nv20sLtqJk6HC10x
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add #cooling-cells to the CPU nodes, and describe the ADC1 (used
exclusively by the TSU) and TSU nodes along with a CPU thermal zone
using passive and critical trip points, with CPU frequency cooling
maps for thermal mitigation.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8->v9:
 * No change.
v8:
moved from [1]
[1] https://lore.kernel.org/all/20260925061617.127349-8-biju.das.jz@bp.renesas.com/
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 66 ++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index b710f47d3f03..241ba7b5da74 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -186,6 +186,7 @@ cpu0: cpu@0 {
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R9A08G046_CLK_IC0>;
+			#cooling-cells = <2>;
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
@@ -196,6 +197,7 @@ cpu1: cpu@100 {
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R9A08G046_CLK_IC1>;
+			#cooling-cells = <2>;
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
@@ -206,6 +208,7 @@ cpu2: cpu@200 {
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R9A08G046_CLK_IC2>;
+			#cooling-cells = <2>;
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
@@ -216,6 +219,7 @@ cpu3: cpu@300 {
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
 			clocks = <&cpg CPG_CORE R9A08G046_CLK_IC3>;
+			#cooling-cells = <2>;
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
@@ -381,6 +385,37 @@ scif5: serial@1004e000 {
 			status = "disabled";
 		};
 
+		adc1: adc@108c0000 {
+			compatible = "renesas,r9a08g046-adc1";
+			reg = <0 0x108c0000 0 0x10000>;
+			interrupts = <GIC_SPI 378 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD R9A08G046_ADC1_ADCLK>,
+				 <&cpg CPG_MOD R9A08G046_ADC1_PCLK>;
+			clock-names = "adclk", "pclk";
+			resets = <&cpg R9A08G046_ADC1_PRESETN>,
+				 <&cpg R9A08G046_ADC1_ADRST_N>;
+			reset-names = "presetn", "adrst-n";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+
+			channel@8 {
+				reg = <8>;
+			};
+		};
+
+		tsu: thermal@108d0000 {
+			compatible = "renesas,r9a08g046-tsu";
+			reg = <0 0x108d0000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A08G046_TSU_PCLK>;
+			resets = <&cpg R9A08G046_TSU_PRESETN>;
+			power-domains = <&cpg>;
+			#thermal-sensor-cells = <0>;
+			io-channels = <&adc1 0>;
+			io-channel-names = "tsu";
+		};
+
 		i2c0: i2c@100ae000 {
 			compatible = "renesas,riic-r9a08g046", "renesas,riic-r9a09g057";
 			reg = <0 0x100ae000 0 0x400>;
@@ -1494,6 +1529,37 @@ stmmac_axi_setup: stmmac-axi-config {
 		snps,blen = <16 8 4 0 0 0 0>;
 	};
 
+	thermal-zones {
+		cpu-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&tsu>;
+
+			cooling-maps {
+				map0 {
+					trip = <&target>;
+					cooling-device = <&cpu0 0 3>, <&cpu1 0 3>,
+							 <&cpu2 0 3>, <&cpu3 0 3>;
+					contribution = <1024>;
+				};
+			};
+
+			trips {
+				sensor_crit: sensor-crit {
+					temperature = <120000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+
+				target: trip-point {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,

-- 
2.43.0

