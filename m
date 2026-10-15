Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604DD413D69
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 16:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792080836; cv=none; b=su4trV4w8zcoucdhLUaFXBPz3q6PcnCxMr10AY04v4hTZj3YSwebvkezqCSkTI1BjW9EvM/i+TmulpJE3diVmeSKookuzGKrhsBUtShbXWOs6vkddUxWpce3Euyy6P9667pDk/Lti1dgqjSAyywCFRxrkfK5rfMYfO2rQ+/RnfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792080836; c=relaxed/simple;
	bh=dAIQgh0zLnp3V5uyawUvtGZNkeOctlQhD+es+ympT8E=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=QsHm7okaM+G2vBs6IaMldmlobmQxEkb3etns2wZbcEEmeDmDfzOVYzRXG6gyGR1brSj0nztTXuXXnJpYhat7mBthLihtkOhfmzpHFqAYTKNJqCWhG29ewcQgXT5/9NFXZCKRBYqUkemT8406N0T/OJDAU8HolOicczK0hdDwHDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rm3WiB6S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rm3WiB6S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B23321F000C6;
	Thu, 15 Oct 2026 16:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792080818;
	bh=DxHSFvlvVuGzXwnRRXJ9nWBLCwWgDED7ccDhljGFkYM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rm3WiB6SYbd8m5oaJBKlk9+EKI1NSOwDWTdubMkFTXk54dN2fuSfd1OEJShG/WqsA
	 99nDy5wlIFejagvVSe91PTrg3OmZ4M8HCuCW0Wc64k5W9JKeYbnCfflIvcfNcBc5Qk
	 mLg/4HJM9h6A/0M7ZiFkfjUzQu82mMX7etQt9p1OOCmGNQyptQ0pKIoo9Tir30ZOE8
	 IDNhU3cOgWdAEfnti2KtjXDEmxXHVO0JEqR32tVf265hNjvcO0tlAbBxB5esKFazqI
	 hfq+VR7ssCvWzxYgot8WvX/kA5c0k8/ZPjeC1XdA7CXZo56O9eUst4rBmtXQ5vzxwH
	 XBaQGhpadGj4A==
Message-ID: <sashiko-outbox-173150@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 04/16] media: sony-starvis2: Parameterise the
 configuration to allow for other models
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261015-media-starvis2-v4-4-75fcdb4163f3@raspberrypi.com>
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
 <20261015-media-starvis2-v4-4-75fcdb4163f3@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 16:13:37 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] media: sony-starvis2: unconditional common_regs_written =3D true=
 on error
--

commit 9eba4e98350150880f04e6b7769441de57543230
Author: Dave Stevenson <dave.stevenson@raspberrypi.com>

media: sony-starvis2: Parameterise the configuration to allow for other mod=
els

This commit extracts and parameterises sensor configuration parameters,
such as pixel array sizes, default VMAX, and common registers. This enables
the driver to support additional Sony Starvis 2 models using the same core
logic.

> diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-s=
tarvis2.c
> index c4f590c489d99..189caac780667 100644
> --- a/drivers/media/i2c/sony-starvis2.c
> +++ b/drivers/media/i2c/sony-starvis2.c
> @@ -896,8 +927,12 @@ static int starvis2_write_common(struct starvis2 *st=
arvis2)
>  {
>  	int ret =3D 0;
> =20
> -	cci_multi_reg_write(starvis2->cci, common_regs, ARRAY_SIZE(common_regs),
> -			    &ret);
> +	if (!starvis2->variant)
> +		/* Powered on during probe to do detection. Variant unknown. */
> +		return 0;
> +
> +	cci_multi_reg_write(starvis2->cci, starvis2->variant->common_regs,
> +			    starvis2->variant->num_common_regs, &ret);
> =20
>  	cci_write(starvis2->cci, STARVIS2_REG_INCK_SEL, starvis2->inck_sel_val,
>  		  &ret);
[ ... ]
>  	cci_write(starvis2->cci, STARVIS2_REG_INTERFACE_SEL,
>  		  STARVIS2_INTERFACE_2L_4L, &ret);
> =20
>  	starvis2->common_regs_written =3D true;

[Severity: Medium]
If a transient I2C error occurs during starvis2_write_common(), the
cci_multi_reg_write() or cci_write() functions will set the error in ret.

Does this unconditionally set starvis2->common_regs_written to true before
returning even when ret is non-zero?

If an error is returned, a subsequent attempt to start streaming might see
starvis2->common_regs_written as true and skip writing the common registers,
leaving the sensor in a partially initialized state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-media-star=
vis2-v4-0-75fcdb4163f3@raspberrypi.com?part=3D4
