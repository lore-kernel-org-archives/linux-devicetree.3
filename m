Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFDF439F90
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 17:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790099499; cv=none; b=moIaZXjJt8hUVcn7hfpFzBDAAf+GNWIk/3EARh5oIBbPX9/YK1KyssqY1A9R/J8Ld1gbLF6Wo54OaSVxheAHffo1s+fH+wEv1hS2Os5eZ5tqgSxKJFAjbeI/yLuOmWz86Cn2RB/FyM1GSq9PVmjmjHWW87Ksu0VZ+O7VbUIIQEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790099499; c=relaxed/simple;
	bh=rpcZQgGzM3/GDccwR9/zjRvAn9J3/hNlztKL5Hxg+PI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FicYHEswAhV3MEQupKRmtl9QMz6+zI564IpP1P1gy8ncfn5iFbxB6Eyfstkf2bqprvGGleHzf+XzBMMm20X/ZhSXtnTACFAxe7oKa6wv9JCYz2PqerpAuYzwmw+B02kzKtekYzUtB0XRsVS8CuXq2iPV2LnR27SmRTcq/ZjYu+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZqeIg2Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZqeIg2Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD311F000FF;
	Tue, 22 Sep 2026 17:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790099498;
	bh=tRSxpUFXKXn00P9e7HEeNYVGQmx2mIM5Bz2wcFEoLh4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OZqeIg2Yr/qip+FdoHwEkq5nN8jdbcAzZ9Nz87MWthZPxAKLIizEoKX4XnuKHEpjR
	 X2vAN4mO42t6g4j42i3a1vFdAy7Nytpjygxan/9OApa3511esnqrcKWAXJv7TbR6Il
	 U81dZOHQX4d575Ji6JaQu59mbE528e0C5SdJx97N67qnB+VOGdcWrCPWXJcIsPYtc9
	 1Uv/uchUkCnEQCl94Gxcjw2Ds8dhZ+yL5dkQyDHwqSvrODHoGPjwK0Ot+7jt4LmTlr
	 qgSyWCDBOBDy+MQqxHvtsGypy6eVURAbuALkScrkQ/cnQUP6dtX+nSlijSZyISH2Eu
	 9hdnI52D3RDWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 01/10] net: ethernet: ravb: Remove gPTP
 control from WoL setup and restore
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260921175037.4084310-2-niklas.soderlund+renesas@ragnatech.se>
References: <20260921175037.4084310-1-niklas.soderlund+renesas@ragnatech.se>
 <20260921175037.4084310-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 17:51:37 +0000
Message-Id: <20260922175137.EAD311F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ravb: gPTP hardware left active during WoL suspend
--

commit c8c6cfc94155923852023c6cb4cc2b70e6464d0d
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

net: ethernet: ravb: Remove gPTP control from WoL setup and restore

This commit removes the explicit gPTP hardware stop and start calls from the
Wake-on-LAN setup and restore functions. The commit message indicates this =
is
redundant because the network device is closed and re-opened during system
suspend and resume.

>     This makes the special case to stop and start it when resuming from W=
oL
>     redundant. As the ndev will always be closed and re-opened when
>     resuming the system.

[Severity: Medium]
Is this assumption accurate for Wake-on-LAN?

Looking at ravb_suspend(), the device explicitly bypasses ravb_close() when=
=20
WoL is enabled:

ravb_suspend()
{
	...
	if (priv->wol_enabled) {
		ret =3D ravb_wol_setup(ndev);
		rtnl_unlock();
		return ret;
	}

	ret =3D ravb_close(ndev);
	...
}

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

[Severity: Medium]
Because ravb_close() is bypassed in ravb_suspend() as noted above, does=20
removing ravb_ptp_stop() here leave the gPTP hardware active and consuming=
=20
power during a WoL suspend?

>  	return enable_irq_wake(priv->emac_irq);
>  }
> =20
> @@ -3204,9 +3201,6 @@ static int ravb_wol_restore(struct net_device *ndev)
>  	if (error)
>  		return error;
> =20
> -	if (priv->info->ccc_gac)
> -		ravb_ptp_init(ndev, priv->pdev);
> -

[Severity: Medium]
Since the gPTP hardware may not have been stopped during suspend, will=20
removing ravb_ptp_init() here cause problems upon resume, or leave the PTP=
=20
clock in an unexpected state?

>  	if (info->nc_queues)
>  		napi_enable(&priv->napi[RAVB_NC]);
>  	napi_enable(&priv->napi[RAVB_BE]);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921175037.4084=
310-1-niklas.soderlund+renesas@ragnatech.se?part=3D1
