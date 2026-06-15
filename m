Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1D040F8C5
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542888; cv=none; b=F09SD4mD4T/C8IdPQOxnNif01lZ4WKA+rAwNtSvDJAdjV8y8lD+/vFM7p+JQefeU/Sq6KEiUCiOZLFVAn9EbNL982/FvG8kd7ORlKAHu0HGeOOCtBKiVZfuwM1i6AiabR8UCCWAtuDDpsB4T3cAFIxJBCGs2jtDaKT2zFGX7Yt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542888; c=relaxed/simple;
	bh=aEMps0HJDtH3jjjrZRMR8j97J/WPQQazEnGUOfYNd2o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jH56rTeAXycMUuIn1dEJygtnKA+aCt/TS1r9Xx10b9ff39n8hZEpmI8frS/1ria7SVF+gqfS3ZCIj9nVVOSEelPCfnCDDYajFA6kfXiGSQkYAzXd5VIouN9BRSMffP7XSuOl6NAfO4EHnZt9YXqVsF9IpO5BNixh1wq6FztyZZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eCCEb4Lq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eCCEb4Lq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B50F1F00A3A;
	Mon, 15 Jun 2026 17:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781542886;
	bh=2itBTZp25ZzFsruIVBWAJPDvNDdsX1nsib8IH+sv14k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eCCEb4LqWUuFDodu4GeSsh6ZeMbmqCkb9SX7r3keB9QZCu0uRLuYgTrBXQwXMKmYy
	 KvebB2rjoRd1lZHbkN554xqAUvYU+3b2e4+pd7aOKpqZ9bzJaNTD+dQPxzkCGKQxtd
	 Vo+L2IHRj8qI0vjPDkiZ27exVOOH1CCX6jRH9UkuJz40rY+Oq8pbxSTdWjqowv2STV
	 6f8l+roc9fLmTZrMd/1ihRjUm/X7OcjzHPUw0flERCyyzpAi9m+QrzzZuqGz+N1skg
	 GcHlUBExprh99v9sk+D6pCVWeM8HHmCPvpsOdvPHS1iL2TnlwT88+4flf/t3Weq7ID
	 Kklt2Ec/34hzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 06/15] net: ethernet: oa_tc6: Support for
 hardware timestamp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260614-s2500-mac-phy-support-v5-6-89874b72f725@onsemi.com>
References: <20260614-s2500-mac-phy-support-v5-6-89874b72f725@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 17:01:26 +0000
Message-Id: <20260615170126.9B50F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:

New issues:
- [High] Unaligned memory access when casting `skb->data` to `u32 *`.
- [High] Unbounded queuing of original TX SKBs without a timeout leaks sock=
et memory.
- [High] Freeing an ongoing TX SKB on SPI transfer error without removing i=
t from the timestamp queue causes a Use-After-Free.
- [High] Unbounded queuing of TX timestamp requests leads to timestamp ID w=
rap-around and Use-After-Free.
- [High] Data race on `skb->cb` between the network stack and the SPI kthre=
ad leads to SKB memory leaks.
- [Medium] Disabling hardware timestamping corrupts in-flight packets.
- [Medium] Missing cleanup of `tx_ts_skb_q` leaks pending SKBs on device te=
ardown.
- [Medium] Overwriting `so_timestamping` in `oa_tc6_get_ts_info` removes co=
re software timestamping capabilities.
- [Medium] Hardware configuration failure leaves `tc6->ts_config` in an inc=
onsistent state.

Pre-existing issues:
- [High] Transient out-of-memory errors permanently kill the main SPI kthre=
ad.
--

commit b7df7518de6607438ff5d3bb817fff0ea7ea3447
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: ethernet: oa_tc6: Support for hardware timestamp
   =20
PTP register/unregister calls are implemented in oa_tc6_ptp.c.
The APIs that work with the hardware for timestamp is provided
by vendor code as it may be vendor dependent.
   =20
