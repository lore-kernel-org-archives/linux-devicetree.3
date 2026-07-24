Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A0F439F8D
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 14:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784902651; cv=none; b=c4D1Xn7OdHZFGgMCUoeGlN8euZ2W5wEuZEL6iqVQNMpvbm7i6a4iNfTmxTKXYSYHtajBvJgFgCE8iWF7ru78epHXbqP9rULrBbKi3brWfaCrGp9sokFjA8vKjN/6/oE286XacFQbU+Id8qUQOERuvRW3awDCnD94C3/8msZFcSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784902651; c=relaxed/simple;
	bh=8ml4QZYmkdxiO0PQj79dPluNWrNr/yqUQTuGgHiEPWw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fznxkguTdBgKqbZSHn/YW3PHUMgi8DqKld5eI2uXHYE5CEYKXVSjnKxicXqJD1p/VOQV9362GcXtdbn2LmR2nAfnyZFyv7bGOVOGK4zvXab0Zw5h1ZBAp1HIsOlQCGK0tDRqeadne8W/FZgZFceRYM6UOSuhyB5znuUvPyJtKvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbrar3yS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbrar3yS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1126E1F000E9;
	Fri, 24 Jul 2026 14:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784902649;
	bh=eJYP/q0UedCTG4vOcRykcnNk0cdbFBXwS1ogN4jmiSU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bbrar3yS02Ql0b9178K2kHBTQRFkwHy1CUQ1XfVVLytog/YU1BJdsN//mrSxRA9p+
	 5VqN62hSn1dpylumOOBfGyA6AKGPWJpn0cWX1bpBS6lnEhzJyez6Zy7cTGJ6Kco0mE
	 YMZWGO3UIPLUJJSr1emLM0zof+AiJMZE0qPLIgKu8t8mIMeo1ma732WKZLt/orUKam
	 vZr4XNnCwW6dufaJ9/SITqaT6a++b+tiYMea2Rs+S/7lZsSLiHEnM06G3c026BUK5T
	 ly+7Y0R/Yg6/PPeP6FVxoLdExPwcgfyp5JZMnAZ6PQJzBFQU9PswT1yxUprX7Rh+Iq
	 ChoDdjXwKmaiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 6/7] net: xilinx: axienet: Dispatch statistics
 through axienet_config ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Suraj Gupta" <suraj.gupta2@amd.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260723123838.125145-7-suraj.gupta2@amd.com>
References: <20260723123838.125145-1-suraj.gupta2@amd.com>
 <20260723123838.125145-7-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 14:17:28 +0000
Message-Id: <20260724141729.1126E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Kernel heap buffer overflow when writing ethtool statistics becaus=
e `axienet_1g_get_ethtool_stats` writes past the end of the allocated `data=
` array.
- [High] Seqcount livelock due to softirq reader interrupting process-conte=
xt writer without disabling bottom halves.
--

--- Patch [6]: [PATCH net-next 6/7] net: xilinx: axienet: Dispatch statisti=
cs through axienet_config ops ---
commit cb6776892b93b092d0fe6ad16946db4662c9e7dd
Author: Suraj Gupta <suraj.gupta2@amd.com>

net: xilinx: axienet: Dispatch statistics through axienet_config ops

This commit adds statistics operation function pointers to
struct axienet_config and routes get_stats64, get_ethtool_stats, and
others through them. It factors the existing 1G counter reads into
axienet_1g_*() helpers.

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/=
net/ethernet/xilinx/xilinx_axienet_main.c
> index 1892d87ebaaea..6e4b3a073e733 100644
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
This is a pre-existing issue, but does reading hw_stats_seqcount here create
a livelock risk with softirq?

If a softirq (e.g., NET_RX_SOFTIRQ) preempts axienet_stats_update() which
writes to hw_stats_seqcount from process context (delayed workqueue) without
disabling bottom halves:

axienet_stats_update()
  write_seqcount_begin(&lp->hw_stats_seqcount);

And calls dev_get_stats() triggering axienet_1g_get_stats64(), the reader
will spin indefinitely in read_seqcount_begin() waiting for the sequence to
become even, but the writer can never resume to release the lock.

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

[Severity: High]
This is a pre-existing issue, but can axienet_1g_get_ethtool_stats() write
past the end of the allocated data array?

axienet_1g_get_sset_count() returns ARRAY_SIZE(axienet_ethtool_stats_string=
s)
which is 9, so the ethtool core only allocates a 9-element array.

However, axienet_1g_get_ethtool_stats() (in the unchanged lines of this loo=
p)
writes to indices 9 and 10:

  data[8] =3D axienet_stat(lp, STAT_USER_DEFINED0);
  data[9] =3D axienet_stat(lp, STAT_USER_DEFINED1);
  data[10] =3D axienet_stat(lp, STAT_USER_DEFINED2);

Could this cause a heap buffer overflow?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723123838.1251=
45-1-suraj.gupta2@amd.com?part=3D6
