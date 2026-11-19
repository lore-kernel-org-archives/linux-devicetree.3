Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795126750;
	b=IdNtPm8Qdz+pYzXFA6KzBph2ZiF7FrmMbeT6P4p3jXshkJvLJRjl4Oo1UZQGdRJGp5bP
	 N+jEGbYJBn4ni2QW+JmG6FNRMlpuc05lBG30YVXcFYpAw+x4Bx1+VVt4P37S9Edknpb1A
	 JIHMqEkXdqyEcyU/6Y0gQUAudvFmsU4PJEnWkNi5SfevQ2p7hklCuxvNi0UN+HA2Wm8rX
	 TzMRe0u56zjls/S3v5UNS1ckursLRL1oUYUxVe6NUYyLhaV0hYLY7fonYyoMBOD7teuCQ
	 OAPcJYH1ntH12woxCp5IBBzPH/nV4goMKYHm1uCm8zzXPxf2+ci784ke36y+BLiZthg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126750;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CRBgbEvoStIBeTJMkdDKxM7dcdg5DC//sc8bR0dB7Hk=;
	b=PmyLdoaSWfDd6Xv8h4EQfNwrMw3yEG1JjVAEddaFJU5QZc/A9EiB3IZP/1EWzVj5gFl6
	 OxWZV/oWYfCw8Zbhso5MGqc+v+INbb1RLnlCl0ANugJGf6qLnUFTZWsYFakufg4drI1Rk
	 eI2GZ//aIIt7XZCNBQjRsJcpXkOD+4SpzG8DW4fSJAfmtawLEs3kMN1oe2dxZAQX2He5/
	 knP+AQpxxYFS2sxhMLYTBpKObBNqAfQxz0hkqPR9E5rOUZMtl7aBp3HPibwI7zf26Kofw
	 fVipEMyVxxZuxwEjbE02qRIvXv5hjlRrQOcPrrzdeeK2BI2ZKiloH0Two47/gOwJrcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nTl3X2DJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36FD606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 22:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nTl3X2DJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3CD1F000C0;
	Thu, 19 Nov 2026 22:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795126749;
	bh=CRBgbEvoStIBeTJMkdDKxM7dcdg5DC//sc8bR0dB7Hk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nTl3X2DJpt959Vyy7KS15u9sxwfA8zo55CFfZ8JROPXYsc/0MHcfxExOlsm0DE691
	 Ut54ztmLLF0ZlLnbAJka7s0iJ2+LxEmNjFq3ZTQce/gydntMMDvfC3sq2GKCmeu0Wb
	 h2UJUcmsDpqtER6znUofW/0KO2n5kjKajo4z7rY8bq5EiKRn3al+xPn+OoZLh+FD12
	 Hc4IoNhaEqvMf+LdkkX1A/x1cYp0cPq7JyiRKlCpiimwtL5g4jHdy/tvxofZMjGT3h
	 ifRyzUuzQ+CYuXDDQWim3153qdfY7ZAxM13xX4gdyrr4Erdds3DK/j3ZG4c3ftWXOt
	 UdpE5NRorjmqA==
Message-ID: <sashiko-outbox-224128@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] remoteproc: amd_mbv_bram: Add RPMsg support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ben Levinsky" <ben.levinsky@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119220405.2838553-5-ben.levinsky@amd.com>
References: <20261119220405.2838553-1-ben.levinsky@amd.com>
 <20261119220405.2838553-5-ben.levinsky@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 22:19:09 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] remoteproc: amd_mbv_bram: active mailboxes in
  amd_bram_rproc_stop() race
- [Medium] remoteproc: amd_mbv_bram: unmapped vdev0buffer added to
  coredump segments
- [Medium] remoteproc: amd_mbv_bram: leaked carveouts on
  amd_bram_rproc_prepare() error
- [Low] remoteproc: amd_mbv_bram: dev_err_probe() used outside probe in
  prepare path
--

commit 8f91a29d9a83c18ff06a14340aaa60590fc44b4c
Author: Ben Levinsky <ben.levinsky@amd.com>

remoteproc: amd_mbv_bram: Add RPMsg support

This commit adds optional RPMsg support to the AMD MicroBlaze/V BRAM
remoteproc driver using mailbox channels for virtqueue notifications and
reserved memory regions for vrings and buffers.

> diff --git a/drivers/remoteproc/amd_mbv_bram_rproc.c b/drivers/remoteproc=
/amd_mbv_bram_rproc.c
> index e4a103cf84558..0b54a6cc3e62b 100644
> --- a/drivers/remoteproc/amd_mbv_bram_rproc.c
> +++ b/drivers/remoteproc/amd_mbv_bram_rproc.c
[ ... ]
> @@ -31,13 +36,266 @@
[ ... ]
> +static int amd_bram_rproc_get_reserved_mem(struct amd_bram_rproc *priv, =
int i,
> +					   const char **name,
> +					   struct resource *res)
> +{
> +	struct device_node *np =3D priv->dev->of_node;
> +	int ret;
> +
> +	ret =3D of_property_read_string_index(np, "memory-region-names", i, nam=
e);
> +	if (ret)
> +		return dev_err_probe(priv->dev, ret,
> +				     "failed to read memory-region name %d\n", i);
> +
> +	ret =3D of_reserved_mem_region_to_resource(np, i, res);
> +	if (ret)
> +		return dev_err_probe(priv->dev, ret,
> +				     "failed to parse memory-region %d\n", i);
> +
> +	/* The remote uses the physical address as device address. */
> +	if (res->end > U32_MAX)
> +		return dev_err_probe(priv->dev, -EINVAL,
> +				     "memory-region %d %pR is above 4 GiB\n",
> +				     i, res);
> +
> +	return 0;
> +}

