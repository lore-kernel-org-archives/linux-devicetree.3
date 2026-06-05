Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AA93101A6
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 16:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780677199; cv=none; b=KfstK+TxxVqFavq9vDN60YdsKSTpxG25abYcKq+HD2uY5wxLoq4qrHi22P4qqeaDT5ae4kED+wFYhqBDYS6Jrc967vh2wkPVsamiQwZDXmyaGfJl/6kzO8QAFB567mpuymtzjAI0tx3F/ADyRCu6/DcFfbmZBLAAaj07L+PH5oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780677199; c=relaxed/simple;
	bh=WivcsqSeAXNSG8+CPidiBOKuFozL+j9/F9DfCpTQusA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dziRn1Ttyqo9RC6/7X5VEWQ5M/NRbsXS8J3rSloo3JNmZZvW766tIGiKSGNgKb4aZCLOS9IJTvErc0qcV5O2LkcpoBpPSsOgx49lBkg8FZ3BRFetlsKSsHCqQEksB18BJH7XHaVNNmL64kwBISYr4dsOQJG5FvY9SH4nmOucnUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VFRnL/Q3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VFRnL/Q3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1B7F1F0089B;
	Fri,  5 Jun 2026 16:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780677194;
	bh=mpRC3tdKlNBaK9EYEWNjfJysT3AsZ2AgFadl3DUUxLQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VFRnL/Q3gOftZLOW0IXKLJhCY7tjdc8/DOQxjvcchIHY0ovBOke4H5W3uaZdnhU+k
	 lGf4GeDOQ5c6vsQ+jRwH8hXtSq4z/Br6M4GSCcRLJj5IcnY4h/fmFM+/IqGueCpgpN
	 TcWSxR3Co4ma0GCCm1TSc+EzqiM1X74MoFGc0GolbsbXumE/4ovjc2vEdEk+bKRgua
	 lh+zWwf0RA7JwTbDfcTtN0pp3DbFO/m2ZoSANUFW0AfwEPUdaP57spr/PBE/cvYyjV
	 8RC86THLpf1lFCA2We6ARfaZ35UkmRxADNoOW9oJmOydhg8vaU2mYcg5p/pTMZsGXC
	 Silc8UEAs5a3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 13/13] net: ethernet: adi: Add a driver for
 the ADIN1140 MACPHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ciprian Regus via B4 Relay" <devnull+ciprian.regus.analog.com@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260604-adin1140-driver-v3-13-5debdb3173c4@analog.com>
References: <20260604-adin1140-driver-v3-13-5debdb3173c4@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 16:33:13 +0000
Message-Id: <20260605163313.F1B7F1F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Lockless iteration over network device MAC address lists causes us=
e-after-free.
- [High] Deadlock due to using a plain `spin_lock` for a lock shared with s=
oftirq context.
- [Medium] Secondary unicast addresses are discarded by the hardware when t=
he interface is in all-multicast mode.
- [Medium] A transient SPI read failure overwrites the driver's statistics =
history with zeros.
- [Medium] Clearing MAC filter slots fails to deactivate them, programming =
a filter for `00:00:00:00:00:00`.
- [Medium] Standard software statistics like `tx_dropped` are dropped and n=
ot reported to userspace.
--

commit 0c3599b0c7883e06b169d454b3d9ab26602d78f2
Author: Ciprian Regus <ciprian.regus@analog.com>
Subject: net: ethernet: adi: Add a driver for the ADIN1140 MACPHY

Add a driver for ADIN1140, a 10BASE-T1S MAC-PHY that connects over SPI. It
implements the Open Alliance TC6 protocol for control and frame transfers. =
The
driver provides a custom mii_bus implementation to work around hardware iss=
ues
with C22 access.

