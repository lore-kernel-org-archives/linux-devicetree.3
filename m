Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482973E9F76
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 15:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780413176; cv=none; b=KJaSLrskOwtw0h4qDJU+O+KBbGtZ0TOUZcX9ZA2yY8YakwFd+FpTvWV6h6B3YQPDVtwQB5f8ubh567K/uKX9z5WjsxZqrRrnmXkI4DyABgrbsbsgBmTsCWySAvYK32+05Lun5rpU2pzeMpMrhLm/MeIrN8bnSuK5y63PEv/989c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780413176; c=relaxed/simple;
	bh=EKytYke4FHBp7X+EL5OoxkERGDYl7uLikdiTswLKhxo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b7k2BPlH98bkIkMe1pyDAHYpK7CRNkJIp8SxiY32pQWRoo+iJwkfQV5sjUqkuoinxZqtPU0dBX65+RBTZ9kX0w0pM38olFhUmLulzojeIFnYb8JAttwQ8TuewsHk3kYn8FLfVI2BhWWzLYhIYjSDRe6c7ix9rUJ+rE/Xod3F4Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AQ9QDLSr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AQ9QDLSr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A67161F00893;
	Tue,  2 Jun 2026 15:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780413174;
	bh=ylk/16NkJTb8MDImJUeE9+B0xBKhYqg+1ZgThscsmvk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AQ9QDLSrP7VEgdkWeaL2MtX0iCXAYXZkRFIYK8qLn2UnZrwoAiNN+W3vq+mfsOQMu
	 ErXjvxHwZGL50DzJT2eWK10iAAypqYWCF1zEumXqbyvSJsnkqpblw2S6JquMdOiIGo
	 SAtOTJeHkEIJydlqe2sg51LTNFKUKXJ9cHuhl1DrHiVmY3MhRCzIJwbDt1KfjBdhTu
	 rb6UrMc02BNbfHKaw+qbZMNvN193/p62I/zlqCToO+lDzNin4vyeKXXoeg0lkkwuyD
	 dcEV+cZRwnq4YpPKUy12L139G960qt2GI31/Y1TyvmNYT2YJKnRHlOjEio7+lz8Ujr
	 aZQxyNcD9KAQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] mfd: mt6397-core: add mt6323 AUXADC support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar via B4 Relay" <devnull+rva333.protonmail.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260602-mt6323-adc-v1-3-68ec737508ee@protonmail.com>
References: <20260602-mt6323-adc-v1-3-68ec737508ee@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 15:12:54 +0000
Message-Id: <20260602151254.A67161F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unvalidated parent pointer dereference causes a kernel oops on inv=
alid Device Tree.
--

commit d38d038f6b60f5f733b7e5174e9d4dc5a41d7cec
Author: Roman Vivchar <rva333@protonmail.com>

mfd: mt6397-core: add mt6323 AUXADC support

This commit registers the AUXADC in the mt6323 devices array to allow the
corresponding driver to probe using the newly added compatible string.

> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 3e58d0764c7e0..013b0857fb548 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -125,6 +125,9 @@ static const struct resource mt6323_pwrc_resources[] =
=3D {
> =20
>  static const struct mfd_cell mt6323_devs[] =3D {
>  	{
> +		.name =3D "mt6323-auxadc",
> +		.of_compatible =3D "mediatek,mt6323-auxadc",

[Severity: High]
Does adding this compatible string expose an unhandled edge case in the
auxadc driver?

If this device is instantiated directly from a Device Tree without an MFD
parent (e.g., at the DT root), dev->parent could be the platform bus
(which has a NULL parent) or NULL itself.

Looking at mt6323_auxadc_probe() in drivers/iio/adc/mt6323-auxadc.c:

    regmap =3D dev_get_regmap(dev->parent->parent, NULL);

Could blindly dereferencing dev->parent->parent here, or passing a NULL
device to dev_get_regmap() (which calls devres_find()), result in a
kernel oops if probed as a root node?

> +	}, {
>  		.name =3D "mt6323-rtc",
>  		.num_resources =3D ARRAY_SIZE(mt6323_rtc_resources),

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602-mt6323-adc=
-v1-0-68ec737508ee@protonmail.com?part=3D3
