Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D77F3E51E4
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 14:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781274668; cv=none; b=goSsjCYQJLVhcSPCGHrRJIJLiFX8aZMNjIayDW7woLQXPYsXQJCXH/Syu7N1PnvoOVvZAHS2DLNQUx9Cue9/g7bnQPDju0vxZgjT7XzvBEhB2VS42c/337BpKuiStss2HFQiScFayZIgI6jXBsQ6AXAGAifGPOZ76UdnBkGbzbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781274668; c=relaxed/simple;
	bh=yi4QZ7onFO7rfmWZfglcXb1b1476GRHsT0qLwRmf1VI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wvm+530DNLzPAKTkGKOJzAz3S5W/nXOvtF7TNSLx3RniUrsZPvPOoB+8O/1i0vc7PU2mXDp/e47jPc98yyj8eG7RW2kb/xpbstDA4hDq68FobhR2PCNm5/MYOSMq2g0794In2yGGrVPYTIk3DWeI3bkkIvQdC/nrXDyE2kKcJRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5/0B6vh; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5/0B6vh"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-68e5f7c1131so1782655a12.2
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781274664; x=1781879464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eRWVvp9trK+KRbAW+1zCJ07zovSFux9Gr6snmMqyjso=;
        b=i5/0B6vhNb/CXABFTw8V0T/F0ztSTSQhJRX5ODYSnpVjsOWeCsW6N2t1iSDiyWD5yr
         54CpaHVu7krDSINGD+QjhmOvnvEo8f5e7FrXrB5HgP5y7YAIdhTHRwUbkWjwIQ/wl/ww
         z/m93apv0PtG2CeYDLVtfFB+gQI/+YAT/gLFlBI9+03D361p2N4VaeT7lWdLVzTs4yhy
         vVYNPnBekYev7TEMRu/XKQduWghvVyWvYxhtSxhL1HWYnSyypBTYOedER/HAfkgK9kqf
         V/bMvSJBTG3BJUs6zgpCu9keTPN+cNkw4UFk6nuX+TaZEPi73x/noRPLR3UBS8tGoOeq
         wAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274664; x=1781879464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eRWVvp9trK+KRbAW+1zCJ07zovSFux9Gr6snmMqyjso=;
        b=Ue5IHiX/E45eHSndJC9ZwKw38djzresIIVX2zrpdLnqch1TSbSNZ5dxLorkvOcsqkR
         X9on6SLuHtkTB098Gina4DU63wxS7eKY/FUy/USI2DSDazXWBUmNO/h/OL2U+OvjHND0
         v9Qq+SFzv5+ZUyjlVQAm5KZgcPcnWTOJB+rHTtKHV4J8M9SoBmcErH0GOylrF9187J/K
         2gxlCLKcV1U+lP6tnQfOssLRuUyY1tCHmaffvq/UfRI8edCH08BYAXH8zlQnfOd57Ta5
         BmwLLcM38KaZkB6bjCyHsb1OsXqjPmJ1eveH8PIYbqox7W1pPwEBqq7wSRumMrAYtoyj
         BMVg==
X-Forwarded-Encrypted: i=1; AFNElJ99QJHsTshcLCQwiK+jAg+rePyUdXmAs1QkImBfoZx47EIn1xpXhvlAi8vF/PokJyJNhqFz+vL+BESY@vger.kernel.org
X-Gm-Message-State: AOJu0YyJzLcSKSAksJBrfexiE5/+yHExrch/6osek2qu3r1gx1VLUfY1
	grhQdBlOSKI0/ju+u1iNLsHsx6rz3zWQyg9ul/7eorWstKg2JhOFWvbo