Interface for ndo_hwtstamp_set/get, ioctl, control and status
callback for ethtool are provided to support hardware timestamp
feature.
   =20
Besides ioctl interface, hardware timestamp functions that handles
header and footer data are in oa_tc6.c. Helper functions are in
oa_tc6_tstamp.c.

> --- a/drivers/net/ethernet/oa_tc6/oa_tc6.c
> +++ b/drivers/net/ethernet/oa_tc6/oa_tc6.c
[ ... ]
> +static void oa_tc6_defer_for_hwtstamp(struct oa_tc6 *tc6,
> +				      struct sk_buff *skb)
> +{
[ ... ]
> +	list_add_tail(&skb->list, &tc6->tx_ts_skb_q);
> +}

[Severity: High]
Does appending the original skb to tx_ts_skb_q without a timeout leak
socket memory?

Delaying the original transmission skb's destruction prevents the
socket from releasing its sk_wmem_alloc memory. If the packet is
dropped by the hardware or the interrupt is lost, the skb remains in
this list forever.

Should this queue a clone (skb_clone_sk()) for timestamping and free
the original skb, or implement a timeout?

[Severity: High]
Can this also lead to a Use-After-Free if an SPI data transfer fails?

If an SPI transfer fails, the error path invokes
oa_tc6_cleanup_ongoing_tx_skb() which unconditionally frees
tc6->ongoing_tx_skb via kfree_skb().

However, oa_tc6_defer_for_hwtstamp() may have already linked this
skb into tc6->tx_ts_skb_q. Since the cleanup routine doesn't remove
it from the list, the skb becomes a dangling pointer. When a timestamp
event arrives, oa_tc6_process_deferred_skb() will traverse tx_ts_skb_q
and access freed memory.

[ ... ]
> +static int oa_tc6_process_deferred_skb(struct oa_tc6 *tc6, u8 tsc)
> +{
[ ... ]
> +	list_for_each_entry_safe(skb, tmp, &tc6->tx_ts_skb_q, list) {
> +		ski =3D oa_tc6_tsinfo_tx(skb);
> +		if (ski->tsc !=3D tsc)
> +			continue;
[ ... ]
> +		list_del(&skb->list);
[ ... ]
> +		dev_kfree_skb(skb);
> +	}
> +	return ret;
> +}

[Severity: High]
Will this loop free active skbs still undergoing SPI transmission if
more than 3 packets are queued?

The MAC-PHY provides 3 TX timestamp capture registers, and the driver
cycles through IDs 1, 2, and 3. If the IDs wrap around, this loop
iterates through tx_ts_skb_q and frees all skbs matching the aliased
tsc value, instead of just the oldest one.

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

[Severity: Medium]
Will returning early here corrupt in-flight packets if hardware
timestamping is disabled dynamically?

If hw_tstamp_enabled is turned off while packets are in-flight, the
driver returns without calling skb_pull(skb, 8). For frames that were
already processed by the MAC-PHY with a prepended timestamp, skipping the
pull leaves the Ethernet header shifted by 8 bytes.

Could this cause the networking stack to misinterpret the packet headers
and drop them?

> +
> +	ts[0] =3D be32_to_cpu(*((u32 *)(skb->data)));
> +	ts[1] =3D be32_to_cpu(*((u32 *)(skb->data) + 1));

[Severity: High]
Does casting skb->data directly to u32 pointer cause an unaligned memory ac=
cess
exception?

Since netdev_alloc_skb_ip_align() reserves 2 bytes to ensure the IP
header is 4-byte aligned, skb->data itself is only 2-byte aligned. On
strict-alignment architectures, dereferencing this will panic.

Should this use get_unaligned_be32(skb->data) instead?

