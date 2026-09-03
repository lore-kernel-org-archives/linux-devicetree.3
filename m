Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D801A4FECD8
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 21:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788470589; cv=none; b=F/1hwwj7Rmq/Cql3yplHXn47EAMJ07lK5+4eQo7dKzT7ybwRwkb1uDP010KmhFqgJhlArI2Uv/kmW5qP3fYjYJtRQ+yef4kC5hDmZRxZkWK45EUD9QzPBlape+zoNl+AvoJwxGCGWZAA3WA/RjADwjxke5sQhDXN37pLB7GHERc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788470589; c=relaxed/simple;
	bh=Rsv0fDr/x2n166RwcClGD1jiJq33DcqdLQTpznpFEec=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D+C2phizwohUTflK+Fl7zvAe8Mn2KRLf7/AgVdH7kJ8pSuq74E3w/dLjL3ekr94nt9XAtx+Hsu+lAaqUKAztyPddi+kUWyLBaSKEbrzz7elk82MOeDz21/VJWc+NKxKu4hHwFzo6juFejIvWcLDDP19U7z13X+L/NwtncIWRZ3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lTqmgbOS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lTqmgbOS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6F71F00A3D;
	Thu,  3 Sep 2026 21:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788470571;
	bh=vRhSnRanZNwZLwFNt4saFX2wPrzMt773aCMzA2+FDn4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lTqmgbOSiPQhdfai7XlrcHVNAabnFMiAErs8pOGVR96GvicAAmCqnDCYFKv+VJUoc
	 SPh02oIlrdUoj71d4JHBd5Nr4ipdPcms5kRpwWRUvQ6I13hb08VWz0IUcaGubyQ/Cc
	 IYPriLnqI+mfnotIYEOdmzQX4qu6obWwFEqqiyl+TF1U3+HbLNtqY39PL4/WHfskS4
	 NH6WgJGOMPUpI8idzaeWUQtq9llYW1GCe99xivYSFkPUwj3LO9rZbhWvdrxwXmrb0D
	 f6cgz3cWjYC0EilaEiyg+002u00N3Gs9zCvQva1QgvDiBG9MgFSixXHP6xhmXMfep2
	 RL0QRKZo1w/WQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] nfc: st-nci: add raw NCI path for ST21NFCD
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kristian Brox" <isyourbrainfoss@proton.me>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902-fp5-st21nfcd-v4-v4-2-ded2f1c501be@proton.me>
References: <20260902-fp5-st21nfcd-v4-v4-0-ded2f1c501be@proton.me>
 <20260902-fp5-st21nfcd-v4-v4-2-ded2f1c501be@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 21:22:50 +0000
Message-Id: <20260903212251.0E6F71F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Buffer overflow (`skb_over_panic`) in `st_nci_i2c_read()` due =
to insufficient SKB allocation size.
- [High] Missing cleanup of NCI device on IRQ request failure leads to Use-=
After-Free.
- [High] Improper teardown ordering in `ndlc_remove()` allows asynchronous =
work to execute after structures are freed.
- [High] Memory leak of supervisor `skb` frames in `llt_ndlc_rcv_queue()`.
--

commit c09112faf79ae0f9e5be39ae7d2605850d39efc5
Author: Kristian Brox <isyourbrainfoss@proton.me>

nfc: st-nci: add raw NCI path for ST21NFCD

This commit adds raw NCI support for the ST21NFCD NFC controller. It bypass=
es
the NDLC PCB headers and ACK timers for I2C communication and consumes
proprietary RF activity notifications.

> diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
> index 152c20b6bb01a..2ec029f31c673 100644
> --- a/drivers/nfc/st-nci/i2c.c
> +++ b/drivers/nfc/st-nci/i2c.c
[ ... ]
> @@ -111,6 +133,42 @@ static int st_nci_i2c_read(struct st_nci_i2c_phy *ph=
y,
>  	u8 buf[ST_NCI_I2C_MAX_SIZE];
>  	struct i2c_client *client =3D phy->i2c_dev;
> =20
> +	if (phy->raw_nci) {
[ ... ]
> +	}
> +
>  	r =3D i2c_master_recv(client, buf, ST_NCI_I2C_MIN_SIZE);
>  	if (r < 0) {  /* Retry, chip was in standby */
>  		usleep_range(1000, 4000);
>  		r =3D i2c_master_recv(client, buf, ST_NCI_I2C_MIN_SIZE);
>  	}
>=20
>  	if (r !=3D ST_NCI_I2C_MIN_SIZE)
>  		return -EREMOTEIO;
>=20
>  	len =3D be16_to_cpu(*(__be16 *) (buf + 2));
>  	if (len > ST_NCI_I2C_MAX_SIZE) {
>  		nfc_err(&client->dev, "invalid frame len\n");
>  		return -EBADMSG;
>  	}
>=20
>  	*skb =3D alloc_skb(ST_NCI_I2C_MIN_SIZE + len, GFP_KERNEL);
>  	if (*skb =3D=3D NULL)
>  		return -ENOMEM;
>=20
>  	skb_reserve(*skb, ST_NCI_I2C_MIN_SIZE);
>  	skb_put(*skb, ST_NCI_I2C_MIN_SIZE);
>  	memcpy((*skb)->data, buf, ST_NCI_I2C_MIN_SIZE);
>=20
>  	if (!len)
>  		return 0;
>=20
>  	r =3D i2c_master_recv(client, buf, len);
>  	if (r !=3D len) {
>  		kfree_skb(*skb);
>  		return -EREMOTEIO;
>  	}
>=20
>  	skb_put(*skb, len);

[Severity: Critical]
This is a pre-existing issue, but does this allocation provide enough room
for both the reserved headroom and the data being put into the SKB?

When allocating an SKB of size ST_NCI_I2C_MIN_SIZE + len and then reserving
ST_NCI_I2C_MIN_SIZE bytes, the available tailroom is reduced to just len.
Since the code subsequently calls skb_put() for ST_NCI_I2C_MIN_SIZE bytes
and then later for len bytes, the total space requested is
ST_NCI_I2C_MIN_SIZE + len. Because the tailroom is only len, can this cause
a buffer overflow leading to an skb_over_panic?

[ ... ]
> @@ -231,8 +299,10 @@ static int st_nci_i2c_probe(struct i2c_client *clien=
t)
[ ... ]
>  	r =3D ndlc_probe(phy, &i2c_phy_ops, &client->dev,
> -			ST_NCI_FRAME_HEADROOM, ST_NCI_FRAME_TAILROOM,
> -			&phy->ndlc, &phy->se_status);
> +			phy->raw_nci ? ST_NCI_RAW_FRAME_HEADROOM :
> +				       ST_NCI_FRAME_HEADROOM,
> +			ST_NCI_FRAME_TAILROOM,
> +			&phy->ndlc, &phy->se_status, phy->raw_nci);
>  	if (r < 0) {
>  		nfc_err(&client->dev, "Unable to register ndlc layer\n");
>  		return r;
>  	}
>=20
>  	phy->irq_active =3D true;
>  	r =3D devm_request_threaded_irq(&client->dev, client->irq, NULL,
>  				st_nci_irq_thread_fn,
>  				IRQF_ONESHOT,
>  				ST_NCI_DRIVER_NAME, phy);
>  	if (r < 0)
>  		nfc_err(&client->dev, "Unable to register IRQ handler\n");
>=20
>  	return r;
>  }

