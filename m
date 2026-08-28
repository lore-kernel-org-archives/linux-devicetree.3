Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18516377A8B
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 19:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787945329; cv=none; b=N9eERsos187k/8vvmFfic3N+1oA/EwAAM3+ztAHYekqEc5Qi7KFTsqJR6xcnBZdr4GKMdbosBHM+txwo3zWV4ILXJ3/tPLZiPJwpLclnjYwGpDoPICDAhRTGp1x58LUAZZo7OMsRYpceMS+AghXkw5KX3rfp+6Ykq3Ey/MMuBRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787945329; c=relaxed/simple;
	bh=j2w5aUEY5l5PcMCOdMD3b7Ro/e96y+Uua1Ya77z1t7g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mt/tIAcc/mzKTnSyV4XG6xBkuDlA8wh6/i+KaGktpqY4bVIJuJ2OVuA0DnbdhzByhZzun8AJl6OurPKBgtgpwXaBtukmraoV8TIAmP7LxmMk62i1es4nDAYbmJmR5t0c1sQhGTghobdAMZ8lZOcCKCNN+Ato3awOqPk8gB7qB9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kteZJqHH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kteZJqHH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3610C1F000E9;
	Fri, 28 Aug 2026 19:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787945327;
	bh=HtLBP5lu0u/xa76enarUZIKVSgbStz0fuzGAp2YOXsA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kteZJqHHN2NlJxtytEumk6kkyMtQPbVMI8AyNz8hb3xNSsv+4i0av6R0zjakWcV2Y
	 Bu4aGpog6aC+ongJjAs5TkUK/krciTNERSZSD1/3i0FqrjG3w4YblGRnjH/BtRwMQ/
	 27MPOyulWHoi0EDquUrKwuBEwcHVDbIMnuJ1mawSRbpRwRssCUOtyyX4xa7gtnbWhI
	 CNk9nDRCqbnEaPzK4KNKbEtd5I2iZUI/trKkcWf0FxSQg85AfNwIEl8xkjReHSSQUS
	 CdOIf7chEpbJD0ybItSTyklTlPZSdYMujgqgIiCz6Q5xICE4ungPecQvrqNJPwg6T2
	 xwPgHmpGb15/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: Document Renesas Multi-Protocol
 PHY driver for R-Car X5H
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marek.vasut+renesas@mailbox.org>
Cc: robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, devicetree@vger.kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260828192223.402422-1-marek.vasut+renesas@mailbox.org>
References: <20260828192223.402422-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 19:28:46 +0000
Message-Id: <20260828192847.3610C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The description for `renesas,num-lanes` incorrectly states it appli=
es to "each PHY input", which contradicts the hardware topology and the sch=
ema constraints.
--

commit ae58224156f0a1174aafe97692e6bf7123fdb20b
Author: Marek Vasut <marek.vasut+renesas@mailbox.org>

dt-bindings: phy: Document Renesas Multi-Protocol PHY driver for R-Car X5H

This commit introduces device tree binding documentation for the Renesas
Multi-Protocol PHY found in the R-Car X5H SoC. It describes a multiplexing =
PHY
block that routes five inputs to four separate IO blocks.

> diff --git a/Documentation/devicetree/bindings/phy/renesas,rcar-gen5-mpph=
y.yaml b/Documentation/devicetree/bindings/phy/renesas,rcar-gen5-mpphy.yaml
> new file mode 100644
> index 0000000000000..2da8be2d3de82
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/renesas,rcar-gen5-mpphy.yaml

[ ... ]

> +  '#phy-cells':
> +    const: 1
> +
> +  renesas,num-lanes:
> +    description: PCIe lane count for each PHY input.

[Severity: Low]
Does this description accurately reflect the schema and hardware topology?

Looking at properties.renesas,num-lanes.description, the text states the
property applies to each PHY input, but the commit message notes there are
five inputs and four outputs. This appears to contradict the array
constraints immediately below it which enforce a maximum of 4 items.=20

Should this description perhaps say "each PHY output" instead, or should the
array limits be updated to allow 5 items for the inputs?

> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 4
> +    maxItems: 4
> +
> +  renesas,phy-type:

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828192223.4024=
22-1-marek.vasut+renesas@mailbox.org?part=3D1
