Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0422E1F936
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 23:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792366025; cv=none; b=PRqdzMOkljod5DMKwb/hfyvB1GIOwbDoDZbY5yYeeOeYUPlta/rH/hu4jOTSFyF0pP2/NDy05PAsCqoYoYMsmKc9xj2E9T4KqirGuTYcgkKCBUVGxE7p/jX2ra6uTycvgFACmiCilwEX3AqRhsQRavsX7p25W+99lWTdid7xiQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792366025; c=relaxed/simple;
	bh=sT9RPraUv8T7Wvpu2lLsY9dWxbvv2HWuR0HbQjniQqI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=cletoqDCpUEaCAFOSqpeHLW+YkUHG3GZCYPB6i6AZxX6oXnkoVVnHIQ9Plj2nvl3vlOSCnoGHUCIss/PZ+JMKVzzRrV0RXmqZ/rDszol9uH+qD1JPd0nRYJn6jXe66vNj4opzoQew7brFKooKbgVUdumpyWvlqEnbXP9NtXcQhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OdI2FloK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OdI2FloK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496031F000C4;
	Sun, 18 Oct 2026 23:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792366023;
	bh=HVm47d7J6T6+JvbGROGkDSLvmrVjR0vndos2ZY5p3+4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OdI2FloKJxd0a6l2AJrsNcikNhAFFugiViZd3Mdtn2jgsypYFK1/eP+irTnbFTIHH
	 W0sSBbcRgJSycFYjlpCbsIEDI1w9qEZP3Z4IARcBKsApzQbZr1IHk1tc9cKyAks+Uj
	 v7luO2oAqIn22M36bodhwuCp4O4m3xJal9jrzutNGKBluYgkutmfTIvhWLeZvVvul+
	 zmr5/e6mxdOXtPRMbPjzR8QJ5r2rlEn1wCw39iscooqdhxLZ/6ElnXyEVB6BIC49ij
	 07k4AjGym7todSQcB8lwe/dWwihBjykPpjUCWe1RYca4UAK14/D+aNxZH3lGLWjOq9
	 B5scEdNF+vATA==
Message-ID: <sashiko-outbox-176451@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ASoC: codecs: wcd937x: add USB Type-C analog audio
 mux support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Val Packett" <val@packett.cool>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261018231244.1266926-3-val@packett.cool>
References: <20261018231244.1266926-1-val@packett.cool>
 <20261018231244.1266926-3-val@packett.cool>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 23:27:02 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] ASoC: wcd937x: UAF and invalid dereference in wcd937x_typec_mux_se=
t()
- [Medium] ASoC: wcd937x: device_node reference leak in wcd937x_probe()
- [Medium] ASoC: wcd937x: typec_switch leak in wcd937x_unbind()
- [Low] ASoC: wcd937x: link failure when SND_SOC_WCD937X=3Dy and TYPEC=3Dm
--

commit 67788c3177c93896a3809eff47952d70eb25c1a1
Author: Val Packett <val@packett.cool>

ASoC: codecs: wcd937x: add USB Type-C analog audio mux support

This commit adds USB Type-C analog audio mux and orientation switch support
to the wcd937x codec driver, handling hotplug notifications and reporting
detected GND-MIC pin swaps back to the external mux.

> diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
> index 7ffbb445f8ac4..770f5925e89f3 100644
> --- a/sound/soc/codecs/wcd937x.c
> +++ b/sound/soc/codecs/wcd937x.c

[ ... ]

> @@ -2634,6 +2644,40 @@ static const struct snd_soc_component_driver soc_c=
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
Can wcd937x_typec_mux_set() dereference a freed, error-valued, or partially
initialized wcd937x->wcd_mbhc pointer?

wcd937x_probe() registers wcd937x_typec_mux_set() via typec_mux_register()
and manages its lifetime with devm_add_action_or_reset() on the platform
device, so the callback remains active for the entire platform device
lifetime. However, wcd937x_typec_mux_set() only checks !wcd937x->wcd_mbhc
before calling wcd_mbhc_typec_report_plug() or
wcd_mbhc_typec_report_unplug(), both of which immediately dereference
mbhc->cfg->typec_analog_mux:

