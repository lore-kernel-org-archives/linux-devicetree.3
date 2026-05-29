Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556A7288D0
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 22:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780092075; cv=none; b=odink669rncUKg/wVQaIMl3Op7X0NyubOnzfewJWoVP6PeDXZoEosoJ57FRffg3xn4ng2uNtutbWe2Mw4dXic0AuJCaNWa9JsWc+/3DcFQ8+qAHOIN+RSTVR04tIeVXHCjsZwk1TirY9jVrud11CyTx9jfbpnUlQnMoGGfj6p3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780092075; c=relaxed/simple;
	bh=pV0TWZ5PN7y6swk63a7UmAAFzKnL9lA+X8PyRUPLxF8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Fu7hruMZ7z9equVIRZrU318P1k042EWwwNx5nmd4soWuSjmcGWGHxoSb8Vo4OMVlY7DwJsKSgvhxVjSuekrJpMJ4/YmAtxy9Iwm7Es72yHYxkNqRaSsCTKF1MjJKT+xbFCvN9Y+dMa1tNj6650Kc1XB/sNXro+ZbWTkn5OWJ0Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UT1ljO9K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UT1ljO9K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CABB41F00893;
	Fri, 29 May 2026 22:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780092074;
	bh=I3mJ1BLdCK5eAocY2gSFSoclzkIK5eS+mqgUJB6qB4s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UT1ljO9KRZlIaBbZvMcR/65X610iFdQlMX8/M8SDpAm1IfYARHIaDUSUrCH0Gd9xe
	 8/Mv3W/aNWFUsJTp7+gvnipEP0+r6JQrqw0fSha+GBK7bbuLpdfkUgK3uJJM5t0ND0
	 a31DpFj6yTgWTm/iyB+FfrHYtavcinxkKJ9rj6TV44FtsvP/5WjsPihuY9QZWkYBF1
	 oW/opO1ZQXR+oR7tMjvlnHsoItjjgG1qb/5/62J1akyyDqrRUOOkD/oVH5oM+YZVOD
	 GUOImjhDtcxhHsHnVov3p5Uz0UjJln6hS/BAG6ZiUlj2R2jhqCBWC9H2SaZ1YfOIDW
	 DBdSmSiHeeChQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: usb: convert PXA USB bindings to YAML
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jeremiah Bishop" <jbishop.dev@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260529213506.37462-1-jbishop.dev@gmail.com>
References: <20260529213506.37462-1-jbishop.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 22:01:13 +0000
Message-Id: <20260529220113.CABB41F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `marvell,pxa-ohci.yaml` schema omits the `vbus1-supply`, `vb=
us2-supply`, and `vbus3-supply` properties but enforces `unevaluatedPropert=
ies: false`, which will cause valid device trees to fail schema validation.
--

commit 78f580ae03eab5d588221a2a8289471c77c1c517
Author: Jeremiah Bishop <jbishop.dev@gmail.com>

dt-bindings: usb: convert PXA USB bindings to YAML

This commit converts the legacy pxa-usb.txt binding documentation to
YAML schemas. It splits the documentation into marvell,pxa-ohci.yaml
and marvell,pxa270-udc.yaml to provide machine-readable validation for
both the host and device controllers.

> diff --git a/Documentation/devicetree/bindings/usb/marvell,pxa-ohci.yaml =
b/Documentation/devicetree/bindings/usb/marvell,pxa-ohci.yaml
> new file mode 100644
> index 0000000000000..3f7935384b9f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/marvell,pxa-ohci.yaml
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +unevaluatedProperties: false

[Severity: Medium]
Will this strict validation reject valid device trees that provide vbus
regulators?=20

The PXA OHCI driver in drivers/usb/host/ohci-pxa27x.c explicitly calls
devm_regulator_get() for "vbus1", "vbus2", and "vbus3" for enabled ports.
These requests resolve to the vbus1-supply, vbus2-supply, and vbus3-supply
properties in the device tree.

Because these properties are not defined in this schema or inherited from
usb-hcd.yaml, and unevaluatedProperties is set to false, it appears that
any device tree describing the vbus supplies will falsely fail the
dt_binding_check validation.

Could these supply properties be added to the schema to prevent validation
errors for existing users?

> +
> +examples:
> +  - |
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529213506.3746=
2-1-jbishop.dev@gmail.com?part=3D1
