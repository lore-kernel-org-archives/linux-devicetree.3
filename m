Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793857198;
	b=Eq23Sk33ayeJkP6LPmOjbQRXOE1IRkKLbjgTAhtG/WWRc9HIoCXNkpEDQy/Mb0BOeYtA
	 MnIdqAHuMxZOUQxbC28QQKkQQXoOgq2CIJknCF5j4ko/GyedMToBGQIZEjXNS016Vj1Sc
	 odRQHxlqbEr/Hu1iYBlL78SlA4m2fXvwygo2JXMSvNJchpvd1bPUJgFP5jXrNh8mcbG8V
	 PfAFHh2TkJgi6wOnQlsgVWIYJR2JAvQfoZt0+SMyXU0x+ZGsaJraJEcEOIdSEy63dAPiD
	 ftnhCQQBh86Q9R4ObQjxWI69j7dx1uWqd2fQHQ59+aOICFN6a7G0p0mta27eLj+NEjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793857198;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sfesCLhQTCl0YuTyC2oNiPws7HoFlf3+O8By7ekW4eQ=;
	b=LfZ8NI8iNPf+ffy/+OQ/OojP2/MjtkI5J28URL88w8fJbBhGwkr4ljDIb/GCcc7GuUZp
	 NH0pisIQ22035TGwSGHySHe8LiTrnt7tSI4KDtXEkNAkcPNMKRXxY6yNnqP9+t+rz2pCx
	 4R2+tH9hNB1rdhM366Ez9YFT5viBFs54CJ4AQ412Kch5o7VIwQmjWe1725z2L1xpel/sY
	 fh5Wwm4/kot9m3Kr2Oh1Wa+jhgVyWR9MU4qm8cHTw1P7wUYu4C0rNOx6DPYdPpwqbE/Zj
	 /iC6hnAPRjdw4r12HpRKWEuLkg9KRoieC8Uhy0n0w8G0Q/uJWfCe/6p7ajL72JMtexg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=euThBoJn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33822606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 05:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=euThBoJn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC361F000C1;
	Thu,  5 Nov 2026 05:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793857197;
	bh=sfesCLhQTCl0YuTyC2oNiPws7HoFlf3+O8By7ekW4eQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=euThBoJnsuFfB3QPvxCCMjp6PiJncfAkM4hhixVD+8BPoKtiY7DS7gCNw4UK0xcZO
	 lZxn0J+MRTXE5Kw42yN4Uu9egYUgYuw2siLCmVBrjtvtCtsWUH9L3VaurEsFhZ8YPT
	 14x9mEDP2HYkv0h6d1pX+xwWRSIJU8AiZXlwAOoAdc4rqG6m0QlyqM5Sir9kjEiJdC
	 +ENoOcMZrnb3OMaLOJI4xRh5AgkW+SEdSTayI09yYM1bkH1teNjVBdStz8ZwJQ4Y+k
	 FZNw03jvKovqWBvyWL4OI5zeN0RKSlMhteBJlECKPFH7MbZ6evjWC2pboPeMY06anI
	 HqWmJHIkkP8tg==
Message-ID: <sashiko-outbox-198601@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/6] remoteproc: amd_mbv_bram: Add RPMsg support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ben Levinsky" <ben.levinsky@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105051902.1646651-7-ben.levinsky@amd.com>
References: <20261105051902.1646651-1-ben.levinsky@amd.com>
 <20261105051902.1646651-7-ben.levinsky@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 05:39:57 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] remoteproc: amd_mbv_bram: active mailboxes in amd_bram_rproc_stop(=
) race
- [Medium] remoteproc: amd_mbv_bram: leak of carveouts on amd_bram_rproc_pr=
epare() error
- [Medium] remoteproc: amd_mbv_bram: unmapped vdev0buffer added to coredump=
 segments
--

commit 65a1b80207879c4cf9d647ab712871d29690bd39
Author: Ben Levinsky <ben.levinsky@amd.com>

remoteproc: amd_mbv_bram: Add RPMsg support

