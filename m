Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792517363;
	b=lLqUvlz/ZurM0N7ofIdabav5cZyR+FpZ/GjulAm8iX4MLu9987x8TOv8+sUP64+r4stl
	 xnacXIYQXV/nDZu/DCLrfEdDRw/jsZAzDnUa02ks+Zq9FXGGgW/kPkWVw62649O1AM2QL
	 i+5ukHrqr1zHfjdt+KStV630qmvnifgnaYI4dfQZU8DpDVc1AkI+TStbofFJQMF/YvbhR
	 sMZSC3k+IXHYrF7UucWkKyQ6yC9svDx5r0ntpQXqfO8habbtVDzguGQvzEZejz7eMDkDE
	 0czhBIKZfPImfLaoOsqIvI0W000thX+vxpMmqPPpz4A+1FVaglH8HXjunldOuU2iKow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517363;
	h=Received:Message-ID:From:Subject:Reply-To:To:Cc:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gHo//PU+15Zb4tLXTqwrJl3+QDkpBTYC8X5b7pdf3AY=;
	b=txRFfVqCnppyOr8Xo2/MQYMQdgMEdvI4Xi633Zsha/AAMWgom4KMCLGI/lgR6sRn/ngW
	 OYhIq05zHFea907Ri5xzQyuKCgZ0BNZTyI9F4RdbTt2z9F2KgHG2KNYR7aAsYt1T0G0hr
	 HRa4m10p1dmDUuy+HiyjvkZsxPnc4SlHTAkTPxOEr+tb3KEMm38t5rZn48kx6LqGFs/rZ
	 5gto7o6hEy9QZZr7iDDOMABwyH//WH9NWOA2MW5PpDfx4gYT+rpIIu69DGuE89sdAkYEP
	 FPJceFEwLOLg2qkrVOvurSDiEQqe3jImRyO2EKn4SL3QGk3hBhD5S8AVxdn134F+q9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF65606A31F
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 17:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C92281F000C9;
	Tue, 20 Oct 2026 17:29:22 +0000 (UTC)
Message-ID: <sashiko-outbox-179421@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] ASoC: codecs: wcd937x: add USB Type-C analog
 audio mux support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Val Packett" <val@packett.cool>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261020170341.1641325-3-val@packett.cool>
References: <20261020170341.1641325-1-val@packett.cool>
 <20261020170341.1641325-3-val@packett.cool>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 17:29:22 +0000
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
- [High] ASoC: codecs: wcd937x: race and UAF on wcd_mbhc in wcd937x_typec_m=
ux_set()
- [High] ASoC: codecs: wcd937x: probe deferral deadlock in wcd937x_bind()
--

commit 11dd57a3e1840028ab1f5c083f76fea5c939b494
Author: Val Packett <val@packett.cool>

ASoC: codecs: wcd937x: add USB Type-C analog audio mux support

This commit adds USB Type-C analog audio mux and orientation switch support=
 to
the wcd937x codec driver, registering it in the Type-C graph when present in
device tree and forwarding plug/unplug and GND-MIC swap events between MBHC
and the external mux.

> diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
> index 7ffbb445f8ac4..9d5d1df41c365 100644
> --- a/sound/soc/codecs/wcd937x.c
> +++ b/sound/soc/codecs/wcd937x.c

[ ... ]

> @@ -2036,8 +2050,11 @@ static int wcd937x_mbhc_init(struct snd_soc_compon=
ent *component)
>  static void wcd937x_mbhc_deinit(struct snd_soc_component *component)
>  {
>  	struct wcd937x_priv *wcd937x =3D snd_soc_component_get_drvdata(componen=
t);
> +	struct wcd_mbhc *mbhc =3D wcd937x->wcd_mbhc;
> =20
> -	wcd_mbhc_deinit(wcd937x->wcd_mbhc);
> +	/* May be accessed by platform dev typec callbacks, clear it first */
> +	wcd937x->wcd_mbhc =3D NULL;
> +	wcd_mbhc_deinit(mbhc);
>  }
> =20
>  /* END MBHC */
> @@ -2634,6 +2651,40 @@ static const struct snd_soc_component_driver soc_c=
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
use-after-free on struct wcd_mbhc?

The Type-C mux is registered in wcd937x_probe() for the lifetime of the
platform device, which outlives the ASoC component lifecycle
(wcd937x_soc_codec_probe() and wcd937x_soc_codec_remove()).

