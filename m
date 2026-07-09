Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914DC39EB47
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 17:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617173; cv=none; b=ZquxKpvupQ4C59d/As/0uUeWEBRzrN3RG6I09dg6u7TbePYMHSvHLAuymtcRV2BccVQNkRcAgALavTzseJC7cJEyaeJ52t4gM1ZusxstwU0v/sl9o7b4WljD3eRbl/zUHRD3wmx40dIEl3EnJ/B5i4sdX3N7sCTrg9GtNBHmi20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617173; c=relaxed/simple;
	bh=pdWLfcc2rFKshEgBnzc0Vc7Eu5qnZSRXfqqx5tnOjzY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kIJYnRQIv7+cQYvTAvsWSMgA9PGQAhw2t+wfwxDeTEq2jaumibkF7gQKNXcTKvTEHswNrpXyFv0G8UjPkP8Vvuz+s7LTdF488i4IrL4+KZnyLBoPHcrHnb7IUHl4eKX4gHT3fhQQQi72OIu4iHrlc26pMfPOaYPN8lAMKnnsUQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BO68pHQm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BO68pHQm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B0A51F00A3A;
	Thu,  9 Jul 2026 17:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783617171;
	bh=7PsIrDH+j0smp15KM5OTWmHXapp4KpCOv1h5Ih4aZWo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BO68pHQm1wZplZphrSJqzQ08Mf4ljnYaCMFCLn+BITp7l67gJbRpTnnjd81x/dIx7
	 0BnmHwhGi1Th00BZXScTNN0h8Qg8do5B8OX7ivQjXy8eRYcMIKwPbyYadbugbSYFrP
	 eJZWLMyCn/uyU69JGcfBy6uZ0BR0h2b5dV/+TjjSdUNBQOH3TZUzWddHhJrnyVEnq4
	 FO+I9+n9PUNmq/p+JmkcqLUXjwts2v/H2dbDpo9PohK8Vm0yttyUXes9GWoqxS0lE5
	 KI1n5T5+oyCysJlAyOAX9raFBCihMWP5lszL7kxclP40wgTXqRjFy0j5sdmQ9TzIVg
	 M/OVANR+WEaAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 14/15] onsemi: s2500: Add driver support for
 TS2500 MAC-PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal" <Selvamani.Rajagopal@onsemi.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-s2500-mac-phy-support-v7-14-478c877aa1a9@onsemi.com>
References: <20260708-s2500-mac-phy-support-v7-0-478c877aa1a9@onsemi.com>
 <20260708-s2500-mac-phy-support-v7-14-478c877aa1a9@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:12:50 +0000
Message-Id: <20260709171251.1B0A51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [High] PTP `adjtime` callback incorrectly blocks the caller by sleeping f=
or up to 60 seconds to emulate hardware slewing.
- [High] Early exit of the background kthread on transient errors causes a =
Use-After-Free when `kthread_stop()` is later called.
- [High] Missing cleanup in `s2500_open()` error paths leaks the kthread an=
d leaves an `ERR_PTR` that causes crashes.
- [High] Missing cleanup in `s2500_probe()` error paths leaks `oa_tc6` and =
the PTP clock device.
- [High] The frequency adjustment calculation in `s2500_ptp_adjtime` is off=
 by a factor of 1000.
- [High] Unprotected read-modify-write on `S2500_REG_MAC_CTRL` leads to tor=
n updates, potentially leaving the MAC enabled after the interface is stopp=
ed.
- [High] Lockless iteration of the network device multicast address list in=
 the background kthread.
- [Medium] Standard network statistics are incorrectly duplicated as privat=
e `ethtool -S` strings instead of implementing standard APIs.
- [Medium] Missing state barrier in the kthread wait loop allows `kthread_s=
top()` wakeups to be lost, hanging `ndo_stop` for 5 seconds.
- [Medium] `s2500_init` masks the failure of `s2500_set_mac_filter`, allowi=
ng initialization to succeed even if the hardware MAC filter cannot be prog=
rammed.
- [Medium] `s2500_set_multicast_mode` forgets to re-enable the hardware mul=
ticast filter after programming specific MACs.
--

--- Patch [14]: [PATCH net-next v7 14/15] onsemi: s2500: Add driver support=
 for TS2500 MAC-PHY ---
