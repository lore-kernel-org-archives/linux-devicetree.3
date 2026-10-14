Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FF348F00F
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 12:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981075; cv=none; b=lQs4INAV1rTG9869H/PHJaojqKOCB9LlDawNVuP/d9jzMBLwY++w240d7WLp79ebyQokmiBP7h9G3tfvMSCUdpQC1unt3OlzO5caEWx+cMjIZWm/wMtQ/oHrT2XielAsa8sQmEV2A2KMtLAvzFp7Q5d1Lb64qrKpIOGRhuZKMTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981075; c=relaxed/simple;
	bh=y3qFI03aHuWHpWlt+UBKPIORPHQ2WnkLQ7RrdDkl7hE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=iSXB3QHf7QFWEO2wMUwazQF/WWt+OwiWJNwFbt646SlrFC2F08xAtsS0A/05MtXRBzL42VH1OaI3VbRd/xveL3rfG4iQ6N/wUaFN/yP5jUZnOZ6UT+WEOh7tSrJFGjfJguJ5mbOERJWtLOu93/Y95z65aP834MGqUc02PcwgLbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cgXi8o3n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cgXi8o3n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89351F00898;
	Wed, 14 Oct 2026 12:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791981073;
	bh=jKvdjsq0hT6ikRaocF0lBtP2qFwUWgotKHzMZTJOO4Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cgXi8o3nLNe4cel44AArRg3K1gY6c17J+KzQ7uqE/Kl0HqNBtqUNZQnv76vAaUbJd
	 g+3rQIGyer+Dbe7BodRMQl6WaiETbUoWKDy6/G0+HKJSO1zTXjwHbyzFPG9DgmtFnT
	 AkPd4xi1+JDQpy65LklA2tU9XjBc22SaRHU1wSVnoUFO35RHtPhqtth9q4gpxYK1qY
	 0Bo2ZLtCg5RiniIBBu2WZhgBlL2OVKEKQ9kHKI3w14nSQO2oZ6ordXrjI9Y9eDspmB
	 6447z0CBcgmimzUOTcLWUmeKIClnaMIgtw/q8msiTld8Ulfg4SoNIoIeiLMSB3Brw/
	 zqKwvephTiiGw==
Message-ID: <sashiko-outbox-171280@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: tegra: Support WM8994 by machine driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014120148.126160-3-clamor95@gmail.com>
References: <20261014120148.126160-1-clamor95@gmail.com>
 <20261014120148.126160-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 12:31:12 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] sound/soc: NULL pointer dereference in tegra_wm8994_remove() durin=
g unload
- [Medium] ASoC: tegra: dropped headphone and button events due to SND_JACK=
_MICROPHONE
--

commit c25c1a719a0690a201ec3decc5bc7bc2cec57601
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ASoC: tegra: Support WM8994 by machine driver

Add Wolfson Microelectronics WM8994 codec support to the Tegra ASoC
machine driver. The WM8994 codec is found on devices like LG Optimus 2X
(P990/star) and Samsung Captivate Glide (SGH-i927).

> diff --git a/sound/soc/tegra/tegra_wm8994.c b/sound/soc/tegra/tegra_wm899=
4.c
> new file mode 100644
> index 0000000000000..1550faeba7256
> --- /dev/null
> +++ b/sound/soc/tegra/tegra_wm8994.c
> @@ -0,0 +1,175 @@

[ ... ]

> +static int tegra_wm8994_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct tegra_machine *machine =3D snd_soc_card_get_drvdata(rtd->card);
> +	int err;
> +
> +	err =3D tegra_asoc_machine_init(rtd);
> +	if (err)
> +		return err;
> +
> +	if (!machine->gpiod_mic_det && machine->asoc->add_mic_jack) {
> +		struct snd_soc_dai *codec_dai =3D snd_soc_rtd_to_codec(rtd, 0);
> +		struct snd_soc_component *component =3D codec_dai->component;
> +
> +		err =3D snd_soc_card_jack_new_pins(rtd->card, "Mic Jack",
> +						 SND_JACK_MICROPHONE,
> +						 machine->mic_jack,
> +						 tegra_wm8994_mic_jack_pins,
> +						 ARRAY_SIZE(tegra_wm8994_mic_jack_pins));
> +		if (err) {

[Severity: Medium]
Will this silently drop headphone and button events from the codec?

The ALSA jack is explicitly initialized with only the SND_JACK_MICROPHONE
capability. However, the WM8994 codec handles full headset detection and tr=
ies
to report events as SND_JACK_HEADSET | SND_JACK_BTN_0.

Because the ALSA jack type is restricted to SND_JACK_MICROPHONE, the ALSA c=
ore
filters out the SND_JACK_HEADPHONE and button bits in snd_jack_report(),
preventing them from reaching the input layer. Additionally, since the DAPM
pin configuration only maps the microphone, automatic DAPM routing will fail
to turn on the Headphone Jack widget upon headset insertion.

> +			dev_err(rtd->dev, "Mic Jack creation failed: %d\n", err);
> +			return err;
> +		}
> +
> +		wm8994_mic_detect(component, machine->mic_jack, 1);
> +	}
> +
> +	return 0;
> +}
> +
> +static int tegra_wm8994_remove(struct snd_soc_card *card)
> +{
> +	struct snd_soc_dai_link *link =3D &card->dai_link[0];
> +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_get_pcm_runtime(card, link);
> +	struct tegra_machine *machine =3D snd_soc_card_get_drvdata(rtd->card);
> +	struct snd_soc_dai *codec_dai =3D snd_soc_rtd_to_codec(rtd, 0);

[Severity: High]
Does this code trigger a NULL pointer dereference during module unload?

When the driver is unbound, devm_snd_soc_register_card() invokes
snd_soc_unregister_card(). This calls soc_cleanup_card_resources(), which
explicitly deletes and frees all PCM runtimes (rtd) from the rtd_list via
snd_soc_remove_pcm_runtime() before calling snd_soc_card_remove(card).

When snd_soc_card_remove() finally invokes this tegra_wm8994_remove() callb=
ack,
the call to snd_soc_get_pcm_runtime() will return NULL because the rtd_list
is empty. The code then unconditionally dereferences this NULL pointer here=
 in
rtd->card and the snd_soc_rtd_to_codec(rtd, 0) macro.

> +	struct snd_soc_component *component =3D codec_dai->component;
> +
> +	if (!machine->gpiod_mic_det && machine->asoc->add_mic_jack)
> +		wm8994_mic_detect(component, NULL, 1);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014120148.1261=
60-1-clamor95@gmail.com?part=3D2
