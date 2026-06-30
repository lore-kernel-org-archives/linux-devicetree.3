Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A467936F429
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 17:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782840246; cv=none; b=FxeKyhVjJdZajeOtvlMEyASRkQgEUtdSuVRK0n/2DiHAF/ovDI5KTfo13GYH9Ff2mYmtUEDXFvsuromJcHLRv9PJ7H2hhXsMvryd/Wbw4F30iOkCXU8qs0CpItOPt2LUL6w/Ez9OV1sEg8IZZql+LauZBakBBqPDQHGenO9mJGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782840246; c=relaxed/simple;
	bh=cIK4wZkPBirXJu39nEQdKPRcWYpX/C48WhxRFHD/p2c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dGtosgW5gQ38701gG+LIvAc9RPrAXu5s/kQh857uq45Dz8HUUKOW3t3+rUOULuV0g1DMvln7SD6VqN8Na9W0j37pOJn2o0rS2zlmsx0zh15HY9+Y6oJEg+NEkl1FX4S8EJHhlkNMg2PJqN6IulcWy4b+ZqHj1lLyCkxq9jeSf9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kcpZ+o0b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kcpZ+o0b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 108871F000E9;
	Tue, 30 Jun 2026 17:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782840244;
	bh=gWfi7ccCaAiMomrg8Es3RpJeLL77QNuclEUIvKIMEQY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kcpZ+o0bxUEMTRoqAvh8uKai4JoqAdfxNAIytK9CK7/6jVj395Ldn8PEHcwZqtuUt
	 Uc1WJZdJc9YuB3cn711RUmWGDywKCHxny1Bvwd6gaiiVoMlDwMRZpzWB38tJt7Xp0Y
	 TGspveBzQ86PlffEaQsgqA/XVwTfK3oLwLVJ4lrBMu+EUPL61Dd+D+HwA4hlyiGy98
	 BPMiiBilLZ0hfWFyiThoGpF2Oaoa5kfTVU3kf7NUXlIseJlWnPioHaYCrnZPMHOefK
	 hIDEsskVNZ5vIMUlnefFsDXY9uHi04qJy0K4BohnTYH1abJIdTOenNUrzfp0j/pWaN
	 9zFHJLdRXvZtA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 12/15] onsemi: s2500: Add driver support for
 TS2500 MAC-PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260629-s2500-mac-phy-support-v6-12-18ce79500371@onsemi.com>
References: <20260629-s2500-mac-phy-support-v6-0-18ce79500371@onsemi.com>
 <20260629-s2500-mac-phy-support-v6-12-18ce79500371@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 17:24:03 +0000
Message-Id: <20260630172404.108871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 15 potential issue=
(s) to consider:
- [High] Lost wakeup race condition in the kthread wait loop causes `kthrea=
d_stop()` to stall for up to 5 seconds during interface teardown.
- [High] The PTP `adjtime` callback manually slews the clock synchronously,=
 blocking the caller for up to 60 seconds.
- [High] Missing cleanup of `oa_tc6` state and PTP clock on driver probe fa=
ilure leads to resource leaks and Use-After-Free vulnerabilities.
- [High] Unprotected iteration of the multicast address list in the backgro=
und worker thread.
- [High] Missing error handling and resource cleanup in `s2500_open` leads =
to orphaned kthreads and active PHY states.
- [High] The PTP `max_adj` configuration causes a signed long overflow of t=
he `scaled_ppm` parameter on 32-bit architectures.
- [High] Premature termination of the polling kthread on transient SPI erro=
rs leaves a dangling pointer, leading to a Use-After-Free.
- [High] Passing an uninitialized `struct timespec64` by value to `s2500_us=
e_settime` triggers undefined behavior.
- [High] Data Race on the `S2500_REG_MAC_CTRL` register due to concurrent R=
ead-Modify-Write cycles.
- [High] Concurrent calls to `s2500_ptp_adjfine()` clobber the long-running=
 frequency slew in `s2500_ptp_adjtime()`, and `adjtime` destructively reset=
s the baseline frequency.
- [High] Incorrect math in the PTP frequency slew calculation results in a =
1,000x slower adjustment.
- [Medium] Standard networking statistics are improperly duplicated in driv=
er-private `ethtool -S` strings instead of using the standard uAPI (`ndo_ge=
t_stats64`).
- [Medium] The driver fails to validate the constructed MAC address read fr=
om NVRAM.
- [Medium] Unhandled return value from `s2500_set_mac_filter` in `s2500_ini=
t` masks configuration failures.
- [Medium] The driver abuses `dev->platform_data` to store dynamically allo=
cated runtime driver state.
--

