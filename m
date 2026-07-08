Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CED93FF891
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 22:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783550101; cv=none; b=X5VX0VtU7UcE2ujhd00X5XY8bHdmh4ZCmB/Aj8kiXrSlAHworToJbaZ7OF+p7g06773tjAc5AaPmXb1V3f+1dqWFxsToJgXP1/EV4G/7eWSwLyBRWl1AMKcuKxslfzxsh09EWy8FEpUvbR/MnTHG0RLD2j9lmm+6zEpIcegXXp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783550101; c=relaxed/simple;
	bh=loqkv+5w15Ze+nNSaboTtpxi656lkaEOsxJRgOHC6pc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nDK4YdyXZO1ir2lum3KJL9/x7PVeKJkCkKSPzK4ygo2NOFDtPfjZzMEIagG8RZwSImrX/pB0mKBfaqBXls+E8hutae4KlTFulP/NF7MBZFX3w3ytf9BKCnwy9n+09Ywzbpq2MAWE/RjJ6x5zTq1NWWPgcgfpDK1SXgQAsc9SrWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YWEU9XcR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YWEU9XcR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B024D1F00A3A;
	Wed,  8 Jul 2026 22:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783550100;
	bh=vfKyeKxilmZJuKbFqcJKSj6ZIdjbcDTlCPuNYAFcqyg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YWEU9XcRM/OXc+XUuGhSKUD63uR63sqsrZVw134e/WF5RM5uCOdYz5FbSPj30y0Kp
	 aVAM1aXhTLKjgy8au9UqN+Ykl9CZ++eocCCNkzpEYFOFf9Bz9gz91ydnXnp4z4NPZi
	 EBQ3b0QbzzIU057h7aIpHLPDr58Rf5OdZybGg5OWKOXzaOCIeanRbmbmaPDu+xx99j
	 svnrofcWqGzdq4UOzleRbjO+g5Hpw1ESeEwikbX3p+v3QgMTzw5HvJaCYC/6ewOud3
	 njUMYXHpJJBwTH+L7eH1mr5c4rmtslO7GvOOKyf5Ad1Xu8Z0oI8TqMrf9sn/060pgo
	 E/guuJjeJz55g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 13/13] net: ethernet: adi: Add a driver for
 the ADIN1140 MACPHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ciprian Regus" <ciprian.regus@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260708-adin1140-driver-v5-13-4aca7b51a58b@analog.com>
References: <20260708-adin1140-driver-v5-0-4aca7b51a58b@analog.com>
 <20260708-adin1140-driver-v5-13-4aca7b51a58b@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 22:34:59 +0000
Message-Id: <20260708223459.B024D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Deadlock vector in stats array protection due to mixed locking con=
texts without softirq disabling.
- [Medium] Lost software statistics (like tx_dropped) in the `ndo_get_stats=
64` implementation.
- [Medium] Hardware MAC filters are not logically disabled in `adin1140_mac=
_filter_clear()`, creating unintended match rules for the all-zero MAC addr=
ess.
--

--- Patch [13]: [PATCH net-next v5 13/13] net: ethernet: adi: Add a driver =
for the ADIN1140 MACPHY ---
commit 05f4df01760b18265ccbc2e4743e13ea5b0d6714
Author: Ciprian Regus <ciprian.regus@analog.com>
Subject: net: ethernet: adi: Add a driver for the ADIN1140 MACPHY

This commit introduces a driver for the ADIN1140 10BASE-T1S MAC-PHY.
The device connects over an SPI bus using the Open Alliance TC6 protocol.
It implements custom mii_bus methods to handle specific hardware limitations
with C22 register access during active reception.

> diff --git a/drivers/net/ethernet/adi/adin1140.c b/drivers/net/ethernet/a=
di/adin1140.c
> new file mode 100644
> index 0000000000000..93710baca1517
> --- /dev/null
> +++ b/drivers/net/ethernet/adi/adin1140.c

[ ... ]

