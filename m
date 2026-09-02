Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCC547277C
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 12:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353971; cv=none; b=L/0BnLzXxxUYAUxwvBSbPe39+9XmITsQBVpZ4YrKxePsbmc1Aqgz3RiAA+Q1Z6q6XMbvUTSFEkA0qeTKhCIhs7H0Yc5jzGKh6cxRXL9khZiX8+EAOR2FM3++vmeQB+1g/TaSLM9E+VHwrvc+PnGE2YO12o/p+gkd3RvhS/4l/SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353971; c=relaxed/simple;
	bh=1E5Hkz+x4mv7Nt5qDbPqiKIYuM+7TvV6KEl2qTJI6j4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HSWqn9eLNoUzrvfoFY/PXVc1fR1RHPKm8VaVDQl9mGJ3YiUxBJ5YTIDs1TQ8IkUCdXLimOzKkDl+i6Zc3DpmoRE9u+HWg5xVjygSKEkY+4asS/pWLC0J9WEpY/rAKSUf+ktqeU9wO9PCQYECmCr6U7aMPlcSCYb2Q+rRox6A8Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=InhVx2rs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="InhVx2rs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C90131F000E9;
	Wed,  2 Sep 2026 12:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788353970;
	bh=eoa/hRKWU+7J5aSVgRWNPsY7IGK16OTJhlA44pUvVvU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=InhVx2rsaMaDLJMyLXqWMpAV3aJtGjN8451FErZ7hgfaphS5u9Ze74EpAqBaK18UB
	 XHcFP/Tvx5J0BtZoH76Cqd6EN8Se3kvtJFW4a5gH3yVcnNW4qW3QIe2voxCzjtFEp0
	 7A3KfJyFNv8aRFYZQk1vgms7GNW178/LLVjRtTeT3MzLYevuRlcV+43VJ/BvSkUXML
	 xWEKgCb6ZKHgnzlruJ1VdhXUl7y1aD9AF1I6957YHtvnSf4Sj/GuiIBO6VJdvDk70j
	 Pa5AlAJm3GfQWoXDN3rzuhBZajPTB9eSzj4/s30zuZBvDFjefxUSQ4YV/MSCFCC/F3
	 GNLVQw9nTOrug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: stm32: Document
 st,stm32mp23/25-syscfg subnodes and cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902124018.606544-1-marex@nabladev.com>
References: <20260902124018.606544-1-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 12:59:29 +0000
Message-Id: <20260902125929.C90131F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `clocks: false` restriction in the `else` block incorrectly fo=
rbids the `clocks` property for `st,stm32-syscfg`, breaking validation of e=
xisting in-tree device trees.
- [High] Making `phy@2400`, `phy@2800`, `#address-cells`, and `#size-cells`=
 unconditionally `required` contradicts their optional nature and breaks ex=
isting device trees.
- [Medium] The patternProperties entry contains a $ref to a schema file (`s=
t,stm32-usb2phy.yaml`) that does not exist in the repository.
--

commit ddc0637029fe22061a9355ce24276a2cff5c6682
Author: Marek Vasut <marex@nabladev.com>

dt-bindings: arm: stm32: Document st,stm32mp23/25-syscfg subnodes and cells

The st,stm32mp23-syscfg and st,stm32mp25-syscfg can have subnodes, which
represent the USB 2.0 FEMTO-PHY. Document subnodes pattern properties and
address/size cells.

> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.=
yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> index 95d2319afe235..a559f8b03b842 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> @@ -39,6 +39,17 @@ properties:

[ ... ]

> +patternProperties:
> +  "^phy@2[48]00$":
> +    type: object
> +    $ref: /schemas/phy/st,stm32-usb2phy.yaml

[Severity: Medium]
Does this reference target a schema file (st,stm32-usb2phy.yaml) that is
missing from the repository? Schema validation tooling might fail to resolve
this reference.

>  required:
>    - compatible
>    - reg
> @@ -54,13 +65,30 @@ allOf:
>      then:
>        required:
>          - clocks
> +    else:
> +      properties:
> +        clocks: false

[Severity: High]
Does this block incorrectly forbid the clocks property for other compatible=
s,
breaking validation of existing in-tree device trees?

For example, platforms like STM32F429 use the st,stm32-syscfg compatible and
define clocks:

arch/arm/boot/dts/st/stm32f429.dtsi:syscfg {
    ...
    clocks =3D <&rcc 0 STM32F4_APB2_CLOCK(SYSCFG)>;
    ...
}

Because st,stm32-syscfg does not match the preceding if condition, it falls
into this else block, which will cause dtbs_check to fail.

>    - if:
>        properties:
>          compatible:
> -          const: st,stm32mp25-syscfg
> +          contains:
> +            enum:
> +              - st,stm32mp23-syscfg
> +              - st,stm32mp25-syscfg
>      then:
>        required:
> +        - "#address-cells"
>          - "#clock-cells"
> +        - "#size-cells"
> +        - phy@2400
> +        - phy@2800

[Severity: High]
Does making these properties unconditionally required contradict their opti=
onal
nature implied by "can have subnodes" in the commit message?

Existing devicetrees without these subnodes will fail validation. For
example, in arch/arm64/boot/dts/st/stm32mp251.dtsi:

syscfg: syscon@44230000 {
	compatible =3D "st,stm32mp25-syscfg", "syscon";
	reg =3D <0x44230000 0x10000>;
	#clock-cells =3D <0>;
};

This node will immediately fail dtbs_check because it lacks the newly
mandated phy@2400, phy@2800, #address-cells, and #size-cells properties.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902124018.6065=
44-1-marex@nabladev.com?part=3D1
