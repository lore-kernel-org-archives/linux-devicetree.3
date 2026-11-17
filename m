Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945184;
	b=XG/ObqGZ81Hmq0cYTf5lFYg6Q7hVf+7MmIxizzNBqD8+o5tYEpULg7aKzDsH7hPeIyby
	 VyNIYl6YXcGexdwQO1LfhbeQl2bvCCfYnLtlgGXYwCprLJT8hCPOs9BhJfeT9isYGmiGm
	 2nbYsGWb7tRcuvZzA2UHsFZuGw2Nzth2aLFu/ezgJwReDT7Ve2fvlWpHGB/4caGdBSVBq
	 5TRLsDYoCWQfJOTx9Hp3RfW29oPBmNJIU/gcTxajMBU7/MPyV3OTSxAErLgTyiKTK5u+a
	 WUNTSxTdzaELz6mh6gdaWECrrOBH3hvrDuNql53gncBepl8/1IWC6Q2buDSSv9+xRnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945184;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=pnWpT04zbNKLDxJ2Fue7GSsGaG0uUbcs8/kqpoWstoY=;
	b=00X/KMQ6PdGmEMYayvbC1VUt01vLGQgvGVf8EbxKKQx4uB+hfPFpqUONrkFBedPYTxr0
	 +tzBy2Zi4wdOVTJIG9Q/ROTiCWUMDkm7/olulTbqwF8Lcsox0XMw610gdzt0TX1+Hd5sU
	 15mX7H7/pJtYO8qJkNTHkfdYNnu3BdYrOFMFL0IBvn3vEgmg+BjyPzJ5TARnDnfiGAjlG
	 FPUYTcNSCMQsNU/7fxXuGJMAx/b+os1qIdqb7jQOmGHbDL+JsZlCznFjIIMg+vYvZ2qCb
	 sRbPOnA3N+05+HrF/jMO1QlLAbDrlC1TqHfZnncnvs3IjswaSnyh9+kyDCZYtFb9Qfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JObLn4oW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165EA606A339;
	Tue, 17 Nov 2026 19:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JObLn4oW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A361F000C9;
	Tue, 17 Nov 2026 19:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794945183;
	bh=pnWpT04zbNKLDxJ2Fue7GSsGaG0uUbcs8/kqpoWstoY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JObLn4oWZ2WsJB2VwvkVlID81k/a22JgNqxXQiGEH2hcwsIr7aHSguL/VbqeI6M07
	 UOs0MPjUGWVP9ePFnROylSa/cH2XH4dZIIgdd8Afu/wJxLT3sMGU85PhxYnkofPPVe
	 +ywNmnalx8NrG25m+pAoIgtPxLYzr6Wn28dHvAxz8NVj73h8KUZtMWjadtzzdEPnpq
	 ft3i0Ts2lHPF/4vsVwjVgbF8XGjw46eYOoqNlH++d4WlBkPmJt3qjvMJ86HRfkgl44
	 t8mMVvKvjJIM4u4F2us/0Qfh9oX/Oad07FzWp9wNtfAVXGU0V0cT+m/YKkXkIrZ5sT
	 jU8Pa93dxHW0Q==
Subject: Re: [PATCH net-next v11 07/14] net: ethernet: oa_tc6: Support for
 hardware timestamp
From: netdev-bot+sashiko@kernel.org
To: Selvamani.Rajagopal@onsemi.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 parthiban.veerasooran@microchip.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, richardcochran@gmail.com,
 andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 edumazet@kernel.org, piergiorgio.beruto@gmail.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, jerry.ray@microchip.com, ciprian.regus@analog.com
Date: Tue, 17 Nov 2026 19:53:02 +0000
Message-ID: <179494518211.3136.1021105568968534363@kernel.org>
In-Reply-To: <20261113-s2500-mac-phy-support-v11-7-7a186141952c@onsemi.com>
References: <20261113-s2500-mac-phy-support-v11-7-7a186141952c@onsemi.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 7 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 6

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] TX timestamp capture slots (TTSCA/B/C) are never reclaimed.
- [Low] The timestamp patch includes edits that belong to other patches
  in the series and are not mentioned in its commit message.
- [Low] The kernel-doc for the exported oa_tc6_get_ts_info()
  (drivers/net/ethernet/oa_tc6/oa_tc6_tstamp.c:207) says 'Return: 0 on…
- [Low] One timestamp request can be counted in both tx_hwtstamp_lost and
  tx_hwtstamp_err.
- [Low] oa_tc6_set_hwtstamp_settings()
  (drivers/net/ethernet/oa_tc6/oa_tc6_tstamp.c:16-104) commits register…
