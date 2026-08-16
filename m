Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D5F18B0A
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 21:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786917044; cv=none; b=L6bfLBw7Nb3wn6WDPNBNMwX2UPZxyRLv5emBKogZcshsKkkGZhpPTJMEsuOu419scCvAhWHtDeJjuhItJS5aDdPiNIWW+J7AzvjRVgyImnlEBfakw2sbf7Usiv7XRaRImUqHIWul0222fOKOp5chwVC2Z1aWMRDwzL2MpoN+33k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786917044; c=relaxed/simple;
	bh=6GG00XJ1Lpfhkl1pADFoQisN4Bl7rRs/1MqCm7IkCck=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SaNcAo4DRp3ajA1RdlNwyWFup3c7H9Nu3A3+D0/qGtPsh7/4v+LtJ7hW785ozuyzftqjY8+Z46NgPfSTehJitZrBYkua/3nAZZPlr3qr86jMS3dePIdRPwSb5gOdtUwKZf/ZvA8UKjrlh+Pbzs2oxYfGlKBC5c4xfpoBptWt1LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jnM3dxCe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jnM3dxCe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551971F000E9;
	Sun, 16 Aug 2026 21:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786917042;
	bh=UqtDToCEn8KO3GCEgyYLUvKkVYZld1GNCyUVGXIzuag=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jnM3dxCe3LDJS63PxGwg8FOCGyIW14eDV2inYYwvwGv6keZAVtOG+2lG5BfUC4/Js
	 EGZfKqKy6kB79lPkaaKkxxvdgVx0SKcDo4ZE+f9mkN6AvI7pgdITJ4wiaZN8jRozt5
	 gZnn/CjNGpESbiR5aNE1Cd5eduXOtAMfVN0/50fWcB8u7KY3T/5nwwgicbQWGY95m2
	 VdUQ8oDxXiOi3C17ucmsWdWySePR5wWYJPf+LTHp/uH/kF43cookCm8VxmGIK/5++Y
	 8s9seN+cEbhPOo6hDHBmB3Z4H6e2+rcgPcfjScBrMIX1GeIXHz3JQKu6OjyTFEtVNG
	 qxPPQQev+Ulww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/9] dt-bindings: arm: stm32: Switch
 st,stm32mp23/25-syscfg into simple-mfd
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: neil.armstrong@linaro.org, linux-phy@lists.infradead.org, robh@kernel.org, vkoul@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260816213849.1044073-8-marex@nabladev.com>
References: <20260816213849.1044073-1-marex@nabladev.com>
 <20260816213849.1044073-8-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 21:50:41 +0000
Message-Id: <20260816215042.551971F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Moving `st,stm32mp23-syscfg` and `st,stm32mp25-syscfg` exclusively=
 to the 3-item array makes the `simple-mfd` compatible string mandatory, br=
eaking validation for existing device trees.
- [High] The st,stm32-usb2phy driver expects a 'reg' property and a syscon =
parent node, but the binding mandates 'st,syscfg' and forbids 'reg'.
- [Medium] The schema uses `additionalProperties: false` but fails to defin=
e the USB PHY subnodes, meaning any added subnodes will be rejected by `dtb=
s_check`.
- [Medium] Incomplete single-node DWC3 binding prevents the use of standard=
 USB properties.
- [Medium] Mismatch between '#clock-cells' binding requirement and driver i=
mplementation.
--

--- Patch [7]: [PATCH v2 7/9] dt-bindings: arm: stm32: Switch st,stm32mp23/=
25-syscfg into simple-mfd ---
commit 442df2b694ee72167d8a15b0750e1f6687add72a
Author: Marek Vasut <marex@nabladev.com>

dt-bindings: arm: stm32: Switch st,stm32mp23/25-syscfg into simple-mfd

The st,stm32mp23-syscfg and st,stm32mp25-syscfg can have subnodes, which
represent the USB 2.0 FEMTO-PHY. Turn the syscfg into "simple-mfd" so the
PHYs would get populated by the OS.

> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.=
yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> index 95d2319afe235..ef640443dd239 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> @@ -22,11 +22,12 @@ properties:
>                - st,stm32mp151-pwr-mcu
>                - st,stm32mp157-syscfg
>                - st,stm32mp21-syscfg
> -              - st,stm32mp23-syscfg
> -              - st,stm32mp25-syscfg
>            - const: syscon
>        - items:
> -          - const: st,stm32-tamp
> +          - enum:
> +              - st,stm32-tamp
> +              - st,stm32mp23-syscfg
> +              - st,stm32mp25-syscfg
>            - const: syscon
>            - const: simple-mfd

[Severity: High]
Does moving st,stm32mp23-syscfg and st,stm32mp25-syscfg exclusively to the
3-item array make the simple-mfd compatible string mandatory? It looks like
this breaks backward compatibility, meaning existing valid device trees that
only specify 'syscon' will suddenly fail schema validation.

[Severity: Medium]
Will this schema reject the new USB PHY subnodes mentioned in the commit
message?=20

Looking at Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml,
it uses additionalProperties: false without defining patternProperties for
child nodes. Any added subnodes will likely be rejected by dtbs_check.

[Severity: High]
Can the USB2 PHY driver probe successfully with a device tree that conforms
to the st,stm32-usb2phy binding?

The driver unconditionally requires a 'reg' property to extract the offset:

drivers/phy/st/phy-stm32-usb2phy.c:stm32_usb2phy_probe() {
    ...
    offset =3D of_get_address(dev->of_node, 0, NULL, NULL);
    if (!offset)
        return dev_err_probe(dev, -EINVAL, "Failed to get regmap offset\n");
    ...
}

However, the binding completely omits and implicitly forbids 'reg',
requiring 'st,syscfg' instead:

Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml:
  st,syscfg:
    $ref: /schemas/types.yaml#/definitions/phandle-array
    description: Phandle to system configuration controller.

[Severity: Medium]
Is the single-node DWC3 binding complete enough to allow standard USB
properties?

The schema is sealed with unevaluatedProperties: false without including a
$ref to snps,dwc3.yaml#:

Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml:
unevaluatedProperties: false

Would this unconditionally reject standard USB core properties?

[Severity: Medium]
Is there a mismatch between the '#clock-cells' binding requirement and the
driver implementation?

The driver registers the clock provider with of_clk_hw_simple_get, which
ignores arguments and acts as a 0-cell provider:

drivers/phy/st/phy-stm32-usb2phy.c:stm32_usb2phy_probe() {
    ...
    ret =3D devm_of_clk_add_hw_provider(phy_dev->dev, of_clk_hw_simple_get,
                                      &phy_dev->clk48_hw);
    ...
}

But the binding mandates #clock-cells =3D 1:

Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml:
  "#clock-cells":
    const: 1

Does this force a dummy argument in the device tree that the driver ignores?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816213849.1044=
073-1-marex@nabladev.com?part=3D7
