Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3803D3C81B4
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 15:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786116819; cv=none; b=hBihOxiHNAbDV0LJIuxvkBvsX211hSliFgrT4BoengmoIzy72PY518f4qqfuw35yRmBIF680dfIPYn0pRgrmXTqMlrBZeDvuNUw22qQHbhMU+xRVsvvwjlkuwsB1RVjj6XobhIGJFftolJYDRYGWP0tDIpNnp/PBplT4XIZqvZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786116819; c=relaxed/simple;
	bh=WdRrGOJhbtH52jZlcXhsZ8WKFaMDifo29EK6EYNVTY4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EzHD4aYDmhmbbCjIEx+CMI3gm+KCoHScgdKsBTSXzPnl+ez6F+6Annj31fnLzmrKpwXGmC+JDAJqZbm1Ga8TO1XgKXM14pDN4cC581W3wZITFwsSBgFZZ2ID2XF0lsNLG0DiESzBn70BkHHWn8PsDE9VRzmOSChtelSEwPgVHCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MvnisGky; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MvnisGky"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A3531F00A3A;
	Fri,  7 Aug 2026 15:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786116818;
	bh=RJ2vqAFiIP9XhHV1D3VqnylVf1ElHI7vr+3UWaquvZU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MvnisGkyMFeyVEzDfoeF+xo7OtT2t0sQrjyocxlc5AHXHz0VPL3J26QLwLdsXOcGo
	 72ilc4N7wV0ls0GUyU7gts5PqeeIzZQO7DWlHyz+VvrQeBBjd/yzyBApzlrV/ul7v7
	 L9/9Fna7qPDK9zqh3SpWNyjzxXmk9VOxdZ6s94fjs+taeHpMYgOebvghwNatHOOp/Q
	 r2KLe7GarTjR8Syeb5snNq8pm9r/I0Q6e4u40SPSNlp8lwW2PNBCz/VJU+MBcvlNGr
	 8kAvLuPMenlIqL4Uha/xim+c0St73d4AkerUUlBGscYd3G4KoeltTHOYNMKY92xFso
	 9xYaSghc/nIfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/7] dt-bindings: clock: Introduce nexus nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWlxdWVsIFJheW5hbCAoU2NobmVpZGVyIEVsZWN0cmljKQ==?= <miquel.raynal@bootlin.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807-schneider-v7-2-rc1-eip201-upstream-v5-1-8785f9531cf0@bootlin.com>
References: <20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com>
 <20260807-schneider-v7-2-rc1-eip201-upstream-v5-1-8785f9531cf0@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 15:33:36 +0000
Message-Id: <20260807153337.5A3531F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The clock-nexus-node schema omits definitions for standard nexus=
 node properties `clock-map-mask`, `clock-map-pass-thru`, and `#clock-cells=
`, breaking schema validation.

Pre-existing issues:
- [High] The Linux clock subsystem lacks support for nexus node parsing, re=
ndering this device tree binding unusable for Linux drivers.
--

--- Patch [1]: [PATCH v5 1/7] dt-bindings: clock: Introduce nexus nodes ---
commit 0bad30dd59cfc8ff93ceabdefc7264eea3d9d045
Author: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

dt-bindings: clock: Introduce nexus nodes

Hardware containers can just decouple external resources like clock
without any more control. Nexus nodes already exist for PWM and GPIOs,
add a binding to allow them for clocks as well.

> diff --git a/Documentation/devicetree/bindings/clock/clock-nexus-node.yam=
l b/Documentation/devicetree/bindings/clock/clock-nexus-node.yaml
> new file mode 100644
> index 0000000000000..ff3283bd5fb11
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/clock-nexus-node.yaml
[ ... ]
> +select: true
> +
> +properties:
> +  clock-map:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix

[Severity: High]
This isn't a bug introduced by this patch, but does the core clock framework
actually support nexus node parsing yet?

Looking at drivers/clk/clk.c:of_parse_clkspec():

	ret =3D of_parse_phandle_with_args(np, "clocks", "#clock-cells",
					 index, out_args);

It appears the core clock framework uses of_parse_phandle_with_args() inste=
ad
of of_parse_phandle_with_args_map().

If a device tree author configures a clock-map and a consumer driver attemp=
ts
to request the mapped clock, wouldn't the clock subsystem incorrectly return
the nexus node itself as the provider instead of mapping to the underlying
clock provider?

> +
> +dependentRequired:
> +  clock-map: ['#clock-cells']

[Severity: Medium]
Are we missing definitions for standard nexus node properties here?

The properties block omits clock-map-mask, clock-map-pass-thru, and
#clock-cells. Since additionalProperties is true, any device tree nodes usi=
ng
clock-map-mask or clock-map-pass-thru will bypass type validation.

Should #clock-cells be included and constrained in the properties block as
dictated by subsystem guidelines for providers?

> +
> +additionalProperties: true
> +
> +# See the original pwm-nexus-node.yaml description for examples

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-schneider-=
v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com?part=3D1