[ ... ]
> @@ -623,24 +783,29 @@ static void oa_tc6_update_rx_skb(struct oa_tc6 *tc6=
, u8 *payload, u8 length)
>  	memcpy(skb_put(tc6->rx_skb, length), payload, length);
>  }
> =20
> -static int oa_tc6_allocate_rx_skb(struct oa_tc6 *tc6)
> +static int oa_tc6_allocate_rx_skb(struct oa_tc6 *tc6, u32 footer)
>  {

[Severity: High]
This isn't a bug introduced by this patch, but will a transient
out-of-memory error permanently kill the main SPI kthread?

If netdev_alloc_skb_ip_align() fails under normal memory pressure,
oa_tc6_allocate_rx_skb() returns -ENOMEM. This error propagates up
through the receive path to oa_tc6_try_spi_transfer() and finally to
oa_tc6_spi_thread_handler().

The kthread loop checks the return value and exits. Returning from a
kthread function permanently kills the thread, rendering the MAC-PHY
dead until the module is reloaded.

[ ... ]
> @@ -1073,6 +1250,7 @@ netdev_tx_t oa_tc6_start_xmit(struct oa_tc6 *tc6, s=
truct sk_buff *skb)
>  	spin_lock_bh(&tc6->tx_skb_lock);
>  	tc6->waiting_tx_skb =3D skb;
>  	spin_unlock_bh(&tc6->tx_skb_lock);
> +	oa_tc6_tsinfo_tx(skb)->tsc =3D 0;
> =20
>  	/* Wake spi kthread to perform spi transfer */
>  	wake_up_interruptible(&tc6->spi_wq);

[Severity: High]
Is there a data race on skb->cb between the network stack and the SPI
kthread here?

The skb is handed over to the SPI kthread by assigning it to
tc6->waiting_tx_skb inside the spinlock. Immediately after releasing
the lock, this code initializes oa_tc6_tsinfo_tx(skb)->tsc =3D 0.

If the SPI kthread wakes up immediately, grabs the skb, and calls
oa_tc6_defer_for_hwtstamp(), it could assign a valid hardware index
(1, 2, or 3) to tsc.

The main thread would then overwrite the valid index with 0. When the
interrupt arrives, oa_tc6_process_deferred_skb() skips the skb because
its tsc is 0, leaking the skb permanently.

[ ... ]
> @@ -1103,6 +1281,8 @@ struct oa_tc6 *oa_tc6_init(struct spi_device *spi, =
struct net_device *netdev)
>  	SET_NETDEV_DEV(netdev, &spi->dev);
>  	mutex_init(&tc6->spi_ctrl_lock);
>  	spin_lock_init(&tc6->tx_skb_lock);
> +	tc6->tx_ts_idx =3D OA_TC6_TTSCA_REG_ID;
> +	INIT_LIST_HEAD(&tc6->tx_ts_skb_q);

[Severity: Medium]
Is there a missing cleanup routine for tx_ts_skb_q on device teardown?

If the module is unloaded or the device is unbound, any skbs sitting
in this queue (e.g., due to a lost hardware interrupt) appear to
remain indefinitely, causing a memory leak.

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
> +}

[Severity: Medium]
Will a hardware configuration failure leave tc6->ts_config in an
inconsistent state?

The new user-provided configuration is copied into the internal
tc6->ts_config before calling oa_tc6_set_hwtstamp_settings(). If
programming the hardware fails over SPI, the function returns an error
but the internal state is not rolled back.

Could subsequent reads (like SIOCGHWTSTAMP) incorrectly report this
unapplied configuration?

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

[Severity: Medium]
Does overwriting info->so_timestamping remove the core software
timestamping capabilities?

Assigning only hardware timestamping flags overwrites the default
software timestamping capabilities (SOF_TIMESTAMPING_SOFTWARE,
SOF_TIMESTAMPING_TX_SOFTWARE, SOF_TIMESTAMPING_RX_SOFTWARE) that the
core network stack natively supports.

Should the hardware flags be bitwise-ORed with the existing flags or
retrieved via ethtool_op_get_ts_info() first?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260614-s2500-mac-=
phy-support-v5-0-89874b72f725@onsemi.com?part=3D6
