Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146DE17A2E8
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 02:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785206965; cv=none; b=Fu9fbG02zvfIOiQLhCT6yzh6zvfuDSMzT+8sDxYckBVFnves0yiXCPQ5Slnvowi/k+E5FqgawmKAkNOBExOuvsyAWCKLgotHQ63l6uJ7RFbNKUywc5C/iLLPtIRnZ5tOiEYfYxynDAKBNtFzC4fGe8cpOvFLQa6udUD54lU69tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785206965; c=relaxed/simple;
	bh=RLTBSlbt/LOJRU9vPNR3jnmVXbPZkeZQlXzT4hkRuR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cK8gzMKc+WjrrNh3Z9/sfxZi8XeT3VrrzsON/i+bI44KpIwx4pnm/BRyRDB5+AtSG7hSUC97KeZpDGohCQE6Q9SunRONqq4zMjFlFPMm40B9LUXoKPyJ2LSGnAc7pqf8cX7zr4nyMV7ysDaEhrGjw+EeeHSNQkeT+9+8brnaTg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXt/aUxX; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXt/aUxX"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-664a09bc459so4193846d50.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 19:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785206963; x=1785811763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SL1KTF1x/wzq2M0G3BusIA5VX7FgJc1o5Gt3hpRnCRU=;
        b=ZXt/aUxXmsjd0NZ5gTnP0kAgHDojoTXlYWG34Zvh65DFZL2VN1f+z3JjTvEhgFKJjF
         7foaE4W30QDzhFxs9HLQT3W2XLFWGx7krFJLc3oUhV1zZlyREHPjlY6at2olNED9Fp3F
         NPK875eaFE2ziApFx6u0JCq8OleHln7LYGpgkam95t2gDY3QZrNTzuETFqA6RZck0A2O
         snMyQGOg43BfViNnCsmfXNc7V7UqFbLxSxcjCKmH0vIfFEIGrMmX1vEV2eKOUz6phhsT
         Lo2arFgBcqrBRSGt3JVANfJ1GpbVq2W7cbHYT0NjeEcS97+lHMDrGjXznkAZs3104q5O
         0Cgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785206963; x=1785811763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SL1KTF1x/wzq2M0G3BusIA5VX7FgJc1o5Gt3hpRnCRU=;
        b=gKivAoG2Pb7DaqgDRLZlTSKaigelCmCgMYXRywPGowLiN9dfG9mP1ECTZlY5ceGyPO
         OLoji3ZAZspUGNG9DUkwX4wYjgKJhE5lg1v/xsbmaAIATadl/MkS7cn4/72tqUDWU50A
         wNI9++PdkXgswUABMiPtSsZueQ6s79kPfauM7WJ1VFnSKvrCp8u2SWSswin6TEUG7sR5
         4TSW3TfS0P9IydCauXub6lYbGrmgF7vqgHB/hcJoJdIJcK3V1aPsdbxQUL2IJvL3McRo
         WWfTJ43zLcKCh+nH267DV5eBOSmyF8/Lbqwbziy51JtN8/P77gaCfJA3VoyU5CFbQf5v
         Lkxw==
X-Forwarded-Encrypted: i=1; AHgh+RqUTzxUdiBTraQnEmGHD03XaG8lXwRLvPdrknWJpeqQQzeWHJnxRTMDnOPgCfxRvILhRCtYQoHnjjKW@vger.kernel.org
X-Gm-Message-State: AOJu0YyESaQODlc5k8Ou70sFi1FpU2bnOFMLOGCmfYojhGmXJ7krpmKY
	l7hFXqS897DGcM/S7FJPia4pZg4IUEzG5qUX/EoMCH0ydqRwWdHc+b6/
X-Gm-Gg: AR+sD12Tq6hqUJLyj9essXPeU6LAX9y/Pm1d36v7qlZ8W507o58XfIcG4Jw4xJgV4A9
	Qy1mUIwnowrNsCXev8KX8HSM0lcTesm0lI05TXs6ohHO98UEbQ5oAMR41ewHfpJ9QR4GtnT7OAS
	+phmEyem/XrqVkL0kDukBrI8F2v7jRs+fTrS00J3aRtaq9z83yRBJHQUatrPvbNWxvg2grMFiHj
	2hvZHOx1rA7MZUjZZ/gzUKr9aTl1tCczLCHpn6P8+JCIP4eySHidMQ9uSaKjWilJNcE0xmiH3hk
	k9ZhcNFq+YkxnUAKZwYViU92GwrQj1F0aptTPqBLafXKav0G7USa6qdkzAC9McafHq/40Q0Wi8o
	BDFoxHSfBDg87RRGDYms2f83in89ZihYRthryR+8TkRhC0dQoAv9Lt3UVjApCrqlM1vk09UzmxS
	H028eN3ZDm6imIRiEBVpqmLtgOTuK8vhBcEL3/
