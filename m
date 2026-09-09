Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA84F2F745C
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 03:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788923635; cv=none; b=kJ+Wc3v4lPrxZy05+O41hlLiykYjOiYxfw9slMxw+QsQc+rgi7HAWW+DdYSZTWoVyDGPRTLM7CZ5Ayl6B91rl04Y5VceqXV6bz97zjJqjmqvLUGnj/yP8pxVP1jNr7QJ5iM6/B+TlzzHXl91XuWayvNH69OQaN70gZ7+7My2IBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788923635; c=relaxed/simple;
	bh=bn7FcouhsRsrTA3z3FVfIV5nXDKRtsPwPHuOTY0pHNY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hobnb7VcQHBSKUKg4yfcimXfiXcZcEVEe0orT+bj/m9SnHEL5x60bDAHg6okO+yIDI8x8gEJoIf8Hbj+bqIK8M92RFMmg5FFR+HWgxMR1WFSVQLhyRhNDpSuhhsN3pMRtzcLEzUJGUDIXn/6fRO3d1oW8rTZSTyzooQrIwBr2NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EjI6utIv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EjI6utIv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C1A41F00A3A;
	Wed,  9 Sep 2026 03:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788923634;
	bh=5UPWLGH5VqfcijeL/ycHgfGRK/p7vLm1OTqdozNiByA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EjI6utIvZ/K0B02BxobxRRZcIJv8vvLYBi4Al0FGnswoAc4971QJ1Af04uRolRUl9
	 lL7nN/z3+y4QIlflMFNa9zU2ezcU7rANoCLYTdDY2W1N4N3Ab0p2FqNiTolvngaYin
	 ZIMDkd3ocxmIUn20YddEYhWPMDnYPVX/MMHTCScdgUTetZwrBRMA87R4bbHhAji1DE
	 /QrfQSIPL5n+KhG6AltDBRZTHdBYKT6liiCW8Uo2BDwR0Q87oApzG+sFKn4wH4rM1d
	 EHU/lIShnhFQ15+YaTqj5hc2hoWYHP+xiFjW9lJInMbVvl8sVB+n2DCOk5s0UoKJca
	 dBekghJzxm50w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] ASoC: codecs: nau8360: Block DSP path selection
 when firmware load fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neo Chang" <YLCHANG2@nuvoton.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260909025947.287120-2-YLCHANG2@nuvoton.com>
References: <20260909025947.287120-1-YLCHANG2@nuvoton.com>
 <20260909025947.287120-2-YLCHANG2@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 03:13:53 +0000
Message-Id: <20260909031354.2C1A41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Time-of-check to time-of-use (TOCTOU) race when checking DAPM bias=
 level, allowing path changes during active playback.
--

commit b29bd8969729968f9e98cb8e88c840d31f1aa474
Author: Neo Chang <YLCHANG2@nuvoton.com>

ASoC: codecs: nau8360: Block DSP path selection when firmware load fails
   =20
This commit blocks DSP path selection if the firmware fails to load,
preventing invalid routing states. It ensures invalid userspace requests
are rejected with -EBUSY to maintain the original hardware state.

> diff --git a/sound/soc/codecs/nau8360.c b/sound/soc/codecs/nau8360.c
> --- a/sound/soc/codecs/nau8360.c
> +++ b/sound/soc/codecs/nau8360.c
> @@ -715,10 +715,15 @@ static int nau8360_dac_mux_put_enum(struct snd_kcon=
trol *kcontrol,
>  	int ret =3D 0;
> =20
>  	if (snd_soc_dapm_get_bias_level(dapm) > SND_SOC_BIAS_STANDBY) {
> -		dev_warn(nau8360->dev, "changing path is not allowed during playback");
> +		dev_warn_ratelimited(nau8360->dev, "changing path is not allowed durin=
g playback");
>  		return ret;
>  	}
> =20
> +	if (item[0] =3D=3D NAU8360_DAC_SRC_DSP && !nau8360->load_fw_done) {
> +		dev_warn_ratelimited(nau8360->dev, "Cannot enable DSP: Firmware not re=
ady or disabled\n");
> +		return -EBUSY;
> +	}
> +
>  	mutex_lock(&nau8360->lock);
> =20
>  	ret =3D snd_soc_dapm_put_enum_double(kcontrol, ucontrol);

[Severity: High]
This is a pre-existing issue, but does nau8360_dac_mux_put_enum() have a
time-of-check to time-of-use (TOCTOU) race when checking the DAPM bias leve=
l?

The follow-up fix in this series ("ASoC: codecs: nau8360: Fix AB-BA deadlock
in mux update") adds dapm_mutex locking to this function but fails to resol=
ve
the race condition.

If a concurrent userspace mixer update and a PCM stream start occur, the mi=
xer
update thread can check that the bias level is <=3D SND_SOC_BIAS_STANDBY.

Once the lock is dropped (or before it is held, in the current patch state),
the PCM stream can start, acquire the dapm_mutex, transition the bias level=
 to
SND_SOC_BIAS_ON, and release the lock.

Then, snd_soc_dapm_put_enum_double() re-acquires the lock internally and
blindly applies the path change while playback is active.

Can this sequence cause the hardware routing path to be mutated while audio
is active, potentially leading to invalid hardware routing states or audio
glitches?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909025947.2871=
20-1-YLCHANG2@nuvoton.com?part=3D1