[Severity: Low]
Should amd_bram_rproc_get_reserved_mem() use dev_err() instead of
dev_err_probe()?  This helper is only called from amd_bram_rproc_prepare()
when booting the remote processor, never during probe.

[ ... ]

> +static int amd_bram_rproc_add_reserved_mem(struct rproc *rproc)
> +{
> +	struct amd_bram_rproc *priv =3D rproc->priv;
> +	struct rproc_mem_entry *mem;
> +	int count;
> +	int ret;
> +	int i;
> +
> +	count =3D amd_bram_rproc_reserved_mem_count(priv);
> +	if (count < 0)
> +		return count;
> +
> +	for (i =3D 0; i < count; i++) {
> +		struct resource res;
> +		const char *name;
> +
> +		ret =3D amd_bram_rproc_get_reserved_mem(priv, i, &name, &res);
> +		if (ret)
> +			return ret;
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
Should the vdev0buffer region be excluded from
rproc_coredump_add_segment()?

rproc_of_resm_mem_entry_init() leaves mem->va and mem->alloc NULL because
vdev0buffer is attached to the child virtio device as a DMA pool rather
than mapped as a carveout.  During coredump collection, rproc_copy_segment()
calls rproc_da_to_va(), which skips carveouts with a NULL va, logs an
invalid copy request error, and fills the vdev0buffer segment in the dump
with 0xff.

> +		dev_dbg(priv->dev, "reserved memory carveout %pR\n", &res);
> +	}
> +
> +	return 0;
> +}
> +
>  static int amd_bram_rproc_prepare(struct rproc *rproc)
>  {
[ ... ]
> @@ -68,6 +326,10 @@ static int amd_bram_rproc_prepare(struct rproc *rproc)
>  		return ret;
>  	}
> =20
> +	ret =3D amd_bram_rproc_check_reserved_mem(priv);
> +	if (ret)
> +		return ret;
> +
>  	mem =3D rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
>  				   resource_size(&res), da,
>  				   rproc_mem_entry_ioremap_wc,
> @@ -79,7 +341,7 @@ static int amd_bram_rproc_prepare(struct rproc *rproc)
>  	rproc_add_carveout(rproc, mem);
>  	rproc_coredump_add_segment(rproc, da, resource_size(&res));
> =20
> -	return 0;
> +	return amd_bram_rproc_add_reserved_mem(rproc);
>  }

[Severity: Medium]
Does an allocation failure in amd_bram_rproc_add_reserved_mem() leave the
already-added carveouts and coredump segments on rproc->carveouts and
rproc->dump_segments?

When rproc_prepare_device() fails in rproc_fw_boot(), it jumps to
disable_iommu without calling rproc_resource_cleanup().  Any entries linked
before the failure remain on the lists, causing duplicate carveouts and
dump segments on subsequent boot attempts or leaking them if the device is
unbound while offline.  Also, the return value of
rproc_coredump_add_segment() is not checked here or in
amd_bram_rproc_add_reserved_mem().

> @@ -116,6 +378,9 @@ static int amd_bram_rproc_stop(struct rproc *rproc)
>  		dev_err(priv->dev, "failed to assert reset: %d\n", ret);
>  		return ret;
>  	}
> +	cancel_work_sync(&priv->rx_work);
> +	bitmap_zero(priv->pending_notify_ids,
> +		    ARRAY_SIZE(priv->notify_msgs));

[Severity: High]
Can a late mailbox RX interrupt race with amd_bram_rproc_stop() while
priv->rx_chan and priv->tx_chan stay active across stop?

CPU0                              CPU1
amd_bram_rproc_stop()
  gpiod_set_value_cansleep(..., 1)
  cancel_work_sync(&priv->rx_work)
                                  amd_pl_mbox_irq_thread()
                                    amd_bram_rproc_rx_callback()
                                      set_bit(..., pending_notify_ids)
  bitmap_zero(pending_notify_ids)
                                      schedule_work(&priv->rx_work)
rproc_resource_cleanup()
  rproc_free_vring()
                                  amd_bram_rproc_rx_work()
                                    rproc_vq_interrupt()  <-- races teardown

Because the mailbox channels are requested at probe time and only shut
down on device unbind, RX interrupts remain enabled and any word already in
the hardware RX FIFO when reset is asserted can still trigger
amd_bram_rproc_rx_callback().  On the TX side, if the remote processor stops
before draining a kick word from the hardware FIFO, the channel's active
request never completes, leaving the mailbox core hrtimer polling while
the processor is offline and delivering a stale notification on the next
boot.  Requesting the mailbox channels in .start() and freeing them in
.stop() would synchronously disable the RX IRQ and reset both hardware
FIFOs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119220405.2838=
553-1-ben.levinsky@amd.com?part=3D4
