Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AB2346FA6
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 21:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778535801; cv=none; b=MKhJbzkudNgi5OW+6ZCqJQ3/AiN8GInzQy7t3JgZ2AcAU41mYv8bvXhzEMn0f8q7ROybODW6xLRTmo9PHYafkh827Re4q1Qbh2LqjFXb3varxHKdV8z7kBFkzl5poS7Sxe9QDeRRh2gwjp17AcB7+7MZi8FWm8Ns9lbwJC0AFHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778535801; c=relaxed/simple;
	bh=GVhaGb6fIDFFc5CjAVm4UfLwz+07fccFsEUqYuqcjT8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qi4pUJ+N9wGyLbkhXRSL5m28SXZzDgjl9Z03JpG8lSz32qDcsKhB2tlDwsbCs+58KnG0QSgHEW1+8xlWxPEe8c+mxR0CuHp0zwKvH6tYwUoC5O6AU9LQKV0OWtbtEysI1tTA1IJHMupU2rGWlnBNXWqbDQmF8CQjsZDSUdD8Ro0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WGUVrdP5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WGUVrdP5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29CEAC2BCB0;
	Mon, 11 May 2026 21:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778535801;
	bh=GVhaGb6fIDFFc5CjAVm4UfLwz+07fccFsEUqYuqcjT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=WGUVrdP5K20HwPE3cS1uHQVgkoEbFab24YSEFyjEgL6JfxGeC0CPSd20o12tyLtvE
	 My1rXSEOREk+ksbnBfbT5GB5j72Hc2IvaYXBKqfgAEziine+B5YltWzl5TTrHUMNHO
	 BhN+p+A6O04AGuenfZUlN21LIMe/UsW0MDvSYtNTgTDAZ0wPVKP4LIp30fsTFedkPT
	 Jfey5QI+/XW/Kn2+UFmeWN1qsaD0529OlCGUryfZRm9wQZdRqYHN/25aIfl5Zfrv6M
	 DDUqAdHoz0rwW8KeauERYd0pogakR01/SIWgBHynmUAGfRLhXdeEcOdGimXJd/AH/d
	 lfY8AG/E7vl4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: misc: add documentation for MediaLB DIM2
 controller
Reply-To: sashiko@lists.linux.dev
To: "Kartik Nair" <contact.kartikn@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260510184419.98043-1-contact.kartikn@gmail.com>
References: <20260510184419.98043-1-contact.kartikn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 21:43:20 +0000
Message-Id: <20260511214321.29CEAC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The `microchip,clock-speed` property is required by the driver but=
 omitted from the schema.
- [High] The clock properties restrict definitions to a single clock named =
"mediaLB_int", which is incompatible with the Freescale driver.
- [High] The `interrupts` property permits 1 interrupt, but the driver unco=
nditionally requires 2.
- [Medium] Missing conditional constraints to enforce hardware-specific clo=
ck requirements.
--

commit ed9d7ddf4fb03364e5365e6ea5d84fa84fa267e6
Author: Kartik Nair <contact.kartikn@gmail.com>

dt-bindings: misc: add documentation for MediaLB DIM2 controller

Add device tree binding documentation for the MediaLB DIM2 hardware
dependent module. This documents the compatible strings used in
drivers/staging/most/dim2/dim2.c which were previously flagged as
undocumented by checkpatch.

> diff --git a/Documentation/devicetree/bindings/misc/microchip,most-dim2.y=
aml b/Documentation/devicetree/bindings/misc/microchip,most-dim2.yaml
> new file mode 100644
> index 0000000000000..213078811f820
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/microchip,most-dim2.yaml

[ ... ]

> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx6q-mlb150
> +      - renesas,mlp
> +      - renesas,rcar-gen3-mlp
> +      - xlnx,axi4-os62420_3pin-1.00.a
> +      - xlnx,axi4-os62420_6pin-1.00.a

Should we add conditional constraints for the clocks property based on the
compatible string?

The Freescale and Renesas variants strictly require clocks in their driver
implementations, while Xilinx variants do not. Since clocks is omitted
from the global required list, incomplete device tree nodes for Freescale
and Renesas platforms will pass validation.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 2

Does the driver support a single interrupt?

The driver implementation in dim2_probe() unconditionally requests two
distinct interrupts by index (index 1 and index 0). If a device tree
specifies only 1 interrupt as permitted here, the driver's attempt to
retrieve index 1 will return an error and abort the probe.

> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: mediaLB_int

Are these clock constraints compatible with the Freescale driver?

The fsl_mx6_enable() implementation explicitly requests up to two clocks by
name ("mlb" and optionally "pll8_mlb"). A device tree adhering to this
schema will provide a single clock named "mediaLB_int", causing the
Freescale driver to fail its clock lookup.

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false

Is there a missing definition for the microchip,clock-speed property?

The driver dim2_probe() explicitly calls of_property_read_string() for
microchip,clock-speed and aborts if it is missing. With
additionalProperties set to false, a device tree including this required
property will fail schema validation, while one conforming strictly to the
schema will omit it and cause the driver to fail at runtime.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510184419.9804=
3-1-contact.kartikn@gmail.com?part=3D1