This commit adds RPMsg support to the AMD MicroBlaze/V BRAM remoteproc
driver by registering reserved-memory carveouts, exposing the loaded
resource table, and using the mailbox framework for virtqueue kicks and
notifications.

> diff --git a/drivers/remoteproc/amd_mbv_bram_rproc.c b/drivers/remoteproc=
/amd_mbv_bram_rproc.c
> index da621f62f7df5..9c2694fd645a6 100644
> --- a/drivers/remoteproc/amd_mbv_bram_rproc.c
> +++ b/drivers/remoteproc/amd_mbv_bram_rproc.c

[ ... ]

> +static void amd_bram_rproc_release_mboxes(void *data)
> +{
> +	struct amd_bram_rproc *priv =3D data;
> +
> +	/*
> +	 * Free the channels before cancelling the receive work. RX channel
> +	 * shutdown disables the controller interrupt synchronously, so no
> +	 * notification can queue the work again once it has been cancelled.
> +	 */
> +	amd_bram_rproc_free_mboxes(priv);
> +	cancel_work_sync(&priv->rx_work);
> +}
> +
> +static int amd_bram_rproc_add_reserved_mem(struct rproc *rproc)
> +{
> +	struct amd_bram_rproc *priv =3D rproc->priv;
> +	struct device_node *np =3D priv->dev->of_node;
> +	struct rproc_mem_entry *mem;
> +	int count;
> +	int ret;
> +	int i;
> +
> +	if (!of_property_present(np, "memory-region"))
> +		return 0;
> +
> +	count =3D of_reserved_mem_region_count(np);
> +	if (count < 0)
> +		return count;
> +
> +	for (i =3D 0; i < count; i++) {
> +		struct resource res;
> +		const char *name;
> +
> +		ret =3D of_property_read_string_index(np, "memory-region-names",
> +						    i, &name);
> +		if (ret)
> +			return dev_err_probe(priv->dev, ret,
> +					     "failed to read memory-region name %d\n",
> +					     i);
> +
> +		ret =3D of_reserved_mem_region_to_resource(np, i, &res);
> +		if (ret)
> +			return dev_err_probe(priv->dev, ret,
> +					     "failed to parse memory-region %d\n", i);
> +
> +		if (!strcmp(name, "vdev0buffer"))
> +			mem =3D rproc_of_resm_mem_entry_init(priv->dev, i,
> +							   resource_size(&res),
> +							   res.start, name);
> +		else
> +			mem =3D rproc_mem_entry_init(priv->dev, NULL,
> +						   (dma_addr_t)res.start,
> +						   resource_size(&res), res.start,
> +						   rproc_mem_entry_ioremap_wc,
> +						   rproc_mem_entry_iounmap,
> +						   "%s", name);
> +		if (!mem)
> +			return -ENOMEM;
> +
> +		rproc_add_carveout(rproc, mem);
> +		rproc_coredump_add_segment(rproc, res.start, resource_size(&res));

[Severity: Medium]
Should vdev0buffer be excluded from rproc_coredump_add_segment() in
amd_bram_rproc_add_reserved_mem()?

When name is "vdev0buffer", the entry is initialized with
rproc_of_resm_mem_entry_init(), which leaves mem->alloc and mem->va as
NULL. During boot, rproc_alloc_registered_carveouts() only allocates
entries with an alloc callback, and rproc_add_virtio_dev() attaches the
reserved memory region to the child virtio device without setting mem->va.

Because amd_bram_rproc_ops does not provide a custom da_to_va callback,
rproc_coredump() -> rproc_copy_segment() -> rproc_da_to_va() skips any
carveout with a NULL va, logs an invalid copy request error, and fills the
vdev0buffer coredump segment with 0xff bytes.

> +		dev_dbg(priv->dev, "reserved memory carveout %pR\n", &res);
> +	}
> +
> +	return 0;
> +}
> +
>  static int amd_bram_rproc_prepare(struct rproc *rproc)
>  {
>  	struct amd_bram_rproc *priv =3D rproc->priv;
> @@ -80,7 +292,7 @@ static int amd_bram_rproc_prepare(struct rproc *rproc)
>  	rproc_add_carveout(rproc, mem);
>  	rproc_coredump_add_segment(rproc, da, resource_size(&res));
> =20
> -	return 0;
> +	return amd_bram_rproc_add_reserved_mem(rproc);
>  }

