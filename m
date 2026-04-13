Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4B5332EBD
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067369; cv=none; b=sjGQZ9Q0icgGE9lxFlOTCBZKVmj/2OLS4aDsf03j947mn86BfpLjvqEszug4nla+vOtJLw86N1TOAZS8g2HSSes/dYLcTh+QIj4Z3don82bw3UA9iDxDuJAeaLXzxVW0RC0hTJCuqAvErgtZsNXt7u2wIfc19JiDQML37MIBgeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067369; c=relaxed/simple;
	bh=eVrkEXLP+791DyS5CNA9zSUQG9FyxWIPqUaZlx8PVx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JygiMZSLcm5WkFEaG66kqDb45Rwwy90/yK8GH4kzVp4v0r6b6ntQtwtu954NxB5FuvhynUL4sXvV4zaz67tDvl8Ac/yIK/ZZR40pI33M+n0B6Vya9z5XKu9poB4Z4Pu/ZM+oIrwm527BbnWvZh3S9NB5+vZ9zIVogzL+sd9Iwlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awIaZizJ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awIaZizJ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so758751f8f.2
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 01:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067364; x=1776672164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J1uRceIt6FZHOLqKiVcTKsVGt2IzySijGuQ2Z2k+iYk=;
        b=awIaZizJtCS1nTBSvZeNWP1O43sz0ySsJWcKvGxYvWDqoJ1nfCqkVy47BHaVvy4Wbq
         u6epnqDgYDuj1WXO2uxtdu+KdpZAo8zaazg1G2xVaav4YqQP07bKQu9PO+Y7KZNYmKt3
         J0tImueuHDMasMwz9rf/QcRlhPUE9pzWcj5MnIXLB1x/2xpuZrvqwJdBBJ+sWogXFLZE
         2pfY4kZ7lZTbtnIY0x5dr1iGPCX6kk4KKwmcntATr00+qEnZTm9UjcVeZ3Z+GrJsi7ld
         orM5Y9A+Zeu/xwTyVM/s3mz089KtwHtpC6FYG2xc4c/W94MUjurFmK280zI/7dEKg1ce
         RijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067364; x=1776672164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J1uRceIt6FZHOLqKiVcTKsVGt2IzySijGuQ2Z2k+iYk=;
        b=SVVEabbndCnoRZbNWBnzBmbKd+BhrOqHEoBMs21/nB7IjcTvf6eoF03TUlGl3VzM0b
         XpgksuCSFDGmtqdZXGxmwtujTO7OiaU8tT5CZ4ZHDcte7gC6p63fV3Irxvb5hDUP4DkT
         XCgT0l8n+YhRTiUrRbfh6uEI09tSq/Msb6BgaXBYQegXbU0dApvtiTWouT4enYUpL38w
         uUNLZHEsJpRfR8rhpO9EeoCZeTDQV7HwmlbYnz22JApPs+YYNXH0rOE/MEnBphL5f4xE
         PPLNJX+IQV0Fkj9/bfkgP8iE5mncFPII7lL3cTZv6bYGJ1yB4xVcC3ynXRgNB9Id0b3o
         ZeRw==
X-Forwarded-Encrypted: i=1; AFNElJ/rKPjzdMB54V9kdijTOiV4w7NYJRZwBHz0vy1RE4uII9gAJWC814ATJr4dPGdZuzMl2oZpR3/GFur3@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp+GcWUR55k1+kofEO5QESDTNCNNHQJoP3TbDqcbQJEjBmOlQW
	absqA5+Rg/JY5/GXiIMOUA3Dwf08FQaxQbTEE9Nx+uqj4RrSmsdIR8Hv
X-Gm-Gg: AeBDiesykEZJJ5o9o0k85+RqbZUipSfeoK58odmZX0kHGSPcGXo3cRMGXGBabv18JWT
	VvcIpfsksXOP2gAhwKiQStqis20jbPURte8ZRWPMIjgeBCCZN4GFrecK8T72R+1s059Knyx9r7D
	Oh9fspHIi8rZc+0t1+osNABR2KqzzZ6kAHP+nUcAZVSz20NgJOB8f8qiGfawsxGlEfOteHEXpCH
	qH1yEjEgBHz0hLMHeYCcnuRSWbDaMofQxFfrWL+XLxHta1cL88yUvL5pF4p3hdk/GpnXFqVugcj
	46mrSL803c+3AKFFGiol9iCDMTvn5kJWk+nz8Mw044YtDoDUTE8A99q8Yb2byxQceaXp8K9359g
	lFRfU+pK5zUxyc/H9roN9B5CawFoo4Z2lXTf38NsLrWzyHOEYywOxXTeoNRO5sKc8MNEn3oh/yN
	wyzYXdUIp32lTay/OU0F0sRR+u/987xNO5vvVU2PClFiKh5JTomaU1ME+CB/ZXL5Xg
X-Received: by 2002:a05:6000:40cd:b0:43b:912c:25c7 with SMTP id ffacd0b85a97d-43d642c4f22mr17696379f8f.25.1776067363780;
        Mon, 13 Apr 2026 01:02:43 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm32155932f8f.33.2026.04.13.01.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:02:43 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 13 Apr 2026 10:02:14 +0200
Subject: [PATCH v8 5/9] riscv: dts: spacemit: k1: add SD card controller
 and pinctrl support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-orangepi-sd-card-uhs-v8-5-c21c40ec16d0@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
In-Reply-To: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>, Vincent Legoll <legoll@online.fr>
X-Mailer: b4 0.14.3

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

