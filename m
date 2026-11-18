Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996406;
	b=OjTAK+FAD5uzNP7BHHVNC9YuXqrXpGhB/eKabIIV/hFWgE0gX3ZqZx66rDV10L3lhzxr
	 Sqdur6HuIn/spKcag9uyqCmL386brxb9ViTBrPTL0YW57dk82QD6vCLJTLxs4xgyjjU4a
	 8uoD67/bV83KUTYmoOjrCZFqGsHhw/FLrfIPCtQ41nDO5SVUM7eq9BbviZvV8Nj8OfDdS
	 PHf8bWO27lkH98X7ri+8hRlgQKDAmhD9ktHA90dAnySnIYMU/6urrNulOita7t11acMgj
	 +LyC+wxtLonJE4LYlEvxlXURPaJuG3yyHlCwAGqPVGn+idgbtn3XnKkXHMlmkCYRMXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996406;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=w+Zp5fYUXpTHENGGEArXBNYqTXx0/SwepjxfieSoHbk=;
	b=qAgvElPecwuGvpSeImoZuTV3ghib0WMYCkDfIAFGZSOT/yOOx6ZHFy0XAWhY1mnSDFbi
	 Zeqv9ZoreggPWeM3iCXXc/rzBjDHyFk8ddIaLtd3aIcbh5NA1wwRrsg35oc5H63YaCXON
	 Qpvw2CQ7A1OYJn66+1SqxAzuXiaOktIG0kBjeMIyJaPAVcw1dExWe2dPJqR5pj44+O5ZD
	 phFDimcvaP0BiQfjPcG2gkxDWQcxwsGmAUN4PeDgY79Y8IdkxxVkqKUMIldW/kBZfFJL+
	 WcsRGQ9XmBV1IyZs5yIte1gmO0oSJP2hun7NJMHaqpBZQbQM/MWDeRmgH3oyBc0mSKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Bc4LnXam;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37811606A33A;
	Wed, 18 Nov 2026 10:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37811606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Bc4LnXam
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0333C1A16CA;
	Wed, 18 Nov 2026 10:06:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CC7135FE9B;
	Wed, 18 Nov 2026 10:06:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9CFD611BC0F29;
	Wed, 18 Nov 2026 11:06:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794996403; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w+Zp5fYUXpTHENGGEArXBNYqTXx0/SwepjxfieSoHbk=;
	b=Bc4LnXamwh12WRr26cHRHMdLSxBfQh4CBDxNoQHTa4xfZ8QwICGQpaEBgfToTF/1J6fWe0
	lj0ufaaK4VQKsrl5OsHmDZw9DcCOjykCvcjRcr179Kz3RbzZH4ZOWa1LEbd5TGasyA8+SC
	uNtsNK4lP13htBCKX+bSYKVfrm0CWb9X8rN8OJuVkSnY56UHzB7DKaDwQTxSFDHB6ybN/5
	POlRNGhMA2KMaUfD1jazF2bvX6kDM7KZgE7BrA9oYHGbM73WpSRxJXn/05dKK82rc17njh
	Dx6yzVHlrdy21JeHC9xd5MtnT7duqpvb6sanV1/bLf+/ngOkOaCdzP/nNYdQmw==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Wed, 18 Nov 2026 11:05:59 +0100
Subject: [PATCH v8 3/3] ARM: dts: renesas: r9a06g032: add EDAC node
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
Message-Id: <20261118-paul-v7-3-rc1-edac-v8-3-ed791084cc19@bootlin.com>
References: <20261118-paul-v7-3-rc1-edac-v8-0-ed791084cc19@bootlin.com>
In-Reply-To: <20261118-paul-v7-3-rc1-edac-v8-0-ed791084cc19@bootlin.com>
To: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 "Paul Louvel (Schneider Electric)" <paul.louvel@bootlin.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794996390; l=1030;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=bjqx9mWsVyVgBUPyTaZqDuanfvJmzUqCelIb9D3jJRg=;
 b=pXwMztftrUVoRpu0lIlphNUPsvtcbzn0ACauG4sULaNgmXDg94ESRJNtxZr1CVAMb7/voAxvW
 65n9rBqAteKD3gqxFgloB0sdo3PurQHPTTHMQhDuECr6JMS6qlEiKwd
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Add EDAC node to the SoC base device tree file.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 5455dccfbdd0..370756014571 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -163,6 +163,14 @@ dmamux: dma-router@a0 {
 			};
 		};
 
+		edac: memory-controller@4000d000 {
+			compatible = "renesas,r9a06g032-ddr-edac", "cdns,ddr-edac";
+			reg = <0x4000d000 0x1000>;
+			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sysctrl R9A06G032_CLK_DDRC>, <&sysctrl R9A06G032_HCLK_DDRC>;
+			clock-names = "ddrc", "pclk";
+		};
+
 		udc: usb@4001e000 {
 			compatible = "renesas,r9a06g032-usbf", "renesas,rzn1-usbf";
 			reg = <0x4001e000 0x2000>;

-- 
2.56.1

