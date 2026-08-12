Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAC346A602
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 14:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786544401; cv=none; b=aXIhd74b2kt7cD3Sq9uO7cL29zDJoPLdrGbzpNYvmHyErO9Ah3hcOCW2Ch7mWNe1yDoufg5S4o1t13K+sOWbmQXdSnUQtQig0plSczYCsFNkgm6pKaJTqhXDt47/aI0LDVHcRfiVHRmteZN3qcJgdOAM+nW3xzSjHS4PFANC8ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786544401; c=relaxed/simple;
	bh=vGCKx1jO2fnjohxYXmY2u5KREn20DVZ1p2jr3ZYBXLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I54jiiY/6eexJuJalmWTYWk27kMDA7ItwHpTsi9D8XfuJWByDZshiNPrIKnxqoB6DMxrBR2MjE5bw3Z5JVMH43Bs1BPEFiX+xxHpfuiIg/tU7zD862ltNbG8cJ/0t7AQb+P8Q7m3GvWtckYLK3fVn2bZO11OqZNZq6lJ2SR+0lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvpipG4z; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvpipG4z"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4994c49f588so10427815e9.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 07:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786544397; x=1787149197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cxuE3pMnvCOTWKB+kOJcuq7ATx4mF7nI4NvRJRTu1Zk=;
        b=kvpipG4zdUoLzZrP/p/zPXHMou+t9jTZuom0ucmSKMOLtinFu7NhWYSfkhgjkC4Az4
         gNJLGvCkMkDiawQ3E1slIz0LLcZ6fhNx1bQXGLTNYbTkoFfEwend2wIaJ6YbRQnDn3Lb
         QnD3hsMb/n7L6+KONPfTHMvFkWqNbAxUeIQJXWhuSA+w6xznmDkJFlktHNJQiP4IWmxz
         Hx6pgvG+aVecbEOgrY1BPoutnUIu2spAS8DIuiqAt3vStcN3RdurTAk86zSKfdXxURD9
         3kVI3409+x7UwVVvnBGb2VV5ui3w/I782GwnnpYzwnrshF8S3ddHtuUAogHeRZF/yx9c
         cy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786544397; x=1787149197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cxuE3pMnvCOTWKB+kOJcuq7ATx4mF7nI4NvRJRTu1Zk=;
        b=ndg8TiKhJ20kemBc2u29SZ9eqLdBfzbSMMwgIR0H7cKA19UZ1QS5Lz+PLZAY3FSTa0
         HdFOASfc31Vj0oWZyjitUew59OcYQlABsnFa+5XPAYuxcvTw1OOpZclrJPBRCHBHnvnA
         ZvtnuJzhJy/sGG7h+R7osNmUCc74hdfZI99pbkZ+Ooy+BJK2F6N2UDlfDgekxvkw5erp
         x9pUvB2xnRbD84TC7Qinmv1Npxr5WbNCNMUWQ0HRFGiaXGC/ept8us4LTzcyM+euBZby
         yrXVzPaPiDOuB2apy0all65Bnc3DtbL72LlBcVmNAdriRgtGidI4qSul+NxybNT338sO
         i6WA==
X-Forwarded-Encrypted: i=1; AHgh+RpoO6JnQ/egGl8IgDIHw21cdw8o4LxlEiIJx5PTt2IEIj1W57shovAWFiUuIkRYxZzP8WHL/XG3Sga6@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmcwa6VdY94r+MhPhQTXS7k4/1Ra+40rhGKXpJPgP4wA3lH/fN
	8Fdy7nhu7tCoGcOBhQfUs9GO9+6hP28/dApBR7MYvhJhhAv2ljLNcavw8tyLxg==
X-Gm-Gg: AR+sD108p4uBbPpOql69KfE11D+bfZ4maJ6rUiZSoScdDki5oc/psFjKEIjPTJF0MXp
	2d4mWoBlNiE1bi6p5+b2fRoWM7dpYX7ACPa1a2IdGDBUOFiqtBW9WXQ/V2vHCKx3Nuok3bmgkCc
	oL71x44ODPbdYpiFPjkCWcsPKvEpnI/4SUY9hdeB6wKOLvgAxw7dvsLbdfye3odr7yPLw+KmBCu
	rLbnUbFwEV/WRF+jirBCzqsmp4zUxbr45FSOIhidMosMFQ8wdVfPlw11RzB44ZSHV7FZa+QwCLP
	SI4njdV9OKChdR3m6nKXXn+Kho6RfKDDKr7i5kWTW7DVKuWwBztmbuMK1cBzhhJpCkb1MZN76Zj
	KoUXm+Uy2bNGh+wq9HzC1e5bXnZL7PCd1kpyu6QQsPQ5J9L9gmD3O6YlgC6OZfSwGaO0Ov1CTyb
	ydMWGb7ARgKcGuLlTAQB9oS73+XkY/TOIUra7TJ/vBh9iKfcaQHiMMh8pb6b+6fgy71ukxK7VMK
	JuIFPTWTKd1tw==
X-Received: by 2002:a05:600c:1d0a:b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-4997c379313mr56996825e9.1.1786544397326;
        Wed, 12 Aug 2026 07:19:57 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:94c0:1825:d248:50ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997ad78f2fsm47352235e9.1.2026.08.12.07.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 07:19:55 -0700 (PDT)
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
Subject: [PATCH v7 8/9] arm64: dts: renesas: r9a08g046l48-smarc: Add USB2.0 Host support
Date: Wed, 12 Aug 2026 15:19:26 +0100
Message-ID: <20260812141940.246223-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812141940.246223-1-biju.das.jz@bp.renesas.com>
References: <20260812141940.246223-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable USB2.0 Host on the RZ/G3L SMARC board (r9a08g046l48-smarc).

Port 0 (ehci0, ohci0, usb2_phy0) is configured as OTG with
usb0_pins pinmux (USB20_OVRCUR, USB20_VBUSEN) and usb0_vbus_otg
as the VBUS supply. Port 1 (ehci1, ohci1, usb2_phy1) is configured
as host-only with usb1_pins pinmux (USB21_OVRCUR, USB21_VBUSEN),
usb1_vbus_otg as the VBUS supply, and renesas,no-otg-pins set to
indicate no OTG pin routing. The phyrst USB PHY reset controller is
also enabled.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * Moved the patch.
 * dr_mode changed to 'host' as function is not enabled yet.
v5->v6:
 * No change.
v4->v5:
 * No change.
v3->v4:
 * No change.
v2->v3:
 * No change.
v1->v2:
 * Updated commit description.
---
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 96cc7ee46a6a..522cfde4b66a 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -87,6 +87,16 @@ vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
 #endif
 };
 
+&ehci0 {
+	dr_mode = "host";
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
+	dr_mode = "host";
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