commit 6987fd19b1f59d7fe0c41efd95d6c4fa14e869c0
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

onsemi: s2500: Add driver support for TS2500 MAC-PHY

Support for onsemi's S2500, 802.3 cg compliant Ethernet transceiver with
integrated MAC-PHY. Works with Open Alliance TC6 framework.

> diff --git a/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c b/drivers/=
net/ethernet/onsemi/s2500/s2500_ethtool.c
> index 0000000000000..7e96d9ad563f8
> --- /dev/null
> +++ b/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c
[ ... ]
> +static const char s2500_mac_stat_strings[][ETH_GSTRING_LEN] =3D {
> +	"tx_bytes",
> +	"tx_frames",

[Severity: Medium]
Should these standard network statistics be duplicated as private ethtool -S
strings?=20

Standard metrics like tx_bytes, tx_frames, and rx_crc_errors are typically
exposed through standard network APIs such as ndo_get_stats64 rather than
added as custom strings.

> +	"tx_broadcast_frames",
> +	"tx_multicast_frames",
> +	"tx_underflow_errors",
[ ... ]
> diff --git a/drivers/net/ethernet/onsemi/s2500/s2500_main.c b/drivers/net=
/ethernet/onsemi/s2500/s2500_main.c
> index 0000000000000..2d81b44f8c76c
> --- /dev/null
> +++ b/drivers/net/ethernet/onsemi/s2500/s2500_main.c
[ ... ]
> +static int s2500_mac_ctrl_modify_bits(struct s2500_info *priv,
> +				      u32 in_bits, bool clr)
> +{
> +	u16 mms =3D OA_TC6_PHY_C45_MAC_MMS1;
> +	u32 reg =3D S2500_REG_MAC_CTRL;
> +	u32 rval =3D 0;
> +	u32 wval =3D 0;
> +	int ret;
> +
> +	ret =3D oa_tc6_read_register_mms(priv->tc6, reg, mms, &rval);
> +	if (ret)
> +		return ret;
> +
> +	if (clr)
> +		wval =3D rval & ~in_bits;
> +	else
> +		wval =3D rval | in_bits;
> +	if (rval !=3D wval)
> +		ret =3D oa_tc6_write_register_mms(priv->tc6, reg,
> +						mms, wval);

[Severity: High]
Can this sequence cause torn updates if called concurrently?

s2500_mac_ctrl_modify_bits() performs a lockless read-modify-write on
S2500_REG_MAC_CTRL over SPI.=20

If the shutdown logic in s2500_shutdown() races with the kthread updating
promiscuous or multicast flags, could the kthread overwrite the register and
inadvertently resurrect TX/RX after they were cleared?

> +	return ret;
> +}
> +
> +static int s2500_init(struct s2500_info *priv)
> +{
[ ... ]
> +	/* Program the source MAC address into the device */
> +	ret =3D s2500_set_mac_filter(priv->ndev, priv->ndev->dev_addr);
> +
> +	val =3D S2500_MAC_CTRL_ADRF_BIT | S2500_MAC_CTRL_FCSA_BIT;
> +
> +	return s2500_mac_ctrl_modify_bits(priv, val, false);

[Severity: Medium]
Is it intentional to overwrite the error status from s2500_set_mac_filter()
here?=20

If writing the MAC filter fails due to an SPI error, the next line overwrit=
es
the ret variable, allowing initialization to succeed even if the hardware
filter cannot be programmed.

> +}
> +
> +static void s2500_shutdown(struct s2500_info *priv)
[ ... ]
> +static int s2500_set_multicast_mode(struct s2500_info *priv,
> +				    unsigned int rx_flags)
> +{
> +	u16 mms =3D OA_TC6_PHY_C45_MAC_MMS1;
> +	int i, ret =3D 0;
> +	u16 addr;
> +	u32 val;
> +
> +	if ((rx_flags & IFF_ALLMULTI) ||
> +	    (netdev_mc_count(priv->ndev) > S2500_N_MCAST_FILTERS)) {
> +		/* Disable multicast filter */
> +		ret =3D s2500_mac_ctrl_modify_bits(priv,
> +						 S2500_MAC_CTRL_MCSF_BIT,
> +						 true);
> +		if (ret)
> +			return ret;
> +
> +		/* Accept all multicasts */
[ ... ]
> +	} else {
> +		struct netdev_hw_addr *ha;
> +		u32 addrh, addrl;
> +
> +		/* Disable multicast filter */
> +		ret =3D s2500_mac_ctrl_modify_bits(priv,
> +						 S2500_MAC_CTRL_MCSF_BIT,
> +						 true);
> +		if (ret)
> +			return ret;
> +
> +		/* Disable filters */
> +		for (i =3D 1; i <=3D S2500_N_MCAST_FILTERS; i++) {
> +			addr =3D S2500_REG_MAC_ADDRFILTH(i);
> +			ret =3D oa_tc6_write_register_mms(priv->tc6,
> +							addr, mms, 0);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		i =3D 1;
> +		netdev_for_each_mc_addr(ha, priv->ndev) {

[Severity: High]
Is it safe for the background kthread to iterate the multicast address list
without holding netif_addr_lock_bh()?=20

If the network stack concurrently adds or removes multicast addresses, could
this lockless traversal of priv->ndev->mc cause list corruption or a
use-after-free?

> +			if (i > S2500_N_MCAST_FILTERS)
> +				break;
> +
> +			addrh =3D S2500_MAC_ADDRFILT_EN_BIT |
[ ... ]
> +			addr =3D S2500_REG_MAC_ADDRMASKH(i);
> +			ret =3D oa_tc6_write_register_mms(priv->tc6,
> +							addr, mms,
> +							0xffff);
> +			if (ret)
> +				return ret;
> +			i++;
> +		}
> +	}
> +	return ret;

[Severity: Medium]
Does s2500_set_multicast_mode() leave the global multicast filter disabled
after programming specific MACs?=20

The code disables the filter by clearing S2500_MAC_CTRL_MCSF_BIT, but there
doesn't appear to be a corresponding call to modify_bits(..., false) to
re-enable it before returning.

> +}
> +
> +/* Deferred function for applying RX mode flags in non-atomic context */
[ ... ]
> +static int s2500_thread_fun(void *data)
> +{
> +	struct s2500_info *priv =3D data;
> +	bool update_rx_mode =3D false;
> +	unsigned long flags;
> +	signed long tout;
> +	int ret =3D 0;
> +
> +	tout =3D priv->poll_jiff;
> +
> +	do {
> +		if (update_rx_mode) {
> +			ret =3D s2500_rx_mode_update(priv);
> +			if (unlikely(ret)) {
> +				dev_err(&priv->spi->dev,
> +					"Failed to set new RX mode");
> +				break;

[Severity: High]
Could this break statement cause a use-after-free during driver unload?

If the kthread encounters an error during s2500_rx_mode_update() and breaks
out of its loop, it terminates itself. Later, when s2500_stop() is called,
it invokes kthread_stop(priv->thread) on the freed task_struct pointer.

> +			}
> +		}
> +
> +		if (tout =3D=3D 0) {
[ ... ]
> +		s2500_process_events(priv);
> +
> +		spin_lock_irqsave(&priv->lock, flags);
> +		__set_current_state(TASK_INTERRUPTIBLE);

[Severity: Medium]
Can a wakeup from kthread_stop() be lost here?=20

Setting the task state to TASK_INTERRUPTIBLE without re-checking
kthread_should_stop() after the lock is released might cause the loop to sl=
eep
in schedule_timeout(), stalling the network stack module unload for up to 5
seconds.

> +
> +		update_rx_mode =3D priv->rx_flags_upd;
> +		ret =3D update_rx_mode;
[ ... ]
> +static int s2500_open(struct net_device *ndev)
> +{
> +	struct s2500_info *priv =3D netdev_priv(ndev);
> +	int ret =3D 0;
> +	u32 val;
> +
> +	dev_dbg(&ndev->dev, "%s", "s2500_open");
> +	phy_start(priv->ndev->phydev);
> +
> +	priv->thread =3D kthread_run(s2500_thread_fun, priv,
> +				   DRV_NAME "/%s:%d",
> +				   dev_name(&priv->spi->dev),
> +				   spi_get_chipselect(priv->spi, 0));
> +
> +	if (IS_ERR(priv->thread)) {
> +		ret =3D PTR_ERR(priv->thread);
> +	} else {

[Severity: High]
Does this error path leak the started PHY or leave an invalid pointer in
priv->thread?=20

If kthread_run() fails, returning here leaves priv->thread as an ERR_PTR.
Later calls to s2500_set_rx_mode() could attempt to call wake_up_process()
on this ERR_PTR.

> +		val =3D S2500_MAC_CTRL_TXEN_BIT | S2500_MAC_CTRL_RXEN_BIT;
> +		ret =3D s2500_mac_ctrl_modify_bits(priv, val, false);
> +
> +		netif_start_queue(priv->ndev);
> +	}
> +	return ret;
> +}
[ ... ]
> +static int s2500_probe(struct spi_device *spi)
> +{
[ ... ]
> +	ret =3D register_netdev(ndev);
> +	if (ret) {
> +		dev_err(&spi->dev, "failed to register netdev\n");
> +		ret =3D -ENODEV;
> +
> +		goto err_reg_read;
> +	}
> +	return 0;
> +
> +err_reg_read:
> +	dev_err(&spi->dev, "could not initialize macphy");
> +	return ret;

[Severity: High]
Does this error path need to call oa_tc6_exit() or oa_tc6_ptp_unregister()?

If probe fails during s2500_init, s2500_ptp_register, or register_netdev,
returning directly leaks the oa_tc6 instance and the PTP clock device, which
could lead to a use-after-free since priv is devres-managed.

> +}
> +
> +static void s2500_remove(struct spi_device *spi)
> diff --git a/drivers/net/ethernet/onsemi/s2500/s2500_ptp.c b/drivers/net/=
ethernet/onsemi/s2500/s2500_ptp.c
> index 0000000000000..7da660cb5b190
> --- /dev/null
> +++ b/drivers/net/ethernet/onsemi/s2500/s2500_ptp.c
[ ... ]
> +static int s2500_ptp_adjtime(struct ptp_clock_info *ptp, s64 delta)
> +{
> +	struct s2500_info *priv =3D container_of(ptp, struct s2500_info,
> +					       ptp_clock_info);
> +	struct ptp_system_timestamp sts;
> +	struct timespec64 target;
> +	unsigned int period_ms;
> +	struct timespec64 now;
> +	s64 scaled_ppm, rem;
> +	int max_iters =3D 3;
> +	s64 target_ns;
> +	int ret =3D 0;
> +	s64 now_ns;
> +	s64 num;
> +	s64 den;
[ ... ]
> +		/* Compute scaled_ppm (Qx.16). scaled_ppm =3D ppm * 2^16
> +		 * ppm =3D (delta_seconds / period_seconds) * 1e6
> +		 * =3D> scaled_ppm =3D delta_ns * 65536 / (period_ms * 1000)
> +		 */
> +		num =3D rem * 65536LL;
> +		den =3D (s64)period_ms * 1000LL;

[Severity: High]
Is this calculation off by a factor of 1000?=20

Scaling period_ms by 1000 instead of shifting it to calculate
parts-per-million could result in an adjustment rate that is drastically
lower than requested by the servo.

> +
> +		/* Integer division rounds toward zero; keep sign in
> +		 * numerator
> +		 */
> +		scaled_ppm =3D div_s64(num, den);
> +
> +		/* Apply frequency adjustment */
> +		ret =3D ptp->adjfine(ptp, (long)scaled_ppm);
> +		if (ret)
> +			break;
> +
> +		/* Sleep for the slew period (interruptible). If
> +		 * interrupted, clear the adjfine and return -EINTR.
> +		 */
> +		if (msleep_interruptible(period_ms)) {

[Severity: High]
Is it safe to block the caller by sleeping for up to 60 seconds in the
PTP adjtime callback?=20

The adjtime callback is expected to execute atomically or return quickly.
Sleeping here blocks the ioctl and exposes a use-after-free if the device
is unbound while the thread is sleeping.

> +			/* Clear adjfine */
> +			ptp->adjfine(ptp, 0);
> +			ret =3D -EINTR;
> +			break;
> +		}
> +
> +		/* Clear adjfine and measure remaining offset */
> +		ptp->adjfine(ptp, 0);
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-s2500-mac-=
phy-support-v7-0-478c877aa1a9@onsemi.com?part=3D14
