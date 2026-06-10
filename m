Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AC841166E
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 15:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781105307; cv=none; b=ZcmAJcNYSUz7rmbCLZHgqa4nEr+fGYsmkOoBtXq+HGkPMa0B9u8bGulpsMpWX97e6sEmphhIiTx7O6tNj4e7S6/sx9lR6EmX7tjlc6idAu7k942t19xgo6eP/uUjNXdgBbSFuTS8ZHrgRNzQKyfVU/Cc08l2ph3VW6E0EbcTscI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781105307; c=relaxed/simple;
	bh=jvMswIHKOdWgmRUpttOx01FhrMdCHMXjmnBBhqLzb+U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CvTTRGVr+qAlaecKh1UxNSMrLFUdRFhlFZNDscDyUuTu2tc6HiYz/fWFTUuD9LeKu6nFZbzA1RI5fEhVWs9VXwbok2QUuplGL96WFWQsgcDIAnd9HmUIPIe7RquRBkPtGAWNEcWaNlUNggkiSLWjrnYEkydbb4NSMenSsvd5asY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lAJ34MBs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lAJ34MBs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C80C1F00893;
	Wed, 10 Jun 2026 15:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781105306;
	bh=hpfmhJ8c7U8zstn9BIl1SfDKHC1RX6NJJyOvLCbChPA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lAJ34MBsgMgrIEvGjbxfPzHP8gkHODsTn6dRsORWacMtyS6rIvL09pu4YrJA6AN4A
	 MqxMZ6lT9iI/71+8ADaTU0QG2nqlzz+0OnoUsakoHxNYeispoWpxoLTyZaNGSeEdXI
	 OofFqF7lQrc4SNFjMVI8qVCS8YUECP1/gxe060ezkvncvtWOL71EbTwcrPon9GDq4E
	 zcgKlV0ckTZCajO1KIwc+mXkQ9lnR9LgYHcVPumyIsrRID9dyc8rOuJRl0IPPlQDXB
	 0a2XdC6kyy3d7udwFZJvs4P46wzZHC1d13Sn3M/vZMArhQH7bDV3CuPbh03FQxRfZx
	 qUFjnDmXcFGqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 13/13] net: ethernet: adi: Add a driver for
 the ADIN1140 MACPHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ciprian Regus via B4 Relay" <devnull+ciprian.regus.analog.com@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260609-adin1140-driver-v4-13-0753e28ee004@analog.com>
References: <20260609-adin1140-driver-v4-13-0753e28ee004@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 15:28:25 +0000
Message-Id: <20260610152826.2C80C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Data race and potential use-after-free when iterating MAC address =
lists in workqueue.
- [High] Hardware statistics are overwritten rather than accumulated, causi=
ng data loss and stats reset on SPI errors.
- [High] Deadlock risk between process context and softirq due to unsafe sp=
inlock usage.
- [High] Secondary unicast MAC addresses are silently dropped when `IFF_ALL=
MULTI` is active.
- [Medium] Clearing a MAC address filter creates an active forwarding rule =
for the 00:00:00:00:00:00 address.
- [Medium] The custom MDIO C22 write function returns an error code instead=
 of acting as a graceful no-op.
--

commit a8bc37d287ad78517cf1f710ad53f270ab363716
Author: Ciprian Regus <ciprian.regus@analog.com>

net: ethernet: adi: Add a driver for the ADIN1140 MACPHY
   =20
Add a driver for ADIN1140. The device is a 10BASE-T1S MAC-PHY
that connects to a CPU over an SPI bus, and implements the Open
Alliance TC6 protocol for control and frame transfers.

> diff --git a/drivers/net/ethernet/adi/adin1140.c b/drivers/net/ethernet/a=
di/adin1140.c
> new file mode 100644
> index 0000000000000..306e5de6faa54
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
When clearing a MAC address filter, does this unconditionally force the fil=
ter
slot to an enabled state?=20

In adin1140_mac_filter_clear(), the driver attempts to disable a filter slot
by programming it with an all-zeros MAC address and an all-ones mask. Howev=
er,
calling this function unconditionally sets the
ADIN1140_MAC_ADDR_FILT_APPLY2PORT1 and ADIN1140_MAC_ADDR_FILT_TO_HOST bits.

