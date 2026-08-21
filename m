Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7C236F8EE
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 16:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329196; cv=none; b=Iv2H74h8qAAMyCJhvCRILzkHUbOe3PRo+Gh6CkqaFgggvDGFCzFgkWWng0RhNR5ZeUkBE3rBWWmW2plX+okbyc2XfamnJHA+64hKmBjWab+cC55QYkz8WuMcOOb39jzkJrQyHeyfgpCbwDEhZraNpTGzVJfhPtLFeYzfCvH2Pc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329196; c=relaxed/simple;
	bh=yqRYkVkSYDMFAKBOjEY/HA2zIkpVggFt2IpdQF+hDZw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U2kXvsoF2yEc2IuxXOJkyEiEloh6hTZ3WqtNoB+Glle08ZB3k11vFdTSjNJ9RH8Ll2JyjqKmmdaskJhLPXioZnxA6CpNP8gIrqjsoP1oIBNSDCoN8vk6zhN5+HhLysvgnwJno8WRdkLSyj19pjLFn8Zt9bqbIh5XfyGW3U2C8Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6yJGKIj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6yJGKIj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE78B1F000E9;
	Fri, 21 Aug 2026 16:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787329195;
	bh=VBDGQnMJJ5dpyriANm4q48Z8HmBPOmV6xZEb+912qlg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l6yJGKIjfUYJYQ2HJg7wtqRolnWxmEO8i40a9RQW3FJtJJWdW0alQawZfzS97z+lm
	 WDhi4L/4T5JE75hH2BYZM69eDSkbmCSwrn0tufPMdkp/rLHC+5OyYO2wb4ApouIfNa
	 1OZMDuFfv0J62sashYawvD9PdYus2VuoBGFe5f62hxZ0bXBEYgudj0WR922JW5KVba
	 f3uCAmkBhxy3+RUxJhx5Zm72OxDLLXUwaCyhJESMso3Vl6Cplnx/ZpXXJ7ROp46iZH
	 z70XW/3gSLftY6jPR29c6HOBR+n0YNI69YNAiyOdDq5z0eEfWY5UKoXI2gYwWx2fhN
	 A8tioz4rs15nQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] ASoC: cs35l45: Adds support for SYNC bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ricardo Rivera-Matos" <rriveram@opensource.cirrus.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260821160946.95258-2-rriveram@opensource.cirrus.com>
References: <20260821160946.95258-1-rriveram@opensource.cirrus.com>
 <20260821160946.95258-2-rriveram@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 16:19:54 +0000
Message-Id: <20260821161954.DE78B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The `cs35l45_sync_en_put` ALSA control put callback incorrectly re=
turns 1 when unchanged, ignores regmap errors, and lacks locking.
- [Medium] Boolean ALSA controls in `cs35l45_sync_controls` are incorrectly=
 named with the suffix ' Enable' instead of ' Switch'.

Pre-existing issues:
- [High] The `cs35l45_amplifier_mode_put` ALSA control updates the software=
 shadow state (`cs35l45->amplifier_mode`) and performs its precondition che=
ck outside of the DAPM mutex.
--

--- Patch [2]: [PATCH v3 2/2] ASoC: cs35l45: Adds support for SYNC bus ---
commit ba724d28c232323128106bdc26fdc20dca80f285
Author: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>

ASoC: cs35l45: Adds support for SYNC bus
   =20
Adds support for the multidevice synchronization (SYNC) bus.
The SYNC bus is an opaque one wire bus that is shared between
Cirrus devices. Initial support only includes software (SW)
data packets.

> diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
> index a032bb23b4ac7..559fae09674cc 100644
> --- a/sound/soc/codecs/cs35l45.c
> +++ b/sound/soc/codecs/cs35l45.c

[ ... ]