- [Low] oa_tc6_set_hwtstamp_settings() checks tc6->disable_traffic under
  tx_skb_lock (oa_tc6_tstamp.c:29-33) and then drops the lock.
- [Low] tx_hwtstamp_pkts, tx_hwtstamp_lost and tx_hwtstamp_err are plain
  u64 fields in struct oa_tc6 (oa_tc6_std_def.h).

--

net: ethernet: oa_tc6: Support for hardware timestamp

This commit adds hardware timestamping support to the OA TC6 framework.
It adds PTP clock register/unregister helpers and exports helpers for
ndo_hwtstamp_set/get and ethtool get_ts_info/get_ts_stats. Each TX frame
that asks for a timestamp gets one of three TTSC capture slots and is
completed with skb_tstamp_tx() when the MAC-PHY signals the capture; if
all three slots are busy the frame is dropped, while on RX the 8-byte
timestamp the MAC-PHY prepends is parsed into the skb.

> diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6_main.c b/drivers/net/ethernet/oa_tc6/oa_tc6_main.c
> index 341d13c97f91f..2b31370da2d2b 100644
> --- a/drivers/net/ethernet/oa_tc6/oa_tc6_main.c
> +++ b/drivers/net/ethernet/oa_tc6/oa_tc6_main.c

[ ... ]

> @@ -49,6 +60,212 @@ static int oa_tc6_get_parity(u32 p)

[ ... ]

