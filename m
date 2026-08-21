Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D7635E55D
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 22:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787352556; cv=none; b=qJhi56VA/IQdEEqGzAOmwkIQ3RzDidYZmJmuyeM4lvlmw9biy3eReL+hlB0dT/NOsiE9aw1USp+K4Bho6sIRUvPxtUkPb1TQj2qdYbeynqGmp+esObbtBUf6QlRKGUpwztUGXMxPK+AizgjltZ7U0f5MA4ksrF7Ni3rqFuQ49dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787352556; c=relaxed/simple;
	bh=zldQ1Y5wJX+S6dsLF5genmK0sbUvFFRdQKgU7KExajU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hGHJ2rB6J0IjD5mR35TZ4w9Hw5/myFFr3hDTlJG+df7L5SblPrsRpv78Sqnyoi+sDMnAeQHRAyCbpdviFd/o8LTcIM4jtbPlEd9M0v9B9jzm7EZlejs5lztgqe51zDPK1Su0hkutTjzlDt2u3uEKzIeVZ+0inlukVyVBNTCeDso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QGjEfp5o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QGjEfp5o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A2E1F00A3A;
	Fri, 21 Aug 2026 22:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787352555;
	bh=lrvfElmxdfE2AEs2IV3fSwbCgTszXxNBdeUGKUQpLGo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QGjEfp5oXSrhClfBM0OqeNmSq47H7iGNcxNpKX55G4575jgBlvUPy+02Y1ev6d/Oa
	 yklUGywTgB97/L3PKgvvbmksOqy9AtbHEOmY4Tc5sZcIZ1mQk1llx5KRWVyYuQd514
	 J3g1PbTYHB+bCoL4KfKuvu907PIp+0fvalarTwHxbUCMDcEEe9gSHydd+jt0kG2US9
	 /nGnQwDLh6wfwo9a/gOvVWKEllYLEgNIjvAVznHdqkr6LYHcZF1TWRG/+lZ/aCJzac
	 NI629C0D5q7BrR9FDPank2JqTwkK0CJiPNEdDIxkyAgF9/UjU9L9z1f1RWLYkk/1ym
	 kLLL0nD2uUfkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] ASoC: cs35l45: Adds support for SYNC bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ricardo Rivera-Matos" <rriveram@opensource.cirrus.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260821-sound-for-next-cs35l45-sync-v4-v4-2-20d3a07c3b8d@opensource.cirrus.com>
References: <20260821-sound-for-next-cs35l45-sync-v4-v4-0-20d3a07c3b8d@opensource.cirrus.com>
 <20260821-sound-for-next-cs35l45-sync-v4-v4-2-20d3a07c3b8d@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 22:49:14 +0000
Message-Id: <20260821224915.37A2E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Spurious ALSA event generation in `cs35l45_sync_en_put` due to u=
nnormalized boolean comparison.
--

--- Patch [2]: [PATCH v4 2/2] ASoC: cs35l45: Adds support for SYNC bus ---
commit 7447f2ac68a757cce556917899f132a9bfc50231
Author: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>

ASoC: cs35l45: Adds support for SYNC bus

Adds support for the multidevice synchronization (SYNC) bus. Initial support
only includes software (SW) data packets.

> diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
> index a032bb23b4ac7..2d6360bc555b3 100644
> --- a/sound/soc/codecs/cs35l45.c
> +++ b/sound/soc/codecs/cs35l45.c
[ ... ]
> @@ -195,6 +196,46 @@ static int cs35l45_activate_ctl(struct snd_soc_compo=
nent *component,
>  	return 0;
>  }
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
> +	if (ucontrol->value.integer.value[0] =3D=3D cs35l45->sync_en) {

[Severity: Medium]
Will this comparison cause spurious ALSA events if userspace writes a non-z=
ero,
non-one value?=20

Since cs35l45->sync_en is a bool, if userspace writes a value like 2, the
comparison (2 =3D=3D 1) evaluates to false. This bypasses the short-circuit=
 check.

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
> +	cs35l45->sync_en =3D ucontrol->value.integer.value[0];

When the unnormalized value is later assigned to the bool, it normalizes to=
 1.=20
The function then returns 1, incorrectly generating a state change notifica=
tion
even though the logical state didn't change.

Should the input value be normalized to a boolean before comparing and
assigning?

> +
> +	snd_soc_dapm_mutex_unlock(dapm);
> +
> +	return 1;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-sound-for-=
next-cs35l45-sync-v4-v4-0-20d3a07c3b8d@opensource.cirrus.com?part=3D2
