Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792651228;
	b=fUtbc9q+oflOEBo1Yji1/lNjv5PFvrFN5a8wkbb1Rp+kWko3BuKlvS9OPqaOrbrY8YlE
	 1gRUUo6JEwFGvkFymtWbBeyGFpT6KCEPimVtALUWy9Zn60uRaFDesMGVyTvcCQOQdyTB/
	 dgz6PwpgVlUeNhN7wwhibds0omr68KE+LZj7b3g3TgG+2nMga+3FxX4t8Rbk4gd4syvUU
	 88lKkHmOC37kRysM0jxQA+sOvrFRCz2cScnbKA6WRgY19n+2bFi3AUE+qIS4cCtxNvyCL
	 rB2SnehqYZ1wOveKbOOaYuU7rxixVL+f6a/0O4YDiP6KDJuLx5WcEM39UITRyWj9A9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792651228;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xrsiDyD8/XqQ3O9wxgnTD9m6J/vqe/KE1Vwj0PrYE9w=;
	b=IUFk5iO+eTPr87Y2TCXz3RPcDJCMVRNZie3JQhY2wlHaQDFo0Z1smknD9ropyABQWw4i
	 MXMN055VO+rbBeIOBadNqBdKIjgN2EovNb2s2F+7Jh0XY1z0+3whaSd3EG21umQBa/yhi
	 bdTI2hfbSoENInh6jEekfJ/CNaT0g8PQeNHjH6EkbMDK+pJLdus8wsWTJeXo8nSiUJs4i
	 48LEk0UkCmwVStT7toWNGDIRWuj+8vsavvlXefTi7P5VTStOxdy5IJHusNqNq1Y3Uc21w
	 P3j4S5blXy2kvrBIKpt/iLKFDcEKlehcc+wBzvnJ7qXIK+AGJ/VzVCfbcVO1ZjExsyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Igerg0C5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F065B606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 06:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Igerg0C5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 991DF1F000C1;
	Thu, 22 Oct 2026 06:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792651227;
	bh=xrsiDyD8/XqQ3O9wxgnTD9m6J/vqe/KE1Vwj0PrYE9w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Igerg0C54GbcyY2mZvYQ/K37U8Ms0xjbgadwkYFYgUZD5VYjiN1uiRbT63bQtSOWy
	 NYAL9iaME8pH6uLzF5nPAjRH/mnFQIIjeHY09ajepw5gfq2nWVQ6doXvXso9IokKcF
	 zQ3zzsDEXSfretvj+7efW7e3o9nru1EOu66ApbW5zE6ZyCaQs10ulM/lU6FQjlcRsA
	 5TrGWdzoW00mbVmJ59UJJrbXB61yGvMoNgL1cXnNSB79MsBs6Aaaw+eW2HfdCx7lMp
	 mpZPPpnlu3lcfY/raDotg1q2H4fe6bv6ilVNmhT1uW83bMCS5CP9g41LkwfC9za26L
	 AuIt//TzY7n1g==
Message-ID: <sashiko-outbox-181101@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 2/2] net: wwan: qcom_bam_dmux: Assign
 restricted DMA pool to remote processor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Santhosh" <vishnu.santhosh@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261021-qcom-bam-dmux-vmid-ext-v3-2-cedd1f681102@oss.qualcomm.com>
References: <20261021-qcom-bam-dmux-vmid-ext-v3-0-cedd1f681102@oss.qualcomm.com>
 <20261021-qcom-bam-dmux-vmid-ext-v3-2-cedd1f681102@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 06:40:27 +0000
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
- [High] net: wwan: qcom_bam_dmux: race on remote_suspended in bam_dmux_rem=
ove()
- [High] net: wwan: qcom_bam_dmux: UAF on register_netdev_work in bam_dmux_=
remove()
--

commit 122841a576cc339cc33ba7e25a1af2d9d591b2cb
Author: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

net: wwan: qcom_bam_dmux: Assign restricted DMA pool to remote processor

This commit adds support for assigning a restricted DMA pool to both the
local and remote execution environments via SCM when qcom,vmid is present,
and reclaiming the pool for the local environment during probe failure or
driver removal if the remote processor has suspended.

> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam=
_dmux.c
> index cc6ace8d64371..fa3621224a56e 100644
> --- a/drivers/net/wwan/qcom_bam_dmux.c
> +++ b/drivers/net/wwan/qcom_bam_dmux.c
[ ... ]
> @@ -829,8 +929,11 @@ static int bam_dmux_probe(struct platform_device *pd=
ev)
> =20
>  	ret =3D irq_get_irqchip_state(dmux->pc_irq, IRQCHIP_STATE_LINE_LEVEL,
>  				    &dmux->pc_state);
> -	if (ret)
> -		goto err_disable_pm;
> +	if (ret) {
> +		/* The PC IRQ may already have powered up the RX path */
> +		bam_dmux_remove(pdev);
> +		return ret;
> +	}

[Severity: High]
When irq_get_irqchip_state() fails in bam_dmux_probe() in
drivers/net/wwan/qcom_bam_dmux.c (or during normal driver removal),
calling bam_dmux_remove() cancels register_netdev_work and unregisters
existing netdevs while dmux->pc_irq and the RX DMA channel can still be
active:

