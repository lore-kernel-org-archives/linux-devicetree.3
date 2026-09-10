Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3D238C42F
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 17:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789061515; cv=none; b=IMUZWenSjNOVcfmtZHIpkpj+h68HzuxzBzX2EGZGn0eWSLt+ZHeSSNC1kov60sBjykGhidVoJXjJnCQ+igrO3V8vxf4GT6hzQ6LVQsMFrYW7TMAEGx8OteIndzLqCBc6PNFr7N7C++uoKTws9MH+ePsF42EcQf2e0lK/2MTLdj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789061515; c=relaxed/simple;
	bh=EkXhhvt1FF7vJqN8uMHTVfCgY30uBfz6gx59WdHM678=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sir49s15lbqyvobFgr8vZuEJBwjj59HXvLqQ7a71RPcBKx5rrvy7qc/9w3Vv46Ajpi0ek+KN/iB6rohWb3S9NjtDtnlZFfblH2hQ+sNzvzakmvsCQO0Hq+0ByQ6LmMVKmiGF+3qDbzLnT17k3Ja5XpYKxNmQ269pw4gQbb121hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bs6GHrQ3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bs6GHrQ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11AE81F000FF;
	Thu, 10 Sep 2026 17:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789061501;
	bh=BA8PXdvrMm2/LT2zxubx9rOR8pWb5CqbauLvZQ9vNDU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bs6GHrQ3Zq64Mr5rMap2YjO1Wqq5CLuaD5xS6zOsfLoblUKg+blpd4QdZIiyO0XSp
	 MVt+PXTXVTfhfgxuleNgoj2VqdG9QcArJVBxOAvQJRwGX4FpALK0BWPhZrsuhdts1S
	 33ule1ZYsFUoC96Xe0Z1oBMjdgMqj6ye7NzLgOeoB2R9mVUf8SdOp9shsRzeAZizpM
	 A5McPt1pOR4Ghmn/i3/4TdZyBIkMGkjelOHRuNBG9hlGkKyWaKaYsmaXQLivzLdJwu
	 IqgT5cwC9gs5gjIEQXazTxnLq6o/oCDSCz8lJlypU0oj5yBNWSXls79NuNAdJIs08v
	 JQVF9ICNQp/OA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 03/10] net: ethernet: ravb: Simplify gPTP
 start and stop
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: devicetree@vger.kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org
In-Reply-To: <20260909173027.2201560-4-niklas.soderlund+renesas@ragnatech.se>
References: <20260909173027.2201560-1-niklas.soderlund+renesas@ragnatech.se>
 <20260909173027.2201560-4-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 17:31:40 +0000
Message-Id: <20260910173141.11AE81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Critical] For gptp devices, early returns in ravb_stop_dma() skip stoppi=
ng the PTP clock, leading to Use-After-Free in ravb_close().
- [High] Missing PTP clock cleanup on ravb_open() error path for ccc_gac de=
vices.
- [Medium] PTP clock remains permanently stopped if ravb_stop_dma() fails l=
ate during TX timeout recovery.

Pre-existing issues:
- [High] Missing NAPI synchronization before freeing DMA rings can lead to =
concurrent access.
--

commit cfbb6c5f1a7c830cb10526b29bb3646d146532ea
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
Subject: net: ethernet: ravb: Simplify gPTP start and stop

The patch simplifies the start and stop of gPTP clocks for Gen2 (gptp-flag)
and Gen3 (ccc_gac) devices. It ties Gen2's PTP clock to the AVB-DMAC start
and stop, while Gen3's PTP clock remains controlled on interface open/close.

> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ether=
net/renesas/ravb_main.c
> index a89f6fe7866fe..2d0022a4f85c3 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c

[ ... ]

> @@ -1115,6 +1123,10 @@ static int ravb_stop_dma(struct net_device *ndev)
>  			netdev_err(ndev, "failed to stop AXI BUS\n");
>  	}
> =20
> +	/* Stop PTP Clock driver */
> +	if (info->gptp)
> +		ravb_ptp_stop(ndev);
> +

[Severity: Critical]
Could moving the PTP clock stop to the end of ravb_stop_dma() introduce a u=
se-after-free
if there is a hardware timeout?

