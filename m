Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB393C98BE
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 21:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787260203; cv=none; b=i7Pvj3okD9Bc2VOzMau67RrJ+PBdFw26UzcwwS4ukXNa+8nnJ+rPjbIGdnDrtLJNgHv6ucB/kZxRsMuktZOMTvf236oGDstpMVP4Ny7ShG0eUZMflkWJ2+2pn/tHBxwk6rjnpr8vLZkJYYDeUiJcFpTXTDM105ukZf53HEXp0zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787260203; c=relaxed/simple;
	bh=8kIzJBj8nQNJ39Sc+0rCc6TQ/ZPeb8d2imlDBHBsEY8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kEMKqVoSjGJ3uMKVFA2h6pOvJubDczlLoMJCc6BAAmAgBDBG9ydUwaF/Dn0nGlV1Yoq2zDEIcorx+G8o+XYOryJeExU0e5z6s1xhURxVXHWQ4nU1zQ6QAIiPcq/uOmDPgbXzIkfSr2QDChZxwKFNOY3Fo/H+SDp5XZW85MwpDeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nx9ePIMq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nx9ePIMq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1581F00A3A;
	Thu, 20 Aug 2026 21:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787260201;
	bh=0/y2LntR3T4VzK2XlVY3mwwYNLSY19JMSQretWSAr1M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nx9ePIMqsHJ470efTrm/3yhEXgYUt0IHBg/rwJ7WI8yz+swtebk9nOtn2qEwx7U4o
	 BdIY0CIKUjWJuSl8ubK/NGwz5Dn1fuvVHecUpI/eJeYy0O6NLQhIMLKfV4CKWRsAtV
	 /G7qW/JT2P3N3wG6p0d++ZCWhfgM6f79WBF9kBWfFfE056bvWurgnjxGMP0Z1T8g8o
	 Ui6N6WvTZEoNnjLyhtRgbbZ3X7F29Bq0kODBim33bdM14NJRqlDv0rwa2Up0Xu9J3v
	 BtZXdU119JhySpBCAhoqiDeSvSUiXl0H6/V/+6hSJS4dpy+QK9bB93KWBLYCckfur9
	 n/G1Ltd5YeXnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] nfc: st-nci: add raw NCI path for ST21NFCD
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kristian Brox" <isyourbrainfoss@proton.me>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260819210906.2500789-3-isyourbrainfoss@proton.me>
References: <20260818205940.1973944-1-isyourbrainfoss@proton.me>
 <20260819210906.2500789-1-isyourbrainfoss@proton.me>
 <20260819210906.2500789-3-isyourbrainfoss@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 21:10:00 +0000
Message-Id: <20260820211001.3D1581F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [High] Late initialization of `raw_nci` causes an `skb_under_panic` due t=
o a race with userspace.
- [High] Improper power sequencing by driving the reset GPIO high before en=
abling VDD-IO.

Pre-existing issues:
- [High] Failing probe IRQ registration leaks the NCI device and causes a U=
se-After-Free.
- [High] Unsafe teardown order in `ndlc_remove` allows a dangling worker to=
 be rescheduled, leading to a Use-After-Free.
- [High] Buffer overflow and `skb_over_panic` due to tailroom consumption m=
ismatch in the legacy read path.
- [High] Unaligned memory access when parsing the legacy NDLC frame length.
- [High] Permanent SKB memory leak when a hardware write fails in the worke=
r thread.
--

--- Patch [2]: [PATCH v2 2/3] nfc: st-nci: add raw NCI path for ST21NFCD ---
commit 9b78e1755a6510b5c027dacfd61c724b1db74622
Author: Kristian Brox <isyourbrainfoss@proton.me>

nfc: st-nci: add raw NCI path for ST21NFCD

ST21NFCD does not use NDLC. When the compatible is st,st21nfcd,
talk raw NCI.

> diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
> index 9ae839a6f5cc0..566689d5aadb4 100644
> --- a/drivers/nfc/st-nci/i2c.c
> +++ b/drivers/nfc/st-nci/i2c.c
[ ... ]
> @@ -111,6 +122,42 @@ static int st_nci_i2c_read(struct st_nci_i2c_phy *ph=
y,
>  	u8 buf[ST_NCI_I2C_MAX_SIZE];
>  	struct i2c_client *client =3D phy->i2c_dev;
> =20
> +	if (phy->raw_nci) {
> +		r =3D i2c_master_recv(client, buf, ST_NCI_NCI_HDR_SIZE);
> +		if (r < 0) {
> +			usleep_range(1000, 4000);
> +			r =3D i2c_master_recv(client, buf, ST_NCI_NCI_HDR_SIZE);
> +		}
> +		if (r !=3D ST_NCI_NCI_HDR_SIZE)
> +			return -EREMOTEIO;
> +
> +		len =3D buf[2];
> +		if (len > ST_NCI_I2C_MAX_SIZE) {
> +			nfc_err(&client->dev, "invalid frame len\n");
> +			return -EBADMSG;
> +		}
> +
> +		*skb =3D alloc_skb(ST_NCI_NCI_HDR_SIZE + len, GFP_KERNEL);
> +		if (!*skb)
> +			return -ENOMEM;
> +
> +		skb_put(*skb, ST_NCI_NCI_HDR_SIZE);
> +		memcpy((*skb)->data, buf, ST_NCI_NCI_HDR_SIZE);
> +
> +		if (!len)
> +			return 0;
> +
> +		r =3D i2c_master_recv(client, buf, len);
> +		if (r !=3D len) {
> +			kfree_skb(*skb);
> +			return -EREMOTEIO;
> +		}
> +
> +		skb_put(*skb, len);
> +		memcpy((*skb)->data + ST_NCI_NCI_HDR_SIZE, buf, len);
> +		return 0;
> +	}
> +
>  	r =3D i2c_master_recv(client, buf, ST_NCI_I2C_MIN_SIZE);
>  	if (r < 0) {  /* Retry, chip was in standby */
>  		usleep_range(1000, 4000);

[Severity: High]
This is a pre-existing issue, but does the legacy read path consume more
headroom and tailroom than it allocates, causing an skb_over_panic?

st_nci_i2c_read() allocates an SKB of size 4 + len:

    *skb =3D alloc_skb(ST_NCI_I2C_MIN_SIZE + len, GFP_KERNEL);

Then it reserves 4 bytes, leaving len bytes of tailroom:

    skb_reserve(*skb, ST_NCI_I2C_MIN_SIZE);

But subsequent skb_put() calls consume 4 + len bytes of tailroom:

    skb_put(*skb, ST_NCI_I2C_MIN_SIZE);
    ...
    skb_put(*skb, len);

Because only len bytes were left in the tailroom, the operations require 4
more bytes than what was requested. If the allocation is just beneath a slab
boundary without extra padding, won't the final skb_put(len) trigger an
skb_over_panic?

[Severity: High]
This is also a pre-existing issue, but does parsing the legacy NDLC frame
length cause an unaligned memory access?

The frame header is read into a stack-allocated byte array:

    u8 buf[ST_NCI_I2C_MAX_SIZE];

Later in st_nci_i2c_read(), the code casts an unaligned offset directly to a
16-bit integer pointer:

    len =3D be16_to_cpu(*(__be16 *) (buf + 2));

On strict-alignment architectures, won't this unaligned dereference trigger
a kernel panic or alignment fault?

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

[Severity: High]
Can driving the reset GPIO high before enabling VDD-IO risk hardware damage?

In st_nci_i2c_probe(), the reset GPIO is requested and actively driven high
via GPIOD_OUT_HIGH:

    phy->gpiod_reset =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);

The vdd-io regulator and system clocks are then requested and enabled after
the GPIO is driven here.

Driving an active HIGH signal into a CMOS IC's I/O pin before its VDD rail
is powered violates power sequencing requirements. This forces voltage
through the chip's internal ESD protection diodes, back-powering the chip.
Should the regulator and clocks be enabled before driving the GPIO high?

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
Can assigning this flag after ndlc_probe() cause an skb_under_panic crash?

Because ndlc_probe() registers the NCI device, the interface is exposed to
userspace before phy->ndlc->raw_nci is initialized. If userspace brings up
the device immediately, st_nci_init() and subsequent commands can execute
while raw_nci is still false.

If ndlc_send() sees raw_nci =3D=3D false, it will attempt to push the NDLC
header:

drivers/nfc/st-nci/ndlc.c:ndlc_send() {
    ...
    if (!ndlc->raw_nci) {
        ...
        *(u8 *)skb_push(skb, 1) =3D pcb;
    }
    ...
}

Because the SKB was allocated for a raw NCI device with tx_headroom =3D 0,
this skb_push() call would panic. Should raw_nci be initialized before
ndlc_probe() exposes the device to userspace?

> =20
>  	phy->irq_active =3D true;
>  	r =3D devm_request_threaded_irq(&client->dev, client->irq, NULL,
>  				st_nci_irq_thread_fn,
>  				IRQF_ONESHOT,
>  				ST_NCI_DRIVER_NAME, phy);
>  	if (r < 0)
>  		nfc_err(&client->dev, "Unable to register IRQ handler\n");
> =20
>  	return r;
>  }

