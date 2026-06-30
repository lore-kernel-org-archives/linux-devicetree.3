Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73FD36F429
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 17:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782840244; cv=none; b=XvEvfnJRM4H3TrM86DFE0OXxJj3gsqMgP3KeatbhcVPVnbpoYws7b+x+ZPvDrdVtUG2s/mL24FPPc4P0j/Eq/0p6H3M061bZxRbTs9qw14yejDFlO84bYxyxIRdEb1t2tTcvD6KCGK5t6/dDVyPfcG+AD/7J2AzSeOezFOSHdpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782840244; c=relaxed/simple;
	bh=BSKGMbToNNGgiCKJqArmibTqtl2KXMfu0O9CXAha1yc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hJzdtbj6I4FtEJbp3M5xEEznpjfa8YVPyAuEe0pEtMqgho+tHD24f9VkUEQClPnz1uxm9y7tzHAp00bOGJFuTZVUENEaqnYahO74X9enVnCNfgc6eNreoamIudz3QKQdHlXe3vmgOAZYoSux3LUiBdPQp+K8ZmS3PYkWZuBrEAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dsvjA+b6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dsvjA+b6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 710D01F00A3A;
	Tue, 30 Jun 2026 17:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782840242;
	bh=bSAI3OIzhLujNz9GoiPY7FKWuFqd9On8iAsq1MH7rnQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dsvjA+b6aK4mJOLt7BxiIP3C9m6aDJJi6wu3Vc0D7R+8yp+Da/K0LEluqGkPo1Eyy
	 dVdNGy4zPgDSeg+orah662Z/rT2e3Q0A1FrAcGn0Z/0vxmPT3GbbsA1TH3vXkL8FEa
	 /XagUrPejEyVGDa1AVGremJ9ZSkgiyDTdkWh5QqUczcRdBF7H/Wu0JhByRQCFehtyN
	 Ll+uyJIgHk/2e6JVUs4T7WzKSOViiF042tYqT+tBGzSH5K+3tw4M+RFxORFgleiB6y
	 rCkMca/HIe+fGe5F9EUGcEr2epmAu+OCNw5FeIf0DmyrhsE9C0bZhLrnDDgplSybax
	 HmQ4I/BIVD00A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 06/15] net: ethernet: oa_tc6: Support for
 hardware timestamp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260629-s2500-mac-phy-support-v6-6-18ce79500371@onsemi.com>
References: <20260629-s2500-mac-phy-support-v6-0-18ce79500371@onsemi.com>
 <20260629-s2500-mac-phy-support-v6-6-18ce79500371@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 17:24:02 +0000
Message-Id: <20260630172402.710D01F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:

New issues:
- [Critical] Use-After-Free of `ongoing_tx_skb` due to premature timestamp =
processing.
- [High] Memory leak of SKBs in `tx_ts_skb_q` during device teardown and lo=
st interrupts.
- [High] Unbounded queueing of TX timestamp SKBs leads to ID wrap-around an=
d corrupt timestamp assignments.
- [High] Invalid pointer dereference of ERR_PTR during PTP clock teardown.
- [Medium] Packet corruption due to early return when disabling hardware ti=
mestamps.
- [Medium] Timestamp configuration state corruption on hardware programming=
 failure.

Pre-existing issues:
- [High] A transient SKB allocation failure permanently disables the networ=
k interface (DoS).
- [High] Missing bounds check allows malformed MAC-PHY packets to trigger `=
skb_over_panic`.
--

commit 7f7731256fae07ec53c17aa75b9a25fc0f8b4a24
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
Subject: net: ethernet: oa_tc6: Support for hardware timestamp

This commit adds hardware timestamping support for the OPEN Alliance
10BASE-T1x MAC-PHY framework. It introduces PTP clock registration,
ioctl handling, and TX/RX packet timestamp extraction functions.

> diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6.c b/drivers/net/ethernet/=
oa_tc6/oa_tc6.c
> index bf96e8d1ccb9a..6cc7c76d1d3c2 100644
> --- a/drivers/net/ethernet/oa_tc6/oa_tc6.c
> +++ b/drivers/net/ethernet/oa_tc6/oa_tc6.c
[ ... ]
> +static void oa_tc6_defer_for_hwtstamp(struct oa_tc6 *tc6,
> +				      struct sk_buff *skb)
> +{
> +	if (!tc6->hw_tstamp_enabled)
> +		return;
> +	if (!skb || (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) =3D=3D 0)
> +		return;
> +	if (tc6->ts_config.tx_type !=3D HWTSTAMP_TX_ON) {
> +		tc6->tx_hwtstamp_lost++;
> +		return;
> +	}
> +
> +	skb_shinfo(skb)->tx_flags |=3D SKBTX_IN_PROGRESS;
> +	u8 ret =3D tc6->tx_ts_idx++;

[Severity: High]
Does this allow the hardware timestamp ID to wrap around and cause collisio=
ns?

The hardware provides only 3 TX timestamp IDs. In oa_tc6_defer_for_hwtstamp,
the code cyclically increments tsc from 1 to 3 and unconditionally adds the
socket buffer to tx_ts_skb_q without checking queue depth. If more than
3 timestamped packets are transmitted before an interrupt fires, the tsc
wraps around. When the interrupt eventually arrives,
oa_tc6_process_deferred_skb will process all buffers matching that tsc,
which could result in the same timestamp being assigned to multiple unrelat=
ed
packets.

> +
> +	if (ret =3D=3D OA_TC6_TTSCC_REG_ID)
> +		tc6->tx_ts_idx =3D OA_TC6_TTSCA_REG_ID;
> +	oa_tc6_tsinfo_tx(skb)->tsc =3D ret;
> +
> +	list_add_tail(&skb->list, &tc6->tx_ts_skb_q);
> +}
> +
> +static int oa_tc6_process_deferred_skb(struct oa_tc6 *tc6, u8 tsc)
> +{
> +	struct skb_shared_hwtstamps tstamp;
> +	struct oa_tc6_ts_info_tx *ski;
> +	struct sk_buff *skb, *tmp;
> +	bool found =3D false;
> +	int ret =3D 0;
[ ... ]
> +		if (!ret) {
> +			tstamp.hwtstamp =3D ktime_set(data[0], data[1]);
> +			skb_tstamp_tx(skb, &tstamp);
> +			tc6->tx_hwtstamp_pkts++;
> +		}
> +
> +		dev_kfree_skb(skb);

[Severity: Critical]
Is there a risk of a use-after-free on ongoing_tx_skb here?

If an skb is assigned to ongoing_tx_skb and placed into tx_ts_skb_q before
it is fully copied to the SPI TX buffer, a stale interrupt for an older
packet sharing the same tsc (due to the ID wrap-around mentioned earlier)
could arrive.

oa_tc6_process_deferred_skb would then unconditionally call dev_kfree_skb on
this buffer. The next iteration of the transmission loop in
oa_tc6_add_tx_skb_to_spi_buf would then dereference the freed ongoing_tx_skb
to continue transmitting its chunks.

> +	}
> +	return ret;
> +}
[ ... ]
> +static void oa_tc6_update_ts_in_rx_skb(struct oa_tc6 *tc6)
> +{
> +	struct sk_buff *skb =3D tc6->rx_skb;
> +	struct oa_tc6_ts_info_rx *ski;
> +	__be32 ts_val[2];
> +	u32 ts[2];
> +
> +	if (!tc6->hw_tstamp_enabled)
> +		return;

[Severity: Medium]
Could this leave corrupt hardware timestamp tags in the payload?

If the hardware was previously configured to append timestamps and the user
dynamically disables the feature via ioctl, in-flight packets will arrive
with ski->rtsa set. Because of this early return when hw_tstamp_enabled is
false, oa_tc6_update_ts_in_rx_skb skips stripping the 8-byte hardware
timestamp via skb_pull, which destroys the packet framing for the network
stack.

> +	ski =3D oa_tc6_tsinfo_rx(skb);
> +	if (!ski->rtsa)
> +		return;
> +
> +	memcpy(&ts_val[0], skb->data, 4);
[ ... ]
> -static int oa_tc6_allocate_rx_skb(struct oa_tc6 *tc6)
> +static int oa_tc6_allocate_rx_skb(struct oa_tc6 *tc6, u32 footer)
>  {
> +	struct oa_tc6_ts_info_rx *ski;
> +
>  	tc6->rx_skb =3D netdev_alloc_skb_ip_align(tc6->netdev, tc6->netdev->mtu=
 +
> -						ETH_HLEN + ETH_FCS_LEN);
> +						ETH_HLEN + ETH_FCS_LEN + OA_TC6_TSTAMP_SZ);
>  	if (!tc6->rx_skb) {
>  		tc6->netdev->stats.rx_dropped++;
>  		return -ENOMEM;

[Severity: High]
This isn't a bug introduced by this patch, but does a transient memory
allocation failure permanently disable the interface?

If netdev_alloc_skb_ip_align fails under memory pressure, it returns -ENOME=
M.
This error propagates up to the threaded IRQ handler
oa_tc6_macphy_threaded_irq, which explicitly checks for non-zero returns fr=
om
the rx path and calls disable_irq_nosync and oa_tc6_disable_traffic. This
permanently halts the interface instead of safely dropping the frame and
recovering.

>  	}
> =20
> +	ski =3D oa_tc6_tsinfo_rx(tc6->rx_skb);
> +	ski->rtsa =3D FIELD_GET(OA_TC6_DATA_FOOTER_RTSA_VALID, footer);
> +	ski->rtsp =3D FIELD_GET(OA_TC6_DATA_FOOTER_RTSP_VALID, footer);
>  	return 0;
>  }
[ ... ]
> @@ -831,13 +999,15 @@ static int oa_tc6_process_spi_data_rx_buf(struct oa=
_tc6 *tc6, u16 length)
>  	/* Process the chunk with ongoing rx frame data */
> -	oa_tc6_prcs_ongoing_rx_frame(tc6, data);
> +	oa_tc6_prcs_ongoing_rx_frame(tc6, data, footer);