commit 959b629541f81f549c8073520aa3f70fa8b692f6
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
Subject: onsemi: s2500: Add driver support for TS2500 MAC-PHY

This commit adds support for the onsemi S2500 Ethernet transceiver with
integrated MAC-PHY. It implements SPI communication, ethtool support,
and hardware timestamping utilizing the Open Alliance TC6 framework.

> diff --git a/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c b/drivers/=
net/ethernet/onsemi/s2500/s2500_ethtool.c
> new file mode 100644
> index 0000000000000..7760cec578492
> --- /dev/null
> +++ b/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c

[ ... ]

> @@ -0,0 +1,353 @@
> +static const char s2500_mac_stat_strings[][ETH_GSTRING_LEN] =3D {
> +	"tx_bytes",
> +	"tx_frames",

[Severity: Medium]
Are these standard statistics being exposed as private ethtool counters?
The networking driver subsystem guidelines forbid duplicating standard=20
counters in ethtool -S output. Exposing them here while omitting the=20
standard ndo_get_stats64 callback prevents standard tools like=20
"ip -s link show" from accessing them.

> diff --git a/drivers/net/ethernet/onsemi/s2500/s2500_main.c b/drivers/net=
/ethernet/onsemi/s2500/s2500_main.c
> new file mode 100644
> index 0000000000000..687c98b69cc02
> --- /dev/null
> +++ b/drivers/net/ethernet/onsemi/s2500/s2500_main.c

[ ... ]

> @@ -0,0 +1,655 @@
> +static int s2500_read_mac_from_nvmem(struct s2500_info *priv)
> +{

[ ... ]

> +	addr[3] =3D FIELD_GET(S2500_VS_MACID1_BYTE3_MASK, mac1);
> +	addr[4] =3D FIELD_GET(S2500_VS_MACID0_BYTE4_MASK, mac0);
> +	addr[5] =3D FIELD_GET(S2500_VS_MACID0_BYTE5_MASK, mac0);
> +
> +	__dev_addr_set(priv->ndev, addr, ETH_ALEN);
> +	priv->ndev->addr_assign_type =3D NET_ADDR_PERM;
> +	return ret;
> +}

[Severity: Medium]
Is it possible for the hardware to yield an invalid MAC address here?
There is no is_valid_ether_addr() check before assigning the address=20
to the netdev. If the NVRAM is unprogrammed or corrupted, this bypasses=20
the random MAC generation fallback in s2500_probe() and registers an=20
invalid address.

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
> +	return ret;
> +}

[Severity: High]
Is this read-modify-write operation protected against concurrent execution?
It appears this function can be invoked simultaneously by the background=20
kthread updating RX filters and userspace bringing the interface down=20
via s2500_stop(), leading to lost register updates and an inconsistent=20
interface state.

[ ... ]

> +static int s2500_init(struct s2500_info *priv)
> +{
> +	u32 val;
> +	int ret;

[ ... ]

> +	/* Program the source MAC address into the device */
> +	ret =3D s2500_set_mac_filter(priv->ndev, priv->ndev->dev_addr);
> +
> +	val =3D S2500_MAC_CTRL_ADRF_BIT | S2500_MAC_CTRL_FCSA_BIT;
> +
> +	return s2500_mac_ctrl_modify_bits(priv, val, false);
> +}

[Severity: Medium]
Does this mask configuration failures during initialization?
The ret variable is overwritten with the result of s2500_mac_ctrl_modify_bi=
ts()
without being validated. If s2500_set_mac_filter() encounters an SPI error,
it will fail silently.

[ ... ]

> +static int s2500_set_multicast_mode(struct s2500_info *priv,
> +				    unsigned int rx_flags)
> +{

[ ... ]

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
> +			if (i > S2500_N_MCAST_FILTERS)
> +				break;

[Severity: High]
Is it safe to iterate the multicast address list here without acquiring=20
netif_addr_lock_bh()? Since this executes in the background worker thread,
concurrent modifications via dev_mc_add() or dev_mc_del() could cause=20
a use-after-free and list corruption.

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
> +			}
> +		}

