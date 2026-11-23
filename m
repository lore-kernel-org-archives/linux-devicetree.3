Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795433147;
	b=iBvdyFDWYzP7+/Lum0IdzzaltCX/c8vMICXKhCqNOTVvNsfefuHjL5XLfg16lrPB8CYg
	 9md1ZUIvxVKHd029fxmk6RKG26+STAzie+wvq+iA4OuDX/kdqZxk1XLYbdU4spz7ZmYm+
	 Bwe/8V4m/zYt2yee65qJATKVg9nU0eBgJF+9gJe2uIdRPz+5xoC4CNhiyoVpjs7dy3cOi
	 Gor9BiAwdc1+sBFZ/SfcfA3UlukmDNH1Z3PL8/trdHDMXndxQujCiCAa0RR+xCcJDnGHm
	 O9T+ozNqAd3xABlwdA35Ea8F5INnnSR5t8nTqzdRfSRc0ql9tUxi9jykqlE1RETHZVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433147;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=iFZ0PWQVKiQkqOudwBnU9+K/nhj0AUrbePeCCn9dkhg=;
	b=usgSDsMgREjT3wPEdHL+/63BQ4j7fKOyb0UQjrY3z+jyQvQ7Ysw27qT4XiZGyMAV3v2R
	 B6fzeoWgPREgqWHBa3uVLkLIDHHNVCvELKrCFxQZ9cyP7Gmi+uBE0jb/etzaYeyOJxuRN
	 zfwpHBqo8xz7HTmtnTmrivA5AFzUTd9ELzdBK8eEwBUzbQ81Reivu4eOJB6KdSOTCm5AF
	 6v33JIYMz2umdoWkABCIOWZl1phobQV5H8f69i2xqNbR4PeWE66bxWZvSHLgqlTtf3+bm
	 hQfwrxgwtzwNIBKMVVdZur4YPWGZM2rHuHs7KmGkW7B5cwPFTtgBBv2BAsHYX7AY8GQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=JXuixt2q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9808606A69F;
	Mon, 23 Nov 2026 11:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9808606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=JXuixt2q
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id DA4782020E7;
	Mon, 23 Nov 2026 12:25:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iFZ0PWQVKiQkqOudwBnU9+K/nhj0AUrbePeCCn9dkhg=;
	b=JXuixt2qSHm3stvhhzSTUJksk4b7CwsSdmp45JRp5USpu0bHDqaIJgLLX3oghBWvzFrpo+
	62nl88uFxI6e4/GgEE9A2KDaOHgsUltQr/sCDxMg/iMbTbfO1zG6FmSbwWqfYJtghkOsar
	FOyYDLJVYEyGEP+V9E55q7ggdU1U543vJuWc0x9JjBDzh+Y4tBIhEimmaPjfHjhaSj+QUM
	+l7SFB71p6V57J7nIz60uuRurdCPkMHxjkagnXiBBr9Mg6f91JHDxaIkdl4AcZ61/J3TDv
	b79f9N6iSHHbiQqQBofxA0yzA40gxEvHHNj7nuJLpKizlLvjzt7FDrHHoevSxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iFZ0PWQVKiQkqOudwBnU9+K/nhj0AUrbePeCCn9dkhg=;
	b=GZoL0LI6NpALD2b2fuMGKxgaC/yY65lx/ZgErUcGNHIbQIn9M8UvDnzNvl2Ir97mM9+Ztp
	TKqtxa1D04uWxT0v3gBXsve52WYZXO3mnWpYonQofKkAZQzaTMhAC9RTeHvmzyDRvOF8FN
	jXcWwShYCJ1vvKvphP+9zaUx4CyFxB7PJUObeQeisLmtxMH+DbBJEjIiULl/trL5TJ+8/V
	YRXY/Cur9zamPM5ydqXOewi69cVkx1qAUG5uX10Ggd3BdlgXnvyFLvqhBCuXyxs+VYiie6
	r8F3Amlrd1Vtwd9fNq5z6kImN+jVe2r2U57Wc1XOELkScq7/NoT1iB5losQEIw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795433142; a=rsa-sha256;
	cv=none;
	b=DkbzSujDve+LbqaxGyAq6D6NqmI47r1bhQLys5tYYXzwzPPcQdIcweQijsxTHt8/E3UArv
	xpUxdEKoUuSIWCB2sDPiCfmZ55Jttg4NsnytQD6YodoOF8LAbCT9gsbSBODb2qyGUofuL9
	SjwwQFbvGOEJSHbpb1HmlWYlLjtVNXXoWuc4ciZ51Zxt43VmoefxBaP2A6yeKvq2n6WETh
	8yJsdG1fWb3m7OVIR9pFnrpRCNKE+zf+ObHTr4aamt/dT2ewyF0oPA0UqwjH+V6VP/bN7q
	i105NZcDFkwzC8NhsKe1m48HUx4wvR++qd1WG/CT3xvTAF05S4n+6JvvRhmBvA==
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xVSB4-0016XI-0y;
	Mon, 23 Nov 2026 12:25:42 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Date: Mon, 23 Nov 2026 12:25:19 +0100
Subject: [PATCH v2 5/5] arm64: dts: freescale: imx93-11x11-frdm-common:
 Describe USB2 VBUS supply
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
Message-Id: <20261123-imx93-frdm-fixes-v2-5-dd97c7fca4b1@pengutronix.de>
References: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
In-Reply-To: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Freimut Diener <f.diener@pengutronix.de>
X-Mailer: b4 0.15.2

The FRDM-i.MX93 USB2 Type-A host port receives its 5 V VBUS supply
through an SGM2526 load switch. The switch's enable input is tied to
the always-on VDD_3V3 rail, keeping VBUS enabled whenever the board
is powered.

Describe the switch output as an always-on fixed regulator and
reference it from the USB2 PHY's vbus-supply property.

This provides the PHY with its actual VBUS supply instead of
falling back to a dummy regulator, which else triggers a warning:

        usb_phy_generic usbphynop2: dummy supplies not allowed for exclusive requests (id=vbus)

Signed-off-by: Freimut Diener <f.diener@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
index e81b2342c50dc..bde2cab5b0c0c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
@@ -62,6 +62,14 @@ reg_pcal6524_vcc: regulator-pcal6524-vcc {
 		regulator-always-on;
 	};
 
+	reg_usb2_vbus: regulator-usb2-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2-vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		off-on-delay-us = <12000>;
@@ -399,6 +407,10 @@ &usbotg2 {
 	status = "okay";
 };
 
+&usbphynop2 {
+	vbus-supply = <&reg_usb2_vbus>;
+};
+
 &usdhc1 {
 	bus-width = <8>;
 	non-removable;

-- 
2.56.0

