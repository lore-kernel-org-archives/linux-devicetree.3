Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0725A545DAA
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 17:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789061517; cv=none; b=lGs2src/ceNBDJvd01AbEMPouw/byU5kjnv+swkAmY6AY/2GDI7wrIpn2rcvkPFhCbut3cvKVtHd98aW4S+yawlXi828x8DihybazXdNaKvRDUwzZcXIJGCMVDO01xlxq5xhVl7klHhdu+CEDY9uvIUI+WMl5VYY86KR3Wi27s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789061517; c=relaxed/simple;
	bh=WrvEGG1yLO+M9xTizJOZEh2QeioH+0enuWXHisvXWtI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OUZL0ZwOldTKUeGtN8B4e2KqDeBcWbvIuL/uNGQPx1jwvJz2+yF+Zgt+HvmdGuxdWier2EXj7HjBwKHtw4Q4fePJ0rGoABgwqQ2QXtOl78maaC0jcvOQVM61aamhq/4BN0bu05buF1oGmLNkD6RP/0BU5XGxn0VrkvQKnYPHiy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X1EFzvhV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X1EFzvhV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 844121F0089A;
	Thu, 10 Sep 2026 17:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789061504;
	bh=qnvQJ0Tf4MUrXpoMN2xg/eISNvoQRvxgNa5NnHjskME=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X1EFzvhVHOw2c90S8dfsHOEVlPfUAQUkVsq8onP1jjflGjrAFAgXxr/Uepcsuz2hI
	 vi5eLIpzAgC/xKtw69luAZdzicahc4hs/+E2FAgpl7JZ3ySZ1ZjOvrhBgHWmhai+iz
	 MmsGqpCzjxG8OyZjNFm5q/O6Yyst3UQ1Dx/sz7u71936iFKV47124bsph5K8Qazklr
	 Jrz11oH2R6Ay/WKOdFl7AlvJPBSMeVmiFTmXS2FtXcArmmegocRQi43t0BKnb5Anm6
	 cbLDBmpQ3bh1rL/X0Kr9WKM0bH9oNgy6RLtocUGKbOn6+Z/CusnSgVPjA7JjF0YZE9
	 J3S55ThY8ZwLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 06/10] net: ethernet: ravb: Replace gPTP
 flags with callbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260909173027.2201560-7-niklas.soderlund+renesas@ragnatech.se>
References: <20260909173027.2201560-1-niklas.soderlund+renesas@ragnatech.se>
 <20260909173027.2201560-7-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 17:31:44 +0000
Message-Id: <20260910173144.844121F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Critical] The PTP clock driver is leaked on the ravb_open() error path f=
or Gen3 hardware, leading to a resource leak and Use-After-Free on unbind.

Pre-existing issues:
- [High] DMA descriptor rings and RX buffers are leaked if ravb_dmac_init()=
 or ravb_open() fails.
--

commit e94a5eaa93f99ec3240945371b306afb7c9c715b
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

net: ethernet: ravb: Replace gPTP flags with callbacks

This commit prepares for Gen4 support by replacing the Gen2 (info->gptp)
and Gen3 (info->ccc_gac) flags with callbacks in a new ravb_gptp_info
struct, simplifying hardware-specific checks.

> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ether=
net/renesas/ravb_main.c
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

[Severity: High]
This is a pre-existing issue, but does this error return leak the previousl=
y=20
allocated DMA descriptor rings and RX buffers?

If ravb_dmac_init() fails here (or at ravb_set_opmode earlier), the caller=
=20
ravb_open() branches to out_set_reset, which skips calling ravb_ring_free()=
.=20
Because ravb_open() is reachable via a userspace command like ip link set u=
p,=20
could this be triggered repeatedly to exhaust DMA coherent memory?

[ ... ]

> @@ -1124,8 +1124,8 @@ static int ravb_stop_dma(struct net_device *ndev)
>  	}
> =20
>  	/* Stop PTP Clock driver */
> -	if (info->gptp)
> -		ravb_ptp_stop(ndev);
> +	if (info->ptp && info->ptp->dmac_stop)
> +		info->ptp->dmac_stop(ndev);

[Severity: Critical]
For Gen3 devices, dmac_stop is NULL since they use ndev_close. If ravb_open=
()
fails during PHY initialization after the PTP clock has been started,=20
ravb_open() jumps to out_ptp_stop and calls ravb_stop_dma().=20

Since dmac_stop is NULL, does the PTP clock remain fully registered?=20

If the interface is left down and the module is subsequently removed,=20
unregister_netdev() will skip ravb_close(), leaving the PTP clock device=20
active. Could userspace then access the leaked /dev/ptpX device and trigger=
 a=20
use-after-free on the freed priv pointer?

[ ... ]

> @@ -1967,8 +1957,11 @@ static int ravb_open(struct net_device *ndev)
>  	ravb_emac_init(ndev);
> =20
>  	/* Initialise PTP Clock driver */
> -	if (info->ccc_gac)
> -		ravb_ptp_init(ndev);
> +	if (info->ptp && info->ptp->ndev_open) {
> +		error =3D info->ptp->ndev_open(ndev);
> +		if (error)
> +			goto out_ptp_stop;
> +	}
> =20
>  	/* PHY control start */
>  	error =3D ravb_phy_start(ndev);

[Severity: Critical]
If ravb_phy_start() fails, the code branches to out_ptp_stop, which calls
ravb_stop_dma(ndev). As noted above, ravb_stop_dma() will not clean up the
Gen3 PTP clock because dmac_stop is NULL.=20

Should the out_ptp_stop block in ravb_open() explicitly call=20
info->ptp->ndev_close(ndev) to ensure the clock is properly unregistered on=
=20
this error path?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909173027.2201=
560-1-niklas.soderlund+renesas@ragnatech.se?part=3D6
