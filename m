Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F32F5625E5
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 17:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789061520; cv=none; b=Ak+HF8vwO02+98y9qQUg4Yl0HyunSdqAa9c03Yl4ygWQuI5O23nE4CChhqVlloQALqBZyNq8UUicLMHjY8d816kQ4d/moAAaGJ8tEhpeRjBATW1pfayrKYfMSlxEL9cqmsEepXYRZHAp2WJpeyQJAO6KchgcJDUZhGvLq8kWFn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789061520; c=relaxed/simple;
	bh=wzZC/dKazyZ1Tje9II7fUSdS2MC2evOutVZM6TU2K5g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W8rZYam+tyS2QNlFCi3QChQXEizk4T4xR6U65zHCJf7y/ilp4itg1zqTn07MBn4jKpTUfK3pqak35u2wMlpRo0YsELiiD7nFeFPTpi4OU4E9zrJJKajgSyWo/pENOwVd3lIQwwBHVuZYsQeI7HwPZ64Cik3Wt3Dx5tNd8xvuSkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCQHwHOp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCQHwHOp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF991F00899;
	Thu, 10 Sep 2026 17:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789061504;
	bh=UZZnhFDcoitetkwTJCJMqFv1JiV9WcQb7vVYt0Kknt4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HCQHwHOpphR9xBetn7L7jIViNnssejzw3fBFLZZpvHPKlMl2YYBrsjAstDDPX50Nb
	 tyNy2JgFz8TzcNFjV0ueN2EL1DsXG6MYE9AwE8rRxVeUSXY0hCSwVKtEe8lZNx5t4Q
	 WUoAS/o/UaUgim5sJW+125v2MlOdiU/xQmQLn+uQQ6ybjZzvU/04Z44Z4dbbVW+KuA
	 Y48sHm4QSB/jOoR3CEFd9iIBshbRpK181gIDFRmEW8lhIp0Em1LSydBCw+zGuY1K5k
	 4fV7u2qHpbpsce7ES+nGLGC5vtckrfPu4nZSLzT3G8ICnAFD53dCRrYgj6V8cOEu+J
	 XB2YYL8XawMWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 05/10] net: ethernet: ravb: Propagate error
 from ptp_clock_register()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260909173027.2201560-6-niklas.soderlund+renesas@ragnatech.se>
References: <20260909173027.2201560-1-niklas.soderlund+renesas@ragnatech.se>
 <20260909173027.2201560-6-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 17:31:43 +0000
Message-Id: <20260910173143.ADF991F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing WRITE_ONCE and temporary exposure of ERR_PTR in a lockle=
ssly accessed variable.
--

commit b7840c35cf3291bc3d465af40f2ae38cc9f5f972
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

net: ethernet: ravb: Propagate error from ptp_clock_register()

This commit reworks ravb_ptp_init() to check the return value of
ptp_clock_register() and propagate any errors back to the caller. It also
refactors the clock assignment by removing the intermediate local variable.

Link: https://sashiko.dev/#/patchset/20260610102432.3538432-2-niklas.soderl=
und+renesas@ragnatech.se?part=3D1

> diff --git a/drivers/net/ethernet/renesas/ravb_ptp.c b/drivers/net/ethern=
et/renesas/ravb_ptp.c
> index f70b616ac847c..37161c0579ce7 100644
> --- a/drivers/net/ethernet/renesas/ravb_ptp.c
> +++ b/drivers/net/ethernet/renesas/ravb_ptp.c
[ ... ]
> -void ravb_ptp_init(struct net_device *ndev)
> +int ravb_ptp_init(struct net_device *ndev)
>  {
>  	struct ravb_private *priv =3D netdev_priv(ndev);
> -	struct ptp_clock *clock;
>  	unsigned long flags;
> +	int ret =3D 0;
> =20
>  	priv->ptp.info =3D ravb_ptp_info;
> =20
[ ... ]
> -	clock =3D ptp_clock_register(&priv->ptp.info, &priv->pdev->dev);
> -	if (IS_ERR(clock)) {
> -		netdev_err(ndev, "failed to register PTP clock: %pe\n", clock);
> -		clock =3D NULL;
> +	priv->ptp.clock =3D ptp_clock_register(&priv->ptp.info, &priv->pdev->de=
v);
> +	if (IS_ERR(priv->ptp.clock)) {
> +		ret =3D PTR_ERR(priv->ptp.clock);
> +		priv->ptp.clock =3D NULL;
> +		ravb_ptp_stop(ndev);
>  	}
> =20
> -	WRITE_ONCE(priv->ptp.clock, clock);
> -	if (clock)
> -		WRITE_ONCE(priv->ptp.phc_index, ptp_clock_index(clock));
> +	return ret;
>  }

[Severity: Medium]
Does this introduce a data race by directly publishing an invalid pointer?

The ravb_ptp_interrupt() handler accesses priv->ptp.clock locklessly via
READ_ONCE(). Because the interrupt handler is registered and enabled via
ravb_setup_irq() before ravb_ptp_init() runs, the hardware interrupt might
already be firing when we reach this point.

If ptp_clock_register() fails, it returns an ERR_PTR. By assigning it
directly to priv->ptp.clock without WRITE_ONCE(), we could have a scenario
where an interrupt fires immediately after the assignment, but before the
error check clears priv->ptp.clock to NULL.

The interrupt handler in ravb_ptp_interrupt() would then read the ERR_PTR:

	struct ptp_clock *clock =3D READ_ONCE(priv->ptp.clock);
	...
	if ((gis & GIS_PTCF) && clock) {
		...
		ptp_clock_event(clock, &event);

Could this crash by dereferencing the ERR_PTR? Would it be safer to
restore the original local variable pattern and retain the WRITE_ONCE()
so that priv->ptp.clock only ever sees a valid pointer or NULL?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909173027.2201=
560-1-niklas.soderlund+renesas@ragnatech.se?part=3D5
