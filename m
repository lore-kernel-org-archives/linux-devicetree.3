Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B1D3CC7CC
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787900137; cv=none; b=ClyjHcHnc0bOBEezTLzfWE8Qhtzlt9xZmwfog7EaSwwsiKV9hC1AFj5JRqH6GNfzxcfEfxajbme4cg+2rdSHI8wZxaZf/UduACMR0AGoyjMLxLJXCLiUGnuBF0KekNO6yskINXPng02zt3g9+v0m/ev933LurQsF4Ca5tIdJq2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787900137; c=relaxed/simple;
	bh=vw7ox9bX9HNEOCKjlHMddoUsJj9Zac+VoB/SM6gecFU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KVTchZCjtHJrl0jwFscTcid6O5fDvRhKgEiJ+CJpXS4a/aNJJSVlSq+wyQIdTvwg2MalwjPVLpAWPVo18Bt4I4tYSqkL++NMKiCX5Adm7Zn8RLBo7rmzyOUp4S1sGk3yfxp/H5XLFDemxhxFJu/t95NKIE16yOB+sn1HutrslDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J+tLB/+Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J+tLB/+Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13791F000E9;
	Fri, 28 Aug 2026 06:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787900135;
	bh=frn1pA3t5A/9AeOQ1tQbW4jR/htphk6DXCgieoCaOco=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J+tLB/+QYvdWvwZhBYWD5QEQ+CfC1EDZwudTRRYvulzJeIrEH35R3FXhcEpRUe0kk
	 XBcT/9az5mZYns5pN9YADBiNYlj2e2xtFhkW6AVHUIePU98WwXrtP5lylBcvi6eIQa
	 hHxzHZpgWFaP7ftkN6Dsl01R2Z68SEkkT5NOgUs2AsiDFYMcYGEt7iUC5Rvf2yvKOp
	 ANAz44hVKts4qXxwY+0cN81h8jmYUaPcTIrHvmdJuFetWFT3+wF+5nme2dw/I1SeCe
	 7Eb2cIEY56MwfinrftUnWmly+4k+qR9UbFabVmo8/OrWotRB2AQ7PnKLfJ/TtE2fTW
	 nUYNZIoXumhxg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] media: dt-bindings: imx908: Add Sony IMX908
 sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lachlan Michael" <lachlan.michael@sony.com>
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org
In-Reply-To: <20260828064843.65047-2-lachlan.michael@sony.com>
References: <20260828064843.65047-1-lachlan.michael@sony.com>
 <20260828064843.65047-2-lachlan.michael@sony.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 06:55:35 +0000
Message-Id: <20260828065535.A13791F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incorrect use of `additionalProperties: false` with a top-level `$r=
ef`, which blocks inherited common properties.
--

commit 065f027b1ff1efb3cf1642216e2b0f54de8f7f54
Author: Lachlan Michael <lachlan.michael@sony.com>

media: dt-bindings: imx908: Add Sony IMX908 sensor

The Sony IMX908 is an 8.39 megapixel (3856x2176) CMOS image sensor
with a MIPI CSI-2 output interface, supporting RAW10 and RAW12 output
over 2 or 4 data lanes. Add device tree bindings for the sensor.

> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml=
 b/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
> new file mode 100644
> index 0000000000000..828db1175e2f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
> @@ -0,0 +1,108 @@
[ ... ]
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - dvdd-supply
> +  - ovdd-supply
> +  - avdd-supply
> +  - port
> +
> +additionalProperties: false

[Severity: Low]
Will this incorrectly reject valid device tree properties inherited from
video-interface-devices.yaml?

Since there is a top-level reference to video-interface-devices.yaml, using
additionalProperties here forbids common media properties like rotation,
orientation, or lens-focus from being evaluated. This will cause make
dtbs_check to fail if those properties are present in the device tree.

Should this be unevaluatedProperties: false instead?

> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    i2c {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828064843.6504=
7-1-lachlan.michael@sony.com?part=3D1
