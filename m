Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0175326A5
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 18:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917376; cv=none; b=BIVmLu/gvwSFqQQS3tPzQhdTwjHvoKOoL2ROFzf2+m3qXqv8vDKFXAKZ41ou9UBsMfqnRu+aEjAEEblHbuZpB2vZhSkK3qEWm1OKp+mzw5BfUvzbeso/5eEBFOLFDSX1awWSFiEK7dQsGFaVzQZvVfyE1XuHdbtUnWpSfpGOoAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917376; c=relaxed/simple;
	bh=Pptj/rXkpJa87AslCVOhrdIqZnwbr5Eu29Vsxoebp8w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=W1VZJbNVmaDo0Ui4e1u0y16MifzgeY6VSl7aGSU85DRYJJSlAItOJKCM0gcN0/c7M+VJXf2sFVjA8tBEsUiwBYeJOX4b2wQEQF5SlpXNNDUqpuqs1FtWDwgKox6zvO4Q23cr4VzabPYelpWR4W+jCr2/CFtziU+5xrosq+GidpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c7Lw59jC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c7Lw59jC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 278051F00893;
	Tue, 13 Oct 2026 18:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791917374;
	bh=XfBTK7P9/FDAuQ3rDeZaxUdXh565Il7AimoMVLumg6w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c7Lw59jCMdlmt+X1THy//8lR0pPLrKXxiz5wkxTmEmV1VoMehL6b9aUeJxbc3gn/J
	 44CEHFG4iEEUlESgQzlQEmbKY0AzpzzjsQsDSkjMNGN6HP+xEMvxkmNBzuQs0iFpgD
	 0dMuTT/rLu2a67xQVx/4kOTVNwXRPVxsL/tl1DrijGIvdGA/wqNYVNZv3ZCIPPXNsn
	 KUOqtRNDZDGmkntpX44sdukrTLI5uB6uCd0f0riUIDXtQTO+q1CTlx86ErgljgFAkz
	 wSOTeE/O+hZXPahuQcurHkFKteYVg8RdziRBliWuti8BJxVJSodItlbQECm255CPmc
	 nZPTuPVMTh92Q==
Message-ID: <sashiko-outbox-170354@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] ASoC: tegra: Support WM8994 by machine driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013183226.513658-3-clamor95@gmail.com>
References: <20261013183226.513658-1-clamor95@gmail.com>
 <20261013183226.513658-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 18:49:33 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] asoc: tegra: UAF and state unbalance due to invalid micbias in wm8=
994_mic_detect() teardown
- [High] asoc: tegra: missing .owner =3D THIS_MODULE leads to module unload=
 crash
- [Low] asoc: tegra: DAPM pin switches reference non-existent widgets
--

commit f9aa3ff5a04d8149180c0f26beabf248ebcd5577
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ASoC: tegra: Support WM8994 by machine driver
   =20
Add Wolfson Microelectronics WM8994 codec support to the Tegra ASoC
machine driver. The WM8994 codec is found on devices like LG Optimus 2X
(P990/star) and Samsung Captivate Glide (SGH-i927).

> diff --git a/sound/soc/tegra/tegra_wm8994.c b/sound/soc/tegra/tegra_wm899=
4.c
> new file mode 100644
> index 0000000000000..950fa6ad388f9
> --- /dev/null
> +++ b/sound/soc/tegra/tegra_wm8994.c
[ ... ]
> +static const struct snd_kcontrol_new tegra_wm8994_controls[] =3D {
> +	SOC_DAPM_PIN_SWITCH("Int Spk"),
> +	SOC_DAPM_PIN_SWITCH("Internal Mic 1"),
> +	SOC_DAPM_PIN_SWITCH("Internal Mic 2"),
> +	SOC_DAPM_PIN_SWITCH("Mic Jack"),
> +	SOC_DAPM_PIN_SWITCH("Line Out"),
> +	SOC_DAPM_PIN_SWITCH("FM Radio"),
> +};

[Severity: Low]
Are there matching DAPM widgets defined for the "Line Out" and "FM Radio"
pin switches?

Neither tegra_asoc_machine.c nor the WM8994 codec driver appears to define
DAPM widgets with these exact names. Referencing non-existent widgets
creates unattached controls that fail to operate correctly when toggled
from userspace.

[ ... ]
> +static int tegra_wm8994_remove(struct snd_soc_card *card)
> +{
> +	struct snd_soc_dai_link *link =3D &card->dai_link[0];
> +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_get_pcm_runtime(card, link);
> +	struct snd_soc_dai *codec_dai =3D snd_soc_rtd_to_codec(rtd, 0);
> +	struct snd_soc_component *component =3D codec_dai->component;
> +
> +	wm8994_mic_detect(component, NULL, 0);

[Severity: High]
Does calling wm8994_mic_detect() with 0 for the micbias argument skip
cleanup and return an error?

In sound/soc/codecs/wm8994.c:wm8994_mic_detect(), when micbias is 0,
it falls into the default switch case, logs a warning, and returns -EINVAL:

	default:
		dev_warn(component->dev, "Invalid MICBIAS %d\n", micbias);
		pm_runtime_put(component->dev);
		return -EINVAL;

Because it returns early, the teardown logic is never executed, and
wm8994->micdet[0].jack is not set to NULL.

When the machine driver is unbound, the snd_jack is freed. However, the
codec still holds the dangling pointer. Can a subsequent microphone IRQ fir=
e,
causing wm8994_mic_irq() to call snd_soc_jack_report() on the freed jack
and leading to a use-after-free crash?

Additionally, is it intentional to call this unconditionally, even if it
was never enabled (for example, when machine->gpiod_mic_det is present)?
This might lead to unbalanced teardown.

> +
> +	return 0;
> +}
[ ... ]
> +static struct snd_soc_card snd_soc_tegra_wm8994 =3D {
> +	.components =3D "codec:wm8994",
> +	.dai_link =3D &tegra_wm8994_dai,
> +	.num_links =3D 1,
> +	.controls =3D tegra_wm8994_controls,
> +	.num_controls =3D ARRAY_SIZE(tegra_wm8994_controls),
> +	.remove =3D tegra_wm8994_remove,
> +	.fully_routed =3D true,
> +};

[Severity: High]
Is the .owner field intentionally omitted from this structure?

The driver uses a shared probe function, tegra_asoc_machine_probe(),
from tegra_asoc_machine.c, which contains the fallback:

	if (!card->owner)
		card->owner =3D THIS_MODULE;

Because THIS_MODULE in the fallback resolves to the snd-soc-tegra-machine
module, the snd-soc-tegra-wm8994 module's reference count is never
incremented when a PCM stream is opened.

Could this allow the snd-soc-tegra-wm8994 module to be unloaded via rmmod
while audio is actively playing, causing any subsequent ALSA core access to
callbacks or data structures in the unloaded module to trigger a kernel oop=
s?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013183226.5136=
58-1-clamor95@gmail.com?part=3D2