ravb_stop_dma() contains multiple early returns if ravb_wait() times out:

static int ravb_stop_dma(struct net_device *ndev)
{
	...
	/* Wait for stopping the hardware TX process */
	error =3D ravb_wait(ndev, TCCR, info->tccr_mask, 0);
	if (error)
		return error;
	...

If one of these early returns is taken, the new ravb_ptp_stop() call is byp=
assed.

Later, during device teardown, ravb_close() ignores errors from ravb_stop_d=
ma():

	/* Set the config mode to stop the AVB-DMAC's processes */
	if (ravb_stop_dma(ndev) < 0)
		netdev_err(ndev,
			   "device will be stopped after h/w processes are done.\n");
	/* Clear the timestamp list */

Since ravb_close() continues and frees the device structures, what happens =
if the PTP clock
was bypassed and remains registered? It appears subsequent ioctls to /dev/p=
tpX
could dereference the freed pointer.

>  	/* Stop AVB-DMAC process */
>  	return ravb_set_opmode(ndev, CCC_OPC_CONFIG);
>  }

[ ... ]

> @@ -1719,9 +1731,7 @@ static int ravb_set_ringparam(struct net_device *nd=
ev,
> =20
>  	if (netif_running(ndev)) {
>  		netif_device_detach(ndev);
> -		/* Stop PTP Clock driver */
> -		if (info->gptp)
> -			ravb_ptp_stop(ndev);
> +
>  		/* Wait for DMA stopping */
>  		error =3D ravb_stop_dma(ndev);

[Severity: High]
This isn't a bug introduced by this patch, but does freeing the rings here =
race
with NAPI polling?

Just after this block in ravb_set_ringparam(), the code frees the DMA buffe=
rs
without disabling NAPI:

		synchronize_irq(ndev->irq);

		/* Free all the skb's in the RX queue and the DMA buffers. */
		ravb_ring_free(ndev, RAVB_BE);

Since synchronize_irq() only waits for hard IRQ handlers to finish, a NAPI =
poll
could execute concurrently on another CPU while the rings are being freed.
Would it be better to call napi_disable() before freeing the resources?

[ ... ]

> @@ -1974,9 +1980,6 @@ static int ravb_open(struct net_device *ndev)
>  	return 0;
> =20
>  out_ptp_stop:
> -	/* Stop PTP Clock driver */
> -	if (info->gptp || info->ccc_gac)
> -		ravb_ptp_stop(ndev);
>  	ravb_stop_dma(ndev);
>  out_set_reset:

[Severity: High]
Is there a resource leak of the PTP clock for ccc_gac devices when removing=
 this
explicit cleanup?

If ravb_open() fails during ravb_phy_start() on a device with the ccc_gac f=
lag,
it jumps to the out_ptp_stop label. With this patch, the cleanup relies ent=
irely
on ravb_stop_dma().

However, ravb_stop_dma() only stops the PTP clock if info->gptp is true. Si=
nce
info->gptp and info->ccc_gac are mutually exclusive, it seems the PTP clock=
 will
remain registered when initialization fails for ccc_gac devices.

[ ... ]

> @@ -2056,10 +2055,6 @@ static void ravb_tx_timeout_work(struct work_struc=
t *work)
>  	ravb_emac_init(ndev);
> =20
>  out:
> -	/* Initialise PTP Clock driver */
> -	if (info->gptp)
> -		ravb_ptp_init(ndev, priv->pdev);
> -

[Severity: Medium]
Will the PTP clock become permanently disabled here if ravb_stop_dma() fails
late during timeout recovery?

If ravb_stop_dma() fails during its final ravb_set_opmode() call, it returns
an error after it has already stopped the PTP clock.

In ravb_tx_timeout_work(), this failure causes a jump directly to the out l=
abel:

	if (ravb_stop_dma(ndev)) {
		ravb_rcv_snd_enable(ndev);
		goto out;
	}

Because ravb_ptp_init() has been removed from the out label, the PTP clock
will remain stopped even though the device resumes passing traffic.

>  	netif_tx_start_all_queues(ndev);
> =20
>  out_unlock:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909173027.2201=
560-1-niklas.soderlund+renesas@ragnatech.se?part=3D3
