Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337C742DA33
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 08:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425278; cv=none; b=usu3ZtCViTolT5ZIGpzi7BeeCPHVxSISGQu+m9eg28jx+OBNNdCGxBzsC2pyCt2yeECIyme2RltnvsK2OEmHjj7SKBQUCdu+3qstZifa/zbX+Zqo5S9CWgKgw6JILoZ6UxZCLFKir6cWBvUL12tEgh/3+p3KOznheh6GyZkVM/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425278; c=relaxed/simple;
	bh=cMHOdkR6lWDmJ6Jo0NDTtkENm/gbWorfVHY+bJMMEmw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dnBCoQ3zlXj/Ok/+plZW9bG6hLTQ9SqGQmq6BvQD6/ynyRZNBJEq4ZVkR81z6PvMmWKKC0vhTNKsSQzFZwweOiZFaSCVsFOyR6ZuIjJckw9Ns2c7jTtfYGPOrewos1zlNShR7vXmxkK2Pk6tOlU4bARa7zPT2zKtHMyoccXKO4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i4knzoVH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i4knzoVH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2791D1F00A3A;
	Thu,  3 Sep 2026 08:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788425275;
	bh=1MbPZtrjXcuiYrNFx66PXepMfdC0u3KDbPTypXNTt2w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i4knzoVHSlk5kBc91raSBxgimUU6USYGhM2ngBRM5mcX5rBktZ4BUO+u4WpZOrNkK
	 uPey0y6iZjOL/SBYbSri8aruPMWh+qAeTNvlq9s8u187W84L2n5vNWsn3zB0oR1N84
	 c2PBx7q52v0CtrbdYFNfcLWZPB99cy7lZtWkcnnGB0JYLZ2zLedWgSAsPfmzgpzOlD
	 ZdxiNZYliT8A9tCP5C28sV8y5YoWkWfqNj4pWLeqOHa/E4W3GykBzWqGUnpiNl7rbv
	 KsgHClcf30ccMLnpToXWRD/7s2wMq/W+YFA0Ry4LfDqgPqjQlgawdVO6ShT8oK8DYo
	 kz3gKBsSjJ04g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 05/10] net: ethernet: ravb: Propagate error
 from ptp_clock_register()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260902084703.3228504-6-niklas.soderlund+renesas@ragnatech.se>
References: <20260902084703.3228504-1-niklas.soderlund+renesas@ragnatech.se>
 <20260902084703.3228504-6-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 08:47:54 +0000
Message-Id: <20260903084755.2791D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Calling `ptp_clock_index()` with a NULL pointer causes a deter=
ministic kernel panic when querying ethtool timestamp info.
- [Critical] Failing to clear `priv->ptp.clock` in `ravb_ptp_stop()` leaves=
 a dangling pointer, leading to a Use-After-Free during ethtool queries.
--

commit 8ab377468104948ff315e1ab381238bac1a1783e
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

net: ethernet: ravb: Propagate error from ptp_clock_register()

If the PTP clock registration failed the error is silently ignored.
Before reworking all callers of ravb_ptp_init() handle and propagate the
error so it can be used.

Link: https://sashiko.dev/#/patchset/20260610102432.3538432-2-niklas.soderl=
und+renesas@ragnatech.se?part=3D1

> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ether=
net/renesas/ravb_main.c
> index e44d065f77cc8..7c7b3ac81e5d6 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -1785,7 +1785,7 @@ static int ravb_get_ts_info(struct net_device *ndev,
>  			(1 << HWTSTAMP_FILTER_NONE) |
>  			(1 << HWTSTAMP_FILTER_PTP_V2_L2_EVENT) |
>  			(1 << HWTSTAMP_FILTER_ALL);
> -		info->phc_index =3D READ_ONCE(priv->ptp.phc_index);
> +		info->phc_index =3D ptp_clock_index(priv->ptp.clock);

[Severity: Critical]
Can this code trigger a NULL pointer dereference if priv->ptp.clock is NULL?

If the interface is not brought up yet, or if PTP registration failed during
initialization, priv->ptp.clock will be NULL. When querying ethtool for
timestamping information, ravb_get_ts_info() invokes
ptp_clock_index(priv->ptp.clock).

Since ptp_clock_index() unconditionally dereferences the pointer, it seems
this could result in a crash.

>  	}
> =20
>  	return 0;

[ ... ]

> diff --git a/drivers/net/ethernet/renesas/ravb_ptp.c b/drivers/net/ethern=
et/renesas/ravb_ptp.c
> index f70b616ac847c..19d039b9d24a5 100644
> --- a/drivers/net/ethernet/renesas/ravb_ptp.c
> +++ b/drivers/net/ethernet/renesas/ravb_ptp.c
[ ... ]
> @@ -369,14 +368,10 @@ static void ravb_ptp_sync_irqs(struct net_device *n=
dev)
>  void ravb_ptp_stop(struct net_device *ndev)
>  {
>  	struct ravb_private *priv =3D netdev_priv(ndev);
> -	struct ptp_clock *clock;
> -
> -	WRITE_ONCE(priv->ptp.phc_index, -1);
> -	clock =3D xchg(&priv->ptp.clock, NULL);
> =20
>  	ravb_ptp_disable(ndev);
>  	ravb_ptp_sync_irqs(ndev);
> =20
> -	if (clock)
> -		ptp_clock_unregister(clock);
> +	if (priv->ptp.clock)
> +		ptp_clock_unregister(priv->ptp.clock);

[Severity: Critical]
Does this leave priv->ptp.clock as a dangling pointer?

The original code used xchg() to set priv->ptp.clock to NULL before
unregistering it. With this change, when the interface is brought down,
ravb_ptp_stop() unregisters and frees the PTP clock but leaves the pointer
pointing to freed memory.

If an unprivileged user or system daemon queries ethtool while the interface
is down, ravb_get_ts_info() will pass this dangling pointer to
ptp_clock_index(), potentially causing a use-after-free read. Should
priv->ptp.clock be explicitly set to NULL here?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902084703.3228=
504-1-niklas.soderlund+renesas@ragnatech.se?part=3D5
