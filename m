Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44D72E266C
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 05:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881162; cv=none; b=WRVCR/gYxMlc+5QHVxnnlMPuEzXfNe4L77vHDka04eOpWLt+8qVXksvc5KYIqU0bz8Sbcv65sASLZkR8+2b7s1/vx/finyfB7yOK+/a8udA6xxgF+ENK6lguplhvmOsLCiwQF1XhLFSkDKZaqLee12z5OL3rpLJr2iQ6zXpwvj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881162; c=relaxed/simple;
	bh=5ifGV88W+1N4xoiwA2raFqxJ8EU9aUY97V90FThxoTU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CmCD4O9jpcxrCEUuC+AG6R6btH2rIRQNW3LE2/h/VNa1i8Dl4Tw2DamqQT7HB+t12zgTPYbP0xHmvWqE4VOdG5AYNi23C7Wht7EyUPDhpRhx5539RQpJlaqfuNuNxpQCVFxFHTOqYCZf5hqMKGGprwSJRM6jhDHGIokORR0FY0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hTSIRkeH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hTSIRkeH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48ECD1F000FF;
	Sun, 20 Sep 2026 05:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789881160;
	bh=akHae49pytpmDD6Cj8rEP9KgSIyWBQ7+p+vOzeQoOHk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hTSIRkeHnoQc2eUu6PJnvUZ77hOS4XNs+HhUKpzAD/R6Nr53go5UU/EyWKaIR8oGv
	 5qb5jsk13P23TXY0dmhq6SO1CB73HZ+lWBLfUPZCeztQPS1TgAoe5yL6kl5j8ITWGV
	 E/FQvGsz1omorSleo50GkHmX+Yf7jke753ogtZwwFoo3Mnmk7v6nEPu2LoywG+gxg5
	 YIxgjjZpOmDX2oUsSQpWSunSakkiOqbjGhnF/hATFszNdNm3KYIVWJBkR3nJH9iJmL
	 fO0IjqL7rqQw0SKRzyphSDdHactLW80kfnh8CbgzUOQbYoAMOKhqaEHfVtzEw5VWK9
	 iEZc/bfuP/hHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/28] ASoC: ops: Accept patterns in
 snd_soc_limit_volume
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260920-macaudio-v1-10-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-10-741cc20a74e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 05:12:39 +0000
Message-Id: <20260920051240.48ECD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] ASoC: ops: Data race and UAF in snd_soc_limit_volume list traversal
- [High] ASoC: ops: Type confusion and NULL pointer dereference in soc_limi=
t_volume
- [High] ASoC: ops: snd_soc_limit_volume API breakage causes audio initiali=
zation failure
--

commit 71061718845772d7571d727c356dc0cbae99856e
Author: Martin Povi=C5=A1er <povik+lin@cutebit.org>

ASoC: ops: Accept patterns in snd_soc_limit_volume

This patch modifies snd_soc_limit_volume() to accept wildcard patterns,
allowing it to apply limits to multiple matching controls at once. It also
returns the number of matching controls on success instead of 0.

> diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
> index e572b05840b48..2f91ee7946bb1 100644
> --- a/sound/soc/soc-ops.c
> +++ b/sound/soc/soc-ops.c
[ ... ]
> @@ -445,31 +468,47 @@ static int soc_limit_volume(struct snd_kcontrol *kc=
tl, int max)
>  }
> =20
>  /**
> - * snd_soc_limit_volume - Set new limit to an existing volume control.
> + * snd_soc_limit_volume - Set new limit to existing volume controls.
>   *
>   * @card: where to look for the control
> - * @name: Name of the control
> + * @name: name pattern
>   * @max: new maximum limit
>   *
> - * Return 0 for success, else error.
> + * Finds controls matching the given name (which can be either a name
> + * verbatim, or a pattern starting with the wildcard '*') and sets
> + * a platform volume limit on them.
> + *
> + * Return number of matching controls on success, else error. At least
> + * one control needs to match the pattern.
>   */
>  int snd_soc_limit_volume(struct snd_soc_card *card, const char *name, in=
t max)
>  {
>  	struct snd_kcontrol *kctl;
> +	int hits =3D 0;
> +	int ret;
> =20
>  	/* Sanity check for name */
>  	if (unlikely(!name))
>  		return -EINVAL;
> =20
> -	kctl =3D snd_soc_card_get_kcontrol(card, name);
> -	if (!kctl) {
> +	list_for_each_entry(kctl, &card->snd_card->controls, list) {

[Severity: High]
Does this locklessly traverse the ALSA control list?

If a local user dynamically adds or removes ALSA user controls via
SNDRV_CTL_IOCTL_ELEM_ADD or SNDRV_CTL_IOCTL_ELEM_REMOVE, couldn't traversing
the list here without holding card->controls_rwsem or card->controls_rwlock
result in memory corruption and a kernel panic?

> +		if (!soc_control_matches(kctl, name))
> +			continue;
> +
> +		ret =3D soc_limit_volume(kctl, max);

[Severity: High]
Since the wildcard matching can now match dynamically created user ALSA
controls, is it safe to pass kctl directly to soc_limit_volume() without
verifying it is actually a mixer control?

For user controls, kctl->private_value is NULL. When soc_limit_volume()
unconditionally casts this to a struct soc_mixer_control pointer and
accesses mc->max or mc->platform_max:

soc_limit_volume(struct snd_kcontrol *kctl, int max)
{
	struct soc_mixer_control *mc =3D
		(struct soc_mixer_control *)kctl->private_value;

	if (max <=3D 0 || max > mc->max - mc->min)
		...

won't this result in a NULL pointer dereference?

> +		if (ret < 0)
> +			return ret;
> +		hits++;
> +	}
> +
> +	if (!hits) {
>  		/* Some cards blindly add limits for multiple variants. */
>  		dev_dbg(card->dev, "Volume limit for unknown control '%s'\n",
>  			name);
>  		return -EINVAL;
>  	}
> =20
> -	return soc_limit_volume(kctl, max);
> +	return hits;

[Severity: High]
Could changing the success return value from 0 to a positive integer break
existing callers?

Callers like asoc_sdw_cs35l56_volume_limit() interpret any non-zero return
value as an error, propagating it and bypassing further initialization steps
like snd_soc_dapm_add_routes().

>  }
>  EXPORT_SYMBOL_GPL(snd_soc_limit_volume);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-macaudio-v=
1-0-741cc20a74e5@gmail.com?part=3D10