X-Received: by 2002:a05:690c:6d0a:b0:81c:e8ab:c4dc with SMTP id 00721157ae682-81f992b6a75mr2515787b3.51.1785206962862;
        Mon, 27 Jul 2026 19:49:22 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:722a:22a9:308b:2c35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f6579f462sm40974847b3.11.2026.07.27.19.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 19:49:21 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v4 2/4] arm64: dts: allwinner: a523: add IR receiver nodes
Date: Mon, 27 Jul 2026 22:49:14 -0400
Message-ID: <20260728024916.993224-3-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728024916.993224-1-utilityemal77@gmail.com>
References: <20260728024916.993224-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A523 has two CIR receivers, both compatible with the A31 CIR: one
in the CPUX domain, clocked from the main CCU, and one in the RTC
power domain, clocked from the R-CCU.

The RTC domain instance's RX signal is typically muxed to PL11, as on
the X96Q Pro+. The CPUX instance's can be muxed to PI8, which is what
the Avaota A1 uses.

Add nodes for both instances, disabled by default. Since the RX signal
of each instance can be routed to more than one pin, boards with an IR
receiver are expected to add the pinctrl properties next to where they
enable the node.

Add pinmux nodes for both pins: PL11 for the RTC domain instance, and
PI8 for the CPUX one.

Co-developed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---

Notes:

v4:
    - add /omit-if-no-ref/ and rename to r-ir-rx-pl-pin (Chen-Yu)
    - take the PI8 pinmux node from Andre's Avaota patch, named
      ir-rx-pi-pin (Chen-Yu); Co-developed-by added and Andre's
      Reviewed-by dropped, since the patch has a new hunk plus
      pinmux node name change.

 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index ca6a16807049..f0b74693da7f 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -155,6 +155,13 @@ i2s2_pi_pins: i2s2-pi-pins {
 				bias-disable;
 			};
 
+			/omit-if-no-ref/
+			ir_rx_pin: ir-rx-pi-pin {
+				pins = "PI8";
+				allwinner,pinmux = <3>;
+				function = "cir_rx";
+			};
+
 			/omit-if-no-ref/
 			ledc_ph_pin: ledc-ph-pin {
 				pins = "PH19";
@@ -327,6 +334,17 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
+		ir: ir@2005000 {
+			compatible = "allwinner,sun55i-a523-ir",
+				     "allwinner,sun6i-a31-ir";
+			reg = <0x02005000 0x400>;
+			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_IR_RX>, <&ccu CLK_IR_RX>;
+			clock-names = "apb", "ir";
+			resets = <&ccu RST_BUS_IR_RX>;
+			status = "disabled";
+		};
+
 		ledc: led-controller@2008000 {
 			compatible = "allwinner,sun55i-a523-ledc",
 				     "allwinner,sun50i-a100-ledc";
@@ -927,6 +945,24 @@ r_i2c_pins: r-i2c-pins {
 				allwinner,pinmux = <2>;
 				function = "r_i2c0";
 			};
+
+			/omit-if-no-ref/
+			r_ir_rx_pin: r-ir-rx-pl-pin {
+				pins = "PL11";
+				allwinner,pinmux = <2>;
+				function = "s_cir_rx";
+			};
+		};
+
+		r_ir: ir@7040000 {
+			compatible = "allwinner,sun55i-a523-ir",
+				     "allwinner,sun6i-a31-ir";
+			reg = <0x07040000 0x400>;
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&r_ccu CLK_BUS_R_IR_RX>, <&r_ccu CLK_R_IR_RX>;
+			clock-names = "apb", "ir";
+			resets = <&r_ccu RST_BUS_R_IR_RX>;
+			status = "disabled";
 		};
 
 		pck600: power-controller@7060000 {
-- 
2.54.0

