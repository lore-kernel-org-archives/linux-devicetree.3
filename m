Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CAF36DA03
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 15:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932636; cv=none; b=UD3uvbf09J/Ffr9pxhcfypiNREna1Hj7kQwH8DBoNHlVh7saiFShHi0PZbzoqLO4ebZjG9OlxCYu6PsNT45XhtixihctMVvZLYxHIXuXW6pt4QJsYiMxGU04ZbjMWugnvuvVDHPonou1LgjGZoNPMDuAkF4k3Aho5x11qTO6qn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932636; c=relaxed/simple;
	bh=Pr8DM0ZtvfTDJ+b2ESSRj79v9gJ2Mz/lMuGl5vArJGo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rZnOipRLFmQtAQBIcctOe8oCMsUwGWfzCqQpLh58xmBjv3q5B7zuPRyvA8NM2IlQEGnETzUcS5+HMkCtyQYxE6UiXshHocWfWFE1kywo04VbX6DuuBErxLYgNt8t69Tq0OrNRMlNOr9cmtvOs0iQL3qANwnqauql8z2AEaStWjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oohiDYr+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oohiDYr+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 233751F000E9;
	Fri, 28 Aug 2026 15:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787932635;
	bh=dYyoFCbSxEdW2Il8BkWwLudNXPTkO3vJI3cYVnHDg14=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oohiDYr+TI8TDibXYC6xlB3Vf4K68J/YAuziAmzASSlZd+NdI2JvTzJgu1KD4ggo2
	 P3mqC4m0hYjNZqsDrLNLBmqcJCDzLQliZjZHj90/q01vZ5MY7PGSWMyEoEP/9+Bi0f
	 ILcaqrgbXDhZs9yh4RaEeSN0uGEwlD0DFEKlDnFE9zYfywSloNjmySgbx6Hgrk3VxN
	 O/wDpv+rJAo5LlnJ8lwk7+ywsXyigWEtxqOX3F5xyu4peOMIjOEtouTc92QuotxPsJ
	 tAIJARJ2yvf9OuqYSFLdnv46bGiHKiTrA0fEtDnWyEv3knmUNskYPdV+KPu0XeQXkP
	 0562Q6/4uLf9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] ASoC: cs35l45: Adds support for SYNC bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ricardo Rivera-Matos" <rriveram@opensource.cirrus.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260828-sound-for-next-cs35l45-sync-v4-v5-2-fe3feba709ff@opensource.cirrus.com>
References: <20260828-sound-for-next-cs35l45-sync-v4-v5-0-fe3feba709ff@opensource.cirrus.com>
 <20260828-sound-for-next-cs35l45-sync-v4-v5-2-fe3feba709ff@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 15:57:14 +0000
Message-Id: <20260828155715.233751F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Hardware I/O errors in cs35l45_sync_en_put cause permanent state=
 desynchronization.
--

commit 81445881eb3cef5b79a02d7516346532c3f3f907
Author: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
ASoC: cs35l45: Adds support for SYNC bus

Adds support for the multidevice synchronization (SYNC) bus. The SYNC
bus is an opaque one wire bus that is shared between Cirrus devices.

> diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
> index a032bb23b4ac7..763cd83b5d6d8 100644
> --- a/sound/soc/codecs/cs35l45.c
> +++ b/sound/soc/codecs/cs35l45.c
[ ... ]
> @@ -195,6 +196,46 @@ static int cs35l45_activate_ctl(struct snd_soc_compo=
nent *component,
[ ... ]
> +static int cs35l45_sync_en_put(struct snd_kcontrol *kcontrol,
> +				      struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	struct cs35l45_private *cs35l45 =3D
> +			snd_soc_component_get_drvdata(component);
> +	struct snd_soc_dapm_context *dapm =3D
> +			snd_soc_component_to_dapm(component);
> +
> +	snd_soc_dapm_mutex_lock(dapm);
> +
> +	if ((bool)ucontrol->value.integer.value[0] =3D=3D cs35l45->sync_en) {
> +		snd_soc_dapm_mutex_unlock(dapm);
> +		return 0;
> +	}
> +
> +	if ((bool)ucontrol->value.integer.value[0])
> +		regmap_set_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_=
EN_MASK);
> +	else
> +		regmap_clear_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYN=
C_EN_MASK);
> +
> +	cs35l45->sync_en =3D (bool)ucontrol->value.integer.value[0];

[Severity: Medium]
Could this lead to permanent state desynchronization if the hardware I/O fa=
ils?
The regmap API calls can fail (e.g., returning -EIO on I2C/SPI errors), but=
 the
error is ignored here and the software cache (cs35l45->sync_en) is updated
unconditionally.

If this happens, the ALSA control state becomes desynchronized from the har=
dware.
Because of the fast-path check at the beginning of this function:

    if ((bool)ucontrol->value.integer.value[0] =3D=3D cs35l45->sync_en) {
        ...

Any subsequent attempts from userspace to set the correct value will be dro=
pped,
making the failure permanent until explicitly toggled to the opposite state=
 and
back again. Should the return values of regmap_set_bits() and regmap_clear_=
bits()
be checked before updating the cached state?

> +
> +	snd_soc_dapm_mutex_unlock(dapm);
> +
> +	return 1;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-sound-for-=
next-cs35l45-sync-v4-v5-0-fe3feba709ff@opensource.cirrus.com?part=3D2