[Severity: High]
Could this break statement cause a use-after-free?
By exiting the kthread loop on a transient SPI error, the thread will=20
gracefully drop its task reference and its task_struct will be freed.=20
However, priv->thread is left dangling and will be dereferenced later=20
by kthread_stop() during interface teardown.

[ ... ]

> +		s2500_process_events(priv);
> +
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
Does this sequence create a lost wakeup window?
Because the state is set to TASK_INTERRUPTIBLE and the thread sleeps
without a prior kthread_should_stop() check, if kthread_stop() sets=20
the should_stop flag and wakes the thread right before __set_current_state(=
),=20
the thread will go to sleep ignoring the stop request. This can stall=20
s2500_stop() for up to 5 seconds.

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
> +		val =3D S2500_MAC_CTRL_TXEN_BIT | S2500_MAC_CTRL_RXEN_BIT;
> +		ret =3D s2500_mac_ctrl_modify_bits(priv, val, false);
> +
> +		netif_start_queue(priv->ndev);
> +	}
> +	return ret;
> +}

[Severity: High]
Is cleanup missing on the error path here?
If s2500_mac_ctrl_modify_bits() fails, the function returns an error=20
but fails to call kthread_stop() or phy_stop(). Since ndo_open fails,=20
the network stack will not invoke ndo_stop, permanently leaking the=20
active PHY state and leaving the kthread running indefinitely.

[ ... ]

> +static const struct net_device_ops s2500_netdev_ops =3D {
> +	.ndo_open            =3D s2500_open,
> +	.ndo_stop            =3D s2500_stop,
> +	.ndo_start_xmit      =3D s2500_start_xmit,
> +	.ndo_set_mac_address =3D s2500_set_mac_address,
> +	.ndo_set_rx_mode     =3D s2500_set_rx_mode,
> +	.ndo_eth_ioctl       =3D s2500_ioctl,
> +	.ndo_hwtstamp_get    =3D s2500_hwtstamp_get,
> +	.ndo_hwtstamp_set    =3D s2500_hwtstamp_set,
> +};

[Severity: Medium]
This confirms the omission of the ndo_get_stats64 callback, which is=20
required to expose standard networking statistics to userspace properly=20
instead of duplicating them in ethtool -S.

[ ... ]

> +static int s2500_probe(struct spi_device *spi)
> +{
> +	struct device *dev =3D &spi->dev;
> +	struct net_device *ndev;
> +	struct s2500_info *priv;

[ ... ]

> +	spin_lock_init(&priv->lock);
> +	mutex_init(&priv->ptp_adj_lock);
> +	ndev->irq =3D spi->irq;
> +
> +	spi->dev.platform_data =3D priv;
> +	spi_set_drvdata(spi, priv);

[Severity: Medium]
Could the usage of platform_data here overwrite board-supplied configuratio=
n?
The platform_data field is designated for system setup code to pass downwar=
d=20
static constraints. Storing dynamically allocated runtime state here should=
=20
be avoided; spi_set_drvdata() is already being used and is the correct=20
mechanism.

[ ... ]

> +	/* Configure PTP if the model supports it */
> +	ret =3D s2500_ptp_register(priv);
> +	if (unlikely(ret))
> +		goto err_reg_read;
> +
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
> +}

[Severity: High]
Does this error path leak resources?
If register_netdev() or s2500_ptp_register() fails, the code jumps to=20
err_reg_read without calling oa_tc6_ptp_unregister() or oa_tc6_exit().=20
Because s2500_info is allocated via devm_, it will be freed on probe=20
failure, leaving active components referencing freed memory.

> diff --git a/drivers/net/ethernet/onsemi/s2500/s2500_ptp.c b/drivers/net/=
ethernet/onsemi/s2500/s2500_ptp.c
> new file mode 100644
> index 0000000000000..7da660cb5b190
> --- /dev/null
> +++ b/drivers/net/ethernet/onsemi/s2500/s2500_ptp.c

[ ... ]

> @@ -0,0 +1,250 @@
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

> +	/* check overflow */
> +	if (adj >=3D (1L << 28))
> +		return -ERANGE;
> +
> +	val =3D (u32)adj | sign_bit;
> +	return oa_tc6_write_register_mms(priv->tc6, S2500_REG_VS_PTP_ADJ,
> +					 OA_TC6_PHY_C45_VS_MMS12, val);
> +}

