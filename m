Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8A61E515
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 06:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778739034; cv=none; b=fo1bN/GkpJ9O9gWhfUbrxuvOVcBGWsK22fxfpPLscuM0boJ1PZv/yAp0H/8J7Dp7tMu9CKCKfXJ7JDJjRNAOwSPxyZBjNwV86m1/EESRritedu6f6BkENnWeWmJ6kZRv9Y0asivjJSD2yX/45Z+wplfEo4jSQgiXWxMOk/oquWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778739034; c=relaxed/simple;
	bh=xUtBvqcpDpr+9Ap/bkuTpm+bA4hsSho5cgbvtoMgGZg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mH8eJRoUF9Gz5bY0wfY8OIIz4H8sMaL560RWnxQbAZdE5a5sMPE9rEEfQuFKtVuOQkqntYj6D3y9WeK/K6y0CLtr/DEM/pBOc3jQkpFymSwb33iGyNz0+2gvwzt1DgNkzL9QZToncg5JOdwaKk0lxdJ0svi3rEIGwrd8NxM1PBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dnkPGw1B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dnkPGw1B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AEEFC2BCC7;
	Thu, 14 May 2026 06:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778739034;
	bh=xUtBvqcpDpr+9Ap/bkuTpm+bA4hsSho5cgbvtoMgGZg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=dnkPGw1BUYqQgcI6Pjd8+KDtGJjJpg8iw0JWvtTv3HjYaZALs3/mbXxpBNo3xx0x3
	 9qgGKRglkq8mT6bfPO+I72mRYCEWtQG79aj5j7ZIV6wCEqzJwb4aIYnYfbXoc1yvZI
	 11yjtpgB3FliuzbQLLCZ3Bp8piq72wG/9k5bl6rOU5vxWz9GU9zHAWZjAh8VZCvUuT
	 06gVk+7Bxn9F7LguyO9s7GK7n+WWAvvRN/Of6Fn3DDhRM7FU3hmnLoy6+UO35X+dMv
	 Cd4HtQsEYiY0gD+hr63fWPqbARZcn3cQgdXSvgZgsxxEqU/pH2wniVeWdhbT9gxdom
	 MQoHbZO9AgyIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 14/17] ASoC: simple-amplifier: gpio-audio-amp: Add
 support for gain-ranges
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herve Codina" <herve.codina@bootlin.com>
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260513081702.317117-15-herve.codina@bootlin.com>
References: <20260513081702.317117-15-herve.codina@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 06:10:34 +0000
Message-Id: <20260514061034.8AEEFC2BCC7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Unsynchronized freeing of dynamically allocated TLV array causes a=
 Use-After-Free during concurrent ALSA TLV read.
- [Medium] Integer overflow in `kctrl_max` accumulation leads to validation=
 bypass and a reachable `WARN(1)`.
- [Medium] Integer overflow in `simple_amp_cmp_ranges` can corrupt the sort=
ed array.
- [Medium] Unprotected state modifications in ALSA control `put` handlers l=
ead to a TOCTOU race and hardware state desynchronization.
--

commit 24a3721afe8e210f60da48c3439973f4c9f7e094
Author: Herve Codina <herve.codina@bootlin.com>

ASoC: simple-amplifier: gpio-audio-amp: Add support for gain-ranges

This commit introduces support for gain-ranges in the simple-amplifier
driver, mapping physical gain values to GPIO values through an array of
ranges and exporting them via an ALSA kcontrol with TLV range information.

diff --git a/sound/soc/codecs/simple-amplifier.c b/sound/soc/codecs/simple-=
amplifier.c
index 5b172e520dcd0..5759f9bc2f4ff 100644
--- a/sound/soc/codecs/simple-amplifier.c
+++ b/sound/soc/codecs/simple-amplifier.c

[ ... ]

> @@ -252,6 +312,38 @@ static int simple_amp_multi_kctrl_int_put(struct snd=
_kcontrol *kcontrol,
>  	return 1; /* The value changed */
>  }

Can concurrent calls to simple_amp_multi_kctrl_int_put() and
simple_amp_single_kctrl_put() lead to hardware state desynchronization?

These handlers read the cached software state, issue hardware I/O via
gpiod_multi_set_value_cansleep(), and update the cached state without
driver-level locking.

The OSS emulation layer only holds a read lock when invoking kctl->put().
Two racing threads could pass the equality check and interleave their
hardware writes, causing the cached software state to permanently
desynchronize from the actual hardware GPIO state.

[ ... ]

> @@ -407,8 +526,17 @@ static int simple_amp_component_probe(struct snd_soc=
_component *component)
>  	return 0;
>  }
> =20
> +static void simple_amp_component_remove(struct snd_soc_component *compon=
ent)
> +{
> +	struct simple_amp *simple_amp =3D snd_soc_component_get_drvdata(compone=
nt);
> +
> +	kfree(simple_amp->gain.tlv_array);
> +	simple_amp->gain.tlv_array =3D NULL;
> +}

Does this kfree() cause a use-after-free during concurrent ALSA TLV reads?

ALSA controls remain accessible as long as a user holds an open file
descriptor, and snd_card_disconnect() does not drain active ioctls. A
concurrent SNDRV_CTL_IOCTL_TLV_READ could be blocked in copy_to_user()
reading control.tlv.p when this memory is synchronously freed.

Should the array's lifetime instead be bound to the kcontrol via the
kcontrol->private_free callback?

[ ... ]

> @@ -426,10 +554,179 @@ static int simple_amp_parse_single_gpio(struct dev=
ice *dev,
>  	return 0;
>  }
> =20
> +static int simple_amp_cmp_ranges(const void *a, const void *b)
> +{
> +	const struct simple_amp_range *a_range =3D a;
> +	const struct simple_amp_range *b_range =3D b;
> +
> +	/* Ranges a and b don't overlap. This has been already checked */
> +
> +	return a_range->min.gain_db - b_range->max.gain_db;
> +}

Can this subtraction mathematically overflow?

If highly negative and highly positive s32 values are provided via the
Device Tree, this operation could reverse the intended sign and break the
strict weak ordering required by sort(), corrupting the resulting array sta=
te.

Could this use safe inequality checks instead of subtraction?

[ ... ]

> +static int simple_amp_parse_ranges(struct device *dev,
> +				   struct simple_amp_multi *multi,
> +				   const char *ranges_property)
> +{

[ ... ]

> +		range->nb_points =3D abs_diff(range->min.gpio_val,
> +					    range->max.gpio_val) + 1;
> +
> +		multi->kctrl_max +=3D range->nb_points;
> +	}
> +
> +	multi->kctrl_max -=3D 1;

Does this code overflow multi->kctrl_max?

A malformed Device Tree could define up to 65,536 ranges, each mapping to
65,536 points. This summation would reach exactly 4,294,967,296, completely
overflowing the u32 back to 0.

The subsequent multi->kctrl_max -=3D 1 operation would then underflow it to
0xFFFFFFFF, bypassing the bounds check in
simple_amp_multi_kctrl_write_gpios() and triggering a reachable WARN(1) in
simple_amp_multi_ranges_kctrl_to_gpio() which could act as a denial of
service if panic_on_warn is set.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513081702.3171=
17-1-herve.codina@bootlin.com?part=3D14
