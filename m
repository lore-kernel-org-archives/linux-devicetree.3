Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17E937268A
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 02:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782356311; cv=none; b=ogeJeOE8xMOrHluayxoN6OcJ1LO/k/iP7wRpFk4Q90aGlEL/ASM8UcngY5mswyaVhlTOVIHoUl0KXMzEhouVCFNZgMLuqApMz1UWJlXcTfR8nuUBWlGbcxGMaRuXlmDfJ04WpcIlnmnlEo3EkFf3j4TpXcTgEHu/hRfCIg3ABRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782356311; c=relaxed/simple;
	bh=cSxEU01gR7iwJdKzixmleAoqsxo5pbkSVShyk/g05V8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bsDKtPU5v93kIwe1od1FbY8pNHEyYg6+4Xx1pSp1c/fJULndDQv9YdUKx6qrooEuHiOZ1GFub1sTvoPN9SlWgrfo96nOeMpup3e5J1STzgeHHSFxA7+nRAkvdKnCs7du9WI3tgbmb5iKsUrh026T0ToUbin/fV/mzOg8fae9mhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uy8V+87O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uy8V+87O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA4631F000E9;
	Thu, 25 Jun 2026 02:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782356310;
	bh=lsMs+Tpw5HvAFCv5BOiOZPAr6CI4MVeFvDsRDWWGvIM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Uy8V+87Ob/WKLMkco4imStYDJH2FgSVqypoA/Ya/aK07d+WFX/Pd1264IoRhgtoRO
	 f83tFeanGFVU3hJJX6wcRVORTSv1Fn2vk+MGbH02dH7begpInD+8RWf50PvGtf4r0r
	 Kk4xScaMooRYfGCVawP/NRMfZhTWVfFKOjits6pkSeP6GkdkJi00YyDy06wWP8+G+0
	 qRPjh40JHXKZXoB3lHxYia7EXAcHBYQknfZcTy4EJzMtwd7ZcIIPUgXNsjqdG83UAQ
	 QidU5TESdZMjcZRfqkZ/Ibk+qPL1+yF0hhkApnDFXJNCki9nvwdpEpSx2RHf6QXt2s
	 xFpd2iYaY8mXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: nuvoton,ma35d1-usb2-phy:
 extend for dual-port OTG support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: vkoul@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, robh@kernel.org
In-Reply-To: <20260625023958.569299-3-a0987203069@gmail.com>
References: <20260625023958.569299-1-a0987203069@gmail.com>
 <20260625023958.569299-3-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 02:58:29 +0000
Message-Id: <20260625025829.EA4631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The commit message claims multiple driver behavioral changes that =
are missing from the patch, leaving the driver incompatible with the new bi=
nding.
--

commit f557b8622653f3df69b040020ac61c52fd0498d6
Author: Joey Lu <a0987203069@gmail.com>

dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port OTG support

This commit updates the device tree binding for the MA35D1 USB2 PHY to supp=
ort
dual-port OTG. It changes the PHY node to be a child of a syscon node, remo=
ves
the nuvoton,sys and clocks properties, and updates #phy-cells to 1.

>       - The PHY node is now a child of the system-management syscon node
>         with a reg property.  The nuvoton,sys phandle and clocks properti=
es
>         are removed; the driver derives the regmap from its parent, and
>         clock gating is owned by each individual USB controller.
>    =20
>       - #phy-cells changes from 0 to 1: the cell selects the PHY port.

> diff --git a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-ph=
y.yaml b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
> index fff858c909a06..a20d03c80932b 100644
> --- a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
[ ... ]
> @@ -8,38 +8,72 @@ title: Nuvoton MA35D1 USB2 phy
[ ... ]
>    "#phy-cells":
> -    const: 0
> +    const: 1
> +    description:
> +      The single cell selects the PHY port. 0 selects the OTG port (USB0,
> +      shared with DWC2 gadget controller) and 1 selects the host-only po=
rt
> +      (USB1).
> =20
> -  clocks:
> -    maxItems: 1
> =20
> -  nuvoton,sys:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> +  nuvoton,rcalcode:

[Severity: High]
Does this patch introduce a regression by updating the binding without the
corresponding driver updates?

The commit message indicates the driver derives the regmap from its parent =
and
handles the #phy-cells change, but this patch does not contain driver
modifications.

If a device tree is updated to comply with this new binding, will the exist=
ing
driver fail to probe? Looking at ma35_usb_phy_probe() in
drivers/phy/nuvoton/phy-ma35d1-usb2.c, it unconditionally requires the
nuvoton,sys property:

drivers/phy/nuvoton/phy-ma35d1-usb2.c:ma35_usb_phy_probe() {
    ...
    p_phy->sysreg =3D syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
                                                    "nuvoton,sys");
    if (IS_ERR(p_phy->sysreg))
        ...
}

Additionally, the unmodified driver still uses of_phy_simple_xlate and
registers a single PHY, which is structurally incompatible with the binding
change to #phy-cells =3D <1>:

drivers/phy/nuvoton/phy-ma35d1-usb2.c:ma35_usb_phy_probe() {
    ...
    provider =3D devm_of_phy_provider_register(&pdev->dev, of_phy_simple_xl=
ate);
    ...
}

Should the driver changes be included in this patch or submitted together as
a series to avoid breaking USB initialization at boot time for compliant de=
vice
trees?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625023958.5692=
99-1-a0987203069@gmail.com?part=3D2
