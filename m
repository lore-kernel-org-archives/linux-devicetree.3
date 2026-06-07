Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457A52C3259
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 05:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780810984; cv=none; b=q/yrIucHZYCGVnsKaLuN1v8yK3fgvlACx5oFNKc7qi1HSlmUOWV7URIRAkjv7T2YRQM/OEwIoYKt9fFkHXvO1N5W5vj1Lbt3wwqz2bLtXrnhLwhHSDPuFLGLSJ6e8B+j4HhbnOdaSOYTKlShmQue0bVKhZYDM8UZTFcj/GXJGsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780810984; c=relaxed/simple;
	bh=cv+NAriH4u0ab0c85as2lOT4WvLjyLe1j7+lXVsK/KA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qh6AqOaKN+SUChgOPPr3RxSB3f4wzayzjB5YJ408HYba1B9SLBqOtqsjG2i56s86s8x0wV+pTxclmj52DzpUJ1E4xtOvoOmt8YSaxKyXPegWHe1Xty84y9faBs0GKAiew111g8BbgNBg1nFtnPx8OWWlpvmYdZcnbJ8P76GZkgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3oYltPe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3oYltPe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDCC71F00893;
	Sun,  7 Jun 2026 05:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780810983;
	bh=2Cq8RCoVga8hRBlHiSlEEE7N4Zu+63ZYxbkErLMnIh8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h3oYltPevDlKJygGtYQsWRGzHZvolilSUEpFuAMIiB/SD4nNWoaZTur9iFjVUiNqC
	 q4VyJURf5Ci2J1tjH3dCdWXvZ/nMuviVxvP4xEkS1KA6DZlrpPE+nW82pMh6kNp5YI
	 eZVY/YPWjVr9/B799LixEPi8qTpDVPiReK5qg/f9jmcEdLukLO6iuZz+33cWVrVfBI
	 EhXmHWlha9ZEbjHpG3Ouj5MttNigJNHmAc1lgsqvCrAk2zWb7ZCFZPCgR/yKx7dymP
	 KRqsiBIebkrATaxXxOi8UBTkTwlI/dIbCHl4mBzJjQ1Dd+Xv4LWnvA57/YSp3KyRk5
	 lkN6Cvm0wSdyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 13/16] onsemi: s2500: Add driver support for
 TS2500 MAC-PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260605-s2500-mac-phy-support-v4-13-de0fbc13c6d8@onsemi.com>
References: <20260605-s2500-mac-phy-support-v4-13-de0fbc13c6d8@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Jun 2026 05:43:02 +0000
Message-Id: <20260607054302.DDCC71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 14 potential issue=
(s) to consider:
- [High] The PTP adjtime ioctl callback actively blocks the calling user-sp=
ace thread for up to 3 minutes.
- [High] Hardware multicast filtering is inadvertently permanently disabled=
 when 1 to 3 multicast addresses are configured.
- [High] Missing cleanup in the s2500_open() error path leaks the PHY and l=
eaves a dangling ERR_PTR causing kernel panics.
- [High] A transient SPI error permanently terminates the background kthrea=
d and leads to a Use-After-Free.
- [High] Missing cleanup in device probe error paths leaks the OA TC6 frame=
work and PTP resources.
- [High] Unprotected read-modify-write operations on the MAC_CTRL register =
lead to race conditions and corrupted device state.
- [High] The `target` timespec64 variable is used uninitialized if `ptp->ge=
ttimex64()` fails.
- [High] Missing kthread_should_stop() check after setting TASK_INTERRUPTIB=
LE causes up to a 5-second shutdown delay.
- [High] The driver iterates over the multicast address list locklessly in =
a background thread, risking list corruption and use-after-free.
- [Medium] The driver duplicates standard network statistics in its private=
 ethtool -S interface and fails to implement ndo_get_stats64.
- [Medium] The driver advertises a max_adj of 100,000,000 ppb, but its adjf=
ine implementation rejects values exceeding ~33.5 million ppb.
- [Medium] Software MAC address is updated even if the hardware update fail=
s.
- [Medium] Concurrent adjtime and adjfine calls clobber the hardware freque=
ncy adjustments.
- [Medium] Multicast MAC filter registers are written in the wrong order.
--

commit 7da83aa832497d5fef58b67e53a49c036aa7948e
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
Subject: onsemi: s2500: Add driver support for TS2500 MAC-PHY

This commit introduces the driver for the onsemi S2500 10BASE-T1S MAC-PHY
Ethernet transceiver. It utilizes the Open Alliance TC6 framework to handle
SPI transactions, and includes standard network device operations, ethtool
capabilities, and PTP hardware timestamping with a custom phase adjustment
fallback loop.

