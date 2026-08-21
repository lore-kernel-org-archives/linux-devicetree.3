Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1F93BE652
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 20:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787345789; cv=none; b=YQhEnAHrWw4EsFFRrwLC10TjxTN0YLAP60yxUbltyZ6y891nqUw54skR77w1zcYuhbxbIwRBGI0Ms9BVK9pJz8kGVmn/Hb1q2vDbAQpKslm83JkBOjsfTM515BIdK6HXftnBaISbrd69JuUsYicHAL9h0UBCQsThyaaQW8e0BCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787345789; c=relaxed/simple;
	bh=QHcf7Cd6bfGjuLOilwm3MmXWrnhSfCzqB/9twTJ16g4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qg702psy364vMkfWxijSyvWrHdjb9gxFtP+tAsLAhrooEnBV12VtCwtM9I7I7hjKNfUUM8eJ9ao4omlKWkXUQJQqmHmlaRZJ5lZXZ3dzdlAa8iX/sABu0Ico+Erj52t71nFEBlGDw3N64CwWFn8yv+zCsGFaSDPEvg06918AosE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c3NPcd0O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c3NPcd0O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E941F000E9;
	Fri, 21 Aug 2026 20:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787345788;
	bh=WPQyzSGC3n9swf8fNLYO3nL+eDqztdjTvHbLHTF6JLo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c3NPcd0OwI+Npvr0V7tSQu8lX23WXpGv+4E8MO5dwfl+JuUeWJDso19NLfZBhL43V
	 M353UoJfYXpYGakZqjE6wtgYCl2gvFZ+VbZzf68yFS2PglGmQb7vghKVk5gZbSmikm
	 fqfvFguXQhkHC+BK4REFZSbXqpl5/jVNwPwMAP5JfK4YeMRS8FYHBWO4m/r3K4qm6h
	 FOyfQvSadx7JFF30RELNSy+FvGN3L+fYA/4m0EtBFJ+9ZFJpcJcltDlbmhqh1rF+wq
	 v9uwZVzqX9/kLBd97NfNotNN9J+svoW+0GUD2iBVvrbNcZgtFdI8YgVof4BQb3xy9r
	 orzmSzSL796aA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] nfc: st-nci: add raw NCI path for ST21NFCD
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kristian Brox" <isyourbrainfoss@proton.me>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260820-fp5-st21nfcd-v3-v3-2-5ee0a7f44d04@proton.me>
References: <20260820-fp5-st21nfcd-v3-v3-0-5ee0a7f44d04@proton.me>
 <20260820-fp5-st21nfcd-v3-v3-2-5ee0a7f44d04@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 20:56:27 +0000
Message-Id: <20260821205627.F2E941F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] The NCI device is registered before the `raw_nci` flag is fully in=
itialized, allowing userspace to trigger `ndlc_send` with 0 headroom on a n=
on-raw setup, causing an `skb_under_panic`.
- [Low] The patch modifies `st_nci_i2c_id_table` to use positional initiali=
zers instead of named initializers for `struct i2c_device_id`.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but if `devm_request=
_threaded_irq()` fails during probe, the function returns an error without =
unregistering or freeing the NCI device, leaving a dangling registered netd=
ev.
- [High] This problem wasn't introduced by this patch, but module removal d=
estroys the NCI device and cancels workqueues while the IRQ handler is stil=
l active, allowing the handler to access freed memory or reschedule cancell=
ed work.
- [High] This problem wasn't introduced by this patch, but received SKBs co=
ntaining SUPERVISOR frames (like ACK, NACK, WAIT) are never freed in `llt_n=
dlc_rcv_queue`, causing a permanent memory leak.
--

--- Patch [2]: [PATCH v3 2/3] nfc: st-nci: add raw NCI path for ST21NFCD ---
commit 5f6ff3e39e1921d843bbd676cd50cbaac4a522d8
Author: Kristian Brox <isyourbrainfoss@proton.me>

nfc: st-nci: add raw NCI path for ST21NFCD

This commit introduces a raw NCI path for the ST21NFCD. It adds
configuration properties to bypass NDLC PCB handling, ACK timers, and
proprietary SET_NFC_MODE commands.

> diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
> --- a/drivers/nfc/st-nci/i2c.c
> +++ b/drivers/nfc/st-nci/i2c.c

[ ... ]

