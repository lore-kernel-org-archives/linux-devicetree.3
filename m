Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01ECC45D5D0
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 23:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784763380; cv=none; b=pKlUCeMSz0cuYiI0YjhhmWf5VMkg95eQOoNKxLAsoOLBwHdbgujbV2h+xtunOtyOh811lsrtkUFkocwmu3WnMqm5OxZyUwrQrZOPEcFz3VqS4EgyIX3IcujnJ6jf6O1gsVqmrV5ZBa1K5nTuJ/hP9xXWD1QUDD9kONUBiuxeCc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784763380; c=relaxed/simple;
	bh=PI8HEf9PMSu33Ykojy4ZXazIa0qphrPfPQHGrFL4I04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fJDAx4CjTAH+VGwWQ7fnhIB0bpQrKypCqUO2zmOgng+PBW62dpYc3FRJTOfxI1lGtZOls4utYFmpkP1HCGX5XnsT6x7VT0UKsPWBJaE0mKJHb3gEApdoZ+grDC85M/td+NG3YgHv5HaLL9A3VeFo0KV2/7B0ISask3eVmGNgPHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MztaWGmm; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MztaWGmm"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-81e8fa1b8d6so670097b3.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 16:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784763378; x=1785368178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lqOrT9xci3vC0yRAEjJsB/AtSU5bQ1X+i+tu63Bn8bU=;
        b=MztaWGmmHOSWgp3rBkzMJAFWWQlxull6aZF9aSrRNCTI1ff8E+yZ6gr4fhLcUwcfQ1
         fG9l8XjmdsSodNA9v2rlD/OOPOkx+CxfLiskMXnRwB019ki6mzInEzg1QfV4qfNcsgIC
         BsA0mv7yxuPAXu61in2Wg2h1eWEPbOiA2Z5pnPgPLlTers8f7GKB0E1vRhrj3Akh+2wM
         Qzy0+8taa5Tzlhs0WJQljhsuYDg2YPu9LLOhIxD3Onr5wPzeJOK3xXo3Im+sslFK+AXJ
         eCRgJ6ivNmR6oAJsmfdV76fbi/+eXpqJtaWutaH0GWp7s0JqD6ERpH4Uq4qcaayU8P3K
         zkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763378; x=1785368178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lqOrT9xci3vC0yRAEjJsB/AtSU5bQ1X+i+tu63Bn8bU=;
        b=lcYTvUiO78lMAxwyW/MPqtfEP0lAMB/RlaaKxQfawRqEtEBotBo7VtP9bX3+K0Dktk
         Sdb2WSv4U2Fl2otrImDVv8zK8pvnOc5J7neL1z/71DEXdOcspIvDiNduK/gt3UBtHTfG
         Uv3gc5Yz9uZPTTXX2cUO4ulMtR4jqjMpQLPneMXKA/t8uWoRziE1DoEVgXiijD6poMtx
         sYtC30Jbqz087T5ZzcQdg2rV3NFw1xqffGGy7slHgOyM0/nNIhGzhPiShvjRQQuwO+8/
         +OFUyt+Iwb6ide0QVKouXAqClHATQBTd3Y/1w3pGHAtJztFd/sXr9MnGDTgv1PqJ3dRp
         Fkdg==
X-Forwarded-Encrypted: i=1; AHgh+Rr72dd+zQufQfplg8AW+cTYtAp5NR0+zkuaGLvEvv/2w2nlWinfvZ8uJ0DsArGn+Oa05uf3Te6wNpo+@vger.kernel.org
X-Gm-Message-State: AOJu0YyF1XmVjJgKiItDGsUjtRzwUhbL9UJh0eFmmFDM5HO5chxxRflJ
	9bjYqmjf41Ps8ZuQRJgx9OMxcgZDZOK0BHZPAVznTqzXMXVpxMegD+Pm
X-Gm-Gg: AR+sD12lWl6fxb+uXpZ55SXM3t8oo+pGKjcpN3LMPml0VZcRGikfYR1/PW79iaLNaaK
	tfcFVxkdqI3KkFWIr3xcxrbNan6W6K8AFb/736dgR8rYkuN6SoJSVeY3JqOha27PvMduTW/4fZQ
	fVPdjkhlAW9ehVHEVReVoPUjXs3aD6qPDMg8dXjor93+oS3AYa9S7T/iCHaSNGJDh9ZAlcsBgJu
	FukOVGEKqg3dKoInPvmC4KX4XNr0aV/MVlszRqHQ84g//FPFmGqSU1HHCTPF3VKA/fPOpNQTvGM
	LCJpKCrLWPAgLH9tDansdyxoH0kQ/cXLYXrPZd0ZvpdtuH6zPoV2c2/t/1nOeJLxdjvS4fn9xXE
	POi1cXDnID/1n4Oh+f/8ymsSS3il4PvZ+jHtDS4QgELTZnuap0+X4UgJ+II5oIf5U5Lp0UvVrsM
	nyCQCTW/VnW34lo3qtKvqFBDaYpLUOVPxsLBvK
X-Received: by 2002:a05:690c:296:b0:80d:66b2:850 with SMTP id 00721157ae682-81f4c2b5753mr2162297b3.42.1784763377901;
        Wed, 22 Jul 2026 16:36:17 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33c627c9sm20937027b3.19.2026.07.22.16.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:36:17 -0700 (PDT)
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
Subject: [PATCH v3 2/4] arm64: dts: allwinner: a523: add IR receiver nodes
Date: Wed, 22 Jul 2026 19:36:02 -0400
Message-ID: <20260722233604.3001063-3-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722233604.3001063-1-utilityemal77@gmail.com>
References: <20260722233604.3001063-1-utilityemal77@gmail.com>
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

Add nodes for both instances, disabled by default. Since the RX signal
of each instance can be routed to more than one pin, boards with an IR
receiver are expected to add the pinctrl properties next to where they
enable the node. Keep the PL11 pin description in the dtsi, as boards
commonly use that pin for the RTC domain instance.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index ca6a16807049..c2de662140ce 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -327,6 +327,17 @@ ccu: clock-controller@2001000 {
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
@@ -927,6 +938,23 @@ r_i2c_pins: r-i2c-pins {
 				allwinner,pinmux = <2>;
 				function = "r_i2c0";
 			};
+
+			r_ir_rx_pin: r-ir-rx-pin {
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