Instead of safely disabling the filter slot, does this activate an explicit
forwarding rule that forces the MAC to send any frames addressed to
00:00:00:00:00:00 to the host? Unused filter slots should likely have their
enable bits cleared rather than being reprogrammed with active dummy rules.

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
> +	} else if (mac_addrs <=3D ADIN1140_MAC_FILT_AVAIL) {

[Severity: High]
Are secondary unicast MAC addresses silently dropped when IFF_ALLMULTI is
active?=20

This exclusive else-if chain skips the block responsible for programming bo=
th
the unicast (uc) and specific multicast (mc) address lists when IFF_ALLMULTI
is enabled. Since IFF_ALLMULTI does not place the hardware in full promiscu=
ous
mode (which would implicitly accept all unicast traffic), it appears all ne=
wly
added secondary unicast addresses will fail to be programmed. Unicast addre=
ss
programming should probably not be mutually exclusive with the IFF_ALLMULTI
toggle.

> +		promisc =3D false;
> +		all_multi =3D false;
> +
> +		slot =3D ADIN1140_MAC_FILT_UC_SLOT + 1;
> +		memset(mask, 0xFF, ETH_ALEN);
> +
> +		netdev_for_each_uc_addr(ha, priv->netdev) {

[Severity: High]
Does iterating the network device's address lists in a workqueue without
holding netif_addr_lock_bh() risk a data race and potential use-after-free?

Because this runs asynchronously in a process context, it can race against
concurrent modifications to the lists (e.g., dev_uc_add or dev_mc_add invok=
ed
via socket options or core network events). Since the workqueue needs to sl=
eep
to perform SPI transfers, should the driver acquire the lock, safely copy t=
he
addresses to a local buffer, release the lock, and then perform the hardware
configuration?

> +			ret =3D adin1140_mac_filter_set(priv, ha->addr, mask,
> +						      slot);
> +			if (ret)
> +				return;
> +
> +			slot++;
> +		}
[ ... ]
> +static void adin1140_stats_work(struct work_struct *work)
> +{
[ ... ]
> +	for (i =3D 0; i < ARRAY_SIZE(adin1140_stat_regs); i++) {
> +		ret =3D oa_tc6_read_register_mms(priv->tc6, OA_TC6_MAC_MMS1,
> +					       adin1140_stat_regs[i],
> +					       &reg_val);
> +		if (ret)
> +			break;
> +
> +		stat_buff[i] =3D reg_val;
> +	}
> +
> +	scoped_guard(spinlock, &priv->stat_lock)

[Severity: High]
Is there a deadlock risk here between process context and softirq?

The stat_lock is acquired in process context using scoped_guard(), which
translates to spin_lock() and does not disable bottom halves. However,
stat_lock is also acquired by the ndo_get_stats64 callback
(adin1140_ndo_get_stats64()), which can be executed from softirq context.
If a softirq fires on the same CPU while the workqueue holds the lock, the
softirq will spin indefinitely waiting for it. The driver must likely use
spin_lock_bh() for stat_lock.

[Severity: High]
Also, are hardware statistics overwritten rather than accumulated here?

If an SPI read fails, the loop breaks early, leaving the remaining elements=
 in
the zero-initialized stat_buff as 0. The memcpy then unconditionally overwr=
ites
the 64-bit software stats with these zeros, destroying previously accumulat=
ed
statistics.

Additionally, since hardware statistics counters are 32-bit and either wrap
or clear on read, overwriting the 64-bit priv->stats instead of accumulating
the deltas defeats the purpose of maintaining 64-bit software counters, as =
the
values will wrap around alongside the hardware.

> +		memcpy(&priv->stats, stat_buff, sizeof(priv->stats));
> +
> +	schedule_delayed_work(dwork, ADIN1140_STATS_CHECK_DELAY);
> +}
[ ... ]
> +static int adin1140_mdiobus_write(struct mii_bus *bus, int addr, int reg=
num,
> +				  u16 val)
> +{
> +	return -EIO;

[Severity: Medium]
The commit message states that the C22 write function is a 'no-op' designed
to protect against ioctl MDIO access path hardware corruption. However, this
unconditionally returns -EIO.=20

Returning an error is functionally distinct from a no-op, as it signals an
I/O failure up to the MDIO core, potentially causing userspace tools or sta=
ndard
PHY setup functions to loudly fail instead of gracefully bypassing the writ=
e.
If the hardware workaround necessitates silently ignoring C22 writes, should
this function return 0 instead?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-adin1140-d=
river-v4-0-0753e28ee004@analog.com?part=3D13