> @@ -225,19 +274,31 @@ static int st_nci_i2c_probe(struct i2c_client *clie=
nt)
>  		return -ENODEV;
>  	}
> =20
> +	r =3D devm_regulator_get_enable_optional(dev, "vdd-io");
> +	if (r && r !=3D -ENODEV)
> +		return dev_err_probe(dev, r, "failed to enable vdd-io\n");
> +
> +	r =3D PTR_ERR_OR_ZERO(devm_clk_get_optional_enabled(dev, NULL));
> +	if (r)
> +		return dev_err_probe(dev, r, "failed to enable clock\n");
> +
>  	phy->se_status.is_ese_present =3D
>  				device_property_read_bool(dev, "ese-present");
>  	phy->se_status.is_uicc_present =3D
>  				device_property_read_bool(dev, "uicc-present");
> =20
>  	r =3D ndlc_probe(phy, &i2c_phy_ops, &client->dev,
> -			ST_NCI_FRAME_HEADROOM, ST_NCI_FRAME_TAILROOM,
> +			phy->raw_nci ? ST_NCI_RAW_FRAME_HEADROOM :
> +				       ST_NCI_FRAME_HEADROOM,
>  			ST_NCI_FRAME_TAILROOM,
>  			&phy->ndlc, &phy->se_status);
>  	if (r < 0) {
>  		nfc_err(&client->dev, "Unable to register ndlc layer\n");
>  		return r;
>  	}
> =20
> +	phy->ndlc->raw_nci =3D phy->raw_nci;

[Severity: High]
Could this lead to an skb_under_panic?

Because ndlc_probe() registers the NCI device and exposes it to userspace,
is it possible for userspace to immediately issue a DEV_UP command before
phy->ndlc->raw_nci is assigned?

If a packet is queued right away, ndlc_send() might see raw_nci =3D=3D false
and attempt to push a 1-byte NDLC header into an SKB allocated with
0 headroom (ST_NCI_RAW_FRAME_HEADROOM), underflowing the SKB.

> +
>  	phy->irq_active =3D true;
>  	r =3D devm_request_threaded_irq(&client->dev, client->irq, NULL,
>  				st_nci_irq_thread_fn,
> @@ -257,23 +318,25 @@ static void st_nci_i2c_remove(struct i2c_client *cl=
ient)
>  	if (r < 0)
>  		nfc_err(&client->dev, "Unable to register IRQ handler\n");
> =20
>  	return r;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but if devm_request_threaded_irq=
()
fails here, does it leave a dangling NCI device?

Since ndlc_probe() already allocated and registered the NCI device with
the networking core, returning an error without unregistering it leaves the
netdev active. When devres later frees the phy and ndlc structures, could
userspace still access the freed interface and trigger a use-after-free pan=
ic?

>  static void st_nci_i2c_remove(struct i2c_client *client)
>  {
>  	struct st_nci_i2c_phy *phy =3D i2c_get_clientdata(client);
> =20
>  	ndlc_remove(phy->ndlc);
>  }

[Severity: High]
This is a pre-existing issue, but does ndlc_remove() destroy the NCI device
and cancel workqueues while the IRQ handler is still active?

Since the devres-managed IRQ isn't explicitly disabled or freed here, if an
interrupt fires concurrently during module removal, could the handler sched=
ule
cancelled work or access the already-freed ndlc->ndev, leading to a crash?

>  static const struct i2c_device_id st_nci_i2c_id_table[] =3D {
> -	{ .name =3D ST_NCI_DRIVER_NAME },
> -	{ }
> +	{ ST_NCI_DRIVER_NAME },
> +	{}
>  };
>  MODULE_DEVICE_TABLE(i2c, st_nci_i2c_id_table);

[Severity: Low]
Is there a reason for removing the named initializer here?

The I2C subsystem guidelines require initialized arrays of type
struct i2c_device_id to use named initializers.

[ ... ]

> diff --git a/drivers/nfc/st-nci/ndlc.c b/drivers/nfc/st-nci/ndlc.c
> --- a/drivers/nfc/st-nci/ndlc.c
> +++ b/drivers/nfc/st-nci/ndlc.c

[ ... ]

> @@ -154,6 +161,10 @@ static void llt_ndlc_rcv_queue(struct llt_ndlc *ndlc)
>  		pr_debug("rcvQlen=3D%d\n", ndlc->rcv_q.qlen);
> =20
>  	while ((skb =3D skb_dequeue(&ndlc->rcv_q)) !=3D NULL) {
> +		if (ndlc->raw_nci) {
> +			nci_recv_frame(ndlc->ndev, skb);
> +			continue;
> +		}
>  		pcb =3D skb->data[0];
>  		skb_pull(skb, 1);
>  		if ((pcb & PCB_TYPE_MASK) =3D=3D PCB_TYPE_SUPERVISOR) {
> 			switch (pcb & PCB_SYNC_MASK) {
> 			case PCB_SYNC_ACK:
> 				skb =3D skb_dequeue(&ndlc->ack_pending_q);
> 				kfree_skb(skb);

[Severity: High]
This isn't a bug introduced by this patch, but does the PCB_SYNC_ACK path
leak the received skb?

When a PCB_SYNC_ACK frame is dequeued from ndlc->rcv_q, the skb pointer
is overwritten by skb_dequeue(&ndlc->ack_pending_q), which is then freed.
It appears the original received SKB containing the ACK frame is never
freed, leading to a permanent memory leak during normal hardware communicat=
ion.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-fp5-st21nf=
cd-v3-v3-0-5ee0a7f44d04@proton.me?part=3D2
