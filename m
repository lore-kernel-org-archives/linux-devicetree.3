Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C408C3932CE
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 07:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065188; cv=none; b=IYo2se03qw1OooPP/KR2foy9a/n2dTSLYe70JrVaWEHYS/kn/ddPv0RKCVrIJlP2ibsWdjzN7dBsXlQxUj90zcWwVcfKqmHdE3DoqxExwQ2wuq8ecTrzLmL2WZIMRSwXMn1Hrs3gRNACv9jxfU7QPCY9W6ZgtXkm/OnQQyKJCOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065188; c=relaxed/simple;
	bh=eVrkEXLP+791DyS5CNA9zSUQG9FyxWIPqUaZlx8PVx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ncQhTpoyLFgphw9eftviPz3+/SXimNh6VnhXPpa38Pj5uLwig9gm4Sz3HyhM/uUUmX/YP6a+F9ybWA3e2yAl5cndc0EUruGaqdUqwvf18nKL8m2gycoigZQYlsdIp8685utvzyCFbKu6Lveie2puBTD41vMNs+SukCbOo8ft+rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sv8tE6wd; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sv8tE6wd"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48374014a77so57158115e9.3
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 00:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065185; x=1776669985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1uRceIt6FZHOLqKiVcTKsVGt2IzySijGuQ2Z2k+iYk=;
        b=Sv8tE6wdcj5EhGJNcv8hHLay6lZLzOqknu4CWsb8j+U9vqBLQyoO1CAcLkt7EhbK7I
         17aFqr82pLR/wLCVeAQ/xCwt74YxjclN19Ei2qDByF3a8QwjkUYQsJjfesIxkMxInwYG
         s6aGA4HIP7eIk2dJ4Uic6tVmdyqowbWCC5p9ChXqjpkTJzMK3gS3TX4BaU+4idz9rKzn
         POWWFIvBsp7oTbxA2i5C7vYzIGuAWndViy/EwxHSx1TEC4LfTorBSQAZzOtz16jB52mu
         kHBM/qXMHjw6QuhDFCz1k2Ky1Q3q1/2pnFZRO3XNRE75hr8qUNNVhhyU3J2zRiSAV3BN
         WwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065185; x=1776669985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J1uRceIt6FZHOLqKiVcTKsVGt2IzySijGuQ2Z2k+iYk=;
        b=Wvnp6g5wgdtPgRDijy7n+S2fCf4Jz4x+5zNXIDrqbS6ahV7qKA9cPupIdmJ/gujFT9
         vuKzEItooPXp3Jf0oPlJvloA/05O8DHZrUkiwgkC0P+yk96YavPdNoLAx7xM0aALWQHC
         APNXLEq3pskjOwVXCwY5UYJHC67NegLS3PiBMVcN0gCVt0IxHyR4XL6U1DDu1r2ZziXl
         5GWWX4B+Tofe1WjD9TZO1vmSFFnef2RTxsKUpFQrAif9/MVWV3cCGTsaIWwACFxlnxf0
         MV0B4B16uWP5xVR4yJzhxYhLBWVeKW/t671vkt1WAR3VFsq6R04touq3rgbGPk6PMY8i
         ECkA==
X-Forwarded-Encrypted: i=1; AFNElJ9YMRCkkO7OD5eZypixSruVrEb5j5djD+m2Y8Cjq7Rx8QWvV7jAA9u3y46Q0CUnmSFiD0jOm0WFsS9g@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/WAkT76e7tcxf3Ok4nKEivcGv997Hk1+2QItdOaN7s+Qw68ER
	r9brBiTiBmE+lCm4hLhVJTTqfsXTRhaoE9Ud5BgI6kIy1T5nBTITH5UU
X-Gm-Gg: AeBDiesVgwItW2pSlFz7XJLKJYCZIbixAZl4Z0oB0awJYj2D8s6R7cQmyZ70bomp8/h
	6AHi+SDa7p7deYPJofumsyyU/im799IzXXtIWjgG8jpcF5HjgxnhynxeUgieobm4dbCrGtHhg5j
	KywMd6bO0ZMjJK4Jg/8myxb4UJ4lBZsq6jviLaNgbaLjCchzlEV0NEvgKzFvZVMpHi1ooz7MtrS
	UsWIjR0s/Rze4ZHWFZY3Vc3k3fUCIfAxcMJ6M0kg0At9fks2MtYV9J2NWDzTdkGTisgr0BrW+Jw
	am6NZnBuOMpEWhrVpPBJWY9YQwERp5Kszd2/FyHBEqEAKcjJPWEFjwesLJzBOYpYoAKGqKpNNuy
	M2W9PdDyP3CGgFWdIMfGNN72EHFL1LXmMe7umFmUKuOoWhbOyiO1SvB1jXuN2xKi0ZEZD+J4xzw
	KJ/oeeOvK9BmB7CIcsUx3NGCg+6/bcN4NO3uXWgFx5qL4BFjckMOq2hEeHYuoUDF8c
