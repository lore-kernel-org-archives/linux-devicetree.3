Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1013D967A
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 08:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781771991; cv=none; b=psrRxRit3g8ABSx0gUHWRSDHdlSz7WHOCRjC9oPo4+XCpjXinLQunVQZgxL407Y97MXAROyQz19VPZq9Qttr1kAFMRZpCJtfZTBynibBhNaVYCVGkWxoQx0u6NdvNvdjtarvLGOFCHvYldLiZ3r7lvbzyUvUeCzOgPZdPkPbp1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781771991; c=relaxed/simple;
	bh=8r2z3TsisrCeqJAdsCsjAlFcLZcV2E1O6rAacLocUrs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ca29vgZsPo+9cxg14l8MFW81lcC35RyGCIep/IvsEF23EGH/cq1bcDE1IMbLYEj+bHqOUlngVgMgL6/hoU2StmzeGKZ5aleVOFIWydcusUJzr+y+DSt4GhSHNAtD7agwGuPpbv6xgZabT6hCY5xpPyF+Ti3HgbBgQB9n93zOI+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ns59mnqf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ns59mnqf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA871F000E9;
	Thu, 18 Jun 2026 08:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781771990;
	bh=kk0PSBhGLuUBUpJhIES7NmTiLcPvE8lDA70TYeq68sw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ns59mnqfwuc1m5fbyiBFEOSj3QvOgEl3kxYi+sHQgDQYkj6LdOppAc3vYXktcDhCI
	 N8euwb/6L8kLr3e8UCs47GfJ2nHPCvToNpcec7iIIT99YlandPGxk8DhwUI4lHZ/aM
	 /IDpoUgvuGQZnZ53Nv/bSmowMhASBVHXO48224CN4sCKTB6D+D2rZmo8/mZU8arfre
	 AXTic6QWVX4J8USfqq3v65mNmKgK4veLAQK/BQdCE1RXQfMGMLU405xLmvwzIhAeQ8
	 q3lPUVuwLHFxrlGph+MEob5o0Yl4qbZoudbzY4sDmQ+hXx/wSypQbuMMapMfvjfj63
	 SU8xlXNoqt4IQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/7] ASoC: codecs: ES8389: Add private members about
 HPF
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhang Yi" <zhangyi@everest-semi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260618082842.2778-7-zhangyi@everest-semi.com>
References: <20260618082842.2778-1-zhangyi@everest-semi.com>
 <20260618082842.2778-7-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 08:39:49 +0000
Message-Id: <20260618083950.2BA871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The fallback logic for a missing `everest,hpf-frq` DT property is =
broken, causing an integer overflow and an impossible `u8` to `U32_MAX` com=
parison.
- [High] The ADC High-Pass Filter parameters `hpfl` and `hpfr` are used wit=
hout being initialized during probe, leading to incorrect hardware configur=
ation.
- [High] Playback stream operations silently corrupt the ADC (capture) High=
-Pass Filter state due to missing stream direction checks.
- [Medium] The newly introduced device tree property `everest,hpf-frq` cont=
ains a typo ('frq' instead of 'freq').
--

commit 5aa70910dd654fd778ac694838a2c5d06ae7cd64
Author: Zhang Yi <zhangyi@everest-semi.com>

ASoC: codecs: ES8389: Add private members about HPF

This commit adds HPF (High-Pass Filter) related private members to the
ES8389 codec. It includes a helper function to match the set HPF frequency
and accesses the HPF frequency set by the user from the Device Tree.

> diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
> index 09257687bb84c..bcec9d9200dbe 100644
> --- a/sound/soc/codecs/es8389.c
> +++ b/sound/soc/codecs/es8389.c
[ ... ]
> @@ -504,6 +507,48 @@ static inline int get_coeff(u8 vddd, u8 dmic, int mc=
lk, int rate)
[ ... ]
> +static bool find_best_hpf_freq(u32 target_hz, u8 *hpf1, u8 *hpf2)
> +{
> +	int best_row =3D -1, best_col =3D -1;
> +	u32 min_diff =3D U32_MAX;
> +	u32 f, diff;
> +	int i, j;
> +
> +	if ((*hpf1 =3D=3D ES8389_HPF_INVALID) | (*hpf2 =3D=3D ES8389_HPF_INVALI=
D))

[Severity: High]
Does this code correctly evaluate the fallback condition?

hpf1 and hpf2 are pointers to u8. Dereferencing them yields a maximum value=
 of
255, so comparing them against ES8389_HPF_INVALID (which is U32_MAX) will
always evaluate to false. This prevents the fallback path from ever executi=
ng.

> +		return false;
> +
> +	for (i =3D 0; i < 10; i++) {
> +		for (j =3D i; j < 10; j++) {
> +			f =3D hpf_table[i][j];
[ ... ]
> @@ -663,6 +710,14 @@ static int es8389_pcm_hw_params(struct snd_pcm_subst=
ream *substream,
>  		return -EINVAL;
>  	}
> =20
> +	freq =3D (es8389->target_freq * 48000) / params_rate(params);

[Severity: High]
If the Device Tree property is missing, target_freq is set to U32_MAX.
Could this cause an integer overflow here, resulting in a garbage freq valu=
e?

Additionally, since the High-Pass Filter is an ADC (Capture) specific featu=
re,
does this code safely avoid overwriting the ADC configuration during playba=
ck
stream operations?

If es8389_pcm_hw_params() is called for a playback stream, it appears it
will unconditionally recalculate the capture stream's filter configuration
using the playback rate. Could this update logic be restricted by checking
the stream direction?

> +	hpf =3D find_best_hpf_freq(freq, &es8389->hpfl, &es8389->hpfr);
> +	if (!hpf) {
> +		dev_dbg(component->dev, "Can't find best freq. Use the default setting=
");
> +		es8389->hpfl =3D ES8389_HPF_DEFAULT;
> +		es8389->hpfr =3D ES8389_HPF_DEFAULT;
> +	}
> +
>  	return 0;
>  }
> =20
> @@ -743,8 +798,8 @@ static int es8389_mute(struct snd_soc_dai *dai, int m=
ute, int direction)
>  			regmap_update_bits(es8389->regmap, ES8389_DAC_FORMAT_MUTE,
>  						0x03, 0x00);
>  		} else {
> -			regmap_update_bits(es8389->regmap, ES8389_ADC_HPF1, 0x0f, 0x0a);
> -			regmap_update_bits(es8389->regmap, ES8389_ADC_HPF2, 0x0f, 0x0a);
> +			regmap_update_bits(es8389->regmap, ES8389_ADC_HPF1, 0x0f, es8389->hpf=
l);
> +			regmap_update_bits(es8389->regmap, ES8389_ADC_HPF2, 0x0f, es8389->hpf=
r);

[Severity: High]
Are hpfl and hpfr properly initialized before they are used here?

Since they are dynamically allocated and zero-initialized, if es8389_mute()
is called prior to es8389_pcm_hw_params() (for instance during stream start=
up
or idle states), this will write uninitialized 0x00 values to the hardware
registers instead of the previously hardcoded 0x0A default.=20

Should they be explicitly initialized in es8389_probe()?

>  			regmap_update_bits(es8389->regmap, ES8389_ADC_FORMAT_MUTE,
>  						0x03, 0x00);
>  		}
> @@ -906,6 +961,12 @@ static int es8389_probe(struct snd_soc_component *co=
mponent)
>  		es8389->mclk_src =3D ES8389_MCLK_SOURCE;
>  	}
> =20
> +	ret =3D device_property_read_u32(component->dev, "everest,hpf-frq", &es=
8389->target_freq);

[Severity: Medium]
This isn't a bug, but there's a typo in the newly introduced device tree
property name ("frq" instead of "freq"). Since Device Tree bindings become
permanent ABI, could this be corrected before it becomes baked into the ker=
nel?

> +	if (ret !=3D 0) {
> +		dev_dbg(component->dev, "hpf-freq return %d\n", ret);
> +		es8389->target_freq =3D ES8389_HPF_INVALID;
> +	}
> +
>  	for (i =3D 0; i < ARRAY_SIZE(es8389_core_supplies); i++)
>  		es8389->core_supply[i].supply =3D es8389_core_supplies[i];

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618082842.2778=
-1-zhangyi@everest-semi.com?part=3D6
