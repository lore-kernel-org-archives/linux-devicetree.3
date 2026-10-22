Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792683740;
	b=rupPyxlCYAAwX+lI6J8Dh35V8j94AFi2nbP9xPfz1SwNAso/YRXsS5Ea5+evMUXWz+fy
	 Gpr/KtvMdcZt815gxGp3eKAXN9KGZd+xqdB9FyTX76lPqFBfakvYgCGWVJ3k2jY+m3BFJ
	 wuCj6f7JtGLFgQIRzuQc+G2qKJGOf4e6Krgod3MUf46idBUjmaV39lEEdEmD2RQFQ/FWg
	 5TEOnE6dS28qTOnUcyITeq9Zqz/GxeBVVRs2ZQ9jajm78L4P4yBFTbL2CF/kn/qfYoQdW
	 9Tmuxg2Co3MreZKN8ubwJxnfBRGqYbsOnsNUsVUkMmmR7BTtYHVrL7f8CgfQGEYi41g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792683740;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yDvJkH6xvcpgjxUtMF/kzR7L/WAKlv9Hxs2lg6rgqjA=;
	b=MWObJxWhiKRHw57nLyYC1LlBXqJEhOXTLaG6oTd/2Pu4/dtp8TFUIcJb3I6PJPSNffFB
	 PSj7QSFD9FD4zVXbiTUVqKEbp1oACucHbpYNxkXruM5AKDjn1290M7uLvgFS9UcjWj0CG
	 /yzZG36BFY8Pl7rYB8i4iRjsJWZirCfVotDwwxcp2u/CdSTd1nsWYCRmCep3/0tmorBSq
	 sSGQCDEKssDSR1Ltybg2d8JXHWNK5MntzWDLa6lWL7tbx/EPBVCdn6TUZP+P5+pQ+W9wg
	 ljQaivqTMF035VrUGGpg3BiJs4ERh42tVVWT+7bmRCH5e1gZUMqjXyr5ifi2foFd7JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y03JHkf9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2E1606A31A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 15:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y03JHkf9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE491F01825;
	Thu, 22 Oct 2026 15:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792683739;
	bh=yDvJkH6xvcpgjxUtMF/kzR7L/WAKlv9Hxs2lg6rgqjA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y03JHkf9OAHHG1d5iO0WAo8cdSgb2y1o+SRBBRAQuPIqyOkdmN/8lm4b+M8NNw2QJ
	 MluPI1EwNi0r0vJ2Vp/J/xBT+oDdBBvrplbYCEhNT/imAvmnN0k6LFmTbqRyhxD6pW
	 1EY5I6ICzTnmN+7FOocrfrSKtRI86AHxUz6fovAUN1Q9VDtAB2yhBKUGLre6uFKwiG
	 UPi6QDdgQhDRgb0ItxTboxlfKIlZM8xpnGJpshw0Vl3xiZeogJntSEtREckX/Xrm+m
	 IlPjrv33NfNOfu0+QdRiBtKKj0Y9RB9TskzAlpfUfg7FsosY22KxNxt2nPL+aOQlsO
	 /dgvXODYPDIeg==
Message-ID: <sashiko-outbox-181715@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/10] iio: frequency: ad9910: support drctl control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261022-ad9910-backend-support-v2-7-0ff7f0bff326@analog.com>
References: <20261022-ad9910-backend-support-v2-0-0ff7f0bff326@analog.com>
 <20261022-ad9910-backend-support-v2-7-0ff7f0bff326@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 15:42:18 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] iio: frequency: ad9910: ad9910_probe() fails when optional drctl P=
WM is absent
--

commit 5605b6a5e6a1ded9bd90cf8a046c13f843a2865d
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: frequency: ad9910: support drctl control

This commit adds optional PWM control for the AD9910 digital ramp
generator DRCTL pin and exposes the integration_time attribute on the DRG
ramp up and ramp down channels using the PWM waveform API.

> diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad991=
0.c
> index dc13986dff3db..1de02017f78c6 100644
> --- a/drivers/iio/frequency/ad9910.c
> +++ b/drivers/iio/frequency/ad9910.c

[ ... ]

> @@ -2249,6 +2365,21 @@ static int ad9910_probe(struct spi_device *spi)
> =20
>  	fsleep(AD9910_WAKEUP_DELAY_us);
> =20
> +	st->drctl_pwm =3D devm_pwm_get(dev, "drctl");
> +	if (IS_ERR(st->drctl_pwm)) {
> +		ret =3D PTR_ERR(st->drctl_pwm);
> +		if (ret !=3D -ENOENT && ret !=3D -ENODEV)
> +			return dev_err_probe(dev, PTR_ERR(st->drctl_pwm),
> +					     "failed to get drctl pwm\n");
> +		st->drctl_pwm =3D NULL;
> +	} else {

[Severity: High]
Will ad9910_probe() fail on Device Tree systems when the optional "drctl"
PWM is omitted from the device node?

On Device Tree platforms, the call chain is:

  ad9910_probe()
    -> devm_pwm_get(dev, "drctl")
      -> pwm_get(dev, "drctl")
        -> of_pwm_get(dev, np, "drctl")
          -> of_property_match_string(np, "pwm-names", "drctl")

Because a non-NULL con_id ("drctl") is passed, of_pwm_get() in
drivers/pwm/core.c resolves the name before looking up the "pwms"
property:

	if (con_id) {
		index =3D of_property_match_string(np, "pwm-names", con_id);
		if (index < 0)
			return ERR_PTR(index);
	}

In drivers/of/property.c, of_property_match_string() returns -EINVAL when
the "pwm-names" property is absent, or -ENODATA when the string is not
found:

	const struct property *prop =3D of_find_property(np, propname, NULL);
	...
	if (!prop)
		return -EINVAL;
	if (!prop->value)
		return -ENODATA;

Since ad9910_probe() only ignores -ENOENT and -ENODEV, won't
ERR_PTR(-EINVAL) or ERR_PTR(-ENODATA) cause probe to fail instead of
treating the "drctl" PWM as absent?

> +		ret =3D devm_add_action_or_reset(dev, ad9910_drctl_disable_action,
> +					       st->drctl_pwm);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to add drctl disable action\n");
> +	}
> +
>  	ret =3D ad9910_parse_fw(st);
>  	if (ret)
>  		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-ad9910-bac=
kend-support-v2-0-0ff7f0bff326@analog.com?part=3D7
