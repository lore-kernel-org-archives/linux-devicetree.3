Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792487183;
	b=wwq4EpB2Zlw7h1v5RFK4xEag2NxZQzh0uE3uc7tK+yWMILZC4bgqTTa8x3bEEtJygPjY
	 liyTgOQo9T/6+PHddCnpXF+iYbPLQmT3QWdycU2XejW1F+IwcRUPsV+Mc+blpkLvK59VX
	 mkDsXiO0cGVuXjFLYBMyHDCL/pG36KQGUa8aZpN1PJkYLvDnBUHPufN8quspIyXjigNtF
	 zsTlOks1h2gXJ4805kWtOa9kT7uT05HXtU7KlR4JTfdU6cixftsX531cDXg4zwM09A7Ia
	 tlhkZdU1lFCern2E5lqUKR+cwQ1hLICo/lgrlyJ9kvm48MPtMUG6jqFhxV2iw73oUZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487183;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pn49u1kwBs9dFgjt7RSgSDIwcLDGVuQNqoxWaFc4fQ4=;
	b=kzUIQi8KX5Rpkx1tH+6JoBz1yW5GkgDW9RTGqiBrwgCRmvrWL/58eiwkxm/lPiRoS3xN
	 E0MKpxhiEKk/22CzNNH2ZZ9Okwk26jn//LUhVlTnj/AIheP1fRCuDdt/uAOzzIF7oUZhG
	 PqjuyPbcLpOYH6XdZtga+cLOidxPE3ltKhnDK5Wl+Qzz+GxdYPr0FqGFPzmnEckKnju04
	 LA/zpf9F1b7hHdAATKq/tpZvFPCZrLmXSeH1YPnox8ZtoAPgMyN6TUxfgaoJ+HdEYGyEx
	 s6+crh1osgjkJvRLd35HXhaulUrazNOg9h4soKIrKMQeCrGwh7XuVByYKziwgC3pkWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BkK3VV5O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6C1606A322
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 09:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BkK3VV5O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F97C1F000C4;
	Tue, 20 Oct 2026 09:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792487182;
	bh=pn49u1kwBs9dFgjt7RSgSDIwcLDGVuQNqoxWaFc4fQ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BkK3VV5Oz0QqxTmIf24mGvXoigwwUL+otvyMKbZjJWV6+jdvvLNpnDT5VLtmAYhUa
	 baswWCw3rlG4dLecHaTBOZg9/8oHcC+urL6KjWalFprci8E75yv6a2qF5WZeKRVyMu
	 QPgycZw5v7RNdfHtRJvurKq5pCXGDQBehvywkJd2GPg9/OjR4SK1noM4sAqycGilxS
	 sOzPlmeW8pgZuHHDR8xe6JtORqd0Xdw5hkqhriR/52BEDhtiZmhXbSurpGg1Ex4a4G
	 iTlgWAHP5FbSOdm8Wsx0ZwaRIj5E27Ajl3aif1eA9WFi0dNHNh9tBnC6JNPi+U047R
	 5DHOnbgSwnbYw==
Message-ID: <sashiko-outbox-178688@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] ASoC: codecs: wcd937x: add USB Type-C analog
 audio mux support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Val Packett" <val@packett.cool>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261020082631.1509275-3-val@packett.cool>
References: <20261020082631.1509275-1-val@packett.cool>
 <20261020082631.1509275-3-val@packett.cool>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 09:06:21 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] ASoC: wcd937x: uninitialized __free(device_node) pointer in wcd937=
x_probe()
- [High] ASoC: codecs: wcd937x: use-after-free race in wcd937x_mbhc_deinit()
--

commit 4c12f167e90fb501eb42394e2202994cfc931062
Author: Val Packett <val@packett.cool>

ASoC: codecs: wcd937x: add USB Type-C analog audio mux support

This commit adds USB Type-C analog audio mux and orientation switch
support to the WCD937x codec driver, handling hotplug notifications via
MBHC and reporting GND-MIC pin swap orientation back to the external mux.

> diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
> index 7ffbb445f8ac4..48f8852d34513 100644
> --- a/sound/soc/codecs/wcd937x.c
> +++ b/sound/soc/codecs/wcd937x.c

[ ... ]

> @@ -2038,6 +2052,8 @@ static void wcd937x_mbhc_deinit(struct snd_soc_comp=
onent *component)
>  	struct wcd937x_priv *wcd937x =3D snd_soc_component_get_drvdata(componen=
t);
> =20
>  	wcd_mbhc_deinit(wcd937x->wcd_mbhc);
> +	/* May be accessed by platform dev typec callbacks, clear */
> +	wcd937x->wcd_mbhc =3D NULL;
>  }
> =20
>  /* END MBHC */
> @@ -2634,6 +2650,40 @@ static const struct snd_soc_component_driver soc_c=
odec_dev_wcd937x =3D {
>  	.endianness =3D 1,
>  };
> =20
> +#if IS_ENABLED(CONFIG_TYPEC)
> +/* Get USB-C plug orientation to provide swap event for MBHC */
> +static int wcd937x_typec_switch_set(struct typec_switch_dev *sw,
> +				    enum typec_orientation orientation)
> +{
> +	struct wcd937x_priv *wcd937x =3D typec_switch_get_drvdata(sw);
> +
> +	wcd937x->typec_orientation =3D orientation;
> +
> +	return 0;
> +}
> +
> +static int wcd937x_typec_mux_set(struct typec_mux_dev *mux,
> +				 struct typec_mux_state *state)
> +{
> +	struct wcd937x_priv *wcd937x =3D typec_mux_get_drvdata(mux);
> +	unsigned int previous_mode =3D wcd937x->typec_mode;
> +
> +	if (!wcd937x->wcd_mbhc)
> +		return -EINVAL;
> +
> +	if (wcd937x->typec_mode !=3D state->mode) {
> +		wcd937x->typec_mode =3D state->mode;
> +
> +		if (wcd937x->typec_mode =3D=3D TYPEC_MODE_AUDIO)
> +			return wcd_mbhc_typec_report_plug(wcd937x->wcd_mbhc);
> +		else if (previous_mode =3D=3D TYPEC_MODE_AUDIO)
> +			return wcd_mbhc_typec_report_unplug(wcd937x->wcd_mbhc);
> +	}
> +
> +	return 0;
> +}
> +#endif /* CONFIG_TYPEC */

