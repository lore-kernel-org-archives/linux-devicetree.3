Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601C8296BCB
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 00:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102159; cv=none; b=KIFwHQpq5HEPt0sSNmXclQrW6Iv0S8I0OdJV4RyhFBCL8JX1rnmuMv/VFuT1GddyVOSEp4JfE9R5701b4/Yio0xckra00gp5Vf9Svkta+HtwWAFddB4MQt7b9I+6COe9a0zgapLgQp9vjs2zXg0bYr9xhCgWH+V2Zk7bY8/ro+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102159; c=relaxed/simple;
	bh=EGSqw2V6NenqXz1u67+T4C22IMJYAgjHLEpTHN8mXJg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U8yLZXLqASC3eljBF1AyHiOtTjI2oLNlvg//xXu8lY4ya5UTqorsp29mJLGt4XtWyFUupErpUEOJB7it449Y7m/vFiyQxvjVH69HScE0zrGOpdfOSGdPpZiXPkP+T16TYNkCcBgi28ii9oh0NStNIOY+a9OiRH1DZVGPyq/FT58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mCxgog2q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mCxgog2q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184B81F00899;
	Sat, 30 May 2026 00:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102158;
	bh=lE1hwwaz3OlX+Lb6mD8/SRzImkAT5W+9cx6Z3xXL2h8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mCxgog2qVw+jxqfb5Jc7IFlaSRJvLrlDuL8picAoXlreL9tTtA/7tFEKDX4168LcG
	 Yi4rnZaFkF2UT1QF/gQf5e5d8e/wI8n92mE8PxJmpdRYLdJ1UgfvDHo/hHrZUWlvip
	 BRayV0DIYmMWL5l99kUSIbJqL57h2XAiIkGtV+wgc6m6hxwuK1TVUfulM9krOe/NFD
	 1MOhlJUUyrzHomp/QduEtx+d/f+ZBonvHFgoQ3f8lylbFt2+DlFcvq5mV8UiPLpw8I
	 9U04bSzN5y3KrrNIcxdVdYSRYY35bdeWwHyKwvI32hULpvnUchqQFwZ8msBTvmE2Ka
	 VouG+J4+AqQfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 10/10] net: ethernet: adi: Add a driver for
 the ADIN1140 MACPHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ciprian Regus via B4 Relay" <devnull+ciprian.regus.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260527-adin1140-driver-v2-10-37e5c8d4e0a0@analog.com>
References: <20260527-adin1140-driver-v2-10-37e5c8d4e0a0@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:49:17 +0000
Message-Id: <20260530004918.184B81F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Incorrect teardown order in `adin1140_remove` allows workqueue use=
-after-free.
- [High] Data race and list corruption when traversing MAC address lists wi=
thout `netif_addr_lock_bh`.
- [High] Potential deadlock due to `spin_lock()` usage in process context w=
ithout disabling bottom halves.
- [High] Statistics corruption: hardware counters are overwritten instead o=
f accumulated, and zeroed on read failure.
- [High] Resource leak and invalid state due to calling `mdiobus_free()` on=
 a registered bus.
- [High] Logic errors in MAC filter programming (`adin1140_rx_mode_work`).
- [High] Unconditional re-arming in `adin1140_stats_work` causes polling af=
ter close and use-after-free.
- [Medium] Returning `-EIO` in `adin1140_mdiobus_write` disrupts PHY framew=
ork operations.
--

commit dcc3638a661c0f596ed52cec0edc4d46a70735da
Author: Ciprian Regus <ciprian.regus@analog.com>
Subject: net: ethernet: adi: Add a driver for the ADIN1140 MACPHY

This commit adds a driver for the ADIN1140 10BASE-T1S MAC-PHY connected
over SPI. It implements the Open Alliance TC6 protocol for control and
frame transfers. The driver implements a custom mii_bus to intercept C22
accesses and uses workqueues to process statistics and rx_mode
configurations asynchronously.

> diff --git a/drivers/net/ethernet/adi/adin1140.c b/drivers/net/ethernet/a=
di/adin1140.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/net/ethernet/adi/adin1140.c

[ ... ]