> +static int adin1140_mac_filter_set(struct adin1140_priv *priv,
> +				   const u8 *addr, const u8 *mask,
> +				   u8 slot)
> +{
> +	u32 reg_address;
> +	u32 val;
> +	int ret;
> +
> +	if (slot >=3D ADIN1140_MAC_FILT_MAX_SLOT)
> +		return -ENOSPC;
> +
> +	reg_address =3D ADIN1140_MAC_ADDR_FILT_UPR_REG + 2 * slot;
> +
> +	ret =3D oa_tc6_write_register_mms(priv->tc6, OA_TC6_MAC_MMS1,
> +					reg_address,
> +					get_unaligned_be16(&addr[0]) |
> +					ADIN1140_MAC_ADDR_FILT_APPLY2PORT1 |
> +					ADIN1140_MAC_ADDR_FILT_TO_HOST);

[Severity: Medium]
Does this unintentionally create an active filter for the all-zero MAC
address?

When adin1140_mac_filter_clear() passes an all-zero MAC address here to
disable an unused slot, the ADIN1140_MAC_ADDR_FILT_APPLY2PORT1 and
ADIN1140_MAC_ADDR_FILT_TO_HOST bits are still unconditionally applied.

This seems to leave the hardware rule active to match 00:00:00:00:00:00
and forward those frames to the host, instead of disabling the filter
slot entirely.

[ ... ]

> +static void adin1140_stats_work(struct work_struct *work)
> +{
> +	struct delayed_work *dwork =3D to_delayed_work(work);
> +	struct adin1140_priv *priv;
> +	u32 reg_val;
> +	int ret;
> +	u32 i;
> +
> +	priv =3D container_of(dwork, struct adin1140_priv, stats_work);
> +
> +	for (i =3D 0; i < ARRAY_SIZE(adin1140_stat_regs); i++) {
> +		ret =3D oa_tc6_read_register_mms(priv->tc6, OA_TC6_MAC_MMS1,
> +					       adin1140_stat_regs[i],
> +					       &reg_val);
> +		if (ret)
> +			goto out;
> +
> +		scoped_guard(spinlock, &priv->stat_lock)

[Severity: High]
Can this cause a deadlock on the stat_lock?

This delayed work executes in process context and acquires the spinlock
without disabling softirqs.

The core network stack can concurrently invoke the .ndo_get_stats64
callback, which calls adin1140_ndo_get_stats64() from softirq context.

If the process-context thread is preempted by the softirq on the same
CPU, the softirq could spin forever attempting to acquire the same lock.

Should this use a softirq-safe guard like scoped_guard(spinlock_bh, ...)
to protect against softirq preemptions?

> +			priv->stats[i] +=3D reg_val;
> +	}
> +
> +out:
> +	schedule_delayed_work(dwork, ADIN1140_STATS_CHECK_DELAY);
> +}

[ ... ]

> +static void __adin1140_ndo_get_stats64(struct adin1140_priv *priv,
> +				       struct rtnl_link_stats64 *storage)
> +{
> +	storage->rx_errors =3D priv->stats[rx_crc_errors] +
> +			     priv->stats[rx_align_errors] +
> +			     priv->stats[rx_preamble_errors] +
> +			     priv->stats[rx_short_frame_errors] +
> +			     priv->stats[rx_long_frame_errors] +
> +			     priv->stats[rx_phy_errors] +
> +			     priv->stats[rx_ifg_errors];
> +
> +	storage->tx_errors =3D priv->stats[tx_excess_collision] +
> +			     priv->stats[tx_underrun];
> +
> +	storage->rx_dropped =3D priv->stats[rx_fifo_full_dropped] +
> +			      priv->stats[rx_addr_filter_dropped];

[Severity: Medium]
Will this overwrite existing software drop counters instead of aggregating
them?

The rx_dropped counter from the core network stack may already have values,
but this directly assigns the hardware drop counters to storage->rx_dropped,
overwriting any software drops that might have been recorded.

> +
> +	storage->multicast =3D priv->stats[rx_mc_frames];

[ ... ]

> +static void adin1140_ndo_get_stats64(struct net_device *dev,
> +				     struct rtnl_link_stats64 *storage)
> +{
> +	struct adin1140_priv *priv =3D netdev_priv(dev);
> +
> +	storage->rx_packets =3D priv->netdev->stats.rx_packets;
> +	storage->tx_packets =3D priv->netdev->stats.tx_packets;
> +
> +	storage->rx_bytes =3D priv->netdev->stats.rx_bytes;
> +	storage->tx_bytes =3D priv->netdev->stats.tx_bytes;

[Severity: Medium]
Are software-maintained statistics like tx_dropped intentionally omitted
here?

The oa_tc6 framework maintains drop statistics such as
netdev->stats.tx_dropped when skb_linearize() fails in oa_tc6_start_xmit().
However, this function only copies rx/tx_packets and rx/tx_bytes, leaving
tx_dropped and other core netdev stats unreported to userspace.

> +
> +	scoped_guard(spinlock, &priv->stat_lock)
> +		__adin1140_ndo_get_stats64(priv, storage);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-adin1140-d=
river-v5-0-4aca7b51a58b@analog.com?part=3D13