[Severity: High]
Can wcd937x_typec_mux_set() race with wcd937x_mbhc_deinit() and cause a
use-after-free on wcd937x->wcd_mbhc?

The Type-C mux is registered in wcd937x_probe() via devres, so it remains
active during component teardown:

wcd937x_unbind()
  snd_soc_unregister_component()
    wcd937x_soc_codec_remove()
      wcd937x_mbhc_deinit()
        wcd_mbhc_deinit(wcd937x->wcd_mbhc)

Inside wcd_mbhc_deinit(), the driver frees IRQs, cancels
mbhc->mbhc_plug_detect_work, and calls kfree(mbhc), all before
wcd937x_mbhc_deinit() sets wcd937x->wcd_mbhc =3D NULL:

sound/soc/codecs/wcd-mbhc-v2.c:wcd_mbhc_deinit() {
	...
	mutex_lock(&mbhc->lock);
	wcd_cancel_hs_detect_plug(mbhc, &mbhc->correct_plug_swch);
	cancel_work_sync(&mbhc->mbhc_plug_detect_work);
	mutex_unlock(&mbhc->lock);

	kfree(mbhc);
}

Because there is no synchronization between wcd937x_typec_mux_set() and
wcd937x_mbhc_deinit(), a concurrent wcd937x_typec_mux_set() callback can
observe a non-NULL wcd937x->wcd_mbhc while or after wcd_mbhc_deinit() runs,
calling wcd_mbhc_typec_report_plug() or wcd_mbhc_typec_report_unplug() on
freed memory and scheduling mbhc->mbhc_plug_detect_work after
cancel_work_sync() and kfree(mbhc).

[ ... ]

> @@ -2907,6 +3043,9 @@ static int wcd937x_probe(struct platform_device *pd=
ev)
>  	struct device *dev =3D &pdev->dev;
>  	struct wcd937x_priv *wcd937x;
>  	struct wcd_mbhc_config *cfg;
> +#if IS_ENABLED(CONFIG_TYPEC)
> +	struct device_node *np __free(device_node);
> +#endif /* CONFIG_TYPEC */
>  	int ret;
> =20
>  	wcd937x =3D devm_kzalloc(dev, sizeof(*wcd937x), GFP_KERNEL);
> @@ -2951,6 +3090,22 @@ static int wcd937x_probe(struct platform_device *p=
dev)
> =20
>  	wcd_dt_parse_mbhc_data(dev, &wcd937x->mbhc_cfg);
> =20
> +#if IS_ENABLED(CONFIG_TYPEC)
> +	/*
> +	 * If the node has a port and a valid remote endpoint,
> +	 * consider HP lines as connected to a USB-C SBU mux
> +	 */
> +	np =3D of_graph_get_remote_node(dev->of_node, 0, 0);
> +	if (np) {
> +		wcd937x->typec_analog_mux =3D true;
> +		cfg->typec_analog_mux =3D true;
> +
> +		ret =3D wcd937x_add_typec(wcd937x, dev);
> +		if (ret)
> +			return ret;
> +	}
> +#endif /* CONFIG_TYPEC */

[Severity: High]
Does wcd937x_probe() pass an uninitialized np pointer to of_node_put() on
early return when CONFIG_TYPEC is enabled?

In wcd937x_probe(), np is declared with __free(device_node) without being
initialized to NULL, and is not assigned until of_graph_get_remote_node()
is called later in the function.

Between the declaration and that assignment, there are five early return
paths if devm_kzalloc(), devm_gpiod_get(), devm_gpiod_get_optional(),
devm_regulator_bulk_get_enable(), or wcd_dt_parse_micbias_info() fails:

sound/soc/codecs/wcd937x.c:wcd937x_probe() {
	...
	wcd937x =3D devm_kzalloc(dev, sizeof(*wcd937x), GFP_KERNEL);
	if (!wcd937x)
		return -ENOMEM;
	...
	wcd937x->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
	if (IS_ERR(wcd937x->reset_gpio))
		return dev_err_probe(dev, PTR_ERR(wcd937x->reset_gpio),
				     "failed to reset wcd gpio\n");
	...
}

If any of those early returns is taken, the __free(device_node) cleanup
handler runs on the uninitialized stack variable np. Should np be
initialized to NULL at declaration, or declared where
of_graph_get_remote_node() is called?

[ ... ]

> =20
>  	ret =3D wcd937x_add_slave_components(wcd937x, dev, &match);
>  	if (ret)
>  		return ret;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020082631.1509=
275-1-val@packett.cool?part=3D2