> @@ -195,6 +196,38 @@ static int cs35l45_activate_ctl(struct snd_soc_compo=
nent *component,
>  	return 0;
>  }
> =20
> +static int cs35l45_sync_en_get(struct snd_kcontrol *kcontrol,
> +				      struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	struct cs35l45_private *cs35l45 =3D
> +			snd_soc_component_get_drvdata(component);
> +
> +	ucontrol->value.integer.value[0] =3D cs35l45->sync_en;
> +
> +	return 0;
> +}
> +
> +static int cs35l45_sync_en_put(struct snd_kcontrol *kcontrol,
> +				      struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	struct cs35l45_private *cs35l45 =3D
> +			snd_soc_component_get_drvdata(component);
> +
> +	if (ucontrol->value.integer.value[0] =3D=3D cs35l45->sync_en)
> +		return 1;

[Severity: High]
Does this incorrectly return 1 when the value is unchanged?

The ALSA kcontrol API expects 0 when the value is unchanged, so returning 1
will cause spurious change events to be broadcast to userspace.

> +
> +	if ((bool)ucontrol->value.integer.value[0])
> +		regmap_set_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_=
EN_MASK);
> +	else
> +		regmap_clear_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYN=
C_EN_MASK);
> +
> +	cs35l45->sync_en =3D ucontrol->value.integer.value[0];
> +
> +	return 1;
> +}

[Severity: High]
Is it safe to ignore the return values from regmap_set_bits() and
regmap_clear_bits() here?=20

If the I/O operation fails, the software shadow state will become
desynchronized from the actual hardware state.

Also, should this state update be protected by a lock?=20

Concurrent writes via snd_ctl_elem_write() could trigger race conditions si=
nce
the state check and update are not atomic.

[ ... ]

> @@ -591,6 +624,18 @@ static SOC_ENUM_SINGLE_DECL(amplifier_mode_enum, SND=
_SOC_NOPM, 0,
>  static DECLARE_TLV_DB_SCALE(amp_gain_tlv, 1000, 300, 0);
>  static const DECLARE_TLV_DB_SCALE(cs35l45_dig_pcm_vol_tlv, -10225, 25, t=
rue);
> =20
> +static const struct snd_kcontrol_new cs35l45_sync_controls[] =3D {
> +	SOC_SINGLE_BOOL_EXT("SYNC Enable", 0, cs35l45_sync_en_get, cs35l45_sync=
_en_put),
> +	SOC_SINGLE("SYNC LSW RX Enable", CS35L45_SYNC_TX_RX_ENABLES,
> +			CS35L45_SYNC_LSW_RX_EN_SHIFT, 1, 0),
> +	SOC_SINGLE("SYNC LSW TX Enable", CS35L45_SYNC_TX_RX_ENABLES,
> +			CS35L45_SYNC_LSW_TX_EN_SHIFT, 1, 0),
> +	SOC_SINGLE("SYNC SW RX Enable", CS35L45_SYNC_TX_RX_ENABLES,
> +			CS35L45_SYNC_SW_RX_EN_SHIFT, 1, 0),
> +	SOC_SINGLE("SYNC SW TX Enable", CS35L45_SYNC_TX_RX_ENABLES,
> +			CS35L45_SYNC_SW_TX_EN_SHIFT, 1, 0),
> +};

[Severity: Medium]
Do these boolean controls need to end in " Switch" instead of " Enable"?

ALSA control naming conventions mandate that boolean controls must end in
" Switch". Standard user-space audio layers (like PulseAudio and PipeWire)
rely on this to recognize them as toggles rather than exposing them as
raw integers.

[ ... ]

While reviewing the ALSA controls, I noticed a pre-existing issue in the
cs35l45_amplifier_mode_put() function:

sound/soc/codecs/cs35l45.c:cs35l45_amplifier_mode_put() {
    ...
    snd_soc_dapm_mutex_unlock(dapm);

    cs35l45->amplifier_mode =3D ucontrol->value.integer.value[0];

    return 1;
}

[Severity: High]
This is a pre-existing issue, but does cs35l45_amplifier_mode_put() update
the software shadow state outside of the DAPM mutex?=20

If two threads execute the put callback concurrently with different target
modes, thread B could check the condition before thread A completes its
hardware update. This could lead to the shadow state becoming out of sync
with the hardware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821160946.9525=
8-1-rriveram@opensource.cirrus.com?part=3D2
