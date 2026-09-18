Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA8639B971
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 03:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789701856; cv=none; b=gdxslEOzUkZJZAf9qJHwbmYT6tL2wjCzc7VcDvTuVeln9Sbv/5ERT34FdZAa+X8a7lAdTuHS7kCDpFvCyLocGEnHPjZiNjpsXSzjUnVOv6axdlXIvaxGkJ/H4xi5hKsHWb15Jo7sLXI85ORsb6eAHO1gQq7us1Y8pJPUXx+epx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789701856; c=relaxed/simple;
	bh=qjLsbhjXu8UtoGz6U1daVoGTJ8OAj+fwUKXsIa/zCJI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tvEQv3qKS6LFSoMv4thex62tSMB1QhGFy6pf8OmDxNLPewK+hl5ziBYII59yveGnaWkLqeMSV61ACiuuTVHyjoYivwRO+1IAxYjXmwFWk8jYw34Sn/IE4SEf46rb4U/MYppQHCAmpgJRZTua+XZ+2cHclbN/tygsx2vfeqKvzQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZrS0E5eL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZrS0E5eL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA9E01F000FF;
	Fri, 18 Sep 2026 03:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789701855;
	bh=EgNsYA7J8y1QLe2OS+GGAmejBdJjGvKc6Z1NbheTGiE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZrS0E5eLJlR2lBHl7B/Uv2aJc3+U7A9E30vdlGlnsRdPD4g6j1UiMyztxAQgZPQcN
	 9orkHd8FSKpliFhGuKibAoV37TNUuGpEVjepF6I6LvUNvuMs3AVvBspln97x1e5csj
	 5cVZcE0xNalBe/vlL7LIukrXFSi/wL5NX9r/pjoQ8d7Kb5WeKkf2yhIwq7OAXHTzfn
	 pD1UsbTtL0m6o0EFYvnEGi4nvh7L+vaYEaQMrjU8d36LGm4DaJWG9VPxbfr61dj1B6
	 9ASp0/sDOTJ2OgjnGhjwEGpdx/zurJiZN7Mgmh5LvjO3l5XIe6nmnP7MoaeSbHqE8x
	 FjZ4XzrPw20vQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] ASoC: es9039q2m: add ESS Technology ES9039Q2M
 codec driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Karl Asseily" <karl@asseily.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260918031326.68542-4-karl@asseily.com>
References: <20260918031326.68542-1-karl@asseily.com>
 <20260918031326.68542-4-karl@asseily.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 03:24:14 +0000
Message-Id: <20260918032414.DA9E01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] es9039q2m: unprotected read-modify-write in es9039_wide_put
- [Medium] es9039q2m: unprotected VOLUME_HOLD sequence allows torn volume u=
pdates
- [Medium] es9039q2m: FIR coefficient RAM is lost on system suspend
- [Low] i2c: missing named initializer for struct i2c_device_id
--

commit b181df27142d5449ea7b02fc0c4c0aa3fd24e5a8
Author: Karl Asseily <karl@asseily.com>

ASoC: es9039q2m: add ESS Technology ES9039Q2M codec driver

This patch adds I2C support for the ESS Technology ES9039Q2M 32-bit
2-channel audio DAC. It includes handling for software mode over I2C,
an asynchronous sample rate converter, and automatic DoP detection.

> diff --git a/sound/soc/codecs/es9039q2m.c b/sound/soc/codecs/es9039q2m.c
> index 0000000000000..4edaab87e3f6f
> --- /dev/null
> +++ b/sound/soc/codecs/es9039q2m.c

[ ... ]

