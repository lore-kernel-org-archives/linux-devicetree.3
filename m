Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792487942;
	b=W471dFah3jPyqhTbgM/BICUEzxlfIhQ+j+Zf4gthf33WOeBKJykw+FoET+hpnxlgo11w
	 Pbnk/AsdfnZpmbTmy1SMeNe0VTPIv8qyPC25L/HEJbegcoInwDozJYvB953R7E+X0+Tnn
	 iTFd9gDIAX7dhWfL3GeZ8Ymww5XG1babysrNAi3OoT7Ck8MsrQhYFdAkcCTXQnqZTbKFw
	 XRTleHeD7k9RXgX4GxBnwGpJhYwMRkbewxJdlG4iR65PBPpxZzcuMw41gWL5id1ZVqHaY
	 gHabe5q/O0S7PMHKBf2X8XY99hrekRBJE+QrOB3L3KeT/Q672M2Atfg2QpqRU0emozw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487942;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Inzihdddve+XCA6nLTcqOVAHoVMbDzXEZVV3NdE6dms=;
	b=yfgGZMyEEWPJxkrqyOvJX4focKpEAYQXcrY2qqVlDDS4Pzc6c9p2KoB4Msps+NUxzV3N
	 wp/wmuh82pYH4Yw1EzV7f31U+QdhF+y+jpYky6c9z7pyi6PSrSwrBZH2n8WGkntYEK42u
	 VG5X5nO2WUME9/81Wtg1WpmBdo5u6DK0ZEOICsb2pZH0eZF1rgZzX6UAWrOzkfxlMgrUq
	 aqNDBQaqgVuga+XmO6axKnAdcpKp77QQU3NdtlzOOql+TDIfxnd3L2zNielVoEiuUQdPF
	 GbCZ3oxh4XZhYL+TiUV+sBVDnwwrqdYsGwgNRLHWZXVnB2kpzJMl8DKl2MaLM3IYAbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WgBYnH75;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E4F606A319
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 09:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WgBYnH75
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 238AB1F000C4;
	Tue, 20 Oct 2026 09:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792487941;
	bh=Inzihdddve+XCA6nLTcqOVAHoVMbDzXEZVV3NdE6dms=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WgBYnH7594MTLYwtcyVc7sJYN+8UkvUnYjsBi+LqYfzG/I8p9KMKJRzdrlPi0H3PY
	 p+MXsQO6jKWMrU3PWKUKkGtjayj9qKyzienLhIEsFYo051LvjM2qXQU21FSCcdNIVJ
	 8x+2zJ9fDQIu7L2H4P4O+8CAhoiw9tV2Z6vCIWynXXLSfYUwihQzTiXZNNebTGk6Q7
	 2HHiBkfucXOHKUaah6euPkzWXUTbRmcpg1hNdMebjuQYbI9zEtqxYjhpLaqkmQHamt
	 htCqYppAICahD3F0PuPdzbDal9N9gQlsaonj5VyDUjqV4GAJrvyOr8mJ6NZ0u1VFUZ
	 6BenDBhx7Q7dQ==
Message-ID: <sashiko-outbox-178714@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] ASoC: codecs: wcd939x: fix ref leak and NULL
 deref with USB-C audio
Reply-To: sashiko-reviews@lists.linux.dev
To: "Val Packett" <val@packett.cool>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261020082631.1509275-5-val@packett.cool>
References: <20261020082631.1509275-1-val@packett.cool>
 <20261020082631.1509275-5-val@packett.cool>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 09:19:00 +0000
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
- [High] ASoC: wcd939x: uninitialized __free() pointer in wcd939x_populate_=
dt_data()
- [High] ASoC: wcd939x: use-after-free race in wcd939x_mbhc_deinit() with t=
ypec mux
--

commit 263e4868f28e72190c4609440782fec0a736dcae
Author: Val Packett <val@packett.cool>

ASoC: codecs: wcd939x: fix ref leak and NULL deref with USB-C audio

This commit addresses three issues with USB-C audio support in wcd939x:
preventing wcd939x->wcd_mbhc from holding an error pointer or stale pointer
for Type-C callbacks, releasing wcd939x->typec_switch on unbind, and
adding a __free(device_node) cleanup annotation for the node returned by
of_graph_get_remote_node().

> diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
> index 2d463f062e6d7..17503e4785e2c 100644
> --- a/sound/soc/codecs/wcd939x.c
> +++ b/sound/soc/codecs/wcd939x.c
[ ... ]
> @@ -2503,6 +2507,8 @@ static void wcd939x_mbhc_deinit(struct snd_soc_comp=
onent *component)
>  	struct wcd939x_priv *wcd939x =3D snd_soc_component_get_drvdata(componen=
t);
> =20
>  	wcd_mbhc_deinit(wcd939x->wcd_mbhc);
> +	/* May be accessed by platform dev typec callbacks, clear */
> +	wcd939x->wcd_mbhc =3D NULL;
>  }

[Severity: High]
Can wcd939x_typec_mux_set() race with wcd939x_mbhc_deinit() and access a
freed wcd939x->wcd_mbhc?

In wcd939x_mbhc_deinit(), wcd939x->wcd_mbhc is only set to NULL after
wcd_mbhc_deinit() has already returned, and without synchronization against
wcd939x_typec_mux_set(). Inside wcd_mbhc_deinit(), execution sleeps across
free_irq() and cancel_work_sync(&mbhc->mbhc_plug_detect_work) before calling
kfree(mbhc):

sound/soc/codecs/wcd-mbhc-v2.c:wcd_mbhc_deinit() {
	...
	mutex_lock(&mbhc->lock);
	wcd_cancel_hs_detect_plug(mbhc,	&mbhc->correct_plug_swch);
	cancel_work_sync(&mbhc->mbhc_plug_detect_work);
	mutex_unlock(&mbhc->lock);

	kfree(mbhc);
}

During that window, wcd939x_typec_mux_set() can still see a non-NULL
wcd939x->wcd_mbhc:

sound/soc/codecs/wcd939x.c:wcd939x_typec_mux_set() {
	...
	if (!wcd939x->wcd_mbhc)
		return -EINVAL;

	if (wcd939x->typec_mode !=3D state->mode) {
		wcd939x->typec_mode =3D state->mode;

		if (wcd939x->typec_mode =3D=3D TYPEC_MODE_AUDIO)
			return wcd_mbhc_typec_report_plug(wcd939x->wcd_mbhc);
		else if (previous_mode =3D=3D TYPEC_MODE_AUDIO)
			return wcd_mbhc_typec_report_unplug(wcd939x->wcd_mbhc);
	}
	...
}

Wouldn't a concurrent wcd939x_typec_mux_set() call dereference freed mbhc
memory or reschedule mbhc_plug_detect_work after cancel_work_sync() has
completed?

> =20
>  /* END MBHC */
> @@ -3175,7 +3181,7 @@ static int wcd939x_populate_dt_data(struct wcd939x_=
priv *wcd939x, struct device
>  {
>  	struct wcd_mbhc_config *cfg =3D &wcd939x->mbhc_cfg;
>  #if IS_ENABLED(CONFIG_TYPEC)
> -	struct device_node *np;
> +	struct device_node *np __free(device_node);
>  #endif /* CONFIG_TYPEC */
>  	int ret;

[Severity: High]
Does wcd939x_populate_dt_data() pass an uninitialized np pointer to
of_node_put() on early return?

Here np is declared with __free(device_node) without being initialized to
NULL, while three early return paths precede its assignment at
of_graph_get_remote_node():

sound/soc/codecs/wcd939x.c:wcd939x_populate_dt_data() {
	...
	wcd939x->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
	if (IS_ERR(wcd939x->reset_gpio))
		return dev_err_probe(dev, PTR_ERR(wcd939x->reset_gpio),
				     "Failed to get reset gpio\n");

	ret =3D devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(wcd939x_supplies),
					     wcd939x_supplies);
	if (ret)
		return dev_err_probe(dev, ret, "Failed to get and enable supplies\n");

	ret =3D wcd_dt_parse_micbias_info(&wcd939x->common);
	if (ret)
		return dev_err_probe(dev, ret, "Failed to get micbias\n");
	...
	np =3D of_graph_get_remote_node(dev->of_node, 0, 0);
}

If any of those three calls fails or defers probe when CONFIG_TYPEC is
enabled, the cleanup handler will run on an uninitialized np pointer. Should
np be initialized to NULL (or declared at the point of assignment)?

[ ... ]

>dari

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020082631.1509=
275-1-val@packett.cool?part=3D4