sound/soc/codecs/wcd-mbhc-v2.c:wcd_mbhc_typec_report_plug() {
	if (!mbhc || !mbhc->cfg->typec_analog_mux)
		return -EINVAL;

There appear to be three ways this check can be bypassed while wcd_mbhc is
not ready for use:

1. During sound card binding in snd_soc_bind_card(),
soc_probe_link_components() calls wcd937x_soc_codec_probe() ->
wcd937x_mbhc_init() -> wcd_mbhc_init(), which allocates wcd937x->wcd_mbhc
with mbhc->cfg left as NULL until wcd937x_codec_set_jack() later calls
wcd_mbhc_start(). If a Type-C audio mode event arrives before
wcd_mbhc_start() runs (or if set_jack is never called), mbhc->cfg is NULL.

2. When wcd937x_soc_codec_remove() runs (for example, if a subsequent DAI
link in snd_soc_bind_card() returns -EPROBE_DEFER and triggers
soc_cleanup_card_resources(), or when the sound card or component master is
unbound), wcd937x_mbhc_deinit() calls wcd_mbhc_deinit(wcd937x->wcd_mbhc),
which kfrees wcd937x->wcd_mbhc without clearing wcd937x->wcd_mbhc to NULL:

sound/soc/codecs/wcd937x.c:wcd937x_mbhc_deinit() {
	struct wcd937x_priv *wcd937x =3D snd_soc_component_get_drvdata(component);

	wcd_mbhc_deinit(wcd937x->wcd_mbhc);
}

3. If wcd_mbhc_init() fails in wcd937x_mbhc_init(), wcd937x->wcd_mbhc holds
an ERR_PTR value:

sound/soc/codecs/wcd937x.c:wcd937x_mbhc_init() {
	wcd937x->wcd_mbhc =3D wcd_mbhc_init(component, &mbhc_cb, intr_ids, wcd_mbh=
c_fields, true);
	if (IS_ERR(wcd937x->wcd_mbhc))
		return PTR_ERR(wcd937x->wcd_mbhc);

[ ... ]

> @@ -2852,6 +2917,12 @@ static int wcd937x_bind(struct device *dev)
>  	put_device(wcd937x->rxdev);
>  err_component_unbind:
>  	component_unbind_all(dev, wcd937x);
> +err_put_typec_switch:
> +#if IS_ENABLED(CONFIG_TYPEC)
> +	if (wcd937x->typec_analog_mux)
> +		typec_switch_put(wcd937x->typec_switch);
> +#endif /* CONFIG_TYPEC */
> +
>  	return ret;
>  }
> =20
> @@ -2874,6 +2945,61 @@ static const struct component_master_ops wcd937x_c=
omp_ops =3D {
>  	.unbind =3D wcd937x_unbind,
>  };

[Severity: Medium]
Does wcd937x_unbind() leak wcd937x->typec_switch?

In wcd937x_bind(), wcd937x->typec_switch is acquired via
fwnode_typec_switch_get(dev->fwnode) when wcd937x->typec_analog_mux is true.
fwnode_typec_switch_get() is not devm-managed; it allocates a struct
typec_switch and takes device and module references that must be released
with typec_switch_put().

While the error path in wcd937x_bind() calls
typec_switch_put(wcd937x->typec_switch), wcd937x_unbind() does not:

sound/soc/codecs/wcd937x.c:wcd937x_unbind() {
	struct wcd937x_priv *wcd937x =3D dev_get_drvdata(dev);

	snd_soc_unregister_component(dev);
	device_link_remove(dev, wcd937x->txdev);
	device_link_remove(dev, wcd937x->rxdev);
	device_link_remove(wcd937x->rxdev, wcd937x->txdev);
	component_unbind_all(dev, wcd937x);
	mutex_destroy(&wcd937x->micb_lock);
	put_device(wcd937x->txdev);
	put_device(wcd937x->rxdev);
}

> +#if IS_ENABLED(CONFIG_TYPEC)
> +static void wcd937x_typec_mux_unregister(void *data)
> +{
> +	struct typec_mux_dev *typec_mux =3D data;
> +
> +	typec_mux_unregister(typec_mux);
> +}

[Severity: Low]
Can this cause a link failure when CONFIG_SND_SOC_WCD937X_SDW=3Dy (which
selects CONFIG_SND_SOC_WCD937X=3Dy) and CONFIG_TYPEC=3Dm?

With IS_ENABLED(CONFIG_TYPEC), built-in wcd937x.o will reference symbols
exported by typec.ko (such as typec_mux_register(), typec_switch_register(),
and fwnode_typec_switch_get()), but neither SND_SOC_WCD937X nor
SND_SOC_WCD937X_SDW in sound/soc/codecs/Kconfig has a "depends on TYPEC ||
!TYPEC" dependency like SND_SOC_WCD939X and SND_SOC_WCD939X_SDW do.

[ ... ]

> @@ -2951,6 +3080,22 @@ static int wcd937x_probe(struct platform_device *p=
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
> +
>  	ret =3D wcd937x_add_slave_components(wcd937x, dev, &match);
>  	if (ret)
>  		return ret;

[Severity: Medium]
Does wcd937x_probe() leak the device_node reference returned by
of_graph_get_remote_node()?

of_graph_get_remote_node() returns a struct device_node pointer with its
reference count incremented, but of_node_put(np) is not called on either the
normal path or the early return when wcd937x_add_typec() fails.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018231244.1266=
926-1-val@packett.cool?part=3D2
