Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF82B274FD1
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 02:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782441871; cv=none; b=gzfAg/U1UuLEhL5hk+O2CFLxEyrGvhMtsxPL6c2cPUyMQLD/KHbvuCcwNXmHPwUFZUgthl0N9BQmoDQe2w/NZAVy9uUcKI3uXz+TmK3YN5cD1tQh46EuyG6/+YJ/lxk3O07wpJfYkDhagrZw+DqsZuEdNK61nNihlhixnhHwuc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782441871; c=relaxed/simple;
	bh=YfOIcol+acxFW/8DHA+Ll6ntSLqpoyt2KhdyQ+gcg/k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uXD+64ymQrLhevMlqtdzSp1Adecw6//iHX1AaAJ7WjdwsK7GpUC5shMdFnQCVtV9yJQJR2vrmDBm3R87Z12Zj/jbvI5qgZm2v7BVjE/efvfqKjEbQEhNntUgaTu/ak80KN+ScuLGQpykDvldmfAXNhWIUd4CehTltQdNbTaHD/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CQ/bMqvL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQ/bMqvL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 476391F000E9;
	Fri, 26 Jun 2026 02:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782441870;
	bh=7vIKUjVeivQJrhvZX6xrs8HXycrKbXsORtjD4WQMHkY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CQ/bMqvLFIY1TOIQ8/UxdbjbQWWIeG823TuGfxyCHCky7YOkmu5uyzQpzm0pbiswi
	 SMNbTU/2bn7K02U/urj/FqrM529C+kB4R2jEATuZ7WbHy9GMqX0/Qff/fka5za7TRm
	 zF01vZqQj02E1kBNYYuZcf92r4WpF6x1nIdtL/sfDtXnhGXdO5A8NrQeMn/PeQ26Dk
	 m5iR4bKNiyqdEMbxh6C1xV2qE1gxNVv9FL7Qwq7N31a/7RBIoZWuhXbuZQ4zYPxppU
	 PYhIqSYdwNnBNzsOUVhNZVweS4GCpolGFDALnh2Zpmy/OvoGkr6H5adihO1CeGkPMF
	 We7TAVNB1SD4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 8/9] ASoC: loongson: Add headphone jack detection and
 DAPM routing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <c4b1503220b6fb433ecdcb881556827579041c3d.1782439646.git.zhoubinbin@loongson.cn>
References: <cover.1782439646.git.zhoubinbin@loongson.cn>
 <c4b1503220b6fb433ecdcb881556827579041c3d.1782439646.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 02:44:29 +0000
Message-Id: <20260626024430.476391F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Double-free of the hp-det GPIO descriptor on probe failure or driv=
er unbind.
- [High] Global state mutation via static global instance structures.
- [Low] Misleading DAPM event handler name and widget array typos due to co=
py-pasting.
--

commit 96bfdeee5a35a70f217e0f245943a82eb9a7ce3b
Author: Binbin Zhou <zhoubinbin@loongson.cn>

ASoC: loongson: Add headphone jack detection and DAPM routing

Extend the Loongson audio machine driver with jack detection, DAPM
widgets support, enabling proper switching between headphones and
speakers on the Loongson-2K0300 ATK-DL2K0300B board.

> diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loon=
gson_card.c
> index 0e63cbcad57ac..25cd12eab4b1f 100644
> --- a/sound/soc/loongson/loongson_card.c
> +++ b/sound/soc/loongson/loongson_card.c

[ ... ]

> +static int tegra_machine_event(struct snd_soc_dapm_widget *w,
> +			       struct snd_kcontrol *k, int event)
> +{

[Severity: Low]
This isn't a bug, but should this function be renamed to match the loongson
namespace instead of keeping the tegra_ prefix from a copied driver?

> +	struct snd_soc_card *card =3D snd_soc_dapm_to_card(w->dapm);
> +	struct loongson_card_data *priv =3D snd_soc_card_get_drvdata(card);
> +
> +	if (!snd_soc_dapm_widget_name_cmp(w, "Speaker"))
> +		gpiod_set_value_cansleep(priv->gpiod_spkr_en,
> +					 SND_SOC_DAPM_EVENT_ON(event));

[ ... ]

> +static const struct snd_soc_dapm_widget loongson_aosc_dapm_widgets[] =3D=
 {

[Severity: Low]
This isn't a bug, but there is a typo here (aosc instead of asoc).

> +	SND_SOC_DAPM_HP("Headphone", tegra_machine_event),
> +	SND_SOC_DAPM_SPK("Speaker", tegra_machine_event),
> +};
> +
> +/* Headphones Jack */
> +
> +static struct snd_soc_jack loongson_asoc_hp_jack;
> +
> +static struct snd_soc_jack_pin loongson_asoc_hp_jack_pins[] =3D {

[ ... ]

> +static struct snd_soc_jack_gpio loongson_asoc_hp_jack_gpio =3D {
> +	.name =3D "Headphones detection",
> +	.report =3D SND_JACK_HEADPHONE,
> +	.debounce_time =3D 150,
> +};

[Severity: High]
Will using a static global instance for snd_soc_jack_gpio cause cross-device
state corruption?

The ASoC core function snd_soc_jack_add_gpios() takes ownership of this
struct and initializes a delayed_work structure inside it. If multiple
instances of this driver probe concurrently or across unbind/rebind cycles,
multiple driver instances might mutate and re-initialize the same global
static struct and its workqueue list head.

Could this be moved to the instance-specific loongson_card_data instead?

> +
> +static int loongson_asoc_machine_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_card *card =3D rtd->card;
> +	struct loongson_card_data *ls_priv =3D snd_soc_card_get_drvdata(card);
> +	int ret =3D 0;

[ ... ]

> @@ -135,16 +229,35 @@ static int loongson_card_parse_acpi(struct loongson=
_card_data *data)
> =20
>  static int loongson_card_parse_of(struct loongson_card_data *data)
>  {
> -	struct device_node *cpu, *codec;
>  	struct snd_soc_card *card =3D &data->snd_card;
> +	struct device_node *cpu, *codec;
>  	struct device *dev =3D card->dev;
>  	int ret, i;
> =20
> +	data->gpiod_hp_det =3D devm_gpiod_get_optional(dev, "hp-det", GPIOD_IN);

[Severity: High]
Will this devm-managed GPIO descriptor trigger a double-free on driver unbi=
nd
or probe deferral?

When devm_gpiod_get_optional() requests the GPIO, it registers a devres
cleanup action. Later in loongson_asoc_machine_init():

loongson_asoc_machine_init() {
    ...
    loongson_asoc_hp_jack_gpio.desc =3D ls_priv->gpiod_hp_det;
    ret =3D snd_soc_jack_add_gpios(&loongson_asoc_hp_jack, 1,
                                 &loongson_asoc_hp_jack_gpio);
    ...
}

The snd_soc_jack_add_gpios() call registers a second overlapping devres act=
ion
that unconditionally frees the GPIO descriptor. When the device is unbound,
won't both cleanup actions attempt to free the same gpio_device, leading to
a Use-After-Free?

> +	if (IS_ERR(data->gpiod_hp_det))
> +		return PTR_ERR(data->gpiod_hp_det);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782439646.gi=
t.zhoubinbin@loongson.cn?part=3D8
