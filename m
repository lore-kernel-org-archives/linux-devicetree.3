Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AD23F8EAF
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 10:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783507753; cv=none; b=MR4q8+ehMkr9WmkxrVEmEoU7m+Wt1WRtyPakMD7AHX5F66mz7Y2TS1Hq0++l3t6sWG3/niL5omggDr6aM2IfClYZ1LsEuFGJCzcsx4i4nvY6AWYPvMDWsJKbOGyNXdql80pVPDRWwuuQBtemwtOfLm7N+v/HvNDWa+6jqjVjCmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783507753; c=relaxed/simple;
	bh=0NpZcEcGAGgvy2ljcRmhmoQE7fhi+nqi0fcU8Mpshh0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NJU2usbdbSR8sN6uxT1krTXz7cyfqcVZZWS1yELjVP49wtoSES/g2BDFcnQNFcvzKwOrXRhihZBaj+mAQh2XekMOLYeZ+FweebAxnpSTYBB+6qdx1WnKiVo0IgHCd2C3zW1SahfK+LhM1ywkyij6lFehDg8WecGwHHxILlJfttE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DrKY8UAx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DrKY8UAx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D616E1F000E9;
	Wed,  8 Jul 2026 10:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783507741;
	bh=NjmxgfT50Pozt5M6c45G6mi5aTkKtqZO4ykzegNi2+A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DrKY8UAxwTpzhIk3f558wYx1DM2BWiMkyACdArzrh6nGPuezDj7FlM/O1Y+/CFVKy
	 8LqkZJ+kTQQhCeNzNwbx0StMQCllHmGgSauclAniz+jfWt7avENlbCUmfavjzVaBPz
	 ygNJ5fxXQdyu7P0UFOxDFnLDUVJEGT03sjOSWIuemtR3Biai8LD/1AdGRvk2Pz6otc
	 rfasjEpKU6hrbnlx3Pn+U0ktUspeFU+7yhVqf7lAsvxQlsVKbcWaSs1v/G+n/lVjGw
	 zer9dZtx1ErUZjg2iMcyBW3Bg4L1/TCaIX9FUp2eSOiCXELOJMSVo2R/py3dVMtE0G
	 CfvKzI90E08AA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: nuvoton,ma35d1-usb2-phy:
 extend for dual-port and OTG
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, vkoul@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260708103606.1462960-2-a0987203069@gmail.com>
References: <20260708103606.1462960-1-a0987203069@gmail.com>
 <20260708103606.1462960-2-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 10:49:00 +0000
Message-Id: <20260708104900.D616E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The DT binding introduces multi-port support, but the correspondin=
g driver lacks implementation, leading to silent hardware malfunction.
- [Medium] The `#phy-cells` property uses an enum constraint instead of a s=
trict const constraint, violating subsystem guidelines.
--

--- Patch [1]: [PATCH v3 1/3] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: ex=
tend for dual-port and OTG ---
commit 7f72a8cc4b64e1dfcf4efba1cd67bf9eafd31d72
Author: Joey Lu <a0987203069@gmail.com>

dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and OTG

This commit updates the nuvoton,ma35d1-usb2-phy device tree binding to
support dual USB PHY ports (PHY0 and PHY1). It relaxes #phy-cells from cons=
t: 0
to enum: [0, 1] to allow port selection while preserving backward
compatibility. It also adds new optional properties for resistor calibration
and over-current polarity.

> diff --git a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-ph=
y.yaml b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
> index fff858c909a06..191d1b2272ec5 100644
> --- a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
[ ... ]
> @@ -15,7 +27,12 @@ properties:
>        - nuvoton,ma35d1-usb2-phy
> =20
>    "#phy-cells":
> -    const: 0
> +    enum: [0, 1]

[Severity: High]
Does the driver currently support this new #phy-cells =3D <1> configuration?

Looking at ma35_usb_phy_probe() in drivers/phy/nuvoton/phy-ma35d1-usb2.c, t=
he=20
provider registers using of_phy_simple_xlate:

    provider =3D devm_of_phy_provider_register(&pdev->dev, of_phy_simple_xl=
ate);

Because of_phy_simple_xlate ignores cell arguments, any valid DT request for
PHY1 will silently map to the single initialized PHY.

Furthermore, ma35_usb_phy_power_on() strictly hardcodes registers for PHY0:

    regmap_update_bits(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, 0x7, (PHY0POR=
 | PHY0SUSPEND));

Will this cause a consumer attempting to control PHY1 to inadvertently rese=
t and
power on PHY0 instead?

[Severity: Medium]
Is it acceptable to use an enum constraint for a cell-count property?

According to the subsystem/dt-bindings.md global review guidelines, each
cell-count property must have a strict const constraint matching the hardwa=
re.
Since the hardware physically has two ports, shouldn't #phy-cells be defined
as const: 1 to accurately model the hardware's capabilities?

> +    description:
> +      When 0, the node exposes PHY0 only and consumers reference it
> +      with no cell argument. When 1, the single cell selects the port,
> +      with 0 for the OTG port (USB0, shared with DWC2 gadget controller)
> +      and 1 for the host-only port (USB1).
[ ... ]
> @@ -39,7 +78,7 @@ examples:
> =20
>      usb_phy: usb-phy {
>          compatible =3D "nuvoton,ma35d1-usb2-phy";
> -        clocks =3D <&clk USBD_GATE>;
> +        clocks =3D <&clk HUSBH0_GATE>;
>          nuvoton,sys =3D <&sys>;
>          #phy-cells =3D <0>;

[Severity: Medium]
With the hardware supporting multiple ports, should the example be updated =
to
demonstrate the correct multi-port configuration (#phy-cells =3D <1>;) inst=
ead
of propagating the legacy configuration?

>      };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708103606.1462=
960-1-a0987203069@gmail.com?part=3D1
