Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A054218A3
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 11:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780572363; cv=none; b=IYaIxilvResJT20QBBYyyyDu9PBqTRsAi8D2/DYcZAbrRXHzwcIO6ZdejYGAxKAEcgG+iDEgYZEJMZhXB7f/iW2GzWiSiI9y5//gmNHXV4vmjJhEr67iE/SsF4VNno4OL50Pk+cxAjaA1IMB2OMx+KAxXWMCXbtmkAYqq/r7xC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780572363; c=relaxed/simple;
	bh=wJ56C/wcQJPDxuUDZ90edipAb4LR0TDl/DC2PrSenKs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZaBnanlMxczhabbfQodpzBomTf+wPDoeDZAw0BmZ56WyuiHACvKiSAKUsamkC68rvYPgtWpUX9jmnZW/YrgQ7MuHmTLjqDsDqSNWn0Ye0xUvs4qgq9WQ1b9CYNEkLTRnDxDd+Qx/1WrzAvm6ZdXUQYMRPsMETPS4hQoAMfKzMEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N3sEiM0K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N3sEiM0K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D7261F00893;
	Thu,  4 Jun 2026 11:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780572361;
	bh=JTPm+ftwfTa8LVMKx6khFQL9vPtPkNeSJTWtVfb/JtY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N3sEiM0K0CIjtn+uz48H/sEvM3CI8AhErr8aXUsT7dn0A/ejdK98RthfwuKj6WnoI
	 iTkRvc3j1xAbU0RcfX0fd9PzR4ruYhbCCq+HGiSu7stbMCc2eOQg0hUFJ/sO7Oe/4w
	 zGrko1hrZrVCwW6KGlY7gYulVpz+fkRuCcXwx98/slr1pU0sSM6Pxw9FSUB95ckKHs
	 TQenSXdxF4yhrVwwNgaLLhWHSMogvOoW+BSNwTsOXzX8pqIUDFNEvwjwCRNLT1bX+Y
	 52Cu9/1MjmIb9pblFMjr4Y/x/fGVYianwx79Tmd8JIPIV7zSctS9smBNXr3uqkUhKo
	 MiHZsS8JgpsrQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: soc: realtek: Add Realtek DHC I/O
 level detector
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260604111821.975624-2-eleanor.lin@realtek.com>
References: <20260604111821.975624-2-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 11:26:01 +0000
Message-Id: <20260604112601.9D7261F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The binding models a software routine as a virtual hardware node, =
improperly hijacking pin control from disjoint peripherals.
--

commit fcf36e305148fab2c941a519260634bf6fcea792
Author: Tzuyi Chang <tychang@realtek.com>

dt-bindings: soc: realtek: Add Realtek DHC I/O level detector

This commit adds device tree binding documentation for the Realtek DHC
I/O level detector. The block detects I/O signaling levels and applies
pad configurations via pinctrl states.

> diff --git a/Documentation/devicetree/bindings/soc/realtek/realtek,rtd162=
5-io-detect.yaml b/Documentation/devicetree/bindings/soc/realtek/realtek,rt=
d1625-io-detect.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/realtek/realtek,rtd1625-io-de=
tect.yaml

[ ... ]

> +properties:
> +  compatible:
> +    const: realtek,rtd1625-io-detect
> +
> +  pinctrl-names:
> +    items:
> +      - const: rgmii_1v8
> +      - const: rgmii_3v3
> +      - const: sdio_1v8
> +      - const: sdio_3v3
> +      - const: csi_1v8
> +      - const: csi_3v3
> +      - const: sd_1v8
> +      - const: sd_3v3
> +      - const: uart1_1v8
> +      - const: uart1_3v3
> +      - const: aio_1v8
> +      - const: aio_3v3
> +      - const: emmc_1v8
> +      - const: emmc_3v3

[Severity: High]
Does this centralized approach prevent the actual peripheral drivers from
managing their own pins dynamically?

For example, MMC/SDHCI drivers typically need to switch between 1.8V and
3.3V pinctrl states during UHS enumeration. By statically claiming all
these disjoint states (RGMII, SDIO, eMMC, etc.) in a single node, does
this strip the individual peripheral drivers of their pin ownership and
break standard subsystem-level pin management?

> +
> +  realtek,iso-pinctrl:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Pinctrl phandle containing I/O detection registers.

[Severity: High]
Does this binding describe a software routine rather than actual
hardware topology?

Since there is no reg property and the node accesses registers via the
realtek,iso-pinctrl phandle, this appears to model a virtual device node.
Device tree principles typically require describing hardware topology.

Could the I/O detection logic be modeled within the actual pinctrl
hardware node or peripheral nodes instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604111821.9756=
24-1-eleanor.lin@realtek.com?part=3D1
