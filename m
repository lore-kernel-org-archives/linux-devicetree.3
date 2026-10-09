Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDB54C6515
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 11:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791543925; cv=none; b=ZeXRF89lgVU1vOJ9L/SBymHYi7aYDIbh0uD1tFyCot530lYUaIvBO7Q78FseB1SI/FuKEe0Qc0aZdhorz8CHTXtUFL7vMAYblD7PLSOwl0BhgWVNqid/x7wUaPNk5y2jCP4LWdUwy7aU5FyMoPTlSBQNE3CnTZ3tTUt+mzWXHiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791543925; c=relaxed/simple;
	bh=u6e+w1kUBl2vZbuHYOmN2xzBeUnaFqtWlhoH2+3+kPk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=c80aUtemXWAMtubmq2iaopZd65yL+ms/ah6lw9ZPjQVAuRlZF9CG0Pt+pfpAi3Fa3rS6eaCYn8H89gfFFailVPusWaTZCzpySvieldVMrmb5DuAV+TiXZnOX7xnk03GWwn7n17uhCKDwo4V0dcZUe/39LLGLmMiemDYl30QdYYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4mPPC8p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4mPPC8p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 129121F000FF;
	Fri,  9 Oct 2026 11:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791543914;
	bh=x65TjIpWN8ajfaY2CqtSSYJd3oa+IIXjQW8wYvciUKc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H4mPPC8pMeNNf+VY1grDP+sP6XIPjjPBEuHTYTHkDrvRz9VXeUTgA4M5mr1e3R+AI
	 ub5ypwD+PXiMExp9uK07I2iH9ahJivyibary/PkGlnLZFIXYWkxxrRKLAJpPsuOx4K
	 vhOyB10xyBii1qmUbXU0WN/haYOOqUfwdn9FbWrSFyBWwXTQo8ufOv8VpSsV0Flzwf
	 GQbS4B3hTAnoynmnW9XCA2sxe5BGaFFp5sz5ScYXlJedTYHWUCgZSy+acE0a3+oTfG
	 4Ws3jCxHOY1KAW6fRof3qVtrjEIpLZwjoXihyedJHaqdu1Vvyy4E6HtigwWuA9UE9u
	 4ENRiO4/J77xg==
Message-ID: <sashiko-outbox-165310@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: display: ti,tpd12s015: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: Quchaosheng <quchaosheng000406@163.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261009105412.300338-2-quchaosheng000406@163.com>
References: <20261009105412.300338-1-quchaosheng000406@163.com>
 <20261009105412.300338-2-quchaosheng000406@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 11:05:13 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: ti,tpd12s015: missing minItems: 3 constraint for gpios=
 property
--

commit 93e133f1119a3271ab3e48f347188c3580055f0b
Author: Chaosheng Qu <quchaosheng000406@163.com>

dt-bindings: display: ti,tpd12s015: Convert to DT schema

Convert the TPD12S015 HDMI level shifter binding to DT schema. Document the
two ports it exposes between the HDMI transmitter and the connector, and
add the tpd12s016 as a fallback compatible.

> diff --git a/Documentation/devicetree/bindings/display/ti/ti,tpd12s015.ya=
ml b/Documentation/devicetree/bindings/display/ti/ti,tpd12s015.yaml
> new file mode 100644
> index 0000000000000..1927da3bd7361
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ti/ti,tpd12s015.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---

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
Does this gpios property also need a minItems: 3 constraint to prevent
incomplete device trees from passing schema validation?

Since maxItems is 3 and minItems is omitted, the schema compiler defaults
minItems to 1.

The driver ti-tpd12s015.c unconditionally attempts to retrieve the third
pin by its explicit index:

    devm_gpiod_get_index(&pdev->dev, NULL, 2, GPIOD_IN)

If a device tree provides 1 or 2 GPIOs, it will pass schema validation but
the driver probe will fail at runtime with -ENOENT.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009105412.3003=
38-1-quchaosheng000406@163.com?part=3D1
