Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5543F36F43E
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 02:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780540029; cv=none; b=F8b7EN/6Z7j9L/KE8ViLCydc2CqtnfHpB2m+dSe2jF6yz3W6kQz6x+9C7uooAqC7yAqNiga8lOCTqRQfBJDAVWwA5o7GhF2/uwZQqJ0yb0m/DeDSULBvKaaDxvRg38zQJQxniszIeVyDtcHY8Hg28bdGk6trlFeAO4NyzV40pew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780540029; c=relaxed/simple;
	bh=XQ8HsYCFI4l6qDDYKQRDRpXfLiDxNRkZVAr8mIMHJf0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OCYenXy5DEHlyZZg62KwxSyjT4lWWjdDwzKaHuVQMAzoZ23jRszNLYKF1vU8MKu0ZNHKPaDjxYKvAmE18HaEebC7uOVUyDG3vMtG5MhM0kJaUIzROBCGSftMmOHyDRvhC4hZQqB4fgksA9eo0UX5GK9TTkgVdowdI2UVJKNMUlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M+h6k6B7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M+h6k6B7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8AD1F00893;
	Thu,  4 Jun 2026 02:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780540024;
	bh=CMwI9J9MuA83fPo3elyni1CiOr6saeW8qDAeQhy/Ayo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M+h6k6B7VDPsZSIAWLUsWgGvqj/DiaJ1eUHyqpHEkEqLscvOjEIs8IUIgG7CZCEpG
	 JpGQr9bUPipzaC0rhCNK88n59XLpQVlktcwy5VCmHdKXDBBCTl62O3CrtKMycjW4eM
	 r/gtP/25iSWrF/33u3FVjsgyULININCL+RUTW2b2ueJMOTAKBDBNFx6+s826s7cY62
	 SrO22jecIATPKFBnEa+SEmxsVa+zOf48QpFxOs1XtnYyK612Th0u04ihJSKMi6xvSk
	 4/h4fXIQVAoLEoyzDH/cU5KMQfFhqNb+l5Fvrd8YFMOaq6sb1ziob9zVQzN24EPmby
	 gp/koB4INZMiw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/7] ASoC: loongson: Add headphone jack detection and
 DAPM routing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <2736a44ee11bcc0bbf282c69e99cb05b12469207.1780538113.git.zhoubinbin@loongson.cn>
References: <2736a44ee11bcc0bbf282c69e99cb05b12469207.1780538113.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 02:27:04 +0000
Message-Id: <20260604022704.6E8AD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The headphone mute GPIO is incorrectly asserted when the headphone=
 widget powers on, muting the audio.
- [High] Double-free / reference count underflow of the headphone detection=
 GPIO descriptor on device unbind or probe failure.
- [Medium] The sound card probe fails completely if the optional headphone =
detection GPIO is omitted from the device tree.
--

commit 5cf0c58f5dc0c2adba751fce8cc39fa382767c93
Author: Binbin Zhou <zhoubinbin@loongson.cn>
Subject: ASoC: loongson: Add headphone jack detection and DAPM routing

This commit adds headphone jack detection and DAPM routing to the Loongson
audio machine driver. It enables proper switching between headphones and
speakers on the Loongson-2K0300 ATK-DL2K0300B board.

> diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loon=
gson_card.c
> index 9200e8476c1fa..ee0cf305187a7 100644
> --- a/sound/soc/loongson/loongson_card.c
> +++ b/sound/soc/loongson/loongson_card.c

[ ... ]

> +/* DAPM widget event: control headphone mute GPIO */
> +static int headphone_widget_event(struct snd_soc_dapm_widget *w,
> +				  struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_card *card =3D snd_soc_dapm_to_card(w->dapm);
> +	struct loongson_card_data *priv =3D snd_soc_card_get_drvdata(card);
> +
> +	gpiod_set_value_cansleep(priv->gpiod_hp_mute, SND_SOC_DAPM_EVENT_ON(eve=
nt));

[Severity: High]
Does this logic assert the mute signal exactly when the headphones should be
active?=20

The hp-mute GPIO is initialized with GPIOD_OUT_LOW (unmuted) during probe.
When the widget powers on, SND_SOC_DAPM_EVENT_ON evaluates to 1, asserting
the mute and resulting in no sound. When it powers off, it evaluates to 0,
unmuting.

Should this logic be inverted so the headphones remain muted while powered
off and unmuted when active?

> +
> +	return 0;
> +}

[ ... ]

> +static int loongson_asoc_machine_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_card *card =3D rtd->card;
> +	struct loongson_card_data *ls_priv =3D snd_soc_card_get_drvdata(card);
> +	int ret =3D 0;
> +
> +	if (!ls_priv->cfg->add_hp_jack)
> +		return 0;
> +
> +	ret =3D snd_soc_card_jack_new_pins(card, "Headphones Jack",
> +					 SND_JACK_HEADPHONE,
> +					 &loongson_asoc_hp_jack,
> +					 loongson_asoc_hp_jack_pins,
> +					 ARRAY_SIZE(loongson_asoc_hp_jack_pins));
> +	if (ret) {
> +		dev_err(rtd->dev, "Headphones Jack creation failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	loongson_asoc_hp_jack_gpio.desc =3D ls_priv->gpiod_hp_det;
> +
> +	ret =3D snd_soc_jack_add_gpios(&loongson_asoc_hp_jack, 1, &loongson_aso=
c_hp_jack_gpio);

[Severity: Medium]
Will this cause the sound card probe to fail completely if the optional
headphone detection GPIO is omitted from the device tree?

The loongson,hp-det GPIO is acquired using devm_gpiod_get_optional() during
loongson_asoc_card_probe(), which returns NULL if the property is absent.

If the descriptor is NULL, passing it to snd_soc_jack_add_gpios() without
setting gpiod_dev causes it to return -EINVAL. This propagates back through
the DAI link initialization, breaking the device initialization.

[Severity: High]
Will this result in a double-free of the headphone detection GPIO descriptor
on device unbind or probe failure?

The gpiod_hp_det descriptor is acquired with devm_gpiod_get_optional(), whi=
ch
registers a devres action to call gpiod_put() when the device is unbound.

Passing this explicitly acquired descriptor directly to
snd_soc_jack_add_gpios() transfers ownership, as it registers its own devres
action that also unconditionally calls gpiod_put().=20

On probe failure or unbind, devres will execute both cleanup actions, causi=
ng
a reference count underflow and leading to a use-after-free of the gpio_dev=
ice.

> +	if (ret)
> +		dev_err(rtd->dev, "Headphone GPIO not added: %d\n", ret);
> +
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780538113.gi=
t.zhoubinbin@loongson.cn?part=3D7