[Severity: Medium]
As reported by Sashiko on v1 [1], if amd_bram_rproc_add_reserved_mem()
fails in amd_bram_rproc_prepare(), does this leak the struct
rproc_mem_entry and struct rproc_dump_segment entries already added to
rproc->carveouts and rproc->dump_segments?

In amd_bram_rproc_prepare(), the executable BRAM carveout and coredump
segment are queued onto rproc->carveouts and rproc->dump_segments before
calling amd_bram_rproc_add_reserved_mem(), which also queues entries in a
loop over memory-region.

In drivers/remoteproc/remoteproc_core.c, when rproc_prepare_device() fails
in rproc_fw_boot(), execution jumps directly to disable_iommu and bypasses
clean_up_resources and rproc_resource_cleanup():

drivers/remoteproc/remoteproc_core.c:rproc_fw_boot() {
    ...
	ret =3D rproc_prepare_device(rproc);
	if (ret) {
		dev_err(dev, "can't prepare rproc %s: %d\n", rproc->name, ret);
		goto disable_iommu;
	}
    ...
}

If amd_bram_rproc_add_reserved_mem() fails at of_reserved_mem_region_count(=
),
of_property_read_string_index(), of_reserved_mem_region_to_resource(), or
carveout allocation, those queued entries remain on rproc->carveouts and
rproc->dump_segments, causing duplicate entries on subsequent rproc_boot()
calls and leaking them if the device is unbound while offline.

>  static int amd_bram_rproc_start(struct rproc *rproc)
> @@ -133,6 +345,9 @@ static int amd_bram_rproc_stop(struct rproc *rproc)
>  		dev_err(priv->dev, "failed to assert reset: %d\n", ret);
>  		return ret;
>  	}
> +	cancel_work_sync(&priv->rx_work);
> +	bitmap_zero(priv->pending_notify_ids,
> +		    ARRAY_SIZE(priv->notify_msgs));

[Severity: High]
As reported by Sashiko on v1 [2], since priv->rx_chan and priv->tx_chan
stay active across amd_bram_rproc_stop(), can amd_bram_rproc_rx_callback()
still fire during or after amd_bram_rproc_stop() and re-queue priv->rx_work?

As the comment in amd_bram_rproc_release_mboxes() notes, shutting down the
mailbox channels disables the controller interrupt synchronously and resets
the hardware FIFOs. Because amd_bram_rproc_stop() keeps the channels open,
any notification words still in the hardware RX FIFO or threaded IRQ handler
(amd_pl_mbox_irq_thread() -> amd_pl_mbox_rx() -> mbox_chan_received_data()
-> amd_bram_rproc_rx_callback()) can race with the non-atomic bitmap_zero()
and call schedule_work(&priv->rx_work) after cancel_work_sync() returns.

That allows amd_bram_rproc_rx_work() -> rproc_vq_interrupt() to run
concurrently with __rproc_shutdown() -> rproc_resource_cleanup() ->
rproc_free_vring() as the virtqueues and notify IDs are torn down.

Keeping priv->tx_chan active across stop also leaves any unread kick word in
the hardware TX FIFO while the remote processor is held in reset with its
clock disabled, causing the mailbox core hrtimer to poll last_tx_done every
1 ms while offline and deliver a stale kick on the next start, and loses PL
Mailbox register state across partial reconfiguration (DFX).

[1] https://lore.kernel.org/r/20261014213426.2957480-7-ben.levinsky@amd.com
[2] https://lore.kernel.org/r/20261014213426.2957480-7-ben.levinsky@amd.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105051902.1646=
651-1-ben.levinsky@amd.com?part=3D6
