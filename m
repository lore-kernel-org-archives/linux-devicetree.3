Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F4F410D09
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542893; cv=none; b=h1YtuRTY90xn6emIDWi3OhThyK4BSAJRYz6tSLVrX6C9x69uXr46bd2Ygcjs73DuqolJ7cSxSwknJAkYelZveeJVEQS/o7L3LR9F5OV2FYY+WEbnffyAYRogOeTxg938U8UGJJKzN42WY2cfU1wHIIqKzVY3F4TpoUC72xmLkNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542893; c=relaxed/simple;
	bh=jJEcrjPUZ6/kS0Cm5CGhJiH4ebdvUllFViN2z4v3Z78=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EhsSL7xP+F80LPO9YrUqNwkSFljADtxhqekPlgMasbPm0SojnJzH3y7+IXuzYOgNOlYu7YSqaW4WDRU64gRuhGIMC+P2qvWYWjv/UJmKR3RhjzaYP61Z0TsUXUAQyNaMqqyJz4sHXgxPjRfA1bogzUDrLEAaxHWKh7tOGd8ZqIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AvWTiVoS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AvWTiVoS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E83591F00A3A;
	Mon, 15 Jun 2026 17:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781542892;
	bh=CpjycqAQpngcGEk48kxN7z6dXZFtDNDxY8ywT57YJ48=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AvWTiVoSOijO7bEqhNriRIXJoIIWSzGLEzjavBngINoDg5dXf3IUhvuiqRK6QKjfD
	 mcxV8a5P7H6UtHDNcLUPhhgfCjdagYdEVPOHLU+FKTGqWZymBmi7BvyUp9As5vVe4o
	 Jvab7jMPIreFv0DIXja1tAR4N50mq8MILETg1XR2pLYlgVy+pT3bupV2QBSc9YyTKD
	 3MyAagdFLGr+7/96A68UUpAIFKIpGJ9kQ0dLzbfpHJKVrYrCFlL9xZIE6LcUuxxNhr
	 2EKe9L3v4iVMuqOb5n7kq+HFF2EPZXabShf+DUcs3+0UBSosmPVdF6q3h0T/hKgpCn
	 hl9b7txGeVHLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 12/15] onsemi: s2500: Add driver support for
 TS2500 MAC-PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260614-s2500-mac-phy-support-v5-12-89874b72f725@onsemi.com>
References: <20260614-s2500-mac-phy-support-v5-12-89874b72f725@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 17:01:31 +0000
Message-Id: <20260615170131.E83591F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 12 potential issue=
(s) to consider:
- [High] Premature exit of the polling kthread leads to a Use-After-Free du=
ring driver teardown or RX mode updates.
- [High] Lockless traversal of the multicast address list in the background=
 thread causes data races and potential Use-After-Free.
- [High] PTP adjtime blocks for up to 60 seconds and computes frequency off=
set incorrectly.
- [High] Failure in s2500_open() leaks the background kthread and leaves th=
e PHY running.
- [High] Failure paths in s2500_probe() do not clean up resources allocated=
 by oa_tc6_init().
- [High] Concurrent Read-Modify-Write of the MAC_CTRL register leads to los=
t updates.
- [High] The s2500_thread_fun kthread contains a lost wakeup window for kth=
read_stop() causing 5 second interface teardown hang.
- [Medium] Standard netdev statistics are duplicated in driver-private etht=
ool -S strings.
- [Medium] The multicast hardware filter is incorrectly left disabled when =
specific MAC addresses are configured.
- [Medium] IFF_UNICAST_FLT is set but secondary unicast MAC filtering is no=
t implemented.
- [Medium] The initialization function silently ignores failures when confi=
guring the device's MAC address filter.
- [Medium] Incorrect MAC address filter register write ordering for multica=
st addresses.
--

commit 460baa0800374b033a33a01995e62355074e779a
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

onsemi: s2500: Add driver support for TS2500 MAC-PHY

This commit introduces a new ethernet driver for the onsemi S2500, an 802.3=
 cg=20
compliant transceiver with integrated MAC-PHY. It hooks into the Open Allia=
nce=20
TC6 framework and implements ethtool stats, hardware timestamping, and PTP.

> --- /dev/null
> +++ b/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c

[ ... ]

