Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E33B39E9AC
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 08:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787385665; cv=none; b=Kk8EmyTKjLn685GtPSRpii45W4Fv/KyVCPbL57H0XmZpi79gxLSpJ+CRUEEkbHM4QA/DqnH2Xt8SBAaGSei60ZnV3Vaa7XN/nXQTY5jef6KkCVS8ANose3y/f1xKEu186Cy7T2HJ3jxC0lQ42s1BgINs/W9ohlmh9RhVZhAnbsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787385665; c=relaxed/simple;
	bh=yvw2vbRd5X1bOwsM+e5eruLyDHJboJhgXp0kpagoZn4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g0qJk9hHGKQ/44HS/elFvAtNIXzn1GkkTN2Lc5yjLeINfpD4HTuPKYgBG601S2z5hbHYY0PcP4wLFMVKlGRQM8daKeGddPkwAGZcLBq5vM4ZfU8aMlwqDOBtkuERzDI/6HJZc+yMvYAnCbzMFi9PdBz74YsHL+Ka/6NzOipqHno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DcbsuU85; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DcbsuU85"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC78A1F000E9;
	Sat, 22 Aug 2026 08:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787385664;
	bh=GdgTm5QXJSEbDVgDlYX7nwx6kwUendpjSOpV52p3aQo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DcbsuU85vNX+x2klQx/GevnB3mRagi7WqGmwPhbT4Fp0n02h5ZFzLEeFEYNraolJc
	 gI5//s0e5lkBNl42rwGgTgz76yX2VZNKNg1FeTXAXrIvLZIJwhM/N3PcABwzeFVUjq
	 Tv7VPuW+stXl3sWHl/xCWqunvMYqPOQIA+X/vRL067XJ5m24+1H3dsNX8UUs++6Nta
	 GbmGUzCW3hSJm9T+z1Myu7ZiCCUhgxbp1dY0cGsszUzaFfBKuuTxxddWafhOvaK67M
	 7YvamZdwzDy9BM6bzs8o8Zks39ZGJN5phuYwaHYqD8kDpZQ6QwKlaZ7MkjMFLpWjOm
	 KvzHJFoiGMsxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/9] dt-bindings: arm: stm32: Switch
 st,stm32mp23/25-syscfg into simple-mfd
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: devicetree@vger.kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, olteanv@gmail.com, conor+dt@kernel.org
In-Reply-To: <20260822074816.548662-8-marex@nabladev.com>
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-8-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 22 Aug 2026 08:01:03 +0000
Message-Id: <20260822080103.AC78A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] Strictly enforcing `simple-mfd` in the compatible array breaks=
 backward compatibility with existing device trees.
- [High] The `en_refcnt` atomic reference counter is leaked on error paths =
in `stm32_usb2phy_enable()`, permanently breaking the PHY.
- [Medium] The `allOf:if` condition for `st,stm32mp23/25-syscfg` uses `enum=
` directly on the `compatible` property array, bypassing the validation blo=
ck.
- [Low] The `patternProperties` regex in the syscon parent binding rejects =
the `usb-phy@` node name recommended by the child PHY binding.
--

--- Patch [7]: [PATCH v3 7/9] dt-bindings: arm: stm32: Switch st,stm32mp23/=
25-syscfg into simple-mfd ---
commit 4dd8eb77acf0eb2b46ea02d08826b4d490de3fb4
Author: Marek Vasut <marex@nabladev.com>
dt-bindings: arm: stm32: Switch st,stm32mp23/25-syscfg into simple-mfd

This commit updates the STM32 syscon binding to convert the
st,stm32mp23-syscfg and st,stm32mp25-syscfg compatibles into "simple-mfd".
This allows the OS to automatically populate the subnodes for the USB 2.0
FEMTO-PHY.

> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.=
yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> index 95d2319afe235..4db4198c5dd7a 100644
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
> +          - const: syscon
> +          - const: simple-mfd

[Severity: Critical]
Does enforcing simple-mfd in this array break backward compatibility?

Older device trees define these syscfg nodes using only st,stm32mp25-syscfg
and syscon. Moving them into a strict 3-item list requiring simple-mfd
causes validation to fail for existing DTBs.

> @@ -39,6 +40,17 @@ properties:
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
Will this regex reject the node names recommended by the child PHY binding?

The child binding example uses usb-phy@2400:

    usb-phy@2400 {
        compatible =3D "st,stm32mp25-usb2phy1";

which fails the stricter ^phy@[0-9a-f]+$ pattern defined here.

[ ... ]

> @@ -57,10 +69,14 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          const: st,stm32mp25-syscfg
> +          enum:
> +            - st,stm32mp23-syscfg
> +            - st,stm32mp25-syscfg

[Severity: Medium]
Does this conditional block bypass schema validation?

Applying enum directly to an array property checks if the array strictly
equals the scalar string, which always evaluates to false. Should this use
contains: enum: instead?

>      then:
>        required:
>          - "#clock-cells"
> +        - "#address-cells"
> +        - "#size-cells"

[Severity: High]
Is there a reference counter leak in stm32_usb2phy_enable() introduced
earlier in this series?

If an unsupported clock rate is detected, the function returns without
decrementing en_refcnt:

drivers/phy/st/phy-stm32-usb2phy.c:stm32_usb2phy_enable() {
    ...
    if (...)
        ...
    else
        return -EINVAL;
}

Additionally, the common error paths do not decrement en_refcnt after it
was incremented:

drivers/phy/st/phy-stm32-usb2phy.c:stm32_usb2phy_enable() {
    ...
error_regdis:
    regulator_disable(phy_dev->vdd33);

    return ret;
}

Future calls will see en_refcnt > 1 and return success immediately, leaving
the PHY disabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260822074816.5486=
62-1-marex@nabladev.com?part=3D7
