Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DA94A6CE6
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 10:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519508; cv=none; b=jkgnyNYywHXNYKP+KOWLBJIM29yH+/RAYMhpCpMPzzS+B0v0miXWokYBiBj6WqQFvedXOhdyKyMLyNX8z7YzJq7CPkSuHNGxRBnEy5kSczs5VJpQgywdShj8UX3gi0+/3dySUBIw6x+CcOw+n0gxXk+q++MlzcTQUyyaOyOTTuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519508; c=relaxed/simple;
	bh=3yyrXQXJ8FPOZIhqUXkQlOgIyUCpSfsvANZfcVbnvrM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eW9kJqzDteBWOe527TLyIWjI74FuXL+4cxS3+tEKr2BUONh/8cTJ/jGEyGg4MA1NXCjheY5m7CbjUBLkshMcrS3nX0BBF09wF5tHbZG4EuibpzDFDyJMEguj9HnVhklPaNBl1zUWNu40wtB7LeFV49ruHNYVrCI/taj1SwCZw34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K+c2T8v7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+c2T8v7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363D81F00A3D;
	Fri,  4 Sep 2026 10:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788519502;
	bh=mwF1YXqITB+00HAdHQSKBe2UKj9XlbYRX+dTjIFeBdU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K+c2T8v7IPD/AUoR6j6tqfLFEcXOqPCWdNitKwAtZUnsz3hJW/sWJ33xOLnvaLLBM
	 Tjq5Q8msjgVpl5Za/9C2OuTQxoCvOCIaOlDjdMkGZUFUMMwRd53QOyX7vS2OoAScsF
	 rwHrQai5vAtozUtl9TArLotLB02R8EenfnrLd1iIwcQhzhe3WnMG0LgoPaUur5yeqk
	 NWFu5sSDRgDr73oPKjv4WbV0AqaqEN20HmH4VBLQUmDLjMTATghhKaGpSs16A0BKLr
	 r/Qobqw3GzxHeEWtKDeKVX8PDilEqBkLNKTCR4/pColJDgXCLzgsVied7s1Xe21nfW
	 1pu1JO8OxwwZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/6] ASoC: qcom: sc8280xp: Add per-DAI board
 configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyang Zhao" <hongyang.zhao@thundersoft.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260904-rubikpi-next-20260605-v3-4-f49146d85af3@thundersoft.com>
References: <20260904-rubikpi-next-20260605-v3-0-f49146d85af3@thundersoft.com>
 <20260904-rubikpi-next-20260605-v3-4-f49146d85af3@thundersoft.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 10:58:21 +0000
Message-Id: <20260904105822.363D81F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing reset of `data->jack_setup` in `sc8280xp_snd_exit` for WCD=
 jack configurations leads to a Use-After-Free during deferred probing or c=
omponent unbind/bind cycles.
--

commit 3a7610af2c37c8b0b947c4604289cd1535efab41
Author: Hongyang Zhao <hongyang.zhao@thundersoft.com>

ASoC: qcom: sc8280xp: Add per-DAI board configuration

This commit introduces an optional per-DAI configuration table indexed
by CPU DAI ID for the SC8280XP sound card. This allows overriding
card-wide settings for MCLK, BCLK, sysclk, and jack setup on a per-DAI
basis.

> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 4d48e1012cd4b..368a54c2cdf8d 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
[ ... ]
> @@ -368,6 +443,19 @@ static int sc8280xp_snd_hw_free(struct snd_pcm_subst=
ream *substream)
>  	return qcom_snd_sdw_hw_free(substream, &data->stream_prepared[cpu_dai->=
id]);
>  }
> =20
> +static void sc8280xp_snd_exit(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct sc8280xp_snd_data *data =3D snd_soc_card_get_drvdata(rtd->card);
> +	struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, 0);
> +	const struct sc8280xp_dai_data *dai_data;
> +
> +	dai_data =3D sc8280xp_get_dai_data(data->priv, cpu_dai->id);
> +	if (dai_data && dai_data->jack_setup =3D=3D SC8280XP_JACK_SETUP_CODEC) {
> +		qcom_snd_headset_jack_cleanup(rtd);
> +		data->jack_setup =3D false;
> +	}
> +}

[Severity: High]
This is a pre-existing issue, but since this new exit callback cleans up=20
the codec jack state, should it also reset the WCD jack state?

When an ASoC component is unbound, the ASoC core unregisters the sound
card and frees the ALSA snd_card, which automatically frees the underlying
snd_jack object. However, the machine driver's sc8280xp_snd_data outlives
the card unbind because it is tied to the platform device.

Because data->jack_setup is not reset to false for WCD configurations
here, when the component is rebound, sc8280xp_snd_init() sees the stale
true value. This skips creating a new jack and passes the dangling
jack->jack pointer to the codec via snd_soc_component_set_jack(). A
subsequent jack event from the codec could then dereference this freed
pointer.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-rubikpi-ne=
xt-20260605-v3-0-f49146d85af3@thundersoft.com?part=3D4