> diff --git a/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c b/drivers/=
net/ethernet/onsemi/s2500/s2500_ethtool.c
> new file mode 100644
> index 0000000000000..85bd8ea50dd8c
> --- /dev/null
> +++ b/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c
[ ... ]
> +static const char s2500_mac_stat_strings[][ETH_GSTRING_LEN] =3D {
> +	"tx_bytes",
> +	"tx_frames",
> +	"tx_broadcast_frames",
> +	"tx_multicast_frames",

[Severity: Medium]
Should standard network UAPI stats like tx_bytes and tx_frames be duplicated
here in the private ethtool strings?

According to the standard kernel networking guidelines, UAPI stats should be
implemented via the standard ndo_get_stats64 interface instead of adding
private UAPI strings in ethtool -S.

> diff --git a/drivers/net/ethernet/onsemi/s2500/s2500_main.c b/drivers/net=
/ethernet/onsemi/s2500/s2500_main.c
> new file mode 100644
> index 0000000000000..7aa3267db39b5
> --- /dev/null
> +++ b/drivers/net/ethernet/onsemi/s2500/s2500_main.c
[ ... ]
> +static int s2500_mac_ctrl_modify_bits(struct s2500_info *priv,
> +				      u32 in_bits, bool clr)
> +{
> +	u32 reg =3D S2500_REG_MAC_CTRL;
> +	u32 rval =3D 0;
> +	int ret;
> +
> +	ret =3D oa_tc6_read_register_mms(priv->tc6, reg,
> +				       OA_TC6_PHY_C45_MAC_MMS1, &rval);
> +	if (!ret) {
> +		u32 wval =3D 0;
> +
> +		if (clr)
> +			wval =3D rval & ~in_bits;
> +		else
> +			wval =3D rval | in_bits;
> +		if (rval !=3D wval)
> +			ret =3D oa_tc6_write_register_mms(priv->tc6, reg,
> +							OA_TC6_PHY_C45_MAC_MMS1, wval);
> +	}
> +	return ret;
> +}

[Severity: High]
Does this read-modify-write operation need mutual exclusion?

s2500_mac_ctrl_modify_bits() performs a non-atomic read-modify-write on
the MAC_CTRL register over the SPI bus. Because SPI operations can sleep,
calling this concurrently from the kthread (e.g. s2500_rx_mode_update())
and ndo_stop() could overwrite the device state, potentially leaving the
hardware incorrectly enabled or disabled.

[ ... ]
> +static int s2500_set_multicast_mode(struct s2500_info *priv,
> +				    unsigned int rx_flags)
> +{
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
> +			ret =3D oa_tc6_write_register_mms(priv->tc6,
> +							S2500_REG_MAC_ADDRFILTH(i),
> +							OA_TC6_PHY_C45_MAC_MMS1, 0);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		i =3D 1;
> +		netdev_for_each_mc_addr(ha, priv->ndev) {

[Severity: High]
Is the multicast filter accidentally left disabled in this execution path?

When 1 to 3 multicast addresses are configured, s2500_mac_ctrl_modify_bits()
is called to disable the filter, but there appears to be no subsequent call
to clear this bit and re-enable the filter after the addresses are written.
This would leave the MAC unconditionally accepting all multicast traffic.

[Severity: High]
Can this list traversal race with user-space configuration?

Since this executes from a background kthread, traversing priv->ndev->mc.li=
st
without holding netif_addr_lock_bh() risks list corruption or a
use-after-free if a user-space daemon simultaneously modifies the addresses.

> +			if (i > S2500_N_MCAST_FILTERS)
> +				break;
> +
> +			addrh =3D S2500_MAC_ADDRFILT_EN_BIT |
> +				 get_unaligned_be16(ha->addr);
> +			addrl =3D get_unaligned_be32(&ha->addr[2]);
> +
> +			ret =3D oa_tc6_write_register_mms(priv->tc6,
> +							S2500_REG_MAC_ADDRFILTH(i),
> +							OA_TC6_PHY_C45_MAC_MMS1, addrh);
> +			if (ret)
> +				return ret;
> +
> +			ret =3D oa_tc6_write_register_mms(priv->tc6,
> +							S2500_REG_MAC_ADDRFILTL(i),
> +							OA_TC6_PHY_C45_MAC_MMS1, addrl);

[Severity: Medium]
Should the lower register (FILTL) be written before the high register
(FILTH)?

Because FILTH contains the S2500_MAC_ADDRFILT_EN_BIT, writing it first
enables the filter using the new high bytes with the old, uninitialized
low bytes. This could cause a brief window of incorrect hardware filtering.

[ ... ]
> +static int s2500_set_mac_address(struct net_device *ndev, void *p)
> +{
> +	struct sockaddr *addr =3D p;
> +
> +	if (!is_valid_ether_addr(addr->sa_data))
> +		return -EADDRNOTAVAIL;
> +
> +	eth_hw_addr_set(ndev, addr->sa_data);
> +	return s2500_set_mac_filter(ndev, addr->sa_data);
> +}

[Severity: Medium]
Should the software MAC address only be updated after the hardware update
succeeds?

Updating the address via eth_hw_addr_set() before s2500_set_mac_filter()
completes means a transient SPI failure will leave the software and hardware
MAC addresses permanently out of sync.

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
> +				dev_err(&priv->spi->dev, "Failed to set new RX mode");
> +				break;
> +			}
> +		}

[Severity: High]
Does this break statement leave priv->thread dangling?

If a transient SPI error occurs during s2500_rx_mode_update(), the kthread
exits permanently, but priv->thread is never cleared. Later calls to
s2500_stop() or s2500_set_rx_mode() might attempt to dereference the
freed task_struct, causing a use-after-free.

[ ... ]
> +		spin_lock_irqsave(&priv->lock, flags);
> +		__set_current_state(TASK_INTERRUPTIBLE);
> +
> +		update_rx_mode =3D priv->rx_flags_upd;
> +		ret =3D update_rx_mode;
> +
> +		spin_unlock_irqrestore(&priv->lock, flags);
> +
> +		if (!ret)
> +			tout =3D schedule_timeout(tout);
> +		else
> +			set_current_state(TASK_RUNNING);
> +	} while (!kthread_should_stop());
> +	return 0;
> +}

