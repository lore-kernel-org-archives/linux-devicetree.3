Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309F743553E
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 20:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784751456; cv=none; b=rRgzyXaVD7CpSWaTLQPv5MNPtanlHABMmDBvF42GBnv2pDzZxEA/WYJ0/ZS5+nwepRBHhz7fFfJto2BefoND+HzsViWurXsWK58CZP3vzCTNiqz0jMICYchokKtoFBG8/6mCTXOlS3gzEpB99kTYGCKSpryZLqD/uASKNNZijrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784751456; c=relaxed/simple;
	bh=Cp9Lf1Yb+LwwMCxqi836F8JB2LfT3ogBlX8ZlkfBiaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p8YK53Shum/oXRQDepqeVO7I+KZQ12TSfdGywAikklGujLH40Cx6qPqJWpBcF4Er9JhKC3B2/0pYyXQLt3LTGqsCEZW1RmmHLits1Sl9uqG3lg7feWLix/7kExb032Rc6j15ya110xZxv2StYr7+43GbnMAwV4NZ3vmfTk95Ib0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNMcfjRp; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNMcfjRp"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6682259cae6so6730593d50.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784751454; x=1785356254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7OAXwu1ImBz6RiI92a0ZzOn6X9oEwvXp6jE08Kyy8I=;
        b=lNMcfjRpf1O3DF1LeASG+DHsKXTAiKEMIxjobrnKMu7SzxyzZb+bEcR1qX2XnfWT2M
         rwIU+HensdMKH6pqIH/AXjfYIYlMiDQQsLGlBFPxIeRkJxLiOPoAMum5zfOgzBmS3ecV
         HWJj4/MCGRIh6in17KTZUpDWks5umI7X2m7uOYac1N3/SHT/SPp0/HhewJUkYtER5v8/
         q9RKj4rrvuDHVsiCN7zyJsQkH6ZZNOb2CFzkBNZT2GXaJxSSKPOTEOz4siNA2LywPC0c
         td0H4EUbVZoW6kab2MjO9NcZ7bXMPxB8IItLUWGMLlktQXGtbFYQ144xwob5Q7BQomC6
         DmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784751454; x=1785356254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7OAXwu1ImBz6RiI92a0ZzOn6X9oEwvXp6jE08Kyy8I=;
        b=cYfDuFu1jw8/FfJbzdKuMT616bLQiNeT2cmvbrLeASpJTu5OGbo4vsipU2uu6WDOwE
         KxuqQ1kDntmhXVcwucxNhjps8b2U68EIA7aFIZpGepk+ZNzvpm16g/E1ZLJpDviddihz
         w63B6rFcuhTS+MmxjRU6AEGK0K6tg86UDrJji4+L0NzYkl+M4isfJgIAHp9Wocs7cb8I
         Iv5DBfeGDMR3thLzXUXT8EsCkLJZ/VCUgT1N59kpUXw+QJzOkKTfBCSd/x+v+D2ZtWj/
         87vTLzcBGv1XRyVcqdMnmJUl42bNyK+FulsglFUkl/TxCa+mr7w4hxRKKo8PZYrizbp8
         W71g==
X-Forwarded-Encrypted: i=1; AHgh+RpWoCVcUUZxYsflP6FejGGYSufEJXIdhtYIzRg9IFtB5d2jnrgf9RRMMPfayhPp790JFVNd6xoi+opv@vger.kernel.org
X-Gm-Message-State: AOJu0YyLCb51CyedMcFtkpvwzJHgxX5OjtYOgCbU7Y3VIOUF92tzcvsA
	FI8HC88S4o9TuIzsWrnIFJ+ZOaZlPox6J66pDcNcyGEIs6cRAasr4dLr
X-Gm-Gg: AR+sD10/qBcja6itEJiSeH8Z2FOfSKr0L7TJa9akJ+nBVdF6ZxG5zp0iQXk+ynxIL19
	ZSdrqAvYPajW9OLEq2drnqnHfspMdYEJXoIC2dyk+PyCFuCTItO/DzU0/W7VyZ68VFiZeR/tWQM
	myoNCCNcCtKKthjtnv+qFY+fZWpiMkYboNzjY6fGHr/2xkHePfVgB7xX676ajMQzf+kfqcNva+h
	ppCKR2eXGSdmnU91+LHASvUEeyOlwStVJKZFNrLbfV5o/sPe6G/Vdpi0b7k53QtoTHg4yf9zm+k
	i6Gb1JAT7rAKx3ZwlacuNvjQggr5e+DGYq2TygHVpyAIu0kUTzzClyeq94ztHpOZ5fHQ38pUlXB
	XCBsHAuMkafDXB02TGOX8Gk8kq9d58KUJuHHVgfkfOPgDxlhHIhBiLmV4yY5fS+CLKNDFHYydb0
	D3/NHG15Xhj6gcK+wk7fmmUaV09hgAFkEHxBK1FAKV9euFXpQ=
X-Received: by 2002:a53:cf51:0:b0:667:cf87:5869 with SMTP id 956f58d0204a3-668a4c197f9mr32658d50.29.1784751453933;
        Wed, 22 Jul 2026 13:17:33 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6689056dfbasm1958866d50.9.2026.07.22.13.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:17:33 -0700 (PDT)
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
Subject: [PATCH v2 2/3] arm64: dts: allwinner: a523: add IR receiver nodes
Date: Wed, 22 Jul 2026 16:17:16 -0400
Message-ID: <20260722201717.2205609-3-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722201717.2205609-1-utilityemal77@gmail.com>
References: <20260722201717.2205609-1-utilityemal77@gmail.com>
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

Cc: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index ca6a16807049..19771aac68e5 100644
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
+				function = "s_cir";
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

