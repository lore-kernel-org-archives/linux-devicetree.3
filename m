Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBFA42EEC9
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 08:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425281; cv=none; b=cbJCR1gwDjvRwXKl9n6co8WLD60lmbHFS4IcdZfTvJl8lJOb/ElDf8XN9/SEnDKRZ2GXphC9Y1Ggkmx+7NiRv+bT/7IY3d/YdxWqdBg9u0VeyY9Usp65Ajb4cAnfL96P/zlN3yX2rRJPRudWRnK+AXYQcU0PqPAisbSkWb6V4+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425281; c=relaxed/simple;
	bh=O1Tr7fT65VJR9JYcxYt8gPNXZPyyfmy2U0dsurAE/LM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q288Z/NDG21bcjkyYYrySRvC+sUAIzO3TekiNwFdhi2W3bzwutUIJI7IMTUgS2YiFpOR8Vdzgm7LPh+KlWo2n6qNzEu/D3oQ6gtPZdgPrNlnGU3d2tRe2pVPP460/xP2+2zNt/JLDIPE+fHHukH7wcs3zF9OW7XHDsoMOfukaS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iUBMvJzT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iUBMvJzT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A0B11F00A3A;
	Thu,  3 Sep 2026 08:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788425278;
	bh=jV23whpzG3vnRYpGn+yZIKopdRsg7pZSWzdevWKVVFk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iUBMvJzTgGFZP6gmpyx7hsh6Bmuduy6X81P//5AitU0dIPee7UUmgsqRVpXD+VipL
	 O59j+f2iSddXhrAyUxd+AQgzH+siaLfjp2sCLX/1LxbaVtGLuEQ+cRnPivHmhS5xYm
	 Sg8glQadezyt0zCtu6Y0O6++Dhu7XYn0SrYr6h019UppfcAhJK+6S6SUQfnH815QbO
	 vHZarnxdpI9Gs7vFqYToHYs3tDHpc8fPZb6U8bn/Og4vu93KlJcWy7m6jivo919hhY
	 MQhTfE5pGDcBKkcMKeIm82rozTBjtWE2plFeMPtDmrDmz0jAbIFWgCFWLWsNLexcjI
	 75WetREtg20VQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 06/10] net: ethernet: ravb: Replace gPTP
 flags with callbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org
In-Reply-To: <20260902084703.3228504-7-niklas.soderlund+renesas@ragnatech.se>
References: <20260902084703.3228504-1-niklas.soderlund+renesas@ragnatech.se>
 <20260902084703.3228504-7-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 08:47:58 +0000
Message-Id: <20260903084758.6A0B11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] ravb_dmac_init leaves the hardware in CCC_OPC_OPERATION mode if =
dmac_start fails.

Pre-existing issues:
- [High] Calling ethtool -T when the interface is down will trigger a NULL =
pointer dereference or a Use-After-Free in ravb_get_ts_info().
--

commit eb974310ac24dea7fe34514d8fd0eeeea0662742
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

net: ethernet: ravb: Replace gPTP flags with callbacks

Prepare for adding Gen4 support which will add a third and new way to
interact with the gPTP clock by replacing the flags for Gen2 behavior
(info->gptp) and Gen3 behavior (info->ccc_gac) with callbacks.

> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ether=
net/renesas/ravb_main.c
> index 7c7b3ac81e5d6..5d5b9c0e2f450 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -712,8 +712,8 @@ static int ravb_dmac_init(struct net_device *ndev)
>  		return error;
> =20
>  	/* Initialise PTP Clock driver */
> -	if (info->gptp)
> -		ravb_ptp_init(ndev);
> +	if (info->ptp && info->ptp->dmac_start)
> +		return info->ptp->dmac_start(ndev);

[Severity: Medium]
If dmac_start() (e.g. PTP initialization) fails during operations like sett=
ing
ring parameters or recovering from a TX timeout, ravb_dmac_init() returns t=
he
error immediately.

Does this leave the hardware in CCC_OPC_OPERATION mode without rolling back
the hardware state to CCC_OPC_CONFIG?

Could this leave the device in an inconsistent state where the DMA is runni=
ng
but the EMAC is disabled and driver queues are detached, causing a local
DoS until the interface is manually restarted?

> =20
>  	return 0;
>  }

[ ... ]

> @@ -1774,7 +1774,7 @@ static int ravb_get_ts_info(struct net_device *ndev,
>  	struct ravb_private *priv =3D netdev_priv(ndev);
>  	const struct ravb_hw_info *hw_info =3D priv->info;
> =20
> -	if (hw_info->gptp || hw_info->ccc_gac) {
> +	if (hw_info->ptp) {

[Severity: High]
This is a pre-existing issue, but calling ethtool -T when the interface is
down can trigger a NULL pointer dereference or a Use-After-Free here in
ravb_get_ts_info().

If a local unprivileged user queries timestamping info via SIOCETHTOOL while
the interface is administratively down, ravb_get_ts_info() eventually passes
priv->ptp.clock to ptp_clock_index(), which unconditionally dereferences it:

ravb_get_ts_info()
    info->phc_index =3D ptp_clock_index(priv->ptp.clock);

If the device is probed but not yet opened, priv->ptp.clock is NULL,
resulting in a NULL pointer dereference.

Furthermore, when the device is closed, ravb_ptp_stop() unregisters the
clock but does not clear the pointer:

ravb_ptp_stop()
    if (priv->ptp.clock)
        ptp_clock_unregister(priv->ptp.clock);

Calling ethtool -T in this state triggers a Use-After-Free. Could this
pointer be cleared on stop, and checked before use in ravb_get_ts_info()?

>  		info->so_timestamping =3D
>  			SOF_TIMESTAMPING_TX_SOFTWARE |
>  			SOF_TIMESTAMPING_TX_HARDWARE |

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902084703.3228=
504-1-niklas.soderlund+renesas@ragnatech.se?part=3D6