If a USB-C mode change invokes typec_mux_set() -> wcd937x_typec_mux_set() on
one CPU while ASoC component removal runs wcd937x_soc_codec_remove() ->
wcd937x_mbhc_deinit() on another CPU, there is no lock synchronizing access
to wcd937x->wcd_mbhc:

CPU0                                     CPU1
wcd937x_typec_mux_set()                  wcd937x_mbhc_deinit()
  if (!wcd937x->wcd_mbhc)
  ...
  wcd_mbhc_typec_report_plug(mbhc)
                                           wcd937x->wcd_mbhc =3D NULL;
                                           wcd_mbhc_deinit(mbhc)
                                             cancel_work_sync(&mbhc->mbhc_p=
lug_detect_work);
                                             kfree(mbhc);
    mbhc->mbhc_cb->clk_setup(...)
    wcd_mbhc_write_field(...)
    schedule_work(&mbhc->mbhc_plug_detect_work);

This dereferences freed memory and schedules mbhc_plug_detect_work after
cancel_work_sync() and kfree(mbhc) have completed.

Additionally, because wcd937x_typec_mux_set() reads wcd937x->wcd_mbhc twice
without locking, if wcd937x->wcd_mbhc becomes NULL between the initial check
and the call to wcd_mbhc_typec_report_plug(), wcd937x->typec_mode is updated
to state->mode even though wcd_mbhc_typec_report_plug(NULL) returns -EINVAL.

[ ... ]

> @@ -2761,10 +2819,24 @@ static int wcd937x_bind(struct device *dev)
>  	/* Give the SDW subdevices some more time to settle */
>  	usleep_range(5000, 5010);
> =20
> +#if IS_ENABLED(CONFIG_TYPEC)
> +	/*
> +	 * Get the USB Type-C switch to send GND/MIC swap events.
> +	 * typec_switch is fetched now to avoid a probe deadlock since
> +	 * the switch depends on the typec_mux register in wcd937x_probe()
> +	 */
> +	if (wcd937x->typec_analog_mux) {
> +		wcd937x->typec_switch =3D fwnode_typec_switch_get(dev->fwnode);
> +		if (IS_ERR(wcd937x->typec_switch))
> +			return dev_err_probe(dev, PTR_ERR(wcd937x->typec_switch),
> +					     "failed to acquire orientation-switch\n");
> +	}
> +#endif /* CONFIG_TYPEC */

[Severity: High]
Does fetching typec_switch in wcd937x_bind() still result in a probe deferr=
al
deadlock when the SoundWire slave devices have already probed?

The RX and TX SoundWire slave devices are registered from Device Tree by
sdw_bus_master_add() -> sdw_of_find_slaves(), and wcd9370_probe() in
sound/soc/codecs/wcd937x-sdw.c calls component_add() without depending on
wcd937x_probe(). When built as modules, snd-soc-wcd937x.ko also depends on
symbols exported by snd-soc-wcd937x-sdw.ko, so wcd9370_probe() runs before
wcd937x_probe() (and when built-in, wcd9370_probe() can still finish first =
if
wcd937x_probe() defers once on regulators or GPIOs).

When both slave components are already added, the call chain in
wcd937x_probe() runs wcd937x_bind() synchronously:

wcd937x_probe()
  wcd937x_add_typec()
    typec_mux_register()
    typec_switch_register()
  component_master_add_with_match()
    try_to_bring_up_aggregate_device()
      wcd937x_bind()
        fwnode_typec_switch_get() -> returns -EPROBE_DEFER

Because wcd937x_probe() has not returned yet, really_probe() has not called
driver_bound() -> driver_deferred_probe_trigger(), so the external Type-C
switch driver waiting on wcd937x's typec_mux has not re-probed. The
-EPROBE_DEFER from fwnode_typec_switch_get() propagates out of
component_master_add_with_match() and fails wcd937x_probe(), triggering devm
cleanup to unregister wcd937x's typec_mux and typec_switch and recreating t=
he
mutual probe deferral deadlock.

[ ... ]

> @@ -2951,6 +3091,22 @@ static int wcd937x_probe(struct platform_device *p=
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

[ ... ]

>  	ret =3D component_master_add_with_match(dev, &wcd937x_comp_ops, match);
>  	if (ret)
>  		return ret;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020170341.1641=
325-1-val@packett.cool?part=3D2