[Severity: High]
This is a pre-existing issue, but is there a missing bounds check here that
could cause a panic?

If the hardware sends a continuous stream of data chunks without ever setti=
ng
the end_valid flag, the receive loop continuously appends 64 bytes using
skb_put in oa_tc6_prcs_ongoing_rx_frame. Without validating against the
available socket buffer tailroom, a broken or malicious MAC-PHY could exhau=
st
the buffer and trigger an skb_over_panic.

> =20
>  	return 0;
>  }
[ ... ]
> @@ -1151,6 +1332,8 @@ struct oa_tc6 *oa_tc6_init(struct spi_device *spi, =
struct net_device *netdev)
>  	SET_NETDEV_DEV(netdev, &spi->dev);
>  	mutex_init(&tc6->spi_ctrl_lock);
>  	spin_lock_init(&tc6->tx_skb_lock);
> +	tc6->tx_ts_idx =3D OA_TC6_TTSCA_REG_ID;
> +	INIT_LIST_HEAD(&tc6->tx_ts_skb_q);

[Severity: High]
Are the socket buffers in tx_ts_skb_q properly freed during device teardown?

When traffic is disabled or the device is torn down, it appears tx_ts_skb_q
is ignored by oa_tc6_free_pending_skbs. If an interrupt is lost, the buffers
remain in the queue forever, which could lead to a permanent memory leak of
the socket buffers and their associated references.

> =20
>  	/* Set the SPI controller to pump at realtime priority */
>  	tc6->spi->rt =3D true;
> diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6_ptp.c b/drivers/net/ether=
net/oa_tc6/oa_tc6_ptp.c
> new file mode 100644
> index 0000000000000..921191ec6829f
> --- /dev/null
> +++ b/drivers/net/ethernet/oa_tc6/oa_tc6_ptp.c
[ ... ]
> +int oa_tc6_ptp_register(struct oa_tc6 *tc6, struct ptp_clock_info *info)
> +{
> +	/* Not supporting hardware timestamp isn't an error */
> +	if (!tc6->hw_tstamp_supported)
> +		return 0;
> +
> +	snprintf(info->name, sizeof(info->name), "%s",
> +		 "OA TC6 PTP clock");
> +	tc6->ptp_clock =3D ptp_clock_register(info, &tc6->spi->dev);
> +	if (IS_ERR(tc6->ptp_clock)) {
> +		dev_err(&tc6->spi->dev, "Registration of %s failed",
> +			info->name);
> +		return -EFAULT;
> +	}

[Severity: High]
Can this cause an invalid pointer dereference on cleanup?

If ptp_clock_register fails, it returns an ERR_PTR which is stored directly
in tc6->ptp_clock. The function returns an error without resetting the
pointer to NULL. Later, oa_tc6_ptp_unregister checks if tc6->ptp_clock is
true, which it is for an ERR_PTR, and attempts to unregister it, leading to=
 a
panic.

> +	dev_info(&tc6->spi->dev, "%s registered. index %d", info->name,
> +		 ptp_clock_index(tc6->ptp_clock));
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(oa_tc6_ptp_register);
[ ... ]
> diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6_tstamp.c b/drivers/net/et=
hernet/oa_tc6/oa_tc6_tstamp.c
> new file mode 100644
> index 0000000000000..272701a4081dc
> --- /dev/null
> +++ b/drivers/net/ethernet/oa_tc6/oa_tc6_tstamp.c
[ ... ]
> +int oa_tc6_hwtstamp_set(struct oa_tc6 *tc6,
> +			struct kernel_hwtstamp_config *cfg)
> +{
[ ... ]
> +	hwtstamp_config_from_kernel(&tc6->ts_config, cfg);
> +
> +	/* Supports timestamping all traffic */
> +	if (cfg->rx_filter !=3D HWTSTAMP_FILTER_NONE)
> +		tc6->ts_config.rx_filter =3D HWTSTAMP_FILTER_ALL;
> +	return oa_tc6_set_hwtstamp_settings(tc6);

[Severity: Medium]
Does this leave the timestamp configuration in an inconsistent state if
hardware programming fails?

The driver copies the new configuration into tc6->ts_config before calling
oa_tc6_set_hwtstamp_settings to program the hardware via SPI. If the SPI
transfer fails, the function returns an error, but tc6->ts_config remains
overwritten with the new values. Future queries to the timestamp
configuration will falsely report the failed configuration.

> +}
> +EXPORT_SYMBOL_GPL(oa_tc6_hwtstamp_set);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-s2500-mac-=
phy-support-v6-0-18ce79500371@onsemi.com?part=3D6
