Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9738F477982
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 13:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183343; cv=none; b=hO9upbzuF/VRWNbt4u+K47qiW6GlDg6y861XpICA6DM/dAJAOkgk4AzgzA4kLdgwhd+PXxDQiYVM5c1tG1D0lth8k5k9/lkQ+YijqsZ2P+GKD0EDGJFFA/eBaBbA8tNjfhzRIodNYq3kmBk3Q4FsZ9KaigFI/jByq/n2d5UhAhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183343; c=relaxed/simple;
	bh=P+KoZFIoflkASBnKlKBvnC0Jjj/YYowgt/rpfhHDRvE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=olmJFfxqd9AcAQNQgVKjswpwl1bfkdFumuJrIqHhiFg4cy2uHGd0BM0jPU8CpzogQVYG+LZu5gy4JJt+Oi+dVWH+lbBB7aQNhm9z+8fG1maPtyI/VewoU6tm6m0cHYEQiKQfw8pP91+jUsXtal4Q2gixB1oFdfrOo828tVtZkAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yk7h07Cv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yk7h07Cv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3968E1F00A3E;
	Mon, 31 Aug 2026 13:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788183341;
	bh=0vmnukF46ZUEyfip+4xLqblxT2uHfgSQVaTRaW9Vn5A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yk7h07CvEC3a4etuUkXRYb9W2uRpKcX911rH/tSHOoZlIY8v7OfnD2mnhpBFK4Zu2
	 zMqN5CEPSAXXvOBjGjnvbtWS+KQMCHBuVzEawdbAwRVPXon0wIIkVgZwVI5JI/vN7o
	 iv+XYogTeXZYjLrFNPMdzMQuWDZ/XC3TlZBNTfk3VvPptCbdMCWpORbJwcdZxuv33H
	 DF44jVDQ0WBFskiYLYHY4P3GyUIc1132sOTDudMIEknGKK3OSEASta5sS28VlsuLJs
	 SIzBD4w400jHlW3/1PK7cjay87nTVY1lqeLh6lqyICeJ/p556NpC+OjA/rmSdKqaYt
	 1qp4XFysQYi7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 10/22] dt-bindings: media: i2c: max96712: add
 control-channel-port property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260831-gmsl2-3_serdes-v16-10-4fa6e08bb514@analog.com>
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <20260831-gmsl2-3_serdes-v16-10-4fa6e08bb514@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 13:35:40 +0000
Message-Id: <20260831133541.3968E1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing schema constraint for variant-specific property `maxim,cont=
rol-channel-port`
--

commit 1c245f50a34397eb74c873313431f23cd90654bf
Author: Dumitru Ceclan <dumitru.ceclan@analog.com>

dt-bindings: media: i2c: max96712: add control-channel-port property
   =20
Add maxim,control-channel-port property to allow platforms choose which
control-channel port MAX96724 exposes to the upstream I2C host.

> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.y=
aml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> @@ -41,6 +41,15 @@ properties:
> =20
>    enable-gpios: true
> =20
> +  maxim,control-channel-port:
> +    description:
> +      Selects which deserializer control-channel port is connected to the
> +      upstream I2C segment when the device resets. 0 selects port 0, 1 s=
elects
> +      port 1. Defaults to 0 when omitted.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +    default: 0
> +

[Severity: Low]
The commit message indicates this property is intended for the MAX96724 var=
iant.
However, because it is added globally under the properties block, it will p=
ass
validation for all devices matching this schema, including maxim,max96712.

Should this property be conditionally restricted in an allOf if/then block =
so
that invalid device trees for variants not supporting it fail schema valida=
tion?

>    i2c-alias-pool:
>      maxItems: 4

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-gmsl2-3_se=
rdes-v16-0-4fa6e08bb514@analog.com?part=3D10
