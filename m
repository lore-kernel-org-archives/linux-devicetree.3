Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BCC531AE1
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 11:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788868202; cv=none; b=pfMA0B0+6skvJaNtON3sq1PXRpWsjAC5VAxdiVCOmMb5urxrhejU0tle1S1yv9Ybx853TqHYepqCeLfYzq+SEJcGYgAe4SzIWaqf+3Ip56I7VKvFoY8Tps6Aglz+OFOXTUVChTusJ5gm0iSzA5PrXXK4fTjQJRij9cyYhXFdmks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788868202; c=relaxed/simple;
	bh=D9GHhZwzcJGi/ffpV5yBrU/hXEA/rS9qRaUbzU3INMw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d8MswvwtMwn2tEYEfoquJbNHiGRKq101CDFEVr3VbiEbQH1jnJ7PBxSHOwA3QClfiVtBhaBqeGkG7ialMl//S5OLYPtXJ513o8vzlFTPiEVocWYutz1M/1W5f9LQr3Y3PmaPs4drSEaypXwQPX9tlGXdJY76xaVDBTcYsCJPONg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KRhKhFQp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KRhKhFQp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CCA31F00A3D;
	Tue,  8 Sep 2026 11:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788868184;
	bh=a0Wbm/9EFMPbEZQ8DnTv6CGAguukjHrIJYNCZEkhPTs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KRhKhFQpBD87y8Ij+TEu/ezVKP4S89gtjluqEljc5bDa1+gVo69L6taSHR9AIWi6Z
	 49nIplAq8AOq320/8vVcghmqnOTKnnwzyT03LEhagnqkw+1l0svZjO23fWhscYrnIQ
	 iTVHOOAEYeuvtRpkzgfEwCikWBrYf1GT+o2WFW0W4TcZpEni/GobT8CRupY/fJwVD/
	 z5paIqC4E8hr8JcPO7oXlK1p3oHomjjoGtxAmR7yqcerIe9Tiw80hgWfovbbqc7CJX
	 ElEHqp5HgnzWxRxh+4QBOSWZE5DV8NOP43DHmg+UTiNp4o5+e9EcGFKJSwfk/2AyxA
	 7R6IO8ukhhTJQ==
From: sashiko-bot@kernel.org
Subject: Re: [RESEND PATCH v5 1/2] dt-bindings: media: i2c: Add os02g10
 sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elgin Perumbilly" <elgin.perumbilly@siliconsignals.io>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260908114235.86568-2-elgin.perumbilly@siliconsignals.io>
References: <20260908114235.86568-1-elgin.perumbilly@siliconsignals.io>
 <20260908114235.86568-2-elgin.perumbilly@siliconsignals.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 11:49:43 +0000
Message-Id: <20260908114944.2CCA31F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing schema constraints for the `data-lanes` property in the end=
point node.
--

commit c48287dfcd39b1f1c512055b67affd7bc77f43df
Author: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>

dt-bindings: media: i2c: Add os02g10 sensor

This commit adds device tree bindings for the OmniVision OS02G10 2MP
color CMOS image sensor. The sensor is controlled via an I2C-compatible
bus and outputs RAW10 data over a 2-lane MIPI CSI-2 interface.

> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yam=
l b/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
> new file mode 100644
> index 0000000000000..e240974dcc9a1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
[ ... ]
> +  port:
> +    description: MIPI CSI-2 transmitter port
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        required:
> +          - link-frequencies

[Severity: Low]
Does this endpoint definition need explicit constraints for the data-lanes
property?

Without explicit constraints, the generic video-interfaces.yaml allows
data-lanes to have up to 8 items by default. Since the binding description
mentions the hardware only supports a 2-lane MIPI interface, device trees
specifying physically impossible lane configurations (such as
data-lanes =3D <1 2 3 4>) will incorrectly pass dt_binding_check validation.

Should we explicitly declare and constrain data-lanes here with something
like minItems: 1 and maxItems: 2 to restrict configurations to the actual
hardware limits?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908114235.8656=
8-1-elgin.perumbilly@siliconsignals.io?part=3D1
