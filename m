Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D316A3451AB
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 08:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425278; cv=none; b=UK9IVK21MZyUBezEPKbiVKI/4nRCNLem6PDHu3/mWXgOngAIRKk9Ug6qguVztzobHCccTecX/qwexWLnsS3DRVzS5yUv8cIRtbUazLJXn332lTSLHsS+PPy5pGJyBl8aarnDrLoYrg+eo3YVqAw7BK1Re9NS2IMM4V/znTvow1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425278; c=relaxed/simple;
	bh=5bYiUwdkd6MZ8J6ObiLwaou52nPt29jS4jywsHOrYL0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NHTjzz7TITWmS28lyRZpOJJEHkYSme4CpfPkN2LpaNVO68PAaCG2k5SEFDwFK/K/dLY9kxEAZbR9NBgj+uk+xR8QpSbTEaSARcdP/bPSfCsDvmobhOw0cMqrYnnaSC/2jRam+PGcs4Ck23AkTu+ijicjHPDhQ+hxfju8XVMsRfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bFNWgz5c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bFNWgz5c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F15D91F000E9;
	Thu,  3 Sep 2026 08:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788425276;
	bh=wClVtRTXY0GjzzvhjtlJJKzey5FjqBClhArQuF71YXw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bFNWgz5cm2eoeYEnHrL3VGzjW1/8DYWWU/zPv0dlORRKmrFYW7XdX197SM1zIGEcL
	 GCdOwgaPd4LsrbBGXxpMyHR7X7CcvhP9DfFYRvT9jFNPrOkV/qpWpTBstg5Opf8m06
	 JI90IIeHoxV2oLBBZowZsixspnXIIcSbR9wYChMYfFeZBG7pALVzRdjvU+iMlXvUc8
	 ErndSv9FZaAZ6+UW/ZR0XA5i3JlOU2OjUEJ4A6Ti+GGy8QF6WTi8ar1nrDOguNcLpy
	 s6LCFiA0Hk/37LzFPR3M6WNWfRGGMWhFubraFk5Zh/KHThkD++KYa7QW8F9AC3HnTA
	 9SwG9Vw8sgh6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 01/10] net: ethernet: ravb: Remove gPTP
 control from WoL setup and restore
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: robh@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260902084703.3228504-2-niklas.soderlund+renesas@ragnatech.se>
References: <20260902084703.3228504-1-niklas.soderlund+renesas@ragnatech.se>
 <20260902084703.3228504-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 08:47:55 +0000
Message-Id: <20260903084755.F15D91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The patch erroneously removes `ravb_ptp_stop()` from `ravb_wol_set=
up()`, leaving the gPTP hardware active during a WoL-enabled suspend.
--

commit bbd624fcad5eb4869638d985be16666aae0f0ca2
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

net: ethernet: ravb: Remove gPTP control from WoL setup and restore

This commit removes explicit gPTP stop/init calls from the Wake-on-LAN setup
and restore paths. The commit message states this is redundant as the device
is always closed and re-opened during suspend and resume.

> net: ethernet: ravb: Remove gPTP control from WoL setup and restore
>=20
> Since commit a6a85ba36fd0 ("net: ravb: Move PTP initialization in the
> driver's ndo_open API for ccc_gac platorms") the gPTP clock (if
> supported) is stopped and started by opening and closing the ndev.
>=20
> This makes the special case to stop and start it when resuming from WoL
> redundant. As the ndev will always be closed and re-opened when
> suspending and resuming the system.

[Severity: High]
Is this description accurate when Wake-on-LAN is enabled?

Looking at ravb_suspend() in drivers/net/ethernet/renesas/ravb_main.c,
ravb_close() is explicitly bypassed when wol_enabled is true:

	if (priv->wol_enabled) {
		ret =3D ravb_wol_setup(ndev);
		rtnl_unlock();
		return ret;
	}

	ret =3D ravb_close(ndev);

>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> Reviewed-by: Sergey Shtylyov <sergei.shtylyov@gmail.com>
>
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ether=
net/renesas/ravb_main.c
> index ea1c7e536791e..36173a09e2fdb 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -3182,9 +3182,6 @@ static int ravb_wol_setup(struct net_device *ndev)
>  	/* Enable MagicPacket */
>  	ravb_modify(ndev, ECMR, ECMR_MPDE, ECMR_MPDE);
> =20
> -	if (priv->info->ccc_gac)
> -		ravb_ptp_stop(ndev);
> -
>  	return enable_irq_wake(priv->emac_irq);
>  }

[Severity: High]
Since ravb_close() is not called during a WoL-enabled suspend, doesn't remo=
ving
ravb_ptp_stop() here leave the gPTP hardware active during suspend?

> =20
> @@ -3204,9 +3201,6 @@ static int ravb_wol_restore(struct net_device *ndev)
>  	if (error)
>  		return error;
> =20
> -	if (priv->info->ccc_gac)
> -		ravb_ptp_init(ndev, priv->pdev);
> -
>  	if (info->nc_queues)
>  		napi_enable(&priv->napi[RAVB_NC]);
>  	napi_enable(&priv->napi[RAVB_BE]);

[Severity: High]
If the PTP clock remains active during suspend, won't it be abruptly torn d=
own
by the ravb_close(ndev) call that occurs later in this ravb_wol_restore()
function?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902084703.3228=
504-1-niklas.soderlund+renesas@ragnatech.se?part=3D1