X-Gm-Gg: Acq92OG+saqUad9nvINjD/gDqIJ8+KSfAXkV1bqI9SL1qKpLHxybXYBEEq4ufYC5eFT
	B9ZakJj8vUEJvwSAj9jC+LfsNqPpGBlVmzkgvsyhtCCj8z/FQ3ilfrB+bc30gvn2R45teoScC4h
	zCHFUSELh2+KOEx6kq5ODlJNeyqwoRNL2SjsuJWZCqcxuZ8fVQDcknwT3G/VEZmMzqVAocgwzFW
	iKUzkk28utn9J3TDP39QAmQCSpB69yZZTS2nDYmRoAOVfUav3MxS5KHdSRvbEo0pNnw3Q9fml/K
	GYXaJtP+LbjqVjntew87erhejStyhOehBdWu9bQUjlyrLkjNrLYUxwMCxi3mZkT7vt8NaL1MUmT
	PKTIIVzyWS1Ce2YSYOr66bYIVmrvkQ8mPAhRKSofqfW/epms0JdeX4mAAXpdwlTuFZY/NatB4ui
	lTHFBvYT9+WZmfGr1PGnlno5hbLqeC5ynS8DS12ZDoycW2RDT+
X-Received: by 2002:a17:907:97c8:b0:be2:cd33:2142 with SMTP id a640c23a62f3a-bfe28600d04mr162616966b.15.1781274661283;
        Fri, 12 Jun 2026 07:31:01 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c72c:50c4:8b28:9a3a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c3782sm5850016f8f.25.2026.06.12.07.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:31:01 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 11/11] arm64: dts: renesas: r9a08g046l48-smarc: Add USB2.0 support
Date: Fri, 12 Jun 2026 15:30:39 +0100
Message-ID: <20260612143048.317907-12-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
References: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable USB2.0 on the RZ/G3L SMARC board (r9a08g046l48-smarc):

- ehci0/ohci0: USB port 0 configured as OTG
- ehci1/ohci1: USB port 1 configured as host only
- phyrst: Enable the USB PHY reset controller
- usb2_phy0: Port 0 PHY with usb0_pins pinmux and usb0_vbus_otg supply
- usb2_phy1: Port 1 PHY with usb1_pins pinmux usb1_vbus_otg supply,
  and renesas,no-otg-pins flag

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 96cc7ee46a6a..b189ae8e808d 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -87,6 +87,16 @@ vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
 #endif
 };
 
+&ehci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ehci1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	pinctrl-names = "default";
@@ -138,6 +148,20 @@ &keys {
 #endif
 };
 
+&ohci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ohci1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&phyrst {
+	status = "okay";
+};
+
 &pinctrl {
 	audio_clk_pins: audio-clock {
 		pinmux = <RZG3L_PORT_PINMUX(H, 4, 6)>, /* AUDIO_CLK_B */
@@ -259,6 +283,16 @@ ssi0_pins: ssi0 {
 			 <RZG3L_PORT_PINMUX(H, 2, 9)>, /* SSIF0_RCK */
 			 <RZG3L_PORT_PINMUX(H, 3, 9)>; /* SSIF0_TXD */
 	};
+
+	usb0_pins: usb0 {
+		pinmux = <RZG3L_PORT_PINMUX(3, 0, 12)>, /* USB20_OVRCUR */
+			 <RZG3L_PORT_PINMUX(3, 1, 12)>; /* USB20_VBUSEN */
+	};
+
+	usb1_pins: usb1 {
+		pinmux = <RZG3L_PORT_PINMUX(3, 4, 12)>, /* USB21_OVRCUR */
+			 <RZG3L_PORT_PINMUX(3, 5, 12)>; /* USB21_VBUSEN */
+	};
 };
 
 #if SW_SER0_PMOD
@@ -330,3 +364,18 @@ &ssi0 {
 	status = "okay";
 };
 #endif
+
+&usb2_phy0 {
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+	vbus-supply = <&usb0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy1 {
+	pinctrl-0 = <&usb1_pins>;
+	pinctrl-names = "default";
+	vbus-supply = <&usb1_vbus_otg>;
+	renesas,no-otg-pins;
+	status = "okay";
+};
-- 
2.43.0