X-Received: by 2002:a05:600c:528f:b0:488:a82f:bbb4 with SMTP id 5b1f17b1804b1-488d689d0b8mr164261225e9.26.1776065184991;
        Mon, 13 Apr 2026 00:26:24 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d532ef00sm308602325e9.5.2026.04.13.00.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:26:24 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Anand Moon <linux.amoon@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Vincent Legoll <legoll@online.fr>
Subject: [PATCH v7 5/9] riscv: dts: spacemit: k1: add SD card controller and pinctrl support
Date: Mon, 13 Apr 2026 09:24:47 +0200
Message-ID: <20260413-orangepi-sd-card-uhs-v7-5-16650f49c022@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
Content-Transfer-Encoding: 8bit

Add SD card controller infrastructure for SpacemiT K1 SoC with complete
pinctrl support for both standard and UHS modes.

- Add sdhci0 controller definition with clocks, resets and interrupts
- Add mmc1_cfg pinctrl for 3.3V standard SD operation
- Add mmc1_uhs_cfg pinctrl for 1.8V UHS high-speed operation
- Configure appropriate drive strength and power-source properties

This provides complete SD card infrastructure that K1-based boards can
enable.

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Tested-by: Vincent Legoll <legoll@online.fr>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.dev>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 40 ++++++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi         | 13 +++++++++
 2 files changed, 53 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index b13dcb10f4d6..b3c472a0783b 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -570,4 +570,44 @@ pwm14-1-pins {
 			drive-strength = <32>;
 		};
 	};
+
+	mmc1_cfg: mmc1-cfg {
+		mmc1-data-cmd-pins {
+			pinmux = <K1_PADCONF(104, 0)>,   /* mmc1_d3 */
+				 <K1_PADCONF(105, 0)>,   /* mmc1_d2 */
+				 <K1_PADCONF(106, 0)>,   /* mmc1_d1 */
+				 <K1_PADCONF(107, 0)>,   /* mmc1_d0 */
+				 <K1_PADCONF(108, 0)>;   /* mmc1_cmd */
+			bias-pull-up = <1>;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+
+		mmc1-clk-pins {
+			pinmux = <K1_PADCONF(109, 0)>;   /* mmc1_clk */
+			bias-pull-down = <1>;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+	};
+
+	mmc1_uhs_cfg: mmc1-uhs-cfg {
+		mmc1-data-cmd-pins {
+			pinmux = <K1_PADCONF(104, 0)>,   /* mmc1_d3 */
+				 <K1_PADCONF(105, 0)>,   /* mmc1_d2 */
+				 <K1_PADCONF(106, 0)>,   /* mmc1_d1 */
+				 <K1_PADCONF(107, 0)>,   /* mmc1_d0 */
+				 <K1_PADCONF(108, 0)>;   /* mmc1_cmd */
+			bias-pull-up = <1>;
+			drive-strength = <42>;
+			power-source = <1800>;
+		};
+
+		mmc1-clk-pins {
+			pinmux = <K1_PADCONF(109, 0)>;   /* mmc1_clk */
+			bias-pull-down = <1>;
+			drive-strength = <42>;
+			power-source = <1800>;
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index f0bad6855c97..28949f804610 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -1211,6 +1211,19 @@ emmc: mmc@d4281000 {
 				interrupts = <101>;
 				status = "disabled";
 			};
+
+			sdhci0: mmc@d4280000 {
+				compatible = "spacemit,k1-sdhci";
+				reg = <0x0 0xd4280000 0x0 0x200>;
+				clocks = <&syscon_apmu CLK_SDH_AXI>,
+					 <&syscon_apmu CLK_SDH0>;
+				clock-names = "core", "io";
+				resets = <&syscon_apmu RESET_SDH_AXI>,
+					 <&syscon_apmu RESET_SDH0>;
+				reset-names = "axi", "sdh";
+				interrupts = <99>;
+				status = "disabled";
+			};
 		};
 	};
 };

-- 
2.53.0