[Severity: High]
This is a pre-existing issue, but does this error path properly clean up the
NCI device?

If devm_request_threaded_irq() fails, the function logs an error and
returns directly, allowing devres to free the memory. However, the NCI
device that was registered earlier via ndlc_probe() -> st_nci_probe()
is never unregistered because ndlc_remove() is not called.

Can this leave the NCI core and network stack with visibility to a freed
device, eventually causing a use-after-free?

> diff --git a/drivers/nfc/st-nci/ndlc.c b/drivers/nfc/st-nci/ndlc.c
> index be4808859cfa9..13026c4facb3a 100644
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
> 				timer_delete_sync(&ndlc->t1_timer);

[Severity: High]
This is a pre-existing issue, but does this loop leak the received supervis=
or
frame?

When an incoming frame is dequeued from ndlc->rcv_q, it is stored in the
local skb variable. In the PCB_SYNC_ACK case, this variable is overwritten
with a frame from ack_pending_q, which is then freed. The original received
ACK skb is never freed.

Similarly, for PCB_SYNC_NACK and PCB_SYNC_WAIT, the switch breaks and the l=
oop
continues without freeing the original skb. Does this leak a frame for every
acknowledgment received?

[ ... ]

While looking at the lifecycle management in ndlc.c, I noticed another
pre-existing issue in ndlc_remove():

	/* cancel work */
	cancel_work_sync(&ndlc->sm_work);

	st_nci_remove(ndlc->ndev);

[Severity: High]
This isn't a bug introduced by this patch, but is the teardown ordering here
safe?

The asynchronous work queue sm_work is cancelled before the NCI device is
unregistered via st_nci_remove(). Because the NCI device is still fully
registered, a concurrent thread like the network stack can send a frame by
calling nci_send_frame() -> ndlc_send(), which unconditionally executes
schedule_work(&ndlc->sm_work).

Could this allow the re-armed work queue to execute after devres has freed
the ndlc structures, leading to a use-after-free?

> diff --git a/drivers/nfc/st-nci/spi.c b/drivers/nfc/st-nci/spi.c
> index 7948c7e0c88c0..1ce80a85bfe6a 100644
> --- a/drivers/nfc/st-nci/spi.c
> +++ b/drivers/nfc/st-nci/spi.c
[ ... ]
> @@ -246,7 +246,7 @@ static int st_nci_spi_probe(struct spi_device *dev)
> =20
>  	r =3D ndlc_probe(phy, &spi_phy_ops, &dev->dev,
>  			ST_NCI_FRAME_HEADROOM, ST_NCI_FRAME_TAILROOM,
> -			&phy->ndlc, &phy->se_status);
> +			&phy->ndlc, &phy->se_status, false);
>  	if (r < 0) {
>  		nfc_err(&dev->dev, "Unable to register ndlc layer\n");
>  		return r;
>  	}
> =20
>  	phy->irq_active =3D true;
>  	r =3D devm_request_threaded_irq(&dev->dev, dev->irq, NULL,
>  				st_nci_irq_thread_fn,
>  				IRQF_ONESHOT,
>  				ST_NCI_SPI_DRIVER_NAME, phy);
>  	if (r < 0)
>  		nfc_err(&dev->dev, "Unable to register IRQ handler\n");
> =20
>  	return r;
>  }

[Severity: High]
This is a pre-existing issue, but st_nci_spi_probe() appears to have the
exact same error handling flaw as st_nci_i2c_probe().

If devm_request_threaded_irq() fails, the NCI device registered by
ndlc_probe() is never unregistered, leaving a dangling reference.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-fp5-st21nf=
cd-v4-v4-0-ded2f1c501be@proton.me?part=3D2
