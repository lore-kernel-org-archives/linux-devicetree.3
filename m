Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FA7427FA0
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 15:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275351; cv=none; b=NL6T60PIW9fa24KrF8yGVigWFVAcUd1S9+Q4dJPCnFp4OnC2gz0jEUS3X29boKPoqrsqHlwnHwuYXsE39uUGjZ5Y3DU6SRlp+b0A3iJNVg0pzegh/8AeXsYKck2LFOiFzCoBkqQp9ZT3CPCckE5UA35x9KjjYayOm13AIW3zaTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275351; c=relaxed/simple;
	bh=jm46WYKLMYLiGgfIzQPq6gZL2TPkT9G5c1kLrDpCfQQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EzLRKLHCR2Llpmfv8/MCh0VGxw2hNyMhcKVh4vRCrx6srAcsWAfOPChCRvhvq2SARoEQCPxw1lvzbDC+obpOibGXDng+RCiIK/PbafqLNVnxspV4PHcKjAtxSEs/MLgiDPqL3cRZJfjZ3Aarco/Pt/NJQrONpwhj4Jww3kKh7Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oj559cio; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oj559cio"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EE531F00A3D;
	Tue,  1 Sep 2026 15:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788275349;
	bh=oaY425VqHAITg9m98dWr/qgL5IzRZx7/OUNUkOTMfFc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oj559cioe8y+reUpLmpnrKNVs7woOTJ2F887npIdlUstaXeG3imluUlWtf74Kz7UR
	 3siOZT6j/yeGLpdl2axAvedrWx5/DO5Rpkh6ZKKoTpIKi06WnTw1dnZ4JHF0fDT3wC
	 ok/+3hpM4AQlzQYUleuS6c9we071a2OFTV+cgexgTUcyXlzklvkfZBoouurD9Fa/aK
	 NrYXb61RHhciK/0cN2goUDOsoH7MdkS8QdA1tGkhdqHSTRiyrsInQvaW457hru85Ms
	 bPijWhqPtuMycLChoVVUnNvrJlfdUc0AY/A/Jy/29/tr7ZZHqPgg/jgspW+viBnQ4s
	 IMTQkzNh1eCuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 5/6] net: xilinx: axienet: Dispatch
 statistics through axienet_config ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Suraj Gupta" <suraj.gupta2@amd.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831150816.1020883-6-suraj.gupta2@amd.com>
References: <20260831150816.1020883-1-suraj.gupta2@amd.com>
 <20260831150816.1020883-6-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 15:09:09 +0000
Message-Id: <20260901150909.9EE531F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Out-of-bounds array write in `axienet_1g_get_ethtool_stats()` due =
to mismatched statistics array indices.
- [High] Reading a `seqcount_mutex_t` from interrupt context can cause a de=
adlock if the writer is preempted.
--

commit a22a50757854e007ab76536560cb1108e8d22fd4
Author: Suraj Gupta <suraj.gupta2@amd.com>

net: xilinx: axienet: Dispatch statistics through axienet_config ops

This commit refactors the AXI Ethernet driver's statistics reporting by
dispatching stats reads through operation pointers in struct axienet_config.
This prepares the driver to support different MAC types without inline
branches in the statistics callbacks.

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/=
net/ethernet/xilinx/xilinx_axienet_main.c
> index 212816613aa86..8100cc53cd643 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -1878,29 +1878,11 @@ static int axienet_ioctl(struct net_device *dev, =
struct ifreq *rq, int cmd)
>  	return phylink_mii_ioctl(lp->phylink, rq, cmd);
>  }
> =20
> -static void
> -axienet_get_stats64(struct net_device *dev, struct rtnl_link_stats64 *st=
ats)
> +static void axienet_1g_get_stats64(struct axienet_local *lp,
> +				   struct rtnl_link_stats64 *stats)
>  {
> -	struct axienet_local *lp =3D netdev_priv(dev);
>  	unsigned int start;
> =20
> -	netdev_stats_to_stats64(stats, &dev->stats);
> -
> -	do {
> -		start =3D u64_stats_fetch_begin(&lp->rx_stat_sync);
> -		stats->rx_packets =3D u64_stats_read(&lp->rx_packets);
> -		stats->rx_bytes =3D u64_stats_read(&lp->rx_bytes);
> -	} while (u64_stats_fetch_retry(&lp->rx_stat_sync, start));
> -
> -	do {
> -		start =3D u64_stats_fetch_begin(&lp->tx_stat_sync);
> -		stats->tx_packets =3D u64_stats_read(&lp->tx_packets);
> -		stats->tx_bytes =3D u64_stats_read(&lp->tx_bytes);
> -	} while (u64_stats_fetch_retry(&lp->tx_stat_sync, start));
> -
> -	if (!(lp->features & XAE_FEATURE_STATS))
> -		return;
> -
>  	do {
>  		start =3D read_seqcount_begin(&lp->hw_stats_seqcount);

[Severity: High]
This is a pre-existing issue, but is it safe to read this seqcount_mutex_t
from this context?

The hw_stats_seqcount writer runs in process context (a delayed work) holdi=
ng
a mutex, meaning it can be preempted by softirqs. The reader here in
axienet_1g_get_stats64() is called via ndo_get_stats64, which can be invoked
from atomic or softirq context (such as via dev_get_stats() in the Open
vSwitch datapath).

If a softirq fires on the same CPU while the writer is inside the seqcount
write section, won't the reader spin infinitely in read_seqcount_begin()
waiting for the odd sequence number to become even, resulting in a hard
deadlock?

[ ... ]
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
> @@ -2381,6 +2387,17 @@ static void axienet_ethtools_get_ethtool_stats(str=
uct net_device *dev,

[Severity: High]
This isn't a bug introduced by this patch, but does this function overflow =
the
data array allocated by the ethtool core?

When a user invokes ethtool -S, the core allocates a buffer for 9 elements
based on the return value of axienet_1g_get_sset_count(). However, inside
the seqcount loop in axienet_1g_get_ethtool_stats(), the code writes beyond
these bounds:

		data[8] =3D axienet_stat(lp, STAT_USER_DEFINED0);
		data[9] =3D axienet_stat(lp, STAT_USER_DEFINED1);
		data[10] =3D axienet_stat(lp, STAT_USER_DEFINED2);

Can this overrun the 72-byte allocated buffer by 16 bytes and cause memory
corruption?

[ ... ]
>  static const char axienet_ethtool_stats_strings[][ETH_GSTRING_LEN] =3D {
>  	"Received bytes",
>  	"Transmitted bytes",
> @@ -2393,12 +2410,26 @@ static const char axienet_ethtool_stats_strings[]=
[ETH_GSTRING_LEN] =3D {
>  	"User Defined Counter 2",
>  };
> =20
> +static void axienet_1g_get_strings(u8 *data)
> +{
> +	memcpy(data, axienet_ethtool_stats_strings,
> +	       sizeof(axienet_ethtool_stats_strings));
> +}
> +
> +static int axienet_1g_get_sset_count(void)
> +{
> +	return ARRAY_SIZE(axienet_ethtool_stats_strings);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831150816.1020=
883-1-suraj.gupta2@amd.com?part=3D5