> +static bool oa_tc6_req_tx_hwtstamp(struct oa_tc6 *tc6, struct sk_buff *skb)
> +{

[ ... ]

> +	tsc = tc6->ttsc_current_id;
> +	for (i = 0; i < OA_TC6_TTSCC_REG_ID; i++) {
> +		if (!(tc6->ts_ttsc_pending &
> +		      BIT(tsc - OA_TC6_TTSCA_REG_ID)))
> +			goto slot_found;
> +		tsc = oa_tc6_next_tsc(tsc);
> +	}
> +
> +	/* All the three slots are waiting for their event. This skb
> +	 * can't request timestamp. Marking it to be dropped.
> +	 */
> +	tc6->tx_hwtstamp_err++;
> +	return true;

[Severity: Medium]
Can all three TTSC slots get stuck so that every timestamped frame ends
up here?

The pending bit set in oa_tc6_req_tx_hwtstamp() is cleared during normal
operation only by oa_tc6_events_handle(), and only when STATUS0 reports
the matching TTSCAx event. oa_tc6_queue_tx_tstamp_skb() puts the sent skb
on tx_ts_skb_q with no timeout or aging, so the socket stays charged for
it as well.

Suppose the MAC-PHY never reports the capture for a frame that carried a
TSC request. Examples are a frame discarded when MAC TXEN is cleared while
frames are still buffered, or a frame not sent because of retry
exhaustion or a TX buffer error. In that case the slot is never released.
After three such losses, oa_tc6_prepare_spi_tx_buf_for_tx_skbs() drops
every SKBTX_HW_TSTAMP frame. Those drops show up only in tx_dropped and
tx_hwtstamp_err.

Recovery also looks hard. ndo_stop and ndo_open do not flush tx_ts_skb_q
or ts_ttsc_pending. The s2500 ndo_stop path added later in the series
only calls netif_stop_queue() and phy_stop() and clears MAC TXEN.

When the same config is applied again, as ptp4l does at startup,
oa_tc6_set_hwtstamp_settings() returns at its early check:

	if (tc6->ts_config.flags == ts_cfg->flags &&
	    tc6->ts_config.tx_type == ts_cfg->tx_type &&
	    tc6->ts_config.rx_filter == ts_cfg->rx_filter)
		return 0;

so oa_tc6_cleanup_tx_tstamp_skbs() never runs. The slots are only cleared
by setting tx_type to OFF, by a fatal disable_traffic, or by removing the
driver.

There is a separate problem with dropping the frame instead of sending it
without a timestamp: any local socket can use up the slots. Once
HWTSTAMP_TX_ON is enabled, SOF_TIMESTAMPING_TX_HARDWARE needs no
capability. A socket that floods timestamp requests can keep all three
slots busy. Other users' PTP event frames are then dropped, not just their
timestamps.

The commit message says:

    Practically, an application using hardware timestamp is not
    expected to hit this scenario as three timestamp capture registers
    are plenty considering the amount of traffic expected in such
    applications.

Does that still hold when a capture never completes, or when a sender
doesn't cooperate? Would it be better to send the frame without a TSC
request, or to age out stale slots?

> +
> +slot_found:

[ ... ]

> +static void oa_tc6_events_handle(struct oa_tc6 *tc6, u32 val, const u32 *ts)
> +{

[ ... ]

> +	list_for_each_entry_safe(skb, tmp, &drop, list) {
> +		list_del(&skb->list);
> +		dev_kfree_skb(skb);
> +	}
> +
> +	if (val & ~handled) {
> +		tc6->tx_hwtstamp_err += hweight32(val & ~handled);
> +		dev_warn_ratelimited(&tc6->spi->dev,
> +				     "Unexpected event: 0x%x\n",
> +				     val & ~handled);
> +	}
> +}

[Severity: Low]
Can one timestamp request be counted in both tx_hwtstamp_lost and
tx_hwtstamp_err? struct ethtool_ts_stats documents @err as exclusive of
@lost.

oa_tc6_cleanup_tx_tstamp_skbs() and oa_tc6_queue_tx_tstamp_skb() count a
request as lost even though the TSC request may already have reached the
MAC-PHY in the data header.

When tx_type goes from ON to OFF, oa_tc6_set_hwtstamp_settings() clears
only the STATUS0 TTSC bits it saw in its earlier block read. If the
capture completes after that read, STATUS0.TTSCAx stays set.

Later, extended status may be processed for some other unmasked reason,
such as an RX buffer overflow. ts_valid is still !!tc6->ptp_clock, so
oa_tc6_events_handle() runs with an empty tx_ts_skb_q. The stale bit then
lands in this branch: tx_hwtstamp_err is incremented and "Unexpected
event" is printed for a request that was already counted as lost.

[ ... ]

> diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6_std_def.h b/drivers/net/ethernet/oa_tc6/oa_tc6_std_def.h
> index c2c120ddcc078..98d815f8f0b48 100644
> --- a/drivers/net/ethernet/oa_tc6/oa_tc6_std_def.h
> +++ b/drivers/net/ethernet/oa_tc6/oa_tc6_std_def.h
> @@ -1,9 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0+ */
>  /*
>   * Register and driver related definitions to support
> - * OPEN Alliance 10BASE‑T1x MAC‑PHY Serial Interface framework.
> - *
> - * Author: Selva Rajagopal <selvamani.rajagopal@onsemi.com>
> + * OPEN Alliance 10BASE-T1x MAC-PHY Serial Interface framework.
>   */

[ ... ]

> @@ -44,7 +47,10 @@
>  #define OA_TC6_DATA_FOOTER_DATA_VALID		BIT(21)
>  #define OA_TC6_DATA_FOOTER_START_VALID		BIT(20)
>  #define OA_TC6_DATA_FOOTER_START_WORD_OFFSET	GENMASK(19, 16)
> +#define OA_TC6_DATA_FOOTER_FRAME_DROP		BIT(15)

[Severity: Low]
This isn't a bug, but this patch makes changes that seem to belong to
other patches in the series, and the commit message doesn't mention them.

The header comment rewrite drops the Author line and replaces the U+2011
hyphens. That header was added by the earlier patch "net: ethernet:
oa_tc6: Move constant definitions to header file", which already has a
Reviewed-by. Should these fixes be squashed into that patch?

Nothing in this patch uses OA_TC6_DATA_FOOTER_FRAME_DROP. Its first user
is oa_tc6_prcs_rx_chunk_payload() in the next patch, "net: ethernet:
oa_tc6: Drop frames if footer has FD bit set". Should the define move
there?

>  #define OA_TC6_DATA_FOOTER_END_VALID		BIT(14)
> +#define OA_TC6_DATA_FOOTER_RTSA_VALID		BIT(7)
> +#define OA_TC6_DATA_FOOTER_RTSP_VALID		BIT(6)

[ ... ]

> diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6_tstamp.c b/drivers/net/ethernet/oa_tc6/oa_tc6_tstamp.c
> new file mode 100644
> index 0000000000000..b3cc032311a9d
> --- /dev/null
> +++ b/drivers/net/ethernet/oa_tc6/oa_tc6_tstamp.c
> @@ -0,0 +1,224 @@

[ ... ]

> +static int oa_tc6_set_hwtstamp_settings(struct oa_tc6 *tc6,
> +					const struct hwtstamp_config *ts_cfg)
> +{

[ ... ]

> +	spin_lock_bh(&tc6->tx_skb_lock);
> +	disabled = tc6->disable_traffic;
> +	spin_unlock_bh(&tc6->tx_skb_lock);
> +	if (disabled)
> +		return -EIO;

[Severity: Low]
Is this check enough to keep the register read-modify-write below from
racing with oa_tc6_disable_traffic()?

tx_skb_lock is dropped right after the check, and spi_ctrl_lock only
serializes individual register transactions.

The threaded IRQ handler can hit an SPI failure after the CONFIG0..
INT_MASK0 block read and before the INT_MASK0 write. In that case
oa_tc6_disable_traffic() sets disable_traffic and writes
OA_TC6_INT_MASK0_ALL_INTERRUPTS. This function then writes back its stale
irqm, which unmasks device interrupts on a device that has been declared a
point of no return. It also commits ts_config and returns 0.

The IRQ line itself stays disabled through disable_irq_nosync(), so the
practical effect is inconsistent state rather than an interrupt storm.

> +
> +	/* CONFIG0, STATUS0 and INT_MASK0 span one register block, so a
> +	 * single control transaction covers all three.
> +	 */
> +	ret = oa_tc6_read_registers(tc6, OA_TC6_REG_CONFIG0, regs,
> +				    ARRAY_SIZE(regs));

[ ... ]

> +	ret = oa_tc6_write_register(tc6, OA_TC6_REG_INT_MASK0, irqm);
> +	if (ret) {
> +		dev_err(&tc6->spi->dev, "failed to write IRQM register\n");
> +		goto out;
> +	}
> +
> +	ret = oa_tc6_write_register(tc6, OA_TC6_REG_CONFIG0, cfg0);
> +	if (ret) {
> +		dev_err(&tc6->spi->dev, "failed to write CFG0 register\n");
> +		goto out;
> +	}

[Severity: Low]
If the INT_MASK0 write succeeds and the CONFIG0 write fails, should
INT_MASK0 be restored before returning?

On ON to OFF, the device ends up with TTSC interrupts masked and FTSE
still enabled, while ts_config.tx_type is still HWTSTAMP_TX_ON.
oa_tc6_req_tx_hwtstamp() keeps assigning slots. The captures no longer
raise an interrupt and are only picked up when some other extended
status event occurs, so the slots can fill up and timestamped frames get
dropped.

On OFF to ON, the TTSC interrupts stay unmasked while timestamping is
reported as off. The earlier STATUS0 write has also already acknowledged
captures without delivering their timestamps.

Because ts_config is not updated on failure, a retry with the same
request would apply all three registers again.

[ ... ]

> +void oa_tc6_get_ts_stats(struct oa_tc6 *tc6,
> +			 struct ethtool_ts_stats *stats)
> +{
> +	stats->pkts = tc6->tx_hwtstamp_pkts;
> +	stats->err = tc6->tx_hwtstamp_err;
> +	stats->lost = tc6->tx_hwtstamp_lost;
> +}

[Severity: Low]
Can these reads tear on 32-bit hosts?

tx_hwtstamp_pkts, tx_hwtstamp_lost and tx_hwtstamp_err are plain u64
fields. They are updated from the IRQ thread, and from the hwtstamp_set
path through oa_tc6_cleanup_tx_tstamp_skbs(). This function reads them
from ethtool context with no lock, READ_ONCE() or u64_stats_sync.

The locking for tx_hwtstamp_err is also inconsistent. It is incremented
under tx_skb_lock in oa_tc6_req_tx_hwtstamp() and in the "Multiple skbs"
branch of oa_tc6_events_handle(). The hweight32() update at the end of
oa_tc6_events_handle() happens after the lock has been released:

	if (val & ~handled) {
		tc6->tx_hwtstamp_err += hweight32(val & ~handled);

> +EXPORT_SYMBOL_GPL(oa_tc6_get_ts_stats);
> +
> +/**
> + * oa_tc6_get_ts_info - Provides timestamp info for ethtool
> + * @tc6: oa_tc6 struct.
> + * @info: ethtool timestamping info structure
> + *
> + * Return: 0 on success otherwise failed.
> + */
> +int oa_tc6_get_ts_info(struct oa_tc6 *tc6,
> +		       struct kernel_ethtool_ts_info *info)
> +{
> +	if (!tc6->ptp_clock)
> +		return 0;

[Severity: Low]
This isn't a bug, but the kernel-doc says "Return: 0 on success otherwise
failed." while both exits return 0. When there is no PHC, the function
returns 0 without filling anything in, which leaves the
ethtool_init_tsinfo() defaults in place.

Could the doc describe that instead? Otherwise vendor drivers may add
error handling that can never run.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113-s2500-mac-phy-support-v11-0-7a186141952c%40onsemi.com
