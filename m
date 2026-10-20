Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792516652;
	b=jhi5rtzwFycTlSl8pBdfKFJ2Mqm/xFnbZhP7Wlt+l7v4pSfBRjPDX0DGBWoobk1qRd6L
	 vbNOrDQt6brXv/sj6m4CBWP5URfkxgD69tuIJ7h4o/0AuG3qKyQ6yWMonWaU+GB1soNiI
	 PrrmNdLSTVqcvBrRFYEzNxV8Lq7TxAKmRR/zjiT09qb4x3VY0rGORu31EHogvN1WJ5atb
	 NtFU0Sn0/ufzA/Js0NLLsEBGW5to141KMrYe4kROXPSQrA39nJPKy+1sW7m0Xyz88Iemf
	 aKVS/WF42+b9H05pPOeOwTxseaqrWbi5fVBD9F3DUNhZVpXk8AN6Qp2X85jVIDAClfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516652;
	h=Received:Message-ID:From:Subject:Reply-To:To:Cc:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:Date;
	bh=by98zTiAvZEoXlHdm6R2mlblXROpxE328PMZRQj1lpg=;
	b=PgFiLEjIcHiit3Vt4OglZAquo6oHNiYQS8uCJXpJVoZyp3TNKC3AyBloGKPnD2qo1FbO
	 WpXX0HLputYhMy7Rm9wihb9SIO7h8LwK+vpsGzBWXv3/JCQjMf75utfrLc/QIaPGtoDQD
	 IdHd/+Qt6kWlhoc6PtWwzj/XuHEoz0INxKz/2mDQbqsRWLYLSBHplvvViaBu6b2JAD0Hn
	 dZhd7K1P/EP30aCdFT+XEtlj5u53xSaW0bwaahl+QsEU0XXFZXLzAdpJrS38je+Sb0epF
	 Cbf6B0bw/8bx4hPoOXf8S7KttPi1jSB3gQsaUvXe0OVNLuP0jTUGDRgnHVKo0L27Naw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16DC606A319
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 17:17:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F2F1F000C9;
	Tue, 20 Oct 2026 17:17:31 +0000 (UTC)
Message-ID: <sashiko-outbox-179410@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] ASoC: codecs: wcd-mbhc: guard against NULL cfg
 in typec_report_(un)plug
Reply-To: sashiko-reviews@lists.linux.dev
To: "Val Packett" <val@packett.cool>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261020170341.1641325-4-val@packett.cool>
References: <20261020170341.1641325-1-val@packett.cool>
 <20261020170341.1641325-4-val@packett.cool>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 17:17:01 +0000
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
- [High] ASoC: codecs: wcd-mbhc: UAF race between typec_report_(un)plug() a=
nd deinit()
- [Medium] ASoC: wcd-mbhc: race between wcd_mbhc_start() and typec_report_(=
un)plug()
--

commit 6517f3fdf1f47c12dda04120bfa0403f19390817
Author: Val Packett <val@packett.cool>

ASoC: codecs: wcd-mbhc: guard against NULL cfg in typec_report_(un)plug

This commit adds a NULL check for mbhc->cfg in
wcd_mbhc_typec_report_unplug() and wcd_mbhc_typec_report_plug() to guard
against Type-C callbacks firing before wcd_mbhc_start() is called.

> diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v=
2.c
> index 850be84d65ceb..fd40c1686d66a 100644
> --- a/sound/soc/codecs/wcd-mbhc-v2.c
> +++ b/sound/soc/codecs/wcd-mbhc-v2.c
> @@ -594,7 +594,7 @@ static irqreturn_t wcd_mbhc_mech_plug_detect_irq(int =
irq, void *data)
>  int wcd_mbhc_typec_report_unplug(struct wcd_mbhc *mbhc)
>  {
> =20
> -	if (!mbhc || !mbhc->cfg->typec_analog_mux)
> +	if (!mbhc || !mbhc->cfg || !mbhc->cfg->typec_analog_mux)
>  		return -EINVAL;
> =20
>  	if (mbhc->mbhc_cb->clk_setup)
> @@ -611,7 +611,7 @@ EXPORT_SYMBOL_GPL(wcd_mbhc_typec_report_unplug);
> =20
>  int wcd_mbhc_typec_report_plug(struct wcd_mbhc *mbhc)
>  {
> -	if (!mbhc || !mbhc->cfg->typec_analog_mux)
> +	if (!mbhc || !mbhc->cfg || !mbhc->cfg->typec_analog_mux)
>  		return -EINVAL;
> =20
>  	if (mbhc->mbhc_cb->clk_setup)

[Severity: Medium]
Is checking !mbhc->cfg without holding mbhc->lock sufficient to synchronize
wcd_mbhc_typec_report_plug() and wcd_mbhc_typec_report_unplug() against
wcd_mbhc_start(), wcd_mbhc_initialise(), and wcd_mbhc_stop()?

In sound/soc/codecs/wcd-mbhc-v2.c, wcd_mbhc_start() assigns mbhc->cfg
without holding mbhc->lock, before setting mbhc->jack and before
wcd_mbhc_initialise() initializes the hardware:

sound/soc/codecs/wcd-mbhc-v2.c:wcd_mbhc_start() {
	if (!mbhc || !cfg || !jack)
		return -EINVAL;

	mbhc->cfg =3D cfg;
	mbhc->jack =3D jack;

	return wcd_mbhc_initialise(mbhc);
}

wcd_mbhc_initialise() then calls pm_runtime_get_sync() before taking
mbhc->lock and configuring the registers:

sound/soc/codecs/wcd-mbhc-v2.c:wcd_mbhc_initialise() {
	ret =3D pm_runtime_get_sync(component->dev);
	if (ret < 0 && ret !=3D -EACCES) {
		...
		return ret;
	}

	mutex_lock(&mbhc->lock);
	...
	/* Plug detect is triggered manually if analog goes through USBCC */
	if (mbhc->cfg->typec_analog_mux)
		wcd_mbhc_write_field(mbhc, WCD_MBHC_L_DET_EN, 0);
	else
		wcd_mbhc_write_field(mbhc, WCD_MBHC_L_DET_EN, 1);
	...
	if (mbhc->mbhc_cb->clk_setup)
		mbhc->mbhc_cb->clk_setup(component, false);
	mutex_unlock(&mbhc->lock);
}

If wcd937x_typec_mux_set() or wcd939x_typec_mux_set() calls
wcd_mbhc_typec_report_plug() while wcd_mbhc_start() is in progress,
wcd_mbhc_typec_report_plug() can observe mbhc->cfg !=3D NULL, enable the MB=
HC
clock, set WCD_MBHC_L_DET_EN to 1, and schedule mbhc_plug_detect_work
before wcd_mbhc_initialise() has configured the MBHC registers or
mbhc->swap_thr. When wcd_mbhc_initialise() then runs under mbhc->lock, it
will clear WCD_MBHC_L_DET_EN back to 0 and disable clk_setup, breaking the
plug detection state.

Additionally, mbhc->cfg is not cleared if wcd_mbhc_initialise() fails or
when wcd_mbhc_stop() runs. Could wcd_mbhc_typec_report_plug() and
wcd_mbhc_typec_report_unplug() still execute when MBHC is uninitialized or
stopped?

[Severity: High]
Can wcd_mbhc_typec_report_plug() and wcd_mbhc_typec_report_unplug() also
race with wcd_mbhc_deinit(), causing a use-after-free on struct wcd_mbhc
and mbhc->mbhc_plug_detect_work?

As the commit message notes, the platform device's Type-C callbacks are not
synchronized with codec ops. In sound/soc/codecs/wcd937x.c (and similarly
in wcd939x.c), wcd937x_typec_mux_set() checks wcd937x->wcd_mbhc and passes
the pointer to wcd_mbhc_typec_report_plug() or
wcd_mbhc_typec_report_unplug() without holding a lock that serializes
against teardown:

sound/soc/codecs/wcd937x.c:wcd937x_typec_mux_set() {
	if (!wcd937x->wcd_mbhc)
		return -EINVAL;

	if (wcd937x->typec_mode !=3D state->mode) {
		wcd937x->typec_mode =3D state->mode;

		if (wcd937x->typec_mode =3D=3D TYPEC_MODE_AUDIO)
			return wcd_mbhc_typec_report_plug(wcd937x->wcd_mbhc);
		else if (previous_mode =3D=3D TYPEC_MODE_AUDIO)
			return wcd_mbhc_typec_report_unplug(wcd937x->wcd_mbhc);
	}
}

During ASoC component removal, wcd937x_soc_codec_remove() calls
wcd937x_mbhc_deinit() -> wcd_mbhc_deinit():

sound/soc/codecs/wcd937x.c:wcd937x_mbhc_deinit() {
	/* May be accessed by platform dev typec callbacks, clear it first */
	wcd937x->wcd_mbhc =3D NULL;
	wcd_mbhc_deinit(mbhc);
}

sound/soc/codecs/wcd-mbhc-v2.c:wcd_mbhc_deinit() {
	...
	mutex_lock(&mbhc->lock);
	wcd_cancel_hs_detect_plug(mbhc,	&mbhc->correct_plug_swch);
	cancel_work_sync(&mbhc->mbhc_plug_detect_work);
	mutex_unlock(&mbhc->lock);

	kfree(mbhc);
}

If wcd937x_typec_mux_set() has already loaded wcd937x->wcd_mbhc before
wcd937x_mbhc_deinit() clears it, wcd_mbhc_deinit() can finish
cancel_work_sync(&mbhc->mbhc_plug_detect_work) and kfree(mbhc) while
wcd_mbhc_typec_report_plug() or wcd_mbhc_typec_report_unplug() is still
running, dereferencing freed mbhc fields and calling
schedule_work(&mbhc->mbhc_plug_detect_work) on freed memory.

Should the Type-C mux callback and MBHC teardown be synchronized with a
lock that spans the wcd_mbhc_typec_report_plug() /
wcd_mbhc_typec_report_unplug() call and wcd_mbhc_deinit()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020170341.1641=
325-1-val@packett.cool?part=3D3
