Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C7D2D060D
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 05:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780810981; cv=none; b=r1m4VDCqHtFkQ01CIBeCO/m0mGm27KR0AIbs8QszHYPo+1gHtOX8zuAB4qQiFG3WrfT8vzPaYmlgbPj/eftBetmFuq+I0uamJcxg9yfPlfASDwmHMeo9Y/olATfv8Mpl0mAIl43JU1HJOaoQ1VamRaB3S3UyuLVSlOBNLzHzPdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780810981; c=relaxed/simple;
	bh=d7IadnjdbBcEE5WKEoLOyihIrbuqzcY8yqUvFQXawK0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kkrsT0sC55zAAvvjwP6k9HQ24Shil7bczAd/2crRWlBrzCa9OFeRsEBJZrx3J8Fe3jxC5qsF0PKWanGRvbFJZjwM/BmhT7Y+eaaP3LBRXCAGoNWdiLOOIQZ+5exN15IwMNaeMsc5KRL3PWPAkyNoJ5Om0ErmiD/fJSg0IO3WWLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ihWQY1uh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ihWQY1uh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 279D71F00893;
	Sun,  7 Jun 2026 05:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780810979;
	bh=1Yjcki1QrfLKrqfaT6IHpiAnUt4a74lX6Bj7qgXUioA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ihWQY1uh8mP/Y7Gi6p9rLBbvl/xQZs55OhL3sSsOBS1EBiWczRLO5DbkW/EyvHVPQ
	 ZDGV5l9+GkpFr6wu8STvGfv/i8VaYG6LW0YAOhUGY7++4vshigabM4f0mMs5cJX2hX
	 wVP8mauSslcce88JlBjgtfFzuf38Yl6v/9MAHXFTVUKvJfmNiF8yExcGy2NC9iG/K/
	 t1Upk5lKUSE/aeUpKq+wa84kR+cxD7KPL7ughp3WooB0CiIeMsQQtnlIIb8mMjQlcl
	 16gmeZP3lRxLlB1Q3sBVpzJuJugQ5R+lDHPSzHOh/bJLToVExM/KEW3tw/OdhFGOFV
	 Cg+VJIAvGjGag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 06/16] net: ethernet: oa_tc6: Support for
 hardware timestamp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260605-s2500-mac-phy-support-v4-6-de0fbc13c6d8@onsemi.com>
References: <20260605-s2500-mac-phy-support-v4-6-de0fbc13c6d8@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Jun 2026 05:42:58 +0000
Message-Id: <20260607054259.279D71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] Data race and Use-After-Free accessing SKB control block after dro=
pping lock.
- [High] Early return in RX timestamp handler fails to pull the hardware ti=
mestamp, corrupting the packet.
- [High] Unaligned memory access when reading the hardware timestamp trigge=
rs traps/panics on strict architectures.
- [High] Premature queueing of `ongoing_tx_skb` causes Use-After-Free durin=
g SPI transmission.
- [High] Error recovery path frees `ongoing_tx_skb` without removing it fro=
m `tx_ts_skb_q`, causing list corruption.
- [High] Missing clearance of `ERR_PTR` in `oa_tc6_ptp_register` causes ker=
nel panics upon deregistration.
- [Medium] Un-timestamped SKBs are permanently leaked upon driver module ex=
it.
- [Medium] Logic bug when handling wrapped TX timestamp IDs applies the tim=
estamp to the wrong SKB.
- [Medium] Missing bounds check before reading the timestamp from RX SKB.
- [Low] `oa_tc6_get_ts_info` overwrites and breaks software timestamping ca=
pabilities.
--

commit a7d440ad6e924ff31545feb9b5387e71f09e4798
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: ethernet: oa_tc6: Support for hardware timestamp

PTP register/unregister calls are implemented in oa_tc6_ptp.c.
The APIs that work with the hardware for timestamp is provided
by vendor code as it may be vendor dependent.

Interface for ndo_hwtstamp_set/get, ioctl, control and status
callback for ethtool are provided to support hardware timestamp
feature.

> diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6.c b/drivers/net/ethernet/=
oa_tc6/oa_tc6.c
> index c7d70d37ba538..9410cecfdc2aa 100644
> --- a/drivers/net/ethernet/oa_tc6/oa_tc6.c
> +++ b/drivers/net/ethernet/oa_tc6/oa_tc6.c
[ ... ]
> +static void oa_tc6_defer_for_hwtstamp(struct oa_tc6 *tc6,
> +				      struct sk_buff *skb)
> +{
[ ... ]
> +	skb_shinfo(skb)->tx_flags |=3D SKBTX_IN_PROGRESS;
> +	u8 ret =3D tc6->tx_ts_idx++;
> +
> +	if (ret =3D=3D OA_TC6_TTSCC_REG_ID)
> +		tc6->tx_ts_idx =3D OA_TC6_TTSCA_REG_ID;
> +	oa_tc6_tsinfo_tx(skb)->tsc =3D ret;
> +
> +	list_add_tail(&skb->list, &tc6->tx_ts_skb_q);

[Severity: High]
If the SPI transfer fails later, the error recovery path in
oa_tc6_cleanup_ongoing_tx_skb() frees ongoing_tx_skb via kfree_skb().
Does it leave a dangling pointer in tx_ts_skb_q since it isn't unlinked
here?

A subsequent hardware timestamp event would then iterate over
tx_ts_skb_q in oa_tc6_process_deferred_skb() and dereference the freed
skb, causing linked list corruption and a use-after-free.

> +}
> +
> +static int oa_tc6_process_deferred_skb(struct oa_tc6 *tc6, u8 tsc)
> +{
[ ... ]
> +		if (found) {
> +			dev_warn_ratelimited(&tc6->spi->dev,
> +					     "Multiple skbs. tsc =3D %d\n",
> +					     tsc);
> +			tc6->tx_hwtstamp_err++;
> +		}
> +		found =3D true;
> +		list_del(&skb->list);
> +
> +		/* Retrieve the timestamping info */
> +		ret =3D oa_tc6_read_registers(tc6,
> +					    OA_TC6_REG_TTSCA_HIGH +
> +					    2 * (tsc - 1), &data[0], 2);

[Severity: Medium]
If multiple skbs share the same ID due to missed interrupts wrapping
the counter, does this logic apply the timestamp to the wrong skb?

The list traversal processes the oldest skb first, reading the hardware
register and applying the new timestamp to the stale skb. It then
processes the newer skb, triggers a warning, and reads the hardware
register again. Reading the register twice might clear it or return
zero, leaving the actual newly transmitted skb with an invalid or zero
timestamp.

> +
> +		if (!ret) {
> +			tstamp.hwtstamp =3D ktime_set(data[0], data[1]);
> +			skb_tstamp_tx(skb, &tstamp);
> +			tc6->tx_hwtstamp_pkts++;
> +		}
[ ... ]
> +static void oa_tc6_update_ts_in_rx_skb(struct oa_tc6 *tc6)
> +{
> +	struct sk_buff *skb =3D tc6->rx_skb;
> +	struct oa_tc6_ts_info_rx *ski;
> +	u32 ts[2];
> +
> +	if (!tc6->hw_tstamp_enabled)
> +		return;
> +	ski =3D oa_tc6_tsinfo_rx(skb);
> +	if (!ski->rtsa)
> +		return;

[Severity: High]
If the timestamp valid flag is false (!ski->rtsa), this early return
skips the skb_pull() call. Does this abandon the 8-byte hardware header
at the start of the skb data buffer, causing the network stack to parse
these dummy bytes as the Ethernet header and corrupting the packet?

> +
> +	ts[0] =3D be32_to_cpu(*((u32 *)(skb->data)));
> +	ts[1] =3D be32_to_cpu(*((u32 *)(skb->data) + 1));

[Severity: High]
Can this cast trigger an unaligned memory access panic on architectures
with strict alignment requirements?

The receive skb is allocated using netdev_alloc_skb_ip_align(), which
aligns skb->data to a 2-byte offset. Casting skb->data to a u32 pointer
and dereferencing it performs a 32-bit read from a 2-byte aligned
address. Should get_unaligned_be32() be used here instead?

[Severity: Medium]
Is there a risk of an out-of-bounds memory read here if the skb payload
is smaller than 8 bytes?

If a runt packet arrives with less than 8 bytes of data, casting and
reading from skb->data will read past the buffer, and the subsequent
skb_pull() might fail silently without properly decrementing skb->len.

> +
> +	/* Check parity */
> +	if ((oa_tc6_get_parity(ts[0]) ^ oa_tc6_get_parity(ts[1])) =3D=3D
[ ... ]
> @@ -866,6 +1041,8 @@ static u16 oa_tc6_prepare_spi_tx_buf_for_tx_skbs(str=
uct oa_tc6 *tc6)
>  			tc6->ongoing_tx_skb =3D tc6->waiting_tx_skb;
>  			tc6->waiting_tx_skb =3D NULL;
>  			spin_unlock_bh(&tc6->tx_skb_lock);
> +			oa_tc6_defer_for_hwtstamp(tc6,
> +						  tc6->ongoing_tx_skb);

[Severity: High]
Does queueing the ongoing_tx_skb for timestamping here create a
use-after-free risk during the SPI transmission?

The skb is added to tx_ts_skb_q before its SPI transmission completes.
If the MAC-PHY asserts a TX timestamp interrupt for a previously
transmitted frame with a matching ID, oa_tc6_process_deferred_skb()
might find this currently-transmitting skb in the queue and free it.
The transmission loop in oa_tc6_add_tx_skb_to_spi_buf() would then
dereference the freed skb's length.

>  		}
>  		if (!tc6->ongoing_tx_skb)
>  			break;
[ ... ]
> @@ -1073,6 +1250,7 @@ netdev_tx_t oa_tc6_start_xmit(struct oa_tc6 *tc6, s=
truct sk_buff *skb)
>  	spin_lock_bh(&tc6->tx_skb_lock);
>  	tc6->waiting_tx_skb =3D skb;
>  	spin_unlock_bh(&tc6->tx_skb_lock);
> +	oa_tc6_tsinfo_tx(skb)->tsc =3D 0;

[Severity: High]
Does accessing the skb control block here introduce a data race or a
use-after-free?

Once the tx_skb_lock is released, the SPI kthread can immediately dequeue
the skb, assign it a valid hardware timestamp ID, transmit it, and even
free it. Overwriting the control block with tsc =3D 0 here modifies a
potentially freed skb, or overwrites a valid ID assigned by the SPI
thread, which breaks the TX timestamp correlation.

> =20
>  	/* Wake spi kthread to perform spi transfer */
>  	wake_up_interruptible(&tc6->spi_wq);
[ ... ]
> @@ -1103,6 +1281,8 @@ struct oa_tc6 *oa_tc6_init(struct spi_device *spi, =
struct net_device *netdev)
>  	SET_NETDEV_DEV(netdev, &spi->dev);
>  	mutex_init(&tc6->spi_ctrl_lock);
>  	spin_lock_init(&tc6->tx_skb_lock);
> +	tc6->tx_ts_idx =3D OA_TC6_TTSCA_REG_ID;
> +	INIT_LIST_HEAD(&tc6->tx_ts_skb_q);

[Severity: Medium]
When the driver is unbound or the module is exited, are the
un-timestamped skbs left in tx_ts_skb_q leaked?

If a timestamp interrupt is lost, the skbs remain in this list
indefinitely. If the teardown path does not traverse and free the skbs
in tx_ts_skb_q, this could guarantee a memory leak of all
un-timestamped skbs.

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
If ptp_clock_register() fails, does this leave an error pointer stored
in tc6->ptp_clock?

If the function returns an error without setting tc6->ptp_clock to
NULL, later teardown routines like oa_tc6_ptp_unregister() will check
if (tc6->ptp_clock) which evaluates to true. Passing the error pointer
to ptp_clock_unregister() would then dereference it and trigger a
kernel panic.

> +	dev_info(&tc6->spi->dev, "%s registered. index %d", info->name,
> +		 ptp_clock_index(tc6->ptp_clock));
> +	return 0;
> +}
[ ... ]
> diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6_tstamp.c b/drivers/net/et=
hernet/oa_tc6/oa_tc6_tstamp.c
> new file mode 100644
> index 0000000000000..272701a4081dc
> --- /dev/null
> +++ b/drivers/net/ethernet/oa_tc6/oa_tc6_tstamp.c
[ ... ]
> +int oa_tc6_get_ts_info(struct oa_tc6 *tc6,
> +		       struct kernel_ethtool_ts_info *info)
> +{
> +	if (!tc6->ptp_clock)
> +		return ethtool_op_get_ts_info(tc6->netdev, info);
> +
> +	info->so_timestamping =3D SOF_TIMESTAMPING_RAW_HARDWARE |
> +				SOF_TIMESTAMPING_TX_HARDWARE |
> +				SOF_TIMESTAMPING_RX_HARDWARE;

[Severity: Low]
Does this assignment completely overwrite and break the software
timestamping capabilities?

By replacing the flags rather than bitwise ORing them with the
software timestamping flags normally provided by
ethtool_op_get_ts_info(), user-space tools querying ethtool might not
see software timestamping capabilities and could fail to fall back to
them.

> +	info->phc_index =3D ptp_clock_index(tc6->ptp_clock);
> +	info->tx_types =3D BIT(HWTSTAMP_TX_ON);
> +	info->rx_filters =3D BIT(HWTSTAMP_FILTER_ALL);
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-s2500-mac-=
phy-support-v4-0-de0fbc13c6d8@onsemi.com?part=3D6
