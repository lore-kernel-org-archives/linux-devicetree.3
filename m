Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECC8383333
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788218582; cv=none; b=sRFqvcfMnDUj6gZCTJ6y5tAjOvZbHzsqy9c4fQ2YZ9I7qnMAagSa/ElKCt+PFkEMGUv402xQyutkstB+EJhAi4fmlHk8FXP/CpVx/5RBWDJxRXRmK+mOGmi/KHadxu4L5KKBQ3+NiGRI/bcq/m9hR88mlW/ZsHK4/okIytA/Ct0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788218582; c=relaxed/simple;
	bh=RffED0Zil+Spq+t51daeMRolQnoBf9nGgGYtfOrIowk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lM1UgiIk454TlFlFZSjD/QvCfTko3wo0oJzqcfE/wvKiZd7pEl/YQgbkyW4rwBJczHqMi9utD6KgPYMJUDhywfowYPUBsNxgBbnXedPiU3nIJSaLiJmZ0s790J8qixr6uTDLQh8WlqlGuyL2UUWznjqHG1kncGAZ7SMSBfTzLOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S8DXdpwG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S8DXdpwG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607B51F000E9;
	Mon, 31 Aug 2026 23:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788218580;
	bh=DcZcXqeRoGpTMJ5ZuOeddUGEDEOoBHUKjZn3SJGiuZs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S8DXdpwGwPjgQXxTEStZ0XAUD3G6Ie86ZbMy6AXSEM8dFbVrHdivuv5lrvAwffJcr
	 exKzwQZ4wel43KExzUrmnAVpZsEljn5yBfvKdoUUbGN3HrGBlaHC2Y8zSSFePfZqHp
	 jme096jl6EPAZul1ClAWWt7t8leRNF6APBeel5rX2EbLOx8OpgRl43Pf387iBM7Dt5
	 9sP3nVUvE90UZfnUYIq3fDccgt1nYghNHcPYMmCpKQgsmVb8TfK0tSTvqPIcL3kJxN
	 3rp1a/4+YWtrnFjqUevplOuEKYhbEl8FF9oZVg5fOVu/qFF+332s4E3WAbADkJMtVW
	 Xsr1WEGGyIlZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: stm32: Document
 st,stm32mp23/25-syscfg subnodes and cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831231359.136475-1-marex@nabladev.com>
References: <20260831231359.136475-1-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 23:22:59 +0000
Message-Id: <20260831232300.607B51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Backward Incompatible Schema Breakage for Existing Device Trees
- [Low] Broken Schema Reference to Non-Existent File
--

commit 03ebc2d5d17d202d6c215a130814ee9c1eb855c2
Author: Marek Vasut <marex@nabladev.com>

dt-bindings: arm: stm32: Document st,stm32mp23/25-syscfg subnodes and cells
   =20
The st,stm32mp23-syscfg and st,stm32mp25-syscfg can have subnodes, which
represent the USB 2.0 FEMTO-PHY. Document subnodes pattern properties and
address/size cells.

> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.=
yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> index 95d2319afe235..2cce174004fe0 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> @@ -39,6 +39,17 @@ properties:
>    "#clock-cells":
>      const: 0
> =20
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +patternProperties:
> +  "^phy@[0-9a-f]+$":
> +    type: object
> +    $ref: /schemas/phy/st,stm32-usb2phy.yaml

[Severity: Low]
Does this reference a non-existent schema file?=20

Running dt_binding_check fails because the target file=20
/schemas/phy/st,stm32-usb2phy.yaml cannot be resolved, which breaks the=20
schema validation tooling.

> +
>  required:
>    - compatible
>    - reg
> @@ -57,10 +68,17 @@ allOf:
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
>          - "#clock-cells"
> +        - "#address-cells"
> +        - "#size-cells"
> +        - phy@2400
> +        - phy@2800

[Severity: High]
The commit message mentions these nodes "can have subnodes", suggesting the=
y=20
should be optional.=20

Making them mandatory in this conditional block will cause existing valid
device trees to fail schema validation.

For example, this existing node in arch/arm64/boot/dts/st/stm32mp251.dtsi
currently lacks these new properties:

		syscfg: syscon@44230000 {
			compatible =3D "st,stm32mp25-syscfg", "syscon";
			reg =3D <0x44230000 0x10000>;
			#clock-cells =3D <0>;
		};

Similar nodes exist in stm32mp231.dtsi.

Could these new required properties be made optional to avoid breaking
existing upstream device trees?

> =20
>  additionalProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831231359.1364=
75-1-marex@nabladev.com?part=3D1