> +static const char s2500_mac_stat_strings[][ETH_GSTRING_LEN] =3D {
> +	"tx_bytes",
> +	"tx_frames",
> +	"tx_broadcast_frames",
> +	"tx_multicast_frames",

[Severity: Medium]
Is it necessary to duplicate standard network statistics like tx_bytes and
tx_frames here?=20

Standard hardware counters should typically be exposed through ndo_get_stat=
s64
(struct rtnl_link_stats64) rather than driver-private ethtool -S strings.

[ ... ]

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

[Severity: High]
Is this read-modify-write cycle safe from concurrent execution?=20

This function appears to be called from the asynchronous background thread
(s2500_rx_mode_update) as well as the networking stack callbacks (e.g.,
s2500_shutdown in the ndo_stop path). Without locking, a TOCTOU race could
cause one path's modification to overwrite the other's.

[ ... ]

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
Does this intentionally discard the return code from s2500_set_mac_filter()?

If setting the MAC address filter fails, the error in 'ret' is immediately
overwritten. This could cause the driver to silently proceed with a
misconfigured MAC address.

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

[Severity: Medium]
Should the multicast filter be re-enabled after writing the specific addres=
ses
to the hardware slots?

The code intentionally disables the global filter (S2500_MAC_CTRL_MCSF_BIT)=
 at
the beginning of this block, but it does not invoke modify_bits(..., false)=
 at
the end, leaving the hardware in all-multicast mode.

[ ... ]

> +		i =3D 1;
> +		netdev_for_each_mc_addr(ha, priv->ndev) {

[Severity: High]
Can this lockless iteration race with userspace modifications?=20

Since this is executed in the background kthread asynchronously, traversing=
 the
multicast list without holding the netif_addr_lock_bh(ndev) lock might
cause list corruption or a use-after-free if dev_mc_add or dev_mc_del runs
concurrently.

[ ... ]

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
Is this write order correct?=20

This writes S2500_REG_MAC_ADDRFILTH(i) (which contains the=20
S2500_MAC_ADDRFILT_EN_BIT enable flag) before writing the=20
S2500_REG_MAC_ADDRFILTL(i) payload. Writing the enable bit before the data
payload could cause the hardware to match against a partially-updated,
stale MAC address.

[ ... ]

> +static int s2500_thread_fun(void *data)
> +{

[ ... ]

> +	do {
> +		if (update_rx_mode) {
> +			ret =3D s2500_rx_mode_update(priv);
> +			if (unlikely(ret)) {
> +				dev_err(&priv->spi->dev, "Failed to set new RX mode");
> +				break;
> +			}
> +		}

[Severity: High]
If s2500_rx_mode_update() fails, this break statement drops out of the loop
causing the kthread to terminate and the kernel to free its task_struct.

However, the driver does not set priv->thread to NULL. When the device is
stopped, won't kthread_stop() blindly dereference the freed task_struct
leading to a use-after-free?

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
Could kthread_stop() trigger a lost wakeup here?=20

If kthread_stop() runs after the loop condition is evaluated but before
__set_current_state(), the thread's TASK_RUNNING state will be immediately
overwritten with TASK_INTERRUPTIBLE. The thread would then sleep in
schedule_timeout() for up to 5 seconds, ignoring the stop request.

[ ... ]

> +static int s2500_open(struct net_device *ndev)
> +{

[ ... ]

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
If s2500_mac_ctrl_modify_bits() fails here, the function returns an error
without stopping the kthread or the PHY. Since ndo_stop is not invoked
if ndo_open fails, won't this leak the kthread and leave the PHY running?

[ ... ]

> +static int s2500_stop(struct net_device *ndev)
> +{

[ ... ]

> +	s2500_shutdown(priv);
> +
> +	kthread_stop(priv->thread);
> +	priv->thread =3D NULL;
> +
> +	return 0;
> +}

[ ... ]

> +static int s2500_probe(struct spi_device *spi)
> +{

[ ... ]

> +	ndev->priv_flags |=3D IFF_UNICAST_FLT;

[Severity: Medium]
The driver advertises IFF_UNICAST_FLT, but s2500_set_rx_mode() does not
appear to process ndev->uc (the unicast address list).=20

Since this flag is set, the kernel won't automatically fall back to promisc=
uous
mode when secondary unicast addresses are assigned, which may cause traffic=
 for
those addresses to be dropped.

[ ... ]

> +	ret =3D s2500_init(priv);
> +	if (unlikely(ret)) {
> +		dev_err(&spi->dev, "failed to s2500_init the device");
> +		goto err_reg_read;
> +	}

[ ... ]

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
If s2500_init(), s2500_ptp_register(), or register_netdev() fail, this jumps
to err_reg_read but does not clean up the TC6 framework.=20

Should this call oa_tc6_exit() and oa_tc6_ptp_unregister() to prevent memory
leaks and dangling PTP registrations?

[ ... ]

> --- /dev/null
> +++ b/drivers/net/ethernet/onsemi/s2500/s2500_ptp.c

[ ... ]

> +static int s2500_ptp_adjtime(struct ptp_clock_info *ptp, s64 delta)
> +{

[ ... ]

> +		/* Compute scaled_ppm (Qx.16). scaled_ppm =3D ppm * 2^16
> +		 * ppm =3D (delta_seconds / period_seconds) * 1e6
> +		 * =3D> scaled_ppm =3D delta_ns * 65536 / (period_ms * 1000)
> +		 */
> +		num =3D remaining * 65536LL;
> +		den =3D (s64)period_ms * 1000LL;
> +
> +		/* Integer division rounds toward zero; keep sign in numerator */
> +		scaled_ppm =3D div_s64(num, den);
> +
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
Does this extra multiplication by 1000 result in an incorrect scaled_ppm?
Dividing the denominator by 1000 again will make the frequency adjustment
1000 times too small.

Additionally, the software slewing loop calls msleep_interruptible() for
up to 60 seconds (or 180s total) while holding the ptp_adj_lock. Will this
block the calling userspace servo loop (e.g., ptp4l via clock_adjtime)
in the kernel for excessive periods?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260614-s2500-mac-=
phy-support-v5-0-89874b72f725@onsemi.com?part=3D12
