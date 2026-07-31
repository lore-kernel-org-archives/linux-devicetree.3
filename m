Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AAC43D4EC
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 15:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785512229; cv=none; b=tnKKXuRq5W1UrMBbC9d1cjqiMZWdUWMoFUjQ8inSJv13QhRsCs/gYjBCCLl3qeLsK8mrgqC8YHJScVf3ID8x/OcjGMGftNNwGI6knOBm8YM9yoLJBDiVdAPhJ0H0lCwd7X2Syn6zD5xC6ekpE0PWX/uCP34y0Yy1caQB+uWqHAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785512229; c=relaxed/simple;
	bh=hIeDgO7is8I+dUSKqJENndxWsMQd88mofgnEyEmg0Xw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CuqnQ8RMs4NAIqa199DRSap3ygX9R++sbYGgPof9VOZln6LspF+BVjJSLUPCTb5AAixUxCAIa37l5XkPYUo6zsFw6Vw8EvSRwmoOHYpvpN0/LJvMSkCN+VdgQrq7cQnyxecNh9UkUp6elwyFZaG6HNGIYywrcUg22pjxt7XdK/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fBXiyqTr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fBXiyqTr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14A31F000E9;
	Fri, 31 Jul 2026 15:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785512227;
	bh=uRma6nD/wmbQDrMSh5Z2Z7V4qaZPnisNeRmYdVTGdrE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fBXiyqTrxIt+KTRdxTzl/LjrkrZlL9Y4se/hRH0jc46ljxJwPQ7Zo0R7FftFIjzCg
	 E1ToKbrLPCMBg/SabwBskYWf2B4xP3l7FsbPLNkF4yCxNOCZWFKX42ObQoar45/DXY
	 h/ucPn3/n2uTf+tSalfVIuFf9rGvyzOdR/on3ExHNBRtRgf0lL8K7gjF9LNZvwlNaD
	 ZTfQX6LVubHgIDAjfXajB/7rrqe7EYQeBUq87yFlCPOol9SWnU7TFDtvnyoqyKqwpo
	 7VOGlN6tpiyrb+UwMoyWE3EIVflWGk2kWE/92XxIaeeylAUBzDy09Gi2i0bsCSbetb
	 RiK7J/gu0yxFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 1/2] dt-bindings: media: i2c: Add mira220 image
 sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacopo Mondi" <jacopo.mondi@ideasonboard.com>
Cc: conor+dt@kernel.org, robh@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org
In-Reply-To: <20260731-mira220-v11-1-1295fe17021d@ideasonboard.com>
References: <20260731-mira220-v11-0-1295fe17021d@ideasonboard.com>
 <20260731-mira220-v11-1-1295fe17021d@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 15:37:06 +0000
Message-Id: <20260731153706.D14A31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Removing `anyOf` from `data-lanes` without explicitly adding `minIt=
ems: 1` implicitly restricts `data-lanes` to strictly 2 lanes, rejecting va=
lid 1-lane configurations.
--

--- Patch [1]: [PATCH v11 1/2] dt-bindings: media: i2c: Add mira220 image s=
ensor ---
commit d966c6286995396b61812a3a1c5b7c1683f0cbf3
Author: Philippe Baetens <philippebaetens@gmail.com>
Subject: dt-bindings: media: i2c: Add mira220 image sensor

Adds device tree bindings for the AMSOSRAM Mira220 image sensor.

> diff --git a/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml=
 b/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml

[ ... ]

> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            items:
> +              - const: 1
> +              - const: 2

[Severity: Low]
Does this configuration implicitly restrict data-lanes to strictly 2 lanes?

By defining items as a two-element array without overriding minItems, dtsch=
ema
automatically infers minItems: 2. This overrides the minItems: 1 inherited
from video-interfaces.yaml, which causes valid 1-lane device tree
configurations like data-lanes =3D <1>; to fail schema validation.

Could an explicit minItems: 1 be added to allow 1-lane configurations?

> +
> +        required:
> +          - data-lanes
> +          - link-frequencies

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-mira220-v1=
1-0-1295fe17021d@ideasonboard.com?part=3D1
