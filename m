Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D2018DB26
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 03:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788924604; cv=none; b=UhSxCBDHOCSqh1Ga3b2pOba+DF+u10wjl5FjkXa+JFLgzg/4jfH0kRWN6mgIsl6uLtRDIq0q6M2wXB/v8hPMMWakWT1pPL8xNrP9B9/1rtP8P4TcVw4L1c2/WnZv/lQ70iirLph/v/CbwsLPIYuvJYobZuKauUn+fu7MHBHxr1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788924604; c=relaxed/simple;
	bh=fn9jMnmVsl13Z7LcT7WVhDZaVuEqxUUgz48xbU1ElHQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FbgVFG/Kcl06jQt6fGsplPaC5VkA96w+adlUUx2f8hwxd7gmUZzY+lq6v3HuIIEVoYKBeA1IR4l0x4U/A3Xtzb5x3A+T7vqItOZu/x8Dk8GHKpEIEFmGemVDnFUByVKErRmC9avVUhwHHRRi7d7pczlDjeeukKzu4VWium3x9pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AECILz+n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AECILz+n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69EB31F00A3A;
	Wed,  9 Sep 2026 03:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788924602;
	bh=PT7kRM1h2fwVXnWqeimUalQSqQaim4WJeXaKw4Mli40=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AECILz+n+vRSS6Xprynj6rDr4kChIAGyv1mzi1bFZjxMubXUBjWMJn1gqm7954JN6
	 obE9NMDalNbCwPB14KcPF7E+yz8Ps/vQ2BGSN9C/JvrAEVvWHr0vKwOhlLBET1vp6E
	 gPJQou2ioaQ6xmYnAnJFPIYgiRRqfvYKjB01huPNRz+euBIgeHyo5R7Tg1+puwbJid
	 p7qfZs9dxeSwokrubJLoT+QM6HhMhaWUIr06/oUdsWfvDihPFeYlGc2YirvQuiGFe+
	 PyaAUNtkPdcu9v0xbVZdjW2lLKjEKx3jUPbyuMqrBp8icBYW4AiUGCsEgaDh2yr2Y2
	 xorybtngHjHqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] ASoC: codecs: nau8360: Fix AB-BA deadlock in mux
 update
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neo Chang" <YLCHANG2@nuvoton.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260909025947.287120-3-YLCHANG2@nuvoton.com>
References: <20260909025947.287120-1-YLCHANG2@nuvoton.com>
 <20260909025947.287120-3-YLCHANG2@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 03:30:01 +0000
Message-Id: <20260909033002.69EB31F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Use-after-free (UAF) due to unbalanced lifecycle operations be=
tween devres component unregistration and background work cancellation.
- [High] Time-of-check to time-of-use (TOCTOU) race when verifying the DAPM=
 bias level constraint before updating DAPM paths.
- [Medium] Returning 0 instead of an error code when rejecting a mux change=
 during playback.
- [Medium] Bogus locking and data race when checking `load_fw_done` flag.
--

commit e1e283a6d218bffef7bd342646768fdbef3b2320
Author: Neo Chang <YLCHANG2@nuvoton.com>

ASoC: codecs: nau8360: Fix AB-BA deadlock in mux update

This commit fixes an AB-BA lock inversion by replacing nau8360->lock with
the DAPM mutex to protect pre-checks. It drops the lock before calling
snd_soc_dapm_put_enum_double() to avoid deadlocks with concurrent stream
startups or mixer updates.

Link: https://sashiko.dev/#/patchset/20260908030342.222655-1-YLCHANG2@nuvot=
on.com?part=3D1

> diff --git a/sound/soc/codecs/nau8360.c b/sound/soc/codecs/nau8360.c
> index 277aa982c341e..7f83c737e8af8 100644
> --- a/sound/soc/codecs/nau8360.c
> +++ b/sound/soc/codecs/nau8360.c
[ ... ]
> @@ -714,27 +717,26 @@ static int nau8360_dac_mux_put_enum(struct snd_kcon=
trol *kcontrol,
>  	unsigned int *item =3D ucontrol->value.enumerated.item;
>  	int ret =3D 0;
> =20
> +	snd_soc_dapm_mutex_lock(dapm);
>  	if (snd_soc_dapm_get_bias_level(dapm) > SND_SOC_BIAS_STANDBY) {
>  		dev_warn_ratelimited(nau8360->dev, "changing path is not allowed durin=
g playback");
> +		snd_soc_dapm_mutex_unlock(dapm);
>  		return ret;

[Severity: Medium]
This is a pre-existing issue, but does this return success to the ALSA
framework when the change was actually rejected?

Since ret is initialized to 0, userspace might incorrectly believe the requ=
est
was accepted or benignly ignored when it attempts to change the control dur=
ing
playback.

>  	}
> =20
>  	if (item[0] =3D=3D NAU8360_DAC_SRC_DSP && !nau8360->load_fw_done) {

[Severity: Medium]
This isn't a bug introduced by this patch, but does the dapm_mutex actually
protect this load_fw_done flag?

Since nau8360_load_fw_work() asynchronously sets nau8360->load_fw_done =3D =
true
without acquiring dapm_mutex, it appears the read here remains a plain C da=
ta
race and the lock provides no actual synchronization.

>  		dev_warn_ratelimited(nau8360->dev, "Cannot enable DSP: Firmware not re=
ady or disabled\n");
> +		snd_soc_dapm_mutex_unlock(dapm);
>  		return -EBUSY;
>  	}
> -
> -	mutex_lock(&nau8360->lock);
> +	snd_soc_dapm_mutex_unlock(dapm);
> =20
>  	ret =3D snd_soc_dapm_put_enum_double(kcontrol, ucontrol);

[Severity: High]
This is a pre-existing issue, but could dropping the lock here before calli=
ng
snd_soc_dapm_put_enum_double() create a race condition?

Since snd_soc_dapm_put_enum_double() re-acquires the same dapm mutex
internally, there is a window where the lock is released. A concurrent PCM
stream startup could acquire the DAPM lock in this window, increment the bi=
as
level, and start playback.

Once the stream starts, snd_soc_dapm_put_enum_double() acquires the lock and
blindly applies the mux routing change during active playback, circumventing
the driver's intended safety constraint checked earlier.

>  	if (ret <=3D 0)
> -		goto unlock;
> +		return ret;
> =20
>  	nau8360_dsp_switch(component, snd_soc_enum_item_to_val(e, item[0]));
> =20
> -unlock:
> -	mutex_unlock(&nau8360->lock);
> -
>  	return ret;
>  }

[Severity: Critical]
This is a pre-existing issue, but is there a use-after-free risk between
devres component unregistration and background work cancellation?

In nau8360_i2c_remove(), the background work is cancelled:

    cancel_work_sync(&nau8360->load_fw_work);

However, the ASoC component is registered using devm_snd_soc_register_compo=
nent().
Due to devres cleanup ordering, the component remains registered after
nau8360_i2c_remove() finishes, until the devres release unregisters it.

During this window, an asynchronous sound card bind (e.g., from deferred pr=
obe)
could successfully acquire the module reference and call nau8360_codec_prob=
e(),
which reschedules the work:

    schedule_work(&nau8360->load_fw_work);

The devres release would then continue, unregistering the component and fre=
eing
the nau8360 struct without canceling the newly scheduled work.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909025947.2871=
20-1-YLCHANG2@nuvoton.com?part=3D2
