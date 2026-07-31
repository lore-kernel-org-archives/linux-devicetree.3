Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769353769FB
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 07:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785483596; cv=none; b=To0T4tWzwSkQ89XT/ieyFHWDMakDFTiL0XRefcLi0I6H2Pq8hNDTlx65jf82T+coufg6mh61cAwMABYCB5RWu56zpTztwlab3ut/qBm/cazuYIBZS8+RQFNUSUbghHAFPD2NK6vzARsQEbzHAi8ht7Ve19EOCUP+D0Q7P3i8q7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785483596; c=relaxed/simple;
	bh=Ndw9HLGDyoDc2x6n75ufA4MpnAsdtVi8DQI/HYMdJzA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kW0tTcP4cobM55sXRwSfcJ3NjwaRdBpFxiRTdLEIFgBKZVckXJQb08djBD9DbZ0l7pVzETr893OvG2qH3Kl/MlJz+v//32ksyUHitwvlJcmAx45VytBZAU4xbJPUYuDbxZgaF4wmFiaJValwyWBK+0w+JhzWTH78+o9WeCxulKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVXYOcGV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVXYOcGV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 197FA1F000E9;
	Fri, 31 Jul 2026 07:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785483593;
	bh=oj7JNF3Ll4IUYFry6532DNxgS0bvqQMQd55AmWuYaVg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IVXYOcGVph4WJyKc1SU8BzZiIN4lUPa9U4qHlzejZGSKyxg0lJ+S27HhJxb2AX4sg
	 jNT81HlzV/dmi9WQUfg1g0EtFA8BAaSU62UtvSaQGtsfX0DkpwWUMM3TtUfggRt5EL
	 cWBrsbxcfkKCz7BxH7n+sRui7xp2QP8VwPNW+wN0NxMa2iQgiyWdKVT3OMLX6cVy1X
	 D03lseTPQ0OZXzaCpP+5fuCkSHCggBb7srpgN4vjZdZEJJEP2YcDuzILKmw1oOZWnl
	 DEr3Uz4eqLyZ4ubJkM+ulgqxfPEJTP3CDiYgFweiZ8X7anfDJPpbkm3KnbRkydjKnG
	 W7HJb4xRQazlg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add onsemi AR0234 image
 sensor binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Shiyan" <eagle.alexander923@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260731073505.2278769-2-eagle.alexander923@gmail.com>
References: <20260731073505.2278769-1-eagle.alexander923@gmail.com>
 <20260731073505.2278769-2-eagle.alexander923@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 07:39:52 +0000
Message-Id: <20260731073953.197FA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The `compatible` property schema contains fatal YAML syntax errors =
due to missing list hyphens (`-`), resulting in invalid JSON schema constru=
cts that will fail `dt_binding_check`.
- [Low] The `data-lanes` schema constraint mathematically allows 3 lanes, w=
hich contradicts the explicit 2-or-4 lane hardware requirement described in=
 the binding.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: media: i2c: Add onsemi AR0234 image=
 sensor binding ---
commit 883339f4cdfd1f0ac858633345ef05f216a1e0e8
Author: Alexander Shiyan <eagle.alexander923@gmail.com>

dt-bindings: media: i2c: Add onsemi AR0234 image sensor binding

This commit adds a new devicetree binding schema for the onsemi AR0234 CMOS
image sensor. It details properties for compatible strings, clocks, supplie=
s,
and the MIPI CSI-2 port configurations.

> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml=
 b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
[ ... ]
> +properties:
> +  compatible:
> +    oneOf:
> +      const: onnn,ar0234cs
> +      items:
> +        enum:
> +          onnn,ar0234cssc
> +          onnn,ar0234cssm
> +        const: onnn,ar0234cs

[Severity: Low]
Are hyphens missing for the array elements in this compatible block?

Without list hyphens under oneOf, items, and enum, the YAML parser might
treat these as mappings or multi-line scalar strings instead of valid JSON
schema array constructs. This invalid structure will cause dt_binding_check
to fail.

[ ... ]
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +        properties:
> +          data-lanes:
> +            description: Number of MIPI CSI-2 data lanes (must be 2 or 4)
> +            minItems: 2
> +            maxItems: 4

[Severity: Low]
Does this constraint mathematically permit 3 data lanes, contradicting the
description that the hardware must use exactly 2 or 4 lanes?

A device tree specifying data-lanes =3D <1 2 3> would silently pass validat=
ion.
Could this be structured using a oneOf block with exact limits to strictly
enforce the hardware requirement?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731073505.2278=
769-1-eagle.alexander923@gmail.com?part=3D1