[Severity: High]
This is a pre-existing issue, but does failing to register the IRQ here leak
the NCI device and cause a use-after-free?

ndlc_probe() allocates and registers the NCI device (ndev), but ndev is not
devres-managed and requires st_nci_remove() to unregister and free it.

If devm_request_threaded_irq() fails, the probe function immediately returns
an error code. This causes devres to free phy and other devm-managed memory,
but leaves the network interface registered. Could subsequent userspace
interaction with the lingering interface dereference the freed pointers?

> diff --git a/drivers/nfc/st-nci/ndlc.c b/drivers/nfc/st-nci/ndlc.c
> index be4808859cfa9..b3192460c96e3 100644
> --- a/drivers/nfc/st-nci/ndlc.c
> +++ b/drivers/nfc/st-nci/ndlc.c
[ ... ]
> @@ -103,6 +106,10 @@ static void llt_ndlc_send_queue(struct llt_ndlc *ndl=
c)
>  			ndlc->hard_fault =3D r;
>  			break;
>  		}
> +		if (ndlc->raw_nci) {
> +			kfree_skb(skb);
> +			continue;
> +		}

[Severity: High]
This isn't a bug introduced by this patch, but does failing a hardware write
leak the dequeued SKB permanently?

In llt_ndlc_send_queue(), an SKB is dequeued and transmitted:

    skb =3D skb_dequeue(&ndlc->send_q);
    r =3D ndlc->ops->write(ndlc->phy_id, skb);
    if (r < 0) {
        ndlc->hard_fault =3D r;
        break;
    }

If the write fails, the loop breaks immediately. The dequeued SKB is neither
freed nor re-queued, stranding the memory permanently. Furthermore, because
hard_fault is set, won't all subsequently scheduled SKBs also dequeue, fail,
and leak, allowing memory exhaustion?

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

[Severity: High]
This is also a pre-existing issue, but does ndlc_remove() have an unsafe
teardown order that can cause a use-after-free?

In ndlc_remove(), cancel_work_sync(&ndlc->sm_work) is called to cancel
pending work before the hardware IRQ is disabled in st_nci_remove():

drivers/nfc/st-nci/ndlc.c:ndlc_remove() {
    ...
    cancel_work_sync(&ndlc->sm_work);
    ...
    st_nci_remove(ndlc->ndev);
    ...
}

If an interrupt fires in the window between cancel_work_sync() and the IRQ
being disabled, st_nci_irq_thread_fn() will read a packet and call
ndlc_recv(), which executes schedule_work(&ndlc->sm_work).

When driver removal finishes, devres frees the ndlc structure, leaving the
newly scheduled worker to execute on freed memory. Is it possible to disable
the IRQ before cancelling the work?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819210906.2500=
789-1-isyourbrainfoss@proton.me?part=3D2