> +static void adin1140_rx_mode_work(struct work_struct *work)
> +{
> +	struct adin1140_priv *priv =3D container_of(work, struct adin1140_priv,
> +						  rx_mode_work);
> +	struct netdev_hw_addr *ha;

[ ... ]

> +	if (priv->netdev->flags & IFF_PROMISC) {
> +		promisc =3D true;
> +		all_multi =3D false;
> +	} else if (priv->netdev->flags & IFF_ALLMULTI) {
> +		promisc =3D false;
> +		all_multi =3D true;

[Severity: High]
If the interface is configured with IFF_ALLMULTI, does this skip programming
the secondary unicast MAC addresses? It looks like the if/else structure
bypasses the unicast address loop entirely in this state, which might cause
the device to silently drop traffic destined for those secondary addresses.

> +	} else if (mac_addrs <=3D ADIN1140_MAC_FILT_AVAIL) {
> +		promisc =3D false;
> +		all_multi =3D false;
> +
> +		slot =3D ADIN1140_MAC_FILT_UC_SLOT + 1;
> +		memset(mask, 0xFF, ETH_ALEN);
> +
> +		netdev_for_each_uc_addr(ha, priv->netdev) {

[Severity: High]
Is a lock needed when traversing these address lists? Since this executes=20
asynchronously in a workqueue, the core network stack could concurrently=20
modify the lists. Without holding netif_addr_lock_bh(), could this lead=20
to list corruption or a use-after-free?

Also, if the number of unicast or multicast addresses has shrunk since
the last update, should the driver clear the remaining unused filter slots?
Without clearing them, the hardware might continue matching and forwarding
packets for MAC addresses that were already deleted.

> +			ret =3D adin1140_mac_filter_set(priv, ha->addr, mask,
> +						      slot);

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
> +		ret =3D oa_tc6_read_register(priv->tc6, adin1140_stat_regs[i],
> +					   &reg_val);
> +		if (ret)
> +			break;
> +
> +		stat_buff[i] =3D reg_val;
> +	}
> +
> +	spin_lock(&priv->stat_lock);
> +	memcpy(&priv->stats, stat_buff, sizeof(priv->stats));

[Severity: High]
Could this lead to statistics corruption? If oa_tc6_read_register() fails
transiently, the loop breaks early leaving the rest of stat_buff as zeroes,
which are then copied over the entire priv->stats array.

Additionally, by replacing the values instead of accumulating them (using +=
=3D),
won't the 64-bit software counters just mirror the 32-bit hardware counters
and lose their history once the hardware registers wrap around?

[Severity: High]
Since adin1140_ndo_get_stats64() can be called from softirq/BH context
and acquires priv->stat_lock using spin_lock(), is there a risk of an
ABBA deadlock here? If a softirq preempts this process context workqueue
while the lock is held, it might spin forever trying to acquire it. Should
this use spin_lock_bh() instead?

> +	spin_unlock(&priv->stat_lock);
> +
> +	schedule_delayed_work(dwork, ADIN1140_STATS_CHECK_DELAY);

[Severity: High]
Should this check if the interface is still running before re-arming?
When the device is closed, adin1140_close() calls cancel_delayed_work_sync(=
).
If the work is running during that call, it will wait for it to finish, but
then re-arm itself here right before returning. This could cause the work to
keep polling after the interface is down, eventually leading to a=20
use-after-free when the module is removed and the netdev is freed.

> +}

[ ... ]

> +static int adin1140_mdiobus_write(struct mii_bus *bus, int addr, int reg=
num,
> +				  u16 val)
> +{
> +	return -EIO;
> +}

[Severity: Medium]
The commit message mentions that the C22 write function is a no-op to
protect against the ioctl MDIO access path. However, returning -EIO will
propagate an error. Could this disrupt standard PHY framework operations
like genphy_suspend() or genphy_resume() by making them abort under the
assumption that the MDIO bus is broken? Would returning 0 be more
appropriate for a true no-op?

[ ... ]

> +static int adin1140_phy_init(struct adin1140_priv *priv,
> +			     struct spi_device *spidev)
> +{
> +	int ret;
> +
> +	ret =3D adin1140_mdio_register(priv, spidev);
> +	if (ret)
> +		return ret;
> +
> +	priv->phydev =3D phy_find_first(priv->mdiobus);
> +	if (!priv->phydev) {
> +		netdev_err(priv->netdev, "No PHY found\n");
> +		ret =3D -ENODEV;
> +		goto free_mdio;

[Severity: High]
If adin1140_mdio_register() succeeds, the MDIO bus is fully registered.
Jumping to free_mdio will call mdiobus_free() on a registered bus. Doesn't
this violate the MDIO subsystem API, trigger a kernel warning, and leak
resources? Should this jump to unregister_mdio instead?

> +	}

[ ... ]

> +unregister_mdio:
> +	mdiobus_unregister(priv->mdiobus);
> +free_mdio:
> +	mdiobus_free(priv->mdiobus);
> +
> +	return ret;
> +}

[ ... ]

> +static void adin1140_remove(struct spi_device *spi)
> +{
> +	struct adin1140_priv *priv =3D spi_get_drvdata(spi);
> +
> +	cancel_work_sync(&priv->rx_mode_work);
> +	unregister_netdev(priv->netdev);

[Severity: High]
Is this the correct teardown order? During unregister_netdev(), the network
core drops device state (like clearing IFF_PROMISC), which will trigger
ndo_set_rx_mode and schedule rx_mode_work again. The priv memory is then
freed by free_netdev(). If the re-queued work executes, won't it access
the freed priv pointer and cause a kernel panic? Should unregister_netdev()
be called before cancelling the workqueue?

> +	adin1140_phy_remove(priv);
> +	oa_tc6_exit(priv->tc6);
> +	free_netdev(priv->netdev);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527-adin1140-d=
river-v2-0-37e5c8d4e0a0@analog.com?part=3D10