[Severity: High]
Can this sequence cause a deadlock or a delay when stopping the interface?

The thread sets TASK_INTERRUPTIBLE and then calls schedule_timeout() without
first checking kthread_should_stop(). If kthread_stop() is executed before
the state change, the wakeup is consumed early, and the thread will sleep
unconditionally for up to 5 seconds while the caller blocks on kthread_stop.

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
> +	priv->thread =3D kthread_run(s2500_thread_fun, priv, DRV_NAME "/%s:%d",
> +				   dev_name(&priv->spi->dev),
> +				   spi_get_chipselect(priv->spi, 0));
> +
> +	if (IS_ERR(priv->thread)) {
> +		ret =3D PTR_ERR(priv->thread);
> +	} else {
> +		val =3D S2500_MAC_CTRL_TXEN_BIT | S2500_MAC_CTRL_RXEN_BIT;
> +		ret =3D s2500_mac_ctrl_modify_bits(priv, val, false);
> +
> +		netif_start_queue(priv->ndev);
> +	}
> +	return ret;
> +}

[Severity: High]
Does this error path properly handle a kthread creation failure?

If kthread_run() fails, priv->thread is left containing an ERR_PTR and the
PHY remains running. If s2500_set_rx_mode() is later called, it checks if
priv->thread exists and attempts a wakeup, which would trigger a kernel
panic when dereferencing the ERR_PTR.

[ ... ]
> +static int s2500_probe(struct spi_device *spi)
> +{
[ ... ]
> +	ret =3D s2500_init(priv);
> +	if (unlikely(ret)) {
> +		dev_err(&spi->dev, "failed to s2500_init the device");
> +		goto err_reg_read;
> +	}
> +
> +	/* Configure PTP if the model supports it */
> +	ret =3D s2500_ptp_register(priv);
> +	if (unlikely(ret))
> +		goto err_reg_read;
> +
> +	ret =3D register_netdev(ndev);
> +	if (ret) {
> +		dev_err(&spi->dev, "failed to register the S2500 device\n");
> +		ret =3D -ENODEV;
> +
> +		goto err_reg_read;
> +	}
> +	return 0;
> +
> +err_reg_read:
> +	dev_err(&spi->dev, "could not initialize macphy");
> +	return ret;
> +}

[Severity: High]
Are the OA TC6 and PTP resources being leaked in this error path?

If initialization steps like s2500_init() or register_netdev() fail, the
code branches to err_reg_read and returns without invoking oa_tc6_exit()
or oa_tc6_ptp_unregister(). Because these are not managed by devres, they
could leak permanently.

