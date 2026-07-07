Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699CB3909BC
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 06:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783405600; cv=none; b=l4Dd7UI5hG/MKE/t5O0G2C9tMamZmGbmiLTWpj1JXgiJLIEfGSaaBZXXtp+O9nXunK2yncbnk5hXF7mIKBe1J+AGQpbXPaixU90v5FW8yRU4IQLYirTZkQyRlDm84ej4nL2oDFA7Kdyu41FaHb2XRO4VQINXQJCdNggacm/xYIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783405600; c=relaxed/simple;
	bh=jXAQUNirnMY33eDAiOEtZ67C0ozklX9/YVTXmVmwmqo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NqhpbxkQDu27UWpRJyzuyY0l94qYt6HPwHXp/IfUH0C1aKPhYJ4bY0GiAPma2iP+jDHPGLZTYJK1GwFwDEalwb4TwzHHoFrYvH6vu8RZnV2Vskf+nrdCs8UKGdG81cWjbVH71o7UWLY7qd0QYNU2/76uN9sBfAVA611rCenrBAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AYFDaPqa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AYFDaPqa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D81181F00A3A;
	Tue,  7 Jul 2026 06:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783405599;
	bh=c9EENQYI0galjYid2sX8n3lxiNpXxCKrkXLWup5+YEI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AYFDaPqavP43j7MGx7VBWI5J3r/w3VxKgB4VBLKlixkwXIr/F223MCxRdUFr08dNr
	 yO2A9ZGZ5KbPZ6HT97HGcPQdc6N2c6ppElPA4fdvIq4LTBn+OlIIrG5ncLOUXvT+Si
	 ACMxfMx40KtTudIFO5c/FytLRP7rMt+4UKrjE0qVVq2aZOX/Pd0Dxfz1YM6/glsaBa
	 tgOP2oEgiTq6mtSloquAtvg92N7L8omIholrhJA0e4kEZQx66lpD+wAoBlRG3W6fzd
	 QWiwm1OyojidLNOY0F9ocM0cVwYbPTcX1nhVjvMyjpwfmcnIzjzgXu/IO+5pshQeN/
	 tfi8INrFikEnQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: usb: Add Aspeed AST2700 DWC3 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Chen" <ryan_chen@aspeedtech.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260707-xhci-v1-1-b202b9b3274e@aspeedtech.com>
References: <20260707-xhci-v1-1-b202b9b3274e@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 06:26:38 +0000
Message-Id: <20260707062638.D81181F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The AST2700 DWC3 binding lists `clocks` and `clock-names` as requir=
ed properties but fails to explicitly define strict constraints for them in=
 the `properties:` block, relying on a loose generic schema.
--

--- Patch [1]: [PATCH] dt-bindings: usb: Add Aspeed AST2700 DWC3 controller=
 ---
commit e94cba741ea120f96563c784f28513d593ede326
Author: Ryan Chen <ryan_chen@aspeedtech.com>

dt-bindings: usb: Add Aspeed AST2700 DWC3 controller

This commit adds a new device tree binding for the Aspeed AST2700 DWC3
controller. It uses a dedicated YAML file that references the generic
snps,dwc3.yaml schema and adds SoC-specific constraints such as a
mandatory USB3 PHY.

> Because reg, clocks and clock-names are only defined indirectly through
> the $ref, they still appear in the required list, the same approach as
> apple,dwc3.yaml.

[Severity: Low]
This isn't a bug, but is this description of apple,dwc3.yaml accurate?

Looking at apple,dwc3.yaml, it explicitly overrides reg in its properties:
block to enforce strict bounds, rather than relying on an indirect
definition through the $ref.

> diff --git a/Documentation/devicetree/bindings/usb/aspeed,dwc3.yaml b/Doc=
umentation/devicetree/bindings/usb/aspeed,dwc3.yaml
> new file mode 100644
> index 0000000000000..976f80b87e24c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/aspeed,dwc3.yaml
[ ... ]
> +properties:
> +  compatible:
> +    items:
> +      - const: aspeed,ast2700-xhci
> +      - const: snps,dwc3
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: usb3-phy

[Severity: Low]
Since clocks and clock-names are listed as required properties below, should
they be explicitly constrained here in the properties: block?

Without strict constraints defined here, device trees with an incorrect
number of clocks or invalid clock names for the AST2700 could silently pass
schema validation by falling back to the loosely defined generic schema in
snps,dwc3.yaml.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - phys
> +  - phy-names

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-xhci-v1-1-=
b202b9b3274e@aspeedtech.com?part=3D1
