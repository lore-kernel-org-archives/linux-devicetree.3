Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3334851CF6A
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 18:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756779; cv=none; b=TK3MLNPAYdV2JB3SkN8LRwDCaIO/2Lu4UPBMsGjUysp7hI7RFym/bYKahtJ5Rk4U9GbCXUVMPXB+WE0n8v4X4FqSbpor3pd3owQLDb1wtdChDl405z5XRr8JJS7sgX1o7ruW73WdwNe9hhK9oGN4VobHEBX9TVd8VTRmgQMgwic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756779; c=relaxed/simple;
	bh=qy7UtYiB0UqGj3GxndRADlhy6gZPxhR/wxWksbheqwA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nPleS6l6blQE2v74JQ7CEKBF+jFgJf4UaHkzBmCmnl5P5hMMXcMF6DEFTKTsz9lIEte82R5IxfYUCaODw9H8LF+UsvJZGGa+2+B6R8IVijBSXPx+c3WkByR7t/GZaG0OlPyk2+VOP7egipQyD1ZrVj/BDPvh17naS86EHK/SENg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LhUJIrQW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LhUJIrQW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE0831F000FF;
	Fri, 18 Sep 2026 18:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789756772;
	bh=UyJBiEzEUNiNIHOgYDbgAmQaCzImHTQzHwEPb7kIt6o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LhUJIrQWlyVXqhjBnYMaMWKodc0vex9OX+oH/N4JWEh6xQsaT+mDCSlHjlr5oT9uv
	 slM5OOcEDazrRxE/J2jdfWoGs5KlVJVqA203zP/Y2iIzgkeIEqCFgQ1xeQSUoUmKIM
	 3sfFXCkzY2jnQ2RwuD6WVLdvutd2bA1E4KBeyBFBU3i5/9HXhoBIwyGG6urUKHo6a+
	 Rq6KOFw0PlUka2WdRyh37iYnwLBoO5RAsCvZyaJy+yLJESMCyLm8RCdmSqc9ZeB5eg
	 I43uh5h7AFFpJdACaajxX1iJ/1Dh9Nwp8sikcsw5tSarSR1ABNeRq4UAEGmKO3Wafj
	 IwqPIi6eLZdHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] ASoC: es9039q2m: add ESS Technology ES9039Q2M
 codec driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Karl Asseily" <karl@asseily.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260918182317.143223-4-karl@asseily.com>
References: <20260918182317.143223-1-karl@asseily.com>
 <20260918182317.143223-4-karl@asseily.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 18:39:31 +0000
Message-Id: <20260918183931.CE0831F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] ASoC: es9039q2m: FIR coefficient upload corrupts data with TLV hea=
der
- [Low] i2c: positional initializer used for i2c_device_id
--

commit 3aee2b23f8220349aa3bc4bfbb0d2fa6dfeb5b60
Author: Karl Asseily <karl@asseily.com>

ASoC: es9039q2m: add ESS Technology ES9039Q2M codec driver

This commit introduces a new ALSA SoC codec driver for the ESS Technology
ES9039Q2M 32-bit audio DAC. It supports software mode over I2C, implementing
programmable FIR filters, custom routing, and DSD/DoP stream detection.

> diff --git a/sound/soc/codecs/es9039q2m.c b/sound/soc/codecs/es9039q2m.c
> new file mode 100644
> index 0000000000000..4e9f86cb78606
> --- /dev/null
> +++ b/sound/soc/codecs/es9039q2m.c

[ ... ]

> +static int es9039_fir_put(struct snd_kcontrol *kcontrol,
> +			  const unsigned int __user *bytes, unsigned int size)
> +{
> +	struct snd_soc_component *c =3D snd_kcontrol_chip(kcontrol);
> +	struct es9039q2m_priv *priv =3D snd_soc_component_get_drvdata(c);
> +	struct soc_bytes_ext *be =3D (void *)kcontrol->private_value;
> +	struct es9039_fir_ctl *p =3D container_of(be, struct es9039_fir_ctl, be=
);
> +	unsigned int idx =3D p->stage_4x ? 1 : 0;
> +	u8 *buf;
> +	int ret;
> +
> +	if (size !=3D p->taps * ES9039_COEFF_BYTES)
> +		return -EINVAL;
> +
> +	buf =3D memdup_user(bytes, size);

[Severity: High]
Does this copy include the ALSA TLV header along with the coefficient paylo=
ad?

When userspace writes coefficients via the ALSA TLV control, snd_ctl_tlv_io=
ctl
passes the TLV array down to snd_soc_bytes_tlv_callback. This array starts
with a 2-word header containing the type and length.

Because memdup_user starts from the very beginning of the bytes array witho=
ut
skipping this 8-byte header, the hardware's coefficient RAM might receive t=
he
header data instead of the actual coefficients, and the last 8 bytes of the
intended payload would be truncated.

> +	if (IS_ERR(buf))
> +		return PTR_ERR(buf);

[ ... ]

> +static const struct i2c_device_id es9039q2m_i2c_id[] =3D {
> +	{ "es9039q2m" },

[Severity: Low]
This isn't a functional bug, but should this use a named initializer to
conform to the I2C subsystem guidelines for i2c_device_id arrays? For
example, using { .name =3D "es9039q2m" }.

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, es9039q2m_i2c_id);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918182317.1432=
23-1-karl@asseily.com?part=3D3
