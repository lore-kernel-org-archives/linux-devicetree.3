Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987C73AFAE6
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 06:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787207900; cv=none; b=sgPCNg+s9EuDhZzWeLIcVKAe97WYqKo0YO4Joyascg1DDxrIVJ4wL8nUYuPOfz0RRW17gjCnpRGWlFwJVKe2aGYnBmeZ4nNTw2c1eXMaBWi9ee1srYuoYsxGy0LRga9K+GOCCjep9YQBq7Cv+1lCvsvrrLza5KzjX6DDDqKwUmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787207900; c=relaxed/simple;
	bh=3rhhy+lGGwbANULE7CZ2rrTWzNQcrFGk15xqNP+DjZs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Fz14SXACVjKNr5MHG1EYgXkUD7XKCuGYesitCqXFDFJgtLfLJhmT9VK6qtfd3KEsnw7PbglHNkd2Cc4fW8VAjo7rZMmzJiTg0nq2fWHN0j1SIxEloxi/3hjSZhA2e/Xp5G+N62FsfGXl4VKY2lzTt7ViSCrC7T0Wqh2c9KRq2RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OxGVGW8e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OxGVGW8e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB781F000E9;
	Thu, 20 Aug 2026 06:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787207899;
	bh=/5Sq3XiKhspYc4sXRKblRuzDbdb/tsuJ2W2EzPZlYk0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OxGVGW8e+zk8/br3EcQ721Zoel0ERLG7DQ4QrNZGut5bKCqq4dnj6gqxnO3qHwh0F
	 XQhsc8NLzeWMp55lMW4bRZJ7qBFsAGeLVjAjWm9pIxeSp1k+aolwQEk4pg21AJiC7Y
	 RhSgPrHn8BTBUkkqEIjWaPWgpoiliI2zghin069Xmv3ifYfErYsCdhtJeYu/8kvsQ4
	 h1D/OA6C6s6D7Bi0dT/P6jGxpfUAW5Bw2sgDnBgtqahC6JWf+nrHN+OrcX6dsKEPPO
	 dPlsRC330TahClGaXMelaEtGK6SMUHaK7k+Ifmp1B8rnUS3nWakU6pHaCYXPCfsDxs
	 b+U+cv8T/OIzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] ASoC: es9039q2m: add ESS Technology ES9039Q2M codec
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Karl Asseily" <karl@asseily.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260820062626.39218-4-karl@asseily.com>
References: <20260820062626.39218-1-karl@asseily.com>
 <20260820062626.39218-4-karl@asseily.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 06:38:18 +0000
Message-Id: <20260820063819.3DB781F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] es9039_dop_put() corrupts hardware state when toggled mid-stream=
 and races with hw_params().
- [Medium] 'Clock Fault' status control queries the wrong register offset.
- [Medium] Probe initialization disables VOLUME_HOLD contrary to its docume=
nted intent.
--

--- Patch [3]: [PATCH 3/4] ASoC: es9039q2m: add ESS Technology ES9039Q2M co=
dec driver ---
commit bc64110211ab9eddd7d7d8ac88b78bebe86562d6
Author: Karl Asseily <karl@asseily.com>

ASoC: es9039q2m: add ESS Technology ES9039Q2M codec driver

This commit introduces the ASoC driver for the ESS Technology ES9039Q2M cod=
ec.=20
It implements the software control mode over I2C, supporting PCM, DSD, DoP,=
=20
and S/PDIF inputs along with an asynchronous sample rate converter.

> diff --git a/sound/soc/codecs/es9039q2m.c b/sound/soc/codecs/es9039q2m.c
> new file mode 100644
> --- /dev/null
> +++ b/sound/soc/codecs/es9039q2m.c
[ ... ]
> +static int es9039_dop_put(struct snd_kcontrol *kcontrol,
> +			  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *c =3D snd_kcontrol_chip(kcontrol);
> +	struct es9039q2m_priv *priv =3D snd_soc_component_get_drvdata(c);
> +	bool on =3D !!ucontrol->value.integer.value[0];
> +	int ret;
> +
> +	if (on =3D=3D priv->dop_auto)
> +		return 0;
> +
> +	priv->dop_auto =3D on;
> +
> +	ret =3D regmap_update_bits(priv->regmap, ES9039_INPUT_SEL,
> +				 ES9039_AUTO_INPUT_SEL,
> +				 on ? ES9039_AUTO_INPUT_SEL : 0);

[Severity: Medium]
Will toggling this control mid-stream corrupt the hardware state?

If toggled on, it sets ES9039_AUTO_INPUT_SEL here but doesn't update
ES9039_SYS_MODE to set ES9039_ENABLE_DOP_DECODE, since that was only evalua=
ted
in es9039q2m_hw_params() when the stream started.

The commit message notes that selecting DoP without enabling the marker
decoder leaves the part hunting and causes it to mute. Is there a need to
synchronize the decoder state in ES9039_SYS_MODE when this control is toggl=
ed?

[ ... ]
> +	/* --- status, read-only --- */
> +	ES9039_STAT("Automute Active CH1", ES9039_AUTOMUTE_READ, BIT(0), 1),
> +	ES9039_STAT("Automute Active CH2", ES9039_AUTOMUTE_READ, BIT(1), 1),
> +	ES9039_STAT("DoP Valid", ES9039_INPUT_STREAM_READ,
> +		    ES9039_RD_DOP_VALID, 1),
> +	ES9039_STAT("TDM Data Valid", ES9039_INPUT_STREAM_READ,
> +		    ES9039_RD_TDM_VALID, 1),
> +	ES9039_STAT("SPDIF Valid", ES9039_INPUT_STREAM_READ,
> +		    ES9039_RD_SPDIF_VALID, 1),
> +	ES9039_STAT("Clock Fault", ES9039_IRQ_SOURCES + 1, BIT(7), 1),

[Severity: Medium]
Is this querying the wrong register offset for the clock fault bit?

ES9039_SRC_BCK_WS_FAIL is defined as BIT(7) of the 16-bit word at
ES9039_IRQ_SOURCES. By adding 1 to the register address and still using
BIT(7) as the mask, won't this check bit 15 of the 16-bit word instead of
bit 7?

[ ... ]
> +static int es9039q2m_component_probe(struct snd_soc_component *component)
> +{
> +	struct es9039q2m_priv *priv =3D snd_soc_component_get_drvdata(component=
);
> +	int ret;
> +
> +	/*
> +	 * Come up muted. The volume registers default to 0 dB, and an unmuted
> +	 * DAC arriving into an already-powered analogue stage is how you get a
> +	 * thump. ASoC unmutes via mute_stream() when a stream starts.
> +	 */
> +	ret =3D regmap_update_bits(priv->regmap, ES9039_DAC_MUTE,
> +				 ES9039_MUTE_BOTH, ES9039_MUTE_BOTH);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * VOLUME_HOLD makes both channel volumes latch together, so a stereo
> +	 * change can never momentarily skew the image.
> +	 */
> +	ret =3D regmap_update_bits(priv->regmap, ES9039_IIR_SPDIF,
> +				 ES9039_VOLUME_HOLD, 0);

[Severity: Medium]
Is this intended to disable the volume hold feature?

The comment explicitly mentions that VOLUME_HOLD makes the channel volumes
latch together, but passing 0 disables it. Should this pass
ES9039_VOLUME_HOLD instead of 0 to enable the feature?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820062626.3921=
8-1-karl@asseily.com?part=3D3