[Severity: High]
Is this lockless hardware access safe?
Concurrent calls to s2500_ptp_adjfine() can silently clobber the long-runni=
ng=20
frequency slew currently being performed in s2500_ptp_adjtime().

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

[ ... ]

> +	while (rem !=3D 0 && max_iters--) {
> +		s64 abs_delta =3D rem > 0 ? rem : -rem;
> +
> +		/* If the adjustment is very large, more than 1 second,
> +		 * use settime to avoid very long slewing periods or
> +		 * excessive frequency offsets.
> +		 */
> +		if (abs_delta > 1000000000LL) {
> +			ret =3D s2500_use_settime(ptp, now, rem);
> +			rem =3D 0;
> +			break;
> +		}

[Severity: High]
Can this result in undefined behavior?
The "now" structure is declared but uninitialized here. It is passed=20
by value to s2500_use_settime(), which copies the uninitialized stack memor=
y.

> +
> +		/* Choose a slewing period depending on magnitude */
> +		if (abs_delta <=3D 1000000LL) /* <=3D 1ms */
> +			period_ms =3D 1000; /* 1 s */
> +		else if (abs_delta <=3D 100000000LL) /* <=3D 100ms */
> +			period_ms =3D 10000; /* 10 s */
> +		else
> +			period_ms =3D 60000; /* 60 s */
> +
> +		/* Compute current time and fixed target for this
> +		 * iteration
> +		 */
> +		memset(&sts, 0, sizeof(sts));
> +		ret =3D ptp->gettimex64(ptp, &now, &sts);
> +		if (ret)
> +			break;
> +
> +		if (rem >=3D 0)
> +			target =3D timespec64_add(now,
> +						ns_to_timespec64(rem));
> +		else
> +			target =3D timespec64_sub(now,
> +						ns_to_timespec64(-rem));
> +
> +		/* Compute scaled_ppm (Qx.16). scaled_ppm =3D ppm * 2^16
> +		 * ppm =3D (delta_seconds / period_seconds) * 1e6
> +		 * =3D> scaled_ppm =3D delta_ns * 65536 / (period_ms * 1000)
> +		 */
> +		num =3D rem * 65536LL;
> +		den =3D (s64)period_ms * 1000LL;

[Severity: High]
Does this math correctly scale the frequency adjustment?
By dividing by (period_ms * 1000) instead of accurately scaling the values,=
=20
the resulting scaled_ppm drastically shrinks the frequency adjustment=20
instead of expanding it. This creates a result mathematically 1,000,000=20
times too small, causing the slew to fail to reach the target time offset.

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
Is it acceptable for adjtime to block synchronously?
The PTP subsystem expects adjtime callbacks to return immediately by=20
stepping the clock or deferring logic. Selecting a sleep duration of=20
up to 60 seconds and calling msleep_interruptible() will freeze=20
userspace PTP daemons and break PI control loops.

> +			/* Clear adjfine */
> +			ptp->adjfine(ptp, 0);
> +			ret =3D -EINTR;
> +			break;
> +		}
> +
> +		/* Clear adjfine and measure remaining offset */
> +		ptp->adjfine(ptp, 0);

[Severity: High]
Could this destructively reset the baseline frequency?
By unconditionally resetting the frequency offset to 0 upon waking=20
from sleep, any concurrent adjustments dynamically applied by the=20
PTP daemon via clock_adjtime(ADJ_FREQUENCY) will be wiped out,=20
preventing accurate clock synchronization.

[ ... ]

> +int s2500_ptp_register(struct s2500_info *priv)
> +{
> +	struct ptp_clock_info *info =3D &priv->ptp_clock_info;
> +	int ret;
> +
> +	info->max_adj =3D 100000000;
> +	info->owner =3D THIS_MODULE;

[Severity: High]
Will this maximum adjustment value overflow on 32-bit architectures?
A max_adj of 100,000,000 ppb will be multiplied by 65.536 by the PTP core=20
to yield a scaled_ppm of ~6.55 billion. This exceeds the capacity of a=20
signed 32-bit long, causing large positive frequency adjustments to overflo=
w=20
into negative values and apply an inverted slew.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-s2500-mac-=
phy-support-v6-0-18ce79500371@onsemi.com?part=3D12
