Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DD333C53D
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 18:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786126398; cv=none; b=Vo6uX1AGIa3qpvSAjA/i/gLYVZQyz6obK9bz0NKLK4qiLhN65dZ8WRkh/xPeb6XbKnr8LuLYUgrT8MBfyworBETsnX9dw4K0UbC8Fuu9rx7n2gv/5Lczbs0N1QjeufRow2lfHb7jIXy4FapRhnlmxfZoFcjiNAmoiJe8MR7ZDLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786126398; c=relaxed/simple;
	bh=/8x3QVcqlgALEsSrukVei0mc0sEjAX8IknUWYrYtvJA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jAwXd3yMgXgcncQ9IpcgGIN0d+hSTztdsMcZCp+xc1d+LFOByZiVbC5ukW3Y7oZjNA1ZvmlsGPCcllNKAZazKQKPif5px+y8NrORyr1c+0XgTiivbqMBs+7Yg98DtdHsF0tahswhZQnQpDaQDIw/xvIIBmb3pjxdtdFcvph+Wfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L9s4kQLz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L9s4kQLz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21E391F00A3A;
	Fri,  7 Aug 2026 18:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786126397;
	bh=03EkH24MFb+zmZzsbq/ayUJDvo1h++00H0K8EaW0IAw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L9s4kQLzpwK6jDRW3g/2ktLjZ5iJmU9x0jIMGxAU807I7eo1kkwv/6TVzwbqZ7yka
	 Qx60alLbXuqCwr1KCeWKYYUF934jyWQjLyfveGUR83k8KXItBN7Pu1Ot/PGsRIk0sX
	 ebROZaqUvbrsi/FiUo9c4Z5UcxvGhKPYwEKrJaOtrnpIOidzXQSVefLaxcwD4H+wKK
	 zXklqmJ31jkzbznDwVH04/XKOYGZ9XONNXZ8vjytUWAnBni6xvOYJJvfWHszOBNjIC
	 S4C6CDqMt35lgSK1TuQolePfDdQoi9GPXq/G5yZyBJZpUhVB5S/bNA3+DJ7fjKwqwN
	 B/2U1d0Y4RkgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 6/7] net: xilinx: axienet: Dispatch
 statistics through axienet_config ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Suraj Gupta" <suraj.gupta2@amd.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806181153.1213996-7-suraj.gupta2@amd.com>
References: <20260723123838.125145-1-suraj.gupta2@amd.com>
 <20260806181153.1213996-1-suraj.gupta2@amd.com>
 <20260806181153.1213996-7-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 18:13:16 +0000
Message-Id: <20260807181317.21E391F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] `axienet_1g_get_ethtool_stats` writes hardware statistics out-of-b=
ounds of the `data` array allocated by the ethtool core.
--

--- Patch [6]: [PATCH net-next v2 6/7] net: xilinx: axienet: Dispatch stati=
stics through axienet_config ops ---
commit dd40493ec0a25e2800677d93923a2097ca0c48e3
Author: Suraj Gupta <suraj.gupta2@amd.com>

net: xilinx: axienet: Dispatch statistics through axienet_config ops

The commit refactors hardware statistic callbacks to use function pointers
in struct axienet_config. This avoids conditional branching for different
MAC types by populating operations like get_ethtool_stats via an
axienet_1g_config structure.

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/=
net/ethernet/xilinx/xilinx_axienet_main.c
> index 1892d87ebaaea..6e4b3a073e733 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c

[ ... ]

> @@ -2360,11 +2369,8 @@ static int axienet_ethtools_nway_reset(struct net_=
device *dev)
>  	return phylink_ethtool_nway_reset(lp->phylink);
>  }
> =20
> -static void axienet_ethtools_get_ethtool_stats(struct net_device *dev,
> -					       struct ethtool_stats *stats,
> -					       u64 *data)
> +static void axienet_1g_get_ethtool_stats(struct axienet_local *lp, u64 *=
data)
>  {
> -	struct axienet_local *lp =3D netdev_priv(dev);
>  	unsigned int start;
> =20
>  	do {

[Severity: High]
This isn't a bug introduced by this patch, but does this function write
hardware statistics out-of-bounds of the data array allocated by the ethtool
core?

The ethtool core allocates memory based on axienet_1g_get_sset_count, which
returns 9 for the size of axienet_ethtool_stats_strings. However, this
function writes to data[8], data[9], and data[10], skipping data[4] and
data[5]:

axienet_1g_get_ethtool_stats() {
    ...
    data[7] =3D axienet_stat(lp, STAT_RX_PFC_FRAMES);
    data[8] =3D axienet_stat(lp, STAT_USER_DEFINED0);
    data[9] =3D axienet_stat(lp, STAT_USER_DEFINED1);
    data[10] =3D axienet_stat(lp, STAT_USER_DEFINED2);
    ...
}

Could this lead to a heap buffer overflow and memory corruption when a user
requests statistics with ethtool -S?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806181153.1213=
996-1-suraj.gupta2@amd.com?part=3D6