> diff --git a/drivers/net/ethernet/onsemi/s2500/s2500_ptp.c b/drivers/net/=
ethernet/onsemi/s2500/s2500_ptp.c
> new file mode 100644
> index 0000000000000..fd6617c7ac798
> --- /dev/null
> +++ b/drivers/net/ethernet/onsemi/s2500/s2500_ptp.c
[ ... ]
> +static int s2500_ptp_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
> +{
> +	struct s2500_info *priv =3D container_of(ptp, struct s2500_info,
> +					       ptp_clock_info);
> +	u32 sign_bit =3D 0;
> +	long adj;
> +	u32 val;
> +	u64 ppm;
> +
> +	if (scaled_ppm < 0) {
> +		/* split sign / mod */
> +		sign_bit =3D 1U << 31;
> +		scaled_ppm =3D ~scaled_ppm + 1;
> +	}
[ ... ]
> +	ppm =3D (u64)scaled_ppm * 125;
> +	do_div(ppm, 1024);
> +	adj =3D (long)ppm;
> +
> +	/* check overflow */
> +	if (adj >=3D (1L << 28))
> +		return -ERANGE;

[Severity: Medium]
Does this boundary check reject valid frequency adjustments?

In s2500_ptp_register(), the max_adj is advertised as 100,000,000 ppb (10%).
However, restricting adj to (1L << 28) mathematically restricts the maximum
scaled_ppm equivalent to roughly 33.5 million ppb. This mismatch causes
valid user-space adjustments to fail with -ERANGE.

> +
> +	val =3D (u32)adj | sign_bit;
> +	return oa_tc6_write_register_mms(priv->tc6, S2500_REG_VS_PTP_ADJ,
> +					 OA_TC6_PHY_C45_VS_MMS12, val);
> +}

[Severity: Medium]
Is a lock required here to prevent clobbering concurrent frequency updates?

This function writes directly to the hardware without acquiring
priv->ptp_adj_lock. A concurrent user-space request to adjfine could confli=
ct
with the driver's own internal slewing loop in s2500_ptp_adjtime().

[ ... ]
> +static int s2500_ptp_adjtime(struct ptp_clock_info *ptp, s64 delta)
> +{
[ ... ]
> +	while (remaining !=3D 0 && max_iters--) {
> +		s64 abs_delta =3D remaining > 0 ? remaining : -remaining;
> +
> +		/* If the adjustment is very large, more than 1 second,
> +		 * use settime to avoid very long slewing periods or
> +		 * excessive frequency offsets.
> +		 */
> +		if (abs_delta > 1000000000LL) {
> +			memset(&sts, 0, sizeof(sts));
> +			ret =3D ptp->gettimex64(ptp, &now, &sts);
> +			if (!ret) {
> +				struct timespec64 delta_ts;
> +
> +				if (remaining >=3D 0) {
> +					delta_ts =3D ns_to_timespec64(remaining);
> +					target =3D timespec64_add(now, delta_ts);
> +				} else {
> +					delta_ts =3D ns_to_timespec64(-remaining);
> +					target =3D timespec64_sub(now, delta_ts);
> +				}
> +			}
> +
> +			if (target.tv_sec < 0 || target.tv_sec >=3D (1ULL << 32))
> +				ret =3D -ERANGE;
> +			else
> +				ret =3D ptp->settime64(ptp, &target);

[Severity: High]
Can target be evaluated uninitialized if ptp->gettimex64() fails?

If gettimex64() encounters an SPI error and returns a non-zero status, the
initialization block is bypassed, but execution falls through to check
target.tv_sec. This may pass garbage data to ptp->settime64(), potentially
corrupting the hardware clock.

[ ... ]
> +		/* Apply frequency adjustment */
> +		ret =3D ptp->adjfine(ptp, (long)scaled_ppm);
> +		if (ret)
> +			break;
> +
> +		/* Sleep for the slew period (interruptible). If interrupted, clear
> +		 * the adjfine and return with -EINTR.
> +		 */
> +		if (msleep_interruptible(period_ms)) {

[Severity: High]
Is it safe to block the caller for up to 3 minutes during phase adjustment?

Because adjtime is invoked synchronously by the clock_adjtime syscall,
sleeping here with msleep_interruptible() for up to 60 seconds per iteration
will cause the user-space daemon (e.g., ptp4l) to block entirely, preventing
it from processing other network events.

> +			/* Clear adjfine */
> +			ptp->adjfine(ptp, 0);
> +			ret =3D -EINTR;
> +			break;
> +		}
> +
> +		/* Clear adjfine and measure remaining offset */
> +		ptp->adjfine(ptp, 0);

[Severity: Medium]
Does clearing adjfine here wipe out concurrent user-space frequency changes?

Unconditionally calling ptp->adjfine(ptp, 0) at the end of the sleep cycle
will overwrite any concurrent clock adjustments made by other user-space
tasks, disrupting synchronization.

> +
> +		memset(&sts, 0, sizeof(sts));
> +		ret =3D ptp->gettimex64(ptp, &now, &sts);
> +		if (ret)
> +			break;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-s2500-mac-=
phy-support-v4-0-de0fbc13c6d8@onsemi.com?part=3D13
