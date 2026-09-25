Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DD64A3F00
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 13:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343636; cv=none; b=GYl5HWxTj/9vmp2RQK8+sSDLaeVVXyCgecjBGVDNYMYojg44jye6KmfpQGe0VNvgkD2y42NkWJC/8524myHAaNjsZd1Rmo/VWpXdBLlmh0spiFmXBMEmeFgtCmkUMtj/adDRQjGT9zuLhZr5k+Y02lcbzY4mzC2r83zRg0tW+C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343636; c=relaxed/simple;
	bh=dznl1RSv53Lbp6kU4vQuBh6nTj+wt8G46c26d/h9cNY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FZn7UT2J7I/B1MyihKUzE0pb6dgj+V2iwajiwlF97V4n9hR+b3IxclC0FmP5yyTohnr55Riw25+6Q1RrxZylqNCdWj9SfcbFiIpoBbKxelyjbNiSxS90+52GZ4SOZ38ol30yQCY0L+DzTsWYWWu4cjAniPYNRONj3DzTadeAjZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q9H9KjXw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9H9KjXw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AE121F00899;
	Fri, 25 Sep 2026 13:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790343632;
	bh=gCgrOW89LcV2GGM0GCcPl4VpBELe2jcyrfBKLU1Y97U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q9H9KjXwgon/CokzYUwgRrp8JlvmkvgsaAEXatIgvZ3kb+Z1hG6gFWM0+BwuKNVVQ
	 ieym5mBb9U8Sis2ZliVpQieNn2/6kgdhKDKVsj+mUVeWxZnEz3g9qfQKtIQL5/miUv
	 52aZDjwhqIsu+xJMpNkJS8cOHiTNVHqk6pq/cAAO6oyxdaoRCmrXfQza5viOG4X8z0
	 +ZWcIOBk3iOFT6XCFCS5xrkS/Zus55um4ZSw4nZ5UTPnAWFEqVhMHx9aVBDS5CQcjZ
	 FkmeVgmd/aSr1b5yv7DEOWyh6hjz0iGzBUy0K2PTDGcZfzz5visMIFKNJllLYeUjZr
	 08fJihjGxXmwg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 1/8] dt-bindings: media: Add bindings for Omnivision
 OV2312
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rishikesh Donadkar" <r-donadkar@ti.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260925133001.2780868-2-r-donadkar@ti.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-2-r-donadkar@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 13:40:32 +0000
Message-Id: <20260925134032.4AE121F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] dt-bindings: media: ov2312: missing standard supplies and interf=
ace properties
- [Medium] dt-bindings: media: ov2312: missing endpoint constraints for dat=
a-lanes
- [Low] dt-bindings: media: ov2312: non-standard relative path used for sch=
ema $ref
- [Low] dt-bindings: media: ov2312: spelling error 'Omnvision' in descripti=
on
--

commit 77ac9a3376c50e8570040c636f5b50eb4a9953b6
Author: Jai Luthra <jai.luthra@linux.dev>

    dt-bindings: media: Add bindings for Omnivision OV2312
   =20
    Add DT bindings for Omnivision OV2312 camera sensor.

> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2312.yaml=
 b/Documentation/devicetree/bindings/media/i2c/ovti,ov2312.yaml
> new file mode 100644
> index 0000000000000..76929fcc65506
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2312.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov2312.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OmniVision OV2312 Camera Sensor
> +
> +maintainers:
> +  - Jai Luthra <j-luthra@ti.com>
> +
> +description: |-
> +  Omnvision OV2312 is a camera sensor with an active array size of 1600x=
1300.

[Severity: Low]
This isn't a bug, but there's a typo in the manufacturer's name. Should this
be "OmniVision" instead of "Omnvision"?

> +  It supports capture of frames with a 4x4 RGB-IR bayer pattern. This pr=
ovides
> +  both human (RGB) and machine vision (IR) capabilities in low-light sce=
narios.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ovti,ov2312

[Severity: Medium]
Does the properties block need to include a $ref to
/schemas/media/video-interface-devices.yaml# and define standard physical
power regulators (like avdd-supply, dvdd-supply, dovdd-supply) or mounting
properties (rotation, orientation)?

Because the schema strictly sets additionalProperties: false, accurate devi=
ce
trees that model these physical hardware features will fail dtbs_check
validation.

[ ... ]

> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:

[Severity: Medium]
Does this endpoint definition need explicit constraints for data-lanes and
link-frequencies?

Without constraints like maxItems: 2, the schema inherits the default from
video-interfaces.yaml and incorrectly allows up to 8 lanes. Missing these
constraints also means essential CSI-2 properties can be omitted entirely
without failing schema validation.

> +        $ref: ../video-interfaces.yaml#

[Severity: Low]
Should this use an absolute path for the schema reference?

While the dt-schema tooling might resolve the relative path
(../video-interfaces.yaml#) based on JSON schema rules, standard kernel
devicetree practice mandates absolute paths (e.g.,
/schemas/media/video-interfaces.yaml#) to ensure consistency for automated
tree-wide tooling and grepping.

> +        unevaluatedProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925133001.2780=
868-1-r-donadkar@ti.com?part=3D1