drivers/net/wwan/qcom_bam_dmux.c:bam_dmux_remove() {
	/* Unregister network interfaces */
	cancel_work_sync(&dmux->register_netdev_work);
	rtnl_lock();
	for (i =3D 0; i < BAM_DMUX_NUM_CH; ++i)
		if (dmux->netdevs[i])
			unregister_netdevice_queue(dmux->netdevs[i], &list);
	unregister_netdevice_many(&list);
	rtnl_unlock();
	...
	/* Try to wait for remote side to drop power vote */
	remote_suspended =3D wait_event_timeout(dmux->pc_wait, !dmux->rx,
					      BAM_DMUX_REMOTE_TIMEOUT);
	...
	/* Make sure everything is cleaned up before we return */
	disable_irq(dmux->pc_irq);
	bam_dmux_power_off(dmux);
}

While bam_dmux_remove() is waiting in wait_event_timeout(), incoming
BAM_DMUX_CMD_OPEN packets on the active RX DMA path invoke
bam_dmux_rx_callback() -> bam_dmux_cmd_open(), which schedules
dmux->register_netdev_work again:

drivers/net/wwan/qcom_bam_dmux.c:bam_dmux_cmd_open() {
	if (netdev) {
		netif_device_attach(netdev);
	} else {
		/* Cannot sleep here, schedule work to register the netdev */
		schedule_work(&dmux->register_netdev_work);
	}
}

Because register_netdev_work is not canceled and netdevs are not
unregistered after disable_irq() and bam_dmux_power_off() stop the IRQ
and RX DMA, can bam_dmux_register_netdev_work() run after
bam_dmux_remove() returns, causing a use-after-free on the devm-allocated
struct bam_dmux or leaving registered net_device instances pointing to
freed memory?

[ ... ]
> @@ -853,6 +957,7 @@ static void bam_dmux_remove(struct platform_device *p=
dev)
>  	struct bam_dmux *dmux =3D platform_get_drvdata(pdev);
>  	struct device *dev =3D dmux->dev;
>  	LIST_HEAD(list);
> +	bool remote_suspended;
>  	int i;
> =20
>  	/* Unregister network interfaces */
> @@ -872,13 +977,21 @@ static void bam_dmux_remove(struct platform_device =
*pdev)
>  	pm_runtime_set_suspended(dev);
> =20
>  	/* Try to wait for remote side to drop power vote */
> -	if (!wait_event_timeout(dmux->pc_wait, !dmux->rx, BAM_DMUX_REMOTE_TIMEO=
UT))
> +	remote_suspended =3D wait_event_timeout(dmux->pc_wait, !dmux->rx,
> +					      BAM_DMUX_REMOTE_TIMEOUT);
> +	if (!remote_suspended)
>  		dev_err(dev, "Timed out waiting for remote side to suspend\n");
> =20
>  	/* Make sure everything is cleaned up before we return */
>  	disable_irq(dmux->pc_irq);
>  	bam_dmux_power_off(dmux);
>  	bam_dmux_free_skbs(dmux->tx_skbs, DMA_TO_DEVICE);
> +
> +	/* The remote side may still access the pool if it did not suspend */
> +	if (remote_suspended)
> +		bam_dmux_reclaim_dma_pool(dmux);
> +	else if (dmux->dma_pool_perms)
> +		dev_warn(dev, "Leaving restricted DMA pool assigned to remote\n");
>  }

[Severity: High]
In bam_dmux_remove() in drivers/net/wwan/qcom_bam_dmux.c,
remote_suspended is sampled from wait_event_timeout(dmux->pc_wait,
!dmux->rx, BAM_DMUX_REMOTE_TIMEOUT) before disable_irq(dmux->pc_irq)
synchronizes with the threaded handler bam_dmux_pc_irq():

drivers/net/wwan/qcom_bam_dmux.c:bam_dmux_pc_irq() {
	if (new_state) {
		if (bam_dmux_power_on(dmux))
			bam_dmux_pc_ack(dmux);
		else
			bam_dmux_power_off(dmux);
	} else {
		bam_dmux_power_off(dmux);
		bam_dmux_pc_ack(dmux);
	}

	dmux->pc_state =3D new_state;
	wake_up_all(&dmux->pc_wait);
}

If dmux->rx is NULL when wait_event_timeout() checks !dmux->rx (for
example, if bam_dmux_pc_irq() was just triggered during the
bam_dmux_probe() error path or during removal and has not yet set
dmux->rx in bam_dmux_power_on()), wait_event_timeout() returns
immediately with remote_suspended set to true.

Before disable_irq(dmux->pc_irq) finishes waiting for the running IRQ
thread, bam_dmux_pc_irq() can complete bam_dmux_power_on(dmux) and send
bam_dmux_pc_ack(dmux) to the remote processor. Then bam_dmux_power_off()
tears down dmux->rx locally without a remote power-down handshake, and
bam_dmux_remove() still sees the stale remote_suspended =3D=3D true and cal=
ls
bam_dmux_reclaim_dma_pool(dmux) while the remote side is active.

Conversely, if wait_event_timeout() times out while bam_dmux_pc_irq() is
in the middle of handling a remote power-down edge, disable_irq() waits
for bam_dmux_pc_irq() to finish calling bam_dmux_power_off() and
bam_dmux_pc_ack(), but remote_suspended remains false and the DMA pool
is never reclaimed.

Should remote_suspended be re-evaluated (for example, checking !dmux->rx)
after disable_irq(dmux->pc_irq) returns and before bam_dmux_power_off()
clears dmux->rx?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-qcom-bam-d=
mux-vmid-ext-v3-0-cedd1f681102@oss.qualcomm.com?part=3D2
