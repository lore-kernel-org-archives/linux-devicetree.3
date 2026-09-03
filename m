Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4B13E0082
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 08:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425280; cv=none; b=bD+yy4x1ms1i5cNHbfGD3q5fusSRU/TMx4GEOBCLMhlX5plba/s/PqxDs0LwF7i39qERCmxX8tOF3KYEqrDzug6c/Eky+TqDwbsidpvuzpowtQGbCc9T9761HbyFQWMoFSIO1AgzRO21xU94IJ9cI7a7GR7avny66NLc9ntuaKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425280; c=relaxed/simple;
	bh=g9VuakgFtoG9HrXzxAdc9EwHdkbtdpanwXW5/9yMlUw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rYPvCm5+5wefx/gU8XKKRKqtKVSFtp3NzizCmw5OCrIskSZ4Wm2sOdem93QsfnFd8HJY+6Y0RPPydi5NxODr3G8PNHxynldj9pBfGmXmaxLo5xWl787EjHKepTvdnbKEz0yDLYz1iLAdkGHX8NV/8MQBbaqt0/6yeNVGDsGmQr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CVLCZpCr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CVLCZpCr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E74B1F00A3E;
	Thu,  3 Sep 2026 08:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788425277;
	bh=wQD1pNA5rrjZtozjTXZlexxd+P5yK4ndBoMbq+DYtLw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CVLCZpCrVkkIRbo6PMvLxFc74X6bLMf08jVuVOsofaWZA1dUx1qlbz9rsKBm5EkpC
	 hoVRKRwJWoMfGrukoN+MoylsdQZvPtIRTScsmf1gC1/iPAQ37gn246ipGJ2gcoan5F
	 sB0d8oCXW6eoZ9Eo3kKHfkIurjY0KPEKkT5cqJOWNpwwlVTaDQUXs9YHpZfMHURZsn
	 Lul5mXYCWaRSbtiHWDaZyzqu5Mk2T67KF2k6xsnqIsJ0pNAcWdJ3lr62Fmbiayb6X6
	 uCl7604VpCcPSGLmDAOXSbwfXSg5dFfYgKMY6bQSrfnAhjlOaVH69mp0cPcuITjpx9
	 78kB6A4BvRTcQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 03/10] net: ethernet: ravb: Simplify gPTP
 start and stop
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org
In-Reply-To: <20260902084703.3228504-4-niklas.soderlund+renesas@ragnatech.se>
References: <20260902084703.3228504-1-niklas.soderlund+renesas@ragnatech.se>
 <20260902084703.3228504-4-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 08:47:57 +0000
Message-Id: <20260903084757.9E74B1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing PTP clock unregistration for `ccc_gac` (Gen3) devices on t=
he `ravb_open()` error path leads to a Use-After-Free.
- [High] Missing PTP clock driver teardown for `gptp` (Gen2) devices on har=
dware timeout leads to a Use-After-Free.
- [Medium] Silent loss of PTP clock functionality during TX timeout recover=
y for `gptp` devices.
--

commit 13e73cf3cf26d2c226a9c19d3728cc27d5cffb72
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

net: ethernet: ravb: Simplify gPTP start and stop

This commit simplifies the gPTP start and stop logic by folding the gptp fl=
ag
handling directly into ravb_dmac_init() and ravb_stop_dma(). It aims to
control the clock for gptp devices in tandem with the AVB-DMAC, while leavi=
ng
ccc_gac devices tied to device open/close operations. However, this
refactoring appears to introduce regressions in error handling and timeout
recovery paths.

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
>  	/* Stop AVB-DMAC process */
>  	return ravb_set_opmode(ndev, CCC_OPC_CONFIG);
>  }

[Severity: High]
Can a hardware timeout cause a use-after-free by skipping the PTP clock
teardown?

Earlier in ravb_stop_dma(), there are multiple ravb_wait() hardware polling
loops. If any of these wait loops time out, the function returns an error
immediately, bypassing this new ravb_ptp_stop() call. During a module unload
or interface close, if ravb_stop_dma() fails, teardown continues but the PTP
clock remains registered. Does this leave the /dev/ptp* device pointing to
freed memory?

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
>  	ravb_set_opmode(ndev, CCC_OPC_RESET);

[Severity: High]
Does this error path leak the PTP clock driver for ccc_gac (Gen3) devices?

When ravb_ptp_init() is called successfully but a subsequent step like
ravb_phy_start() fails, the code jumps here to out_ptp_stop. Since
ravb_stop_dma() only stops the clock for gptp devices, the clock remains
registered for ccc_gac devices. If the network device is subsequently freed
by a module unload, could this lead to a use-after-free when userspace
accesses the dangling PTP device?

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
>  	netif_tx_start_all_queues(ndev);
> =20
>  out_unlock:

[Severity: Medium]
Does removing this initialization cause a silent loss of PTP clock
functionality during TX timeout recovery?

If ravb_stop_dma() successfully stops the PTP clock but fails at its final
step (ravb_set_opmode()), it returns an error. The error path in
ravb_tx_timeout_work() jumps to the out label, re-enables queues, and
aborts full re-initialization.

Since ravb_ptp_init() is no longer called at the out label, does the PTP
clock remain permanently stopped and unregistered until the interface is
manually brought down and up again?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902084703.3228=
504-1-niklas.soderlund+renesas@ragnatech.se?part=3D3