> diff --git a/drivers/net/ethernet/adi/adin1140.c b/drivers/net/ethernet/a=
di/adin1140.c
> new file mode 100644
> index 0000000000000..358e9a11c9936
> --- /dev/null
> +++ b/drivers/net/ethernet/adi/adin1140.c
[ ... ]
> +static int adin1140_mac_filter_set(struct adin1140_priv *priv,
> +				   const u8 *addr, const u8 *mask,
> +				   u8 slot)
> +{
[ ... ]
> +	reg_address =3D ADIN1140_MAC_ADDR_FILT_UPR_REG + 2 * slot;
> +
> +	ret =3D oa_tc6_write_register_mms(priv->tc6, OA_TC6_VEND_MMS1,
> +					reg_address,
> +					get_unaligned_be16(&addr[0]) |
> +					ADIN1140_MAC_ADDR_FILT_APPLY2PORT1 |
> +					ADIN1140_MAC_ADDR_FILT_TO_HOST);

[Severity: Medium]
Will this unintentionally activate the filter slot when trying to clear it?

When adin1140_mac_filter_clear() calls this function with an all-zero MAC
address, it unconditionally bitwise-ORs the ADIN1140_MAC_ADDR_FILT_APPLY2PO=
RT1
and ADIN1140_MAC_ADDR_FILT_TO_HOST bits into the register write. This fails
to disable the filter, and instead actively enables the slot to match frames
with the destination MAC address 00:00:00:00:00:00.

Could an attacker on the local network bypass the hardware filter by
sending frames to this address, forcing the MAC to forward them over the
SPI bus? A proper clear might need to write 0 to the register to completely
disable the slot.

[ ... ]
> +static void adin1140_rx_mode_work(struct work_struct *work)
> +{
[ ... ]
> +	mac_addrs =3D netdev_uc_count(priv->netdev) +
> +		    netdev_mc_count(priv->netdev);
> +
> +	if (priv->netdev->flags & IFF_PROMISC) {
> +		promisc =3D true;
> +		all_multi =3D false;
> +	} else if (priv->netdev->flags & IFF_ALLMULTI) {
> +		promisc =3D false;
> +		all_multi =3D true;

[Severity: Medium]
Does this logic prevent unicast filters from being programmed when
IFF_ALLMULTI is active?

If IFF_ALLMULTI is set, the logic enters this else-if block but skips the
subsequent block that programs secondary unicast MAC addresses into the
hardware filters. Because promiscuous mode is disabled in this state, will
the hardware filter drop any frames destined for secondary unicast addresses
(such as those used by macvlan interfaces on top of this device)?

> +	} else if (mac_addrs <=3D ADIN1140_MAC_FILT_AVAIL) {
> +		promisc =3D false;
> +		all_multi =3D false;
> +
> +		slot =3D ADIN1140_MAC_FILT_UC_SLOT + 1;
> +		memset(mask, 0xFF, ETH_ALEN);
> +
> +		netdev_for_each_uc_addr(ha, priv->netdev) {
> +			ret =3D adin1140_mac_filter_set(priv, ha->addr, mask,
> +						      slot);

[Severity: High]
Does iterating over the network device MAC address lists here without holdi=
ng
the netif_addr_lock_bh() spinlock cause a use-after-free?

This function executes in a workqueue (process context). Because it does not
acquire the lock, concurrent modifications to these lists from the networki=
ng
stack (e.g., via dev_uc_add() or dev_uc_del()) can alter the list structure
or free list nodes during traversal, resulting in use-after-free crashes or
infinite loops.

Since the loop performs sleepable SPI writes, should the driver copy the
addresses into a local array while holding the lock, and then perform the
SPI writes outside the lock?

> +			if (ret)
> +				return;
> +
> +			slot++;
> +		}
> +
> +		netdev_for_each_mc_addr(ha, priv->netdev) {
> +			ret =3D adin1140_mac_filter_set(priv, ha->addr, mask,
> +						      slot);

[Severity: High]
Can the same use-after-free happen here with the multicast list?

Like the unicast list, traversing the multicast list locklessly in an
asynchronous workqueue leaves the traversal vulnerable to concurrent list
modifications.

[ ... ]
> +static void adin1140_stats_work(struct work_struct *work)
> +{
> +	struct delayed_work *dwork =3D to_delayed_work(work);
> +	u64 stat_buff[ADIN1140_STATS_CNT] =3D {};
> +	struct adin1140_priv *priv;
> +	u32 reg_val;
> +	int ret;
> +	u32 i;
> +
> +	priv =3D container_of(dwork, struct adin1140_priv, stats_work);
> +
> +	for (i =3D 0; i < ARRAY_SIZE(adin1140_stat_regs); i++) {
> +		ret =3D oa_tc6_read_register_mms(priv->tc6, OA_TC6_VEND_MMS1,
> +					       adin1140_stat_regs[i],
> +					       &reg_val);
> +		if (ret)
> +			break;
> +
> +		stat_buff[i] =3D reg_val;
> +	}
> +
> +	scoped_guard(spinlock, &priv->stat_lock)
> +		memcpy(&priv->stats, stat_buff, sizeof(priv->stats));

[Severity: Medium]
Will a transient SPI read failure overwrite the driver's statistics history
with zeros?

The stat_buff array is initialized to zero. If oa_tc6_read_register_mms()
fails due to a transient SPI error, the loop breaks early, leaving the
remaining elements in stat_buff as zero. The function then unconditionally
copies this partially zeroed buffer over priv->stats. This wipes out all
previously accumulated values for the unread statistics.

Should the driver skip the stats update entirely if an error occurs, so
statistics don't incorrectly report as zero to userspace until the next
successful poll?

[Severity: High]
Does acquiring this plain spinlock in process context create a deadlock risk
with softirq contexts?

The adin1140_stats_work() function runs in process context, while
adin1140_ndo_get_stats64() can be called from softirq context (e.g., during
packet transmission or by qdiscs) via dev_get_stats().

If adin1140_stats_work() acquires the lock in process context and a softirq
fires on the same CPU attempting to read statistics, the softirq will wait
on the same lock, deadlocking the CPU. Does any process context code
acquiring stat_lock need to disable softirqs (e.g., using spinlock_bh)?

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
Are standard software statistics like tx_dropped discarded here and not
reported to userspace?

The driver manually copies a few fields from priv->netdev->stats to the
storage parameter, but fails to include others like tx_dropped. The oa_tc6
framework specifically increments tc6->netdev->stats.tx_dropped on
transmission errors.

Should this use netdev_stats_to_stats64(storage, &dev->stats) to copy all
base software statistics before adding the driver-specific hardware counter=
s?

> +
> +	scoped_guard(spinlock, &priv->stat_lock)
> +		__adin1140_ndo_get_stats64(priv, storage);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-adin1140-d=
river-v3-0-5debdb3173c4@analog.com?part=3D13
