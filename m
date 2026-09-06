Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAAD3644C4
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 18:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788720902; cv=none; b=cUNONi9lK0W8SZRsQkTmxxfuD1ZOgW8QLuFXtsz9zxxwqmBtmiu1Nkj1XqskpqvebH7ZbsCeWpI2/S4lh2TfLciHvoW40CQupfLesOOoyW5kW4GMyzBqpg9PYQtShxjKPPA28FC4XxA8rCNu2dzTMnJPbv7ZLtFC0kSZaywiMcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788720902; c=relaxed/simple;
	bh=GR1LanTkiHrVAKhf9x3/DeSKyj6Z4QCaB7l7j1st1w0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OgXwEdyCuKbn0lc5ulOZ+0Fr4brdMd6tE5D5+j4LpSLGNfirB5YxtDXtUXa7XjAqhynPElhmXMnafZ+weUXFOBsB6AJzUO8mCbfVsZ3pOJR8SFC+E6If5TqGaAhcDPJ5MCWKeEgPPzR2rDD89m+PgAxlj4MbC4jS4gZiZ8b+3/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=diCDlryn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="diCDlryn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199951F00A3A;
	Sun,  6 Sep 2026 18:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788720892;
	bh=mntpMrPft9O86w/A6pOuxRq49NTPoB4NUN9KIJhj3xE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=diCDlrynjUCwfSUCNdYJBCV2dYC7bOyVGmOChVtKbzeiDKIYmPKfJmtPN1l7Ncnh7
	 6VVpr37c2PkIZEwk2gms7b3lhMeSiBQuVMRLFgBVyt3wl9vL0G7ADUcCv/HuIz50qj
	 RnniPTrC0OVt5aOatsWmVLBHsu//Wrm5ZMA2rA1+uDPllIATiMlvQBE67UdO/Z1Scu
	 Ku4p5iwJjsaNkzNe/+noTfeibgNl9ur7QhGtimyEdLkiCrTBL+EOn4WqCRGWBQZ941
	 896Ut9+sXx1PFwiC3fWS/VyWGkJ8EME1ns5hkTT/rghUHlJPYof5fxKnORKU2ZhLiW
	 wmctghBvP3l/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/22] usb: typec: tipd: Publish CD321x partner
 alternate modes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Peter" <sven@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-4-1f80085f93fb@kernel.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-4-1f80085f93fb@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 18:54:51 +0000
Message-Id: <20260906185452.199951F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Probe error path causes Use-After-Free and data races when unregis=
tering partner altmodes.

Pre-existing issues:
- [High] Uncancelled delayed works (`update_work` and `wq_poll`) in the `tp=
s6598x_probe` error paths lead to use-after-free of the `tps` structure.
--

commit 32fed0e1c2a7fe442601560146889c74a0d8a3f2
Author: Sven Peter <sven@kernel.org>

    usb: typec: tipd: Publish CD321x partner alternate modes
   =20
    Register Thunderbolt partner and cable modes once their VDOs are
    available and USB4 as a partner mode once firmware has negotiated it,
    with the EUDO stored in its eudo field. The CD321X firmware still contr=
ols
    mode selection and entry itself. This just makes the negotiated modes
    available to consumers on the Type-C bus.
   =20
    Mark them active after the Type-C mux has been configured and deactivate
    them before the mux is switched back to its safe state to make sure any
    consuming driver is initialized and shut down in the correct order.
   =20
    Signed-off-by: Sven Peter <sven@kernel.org>

> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index 8c7f93d4270e2..218b52b07b5a7 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
[ ... ]
> @@ -1380,6 +1565,7 @@ cd321x_unregister_port(struct tps6598x *tps)
>  {
>  	struct cd321x *cd321x =3D container_of(tps, struct cd321x, tps);
> =20
> +	cd321x_unregister_partner_altmodes(cd321x);

[Severity: High]
Does this code introduce a use-after-free on the probe error path?

If tps6598x_probe() fails after a successful connect, it jumps to err_disco=
nnect:

tps6598x_probe()
    ...
err_disconnect:
    tps6598x_disconnect(tps, 0);
err_unregister_port:
    tps->data->unregister_port(tps);

tps6598x_disconnect() unregisters the partner, which cascades and frees its=
=20
children (the altmodes).

Next, tps->data->unregister_port() calls cd321x_unregister_port(), which
now calls cd321x_unregister_partner_altmodes().=20

Since the altmode pointers were never cleared to NULL on the error path,=20
cd321x_unregister_partner_altmodes() will dereference the freed memory=20
(e.g., cd321x->partner_altmode_tbt->active).

Could we clear the altmode pointers in tps6598x_disconnect() or check for t=
heir
validity before dereferencing?

>  	typec_mux_put(cd321x->mux);
>  	cd321x->mux =3D NULL;
>  	typec_unregister_altmode(cd321x->port_altmode_dp);
[ ... ]
> @@ -1802,6 +1988,14 @@ static void cd321x_remove(struct tps6598x *tps)
>  	struct cd321x *cd321x =3D container_of(tps, struct cd321x, tps);
> =20
>  	cancel_delayed_work_sync(&cd321x->update_work);
> +
> +	guard(mutex)(&tps->lock);
> +	cd321x_deactivate_altmodes(cd321x);
> +	cd321x->state.alt =3D NULL;
> +	cd321x->state.mode =3D TYPEC_STATE_SAFE;
> +	cd321x->state.data =3D NULL;
> +	typec_set_mode(tps->port, TYPEC_STATE_SAFE);
> +	cd321x_unregister_partner_altmodes(cd321x);
>  }
> =20
>  static int tps6598x_probe(struct i2c_client *client)

[Severity: High]
This is a pre-existing issue, but does the probe error path leak delayed wo=
rks?

When tps6598x_probe() allocates `tps` via devm_kzalloc(), it queues delayed=
=20
works. For example, cd321x_connect() schedules `update_work`, and if=20
polling mode is chosen, `wq_poll` is scheduled.=20

If probe fails after these works are queued (e.g., devm_request_threaded_ir=
q=20
fails), the function jumps to err_disconnect and returns an error without=20
cancelling the delayed works:

tps6598x_probe() {
    ...
err_disconnect:
	tps6598x_disconnect(tps, 0);
err_unregister_port:
	tps->data->unregister_port(tps);
err_role_put:
    ...
    return ret;
}

Devres will then free the `tps` memory. When the delayed works execute=20
later, they will dereference the freed `tps` structure, causing a panic.

Could we add cancel_delayed_work_sync() for the scheduled works in the prob=
e=20
error paths?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-b4-apple-s=
oc-tbt-v2-0-1f80085f93fb@kernel.org?part=3D4