> +static int es9039_wide_put(struct snd_kcontrol *kcontrol,
> +			   struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *c =3D snd_kcontrol_chip(kcontrol);
> +	struct es9039q2m_priv *priv =3D snd_soc_component_get_drvdata(c);
> +	struct es9039_wide_ctl *p =3D (void *)kcontrol->private_value;
> +	long v =3D ucontrol->value.integer.value[0];
> +	u32 old;
> +	int ret;
> +
> +	if (v < 0 || v > p->max)
> +		return -EINVAL;
> +
> +	ret =3D es9039_read_le(priv->regmap, p->reg, p->bytes, &old);
> +	if (ret)
> +		return ret;
> +
> +	if ((old & p->mask) =3D=3D (u32)v)
> +		return 0;
> +
> +	/* Preserve the bits outside the field - reg 124 carries MUTE_RAMP. */
> +	ret =3D es9039_write_le(priv->regmap, p->reg, p->bytes,
> +			      (old & ~p->mask) | (u32)v);

[Severity: Medium]
Could this manual read-modify-write sequence race with other ALSA control u=
pdates?

Because snd_ctl_elem_write() takes the ALSA controls_rwsem lock in read mod=
e,
concurrent control writes can interleave here. If another thread updates the
"Mute Ramp To Ground Switch" (which shares register 125, mapped here) right
after es9039_read_le() completes, es9039_write_le() will overwrite and lose
that concurrent change.

Should this sequence be protected by a lock?

[ ... ]

> +static int es9039_vol_put(struct snd_kcontrol *kcontrol,
> +			  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *c =3D snd_kcontrol_chip(kcontrol);
> +	struct es9039q2m_priv *priv =3D snd_soc_component_get_drvdata(c);
> +	int ret;
> +
> +	ret =3D regmap_update_bits(priv->regmap, ES9039_IIR_SPDIF,
> +				 ES9039_VOLUME_HOLD, ES9039_VOLUME_HOLD);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D snd_soc_put_volsw(kcontrol, ucontrol);
> +
> +	regmap_update_bits(priv->regmap, ES9039_IIR_SPDIF,
> +			   ES9039_VOLUME_HOLD, 0);

[Severity: Medium]
Does this sequence need protection against concurrent volume updates?

If two threads call es9039_vol_put() concurrently, the sequences could
interleave. For example, Thread 1 could clear ES9039_VOLUME_HOLD while
Thread 2 is halfway through its snd_soc_put_volsw() writes.

Thread 2's remaining register writes would then apply immediately instead of
being latched together, which defeats the hardware pop-suppression mechanis=
m.

[ ... ]

> +static int es9039q2m_resume(struct snd_soc_component *component)
> +{
> +	struct es9039q2m_priv *priv =3D snd_soc_component_get_drvdata(component=
);
> +	int ret;
> +
> +	guard(mutex)(&priv->lock);
> +
> +	regcache_cache_only(priv->regmap, false);
> +
> +	/*
> +	 * Mute the part before anything else, and write it straight to the
> +	 * hardware rather than through the cache.
> +	 *
> +	 * Where the board kept the supplies up this is a no-op - the part still
> +	 * holds the mute state it went to sleep with. Where the board removed
> +	 * them it is not: the part comes back at reset defaults, which are
> +	 * DAC_MODE clear, both channels UNMUTED, and both volume registers at
> +	 * 0x00, their 0 dB setting. regcache_sync() walks registers in ascendi=
ng
> +	 * address order, so it would set DAC_MODE in register 0 - lighting the
> +	 * datapath up unmuted at full scale - and only restore the real mute in
> +	 * register 86, long after. That is the thump the probe path mutes to
> +	 * avoid, arriving by the other door.
> +	 *
> +	 * The cache is bypassed so the cached mute state is untouched; the sync
> +	 * below puts it back, after the volume registers at 74 and 75.
> +	 */
> +	regcache_cache_bypass(priv->regmap, true);
> +	ret =3D regmap_update_bits(priv->regmap, ES9039_DAC_MUTE,
> +				 ES9039_MUTE_BOTH, ES9039_MUTE_BOTH);
> +	regcache_cache_bypass(priv->regmap, false);
> +
> +	if (ret)
> +		dev_warn(component->dev,
> +			 "could not mute before resync: %d\n", ret);
> +
> +	ret =3D regcache_sync(priv->regmap);

[Severity: Medium]
Will the programmable FIR coefficients survive a system suspend?

If the device loses power during suspend, the FIR memory is cleared.
When resume calls regcache_sync() here, it will restore ES9039_PROG_RAM_CTRL
(which turns the custom FIR switch back on). However, the FIR taps
themselves are not restored since the data port is write-only and not
tracked by regmap.

Can this result in silent or distorted audio on resume?

[ ... ]

> +static const struct i2c_device_id es9039q2m_i2c_id[] =3D {
> +	{ "es9039q2m" },
> +	{ }
> +};

[Severity: Low]
Can we use named initializers for this array?

The I2C subsystem requires explicitly named initializers for struct
i2c_device_id arrays to ensure proper device matching.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918031326.6854=
2-1-karl@asseily.com?part=3D3
