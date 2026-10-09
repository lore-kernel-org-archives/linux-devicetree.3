Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD20F4C650B
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 11:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791544477; cv=none; b=gNoGxNrUx9w6P3WQ+CarvZWQMSs0o0Mt/2MN46moIc5A0x5dD84eB0lYHbcm+eZdy4KdgrJ5WybBgrbasO+U5ije0WlvF3UpOhGNH0DH6IVPzSm1jricJkvBsVRUXDck75qehk6yTBlK+YaTOk+PDykCq6SFWCYquaLZ/hS1Q6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791544477; c=relaxed/simple;
	bh=NV9QihphD6gTfDyqkbikkVBGVpXx2wuzv3xFVZngB9g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=P2+/53vsqJsfcNsooniJX7mmN9jnAYLasIkC9AXhrCD6CZEYFmVvwUrKdADFwkOSDfP8C32MPahEs4DkiCTwUvPtt1HJmQuARUcL/1fGJMdDo+wV/vQ5eHJsecP+tyGaAJF6iHqY+XVrrEl6vPykgp3iaroy9TWsHIwIlZTvi7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P96Vx3HG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P96Vx3HG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26EE1F000FF;
	Fri,  9 Oct 2026 11:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791544468;
	bh=wAlmfTO1x8ZGuIrBVnjfCIbThBR9a4CfW10WL3eQS7M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P96Vx3HGBtOYuWHSnBl8hVuig9QLG7UyK8EDObvwgJBfuB/QmmBDPaK8cQDB8PBMa
	 JbIZlb9gDD7cRfa1gmsSjpE2B6zti95nLR8g/IR/ynRYVi0aicL1BjP2iQJQ9RsdlP
	 AXZA8y7i6NC93LKx7PV+tXIYk+kn5tAscrv9x5GubMOGVtxT1QN0TtSLcGFWmklQt8
	 Ics8hnLFKmzf485VHwIaVv+JBuuR6NSLngtdhg9fLrEpfsLnEQOgbUs20rGrdRw5xn
	 SMcYpPXQzhqeC4y8bPybn/2LSDqgiLb1yBFXVD1ZjVKl/RFrbR6SonelaTJhEI44pT
	 Gu+PE6reFhT4w==
Message-ID: <sashiko-outbox-165335@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: display: ti,tpd12s015: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: Quchaosheng <quchaosheng000406@163.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20261009105601.301891-2-quchaosheng000406@163.com>
References: <20261009105601.301891-1-quchaosheng000406@163.com>
 <20261009105601.301891-2-quchaosheng000406@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 11:14:27 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: display: ti,tpd12s015: gpios lacks minItems: 3 and is =
not required
--

commit 0e47bb58ccd4af1df6d3ff49895c7cf9fbc75cb8
Author: Chaosheng Qu <quchaosheng000406@163.com>

dt-bindings: display: ti,tpd12s015: Convert to DT schema

Convert the TPD12S015 HDMI level shifter binding to DT schema.

> diff --git a/Documentation/devicetree/bindings/display/ti/ti,tpd12s015.ya=
ml b/Documentation/devicetree/bindings/display/ti/ti,tpd12s015.yaml
> new file mode 100644
> index 0000000000000..1927da3bd7361
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ti/ti,tpd12s015.yaml
[ ... ]
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: ti,tpd12s015
> +      - items:
> +          - const: ti,tpd12s016
> +          - const: ti,tpd12s015
> +
> +  gpios:
> +    description:
> +      The CT CP HPD, LS OE and HPD GPIOs, in that order. The first contr=
ols
> +      the level shifter, the second enables the level shifter outputs and
> +      the third reads the hot-plug detect line.
> +    maxItems: 3

[Severity: Low]
Does this schema accurately reflect the requirements for the GPIOs?

If a device tree node defines fewer than 3 GPIOs or omits the property
entirely, it will pass schema validation since maxItems is set to 3 without
minItems: 3, and gpios is omitted from the required block below.

However, both the DRM and FBDEV drivers unconditionally fetch index 2 (the
HPD GPIO) and fail probe if it is missing:

drivers/gpu/drm/bridge/ti-tpd12s015.c:tpd12s015_probe() {
	...
	gpio =3D devm_gpiod_get_index(&pdev->dev, NULL, 2, GPIOD_IN);
	if (IS_ERR(gpio))
		return PTR_ERR(gpio);
	...
}

Should the schema include minItems: 3 under gpios and add gpios to the
required list to ensure device tree configurations that pass validation don=
't
silently fail during driver probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009105601.3018=
91-1-quchaosheng000406@163.com?part=3D1
